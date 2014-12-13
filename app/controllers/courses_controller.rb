class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :set_date, only: [:create]
  before_action :is_owner, only: [:edit, :update, :destroy]
  skip_before_filter :require_login, only: [:index, :next, :show]

  include Course::Updatable
  include Course::Searchable
  include Global::Slugable

  def to_param
    to_slug(title)
  end

  def index
    @courses = Course.all
  end

  def next
    offset = params[:offset] || 0
    limit = 10
    @courses = Course.last_ones(offset, limit)
  end

  def show
    @contributors = get_contributors
    @participants = Participation.get_participants({ course_id: @course.id })
  end

  def new
    @course = Course.new
    @parameters = [@course]
  end

  def edit
    @parameters = [@course, url: course_path(@course.slug)]
  end

  def create
    @course = Course.new(course_params)
    @course.slug = to_slug(params[:course][:title])

    # TODO: Creating a participation as an author

    respond_to do |format|
      if @course.save

        # Saving the associated tags
        self.update_or_add_tags

        # Saving the associated user
        @course.participations.create({
          user: current_user,
          date: params["course"]["date"],
          role: "author"
        })

        format.html { redirect_to course_path(@course.slug), notice: 'Ce cours a bien été ajouté.' }
        format.json { render :show, status: :created, location: @course }
      else
        @parameters = [@course]
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    old_slug = @course.slug
    @course.slug = to_slug(params[:course][:title])
    respond_to do |format|
      if @course.update(course_params)

        # Deleting all the previous taggings
        self.clean_taggings if params["course"]["tags"].length > 1

        # Updating the associated tags
        self.update_or_add_tags

        format.html { redirect_to course_path(@course.slug), notice: 'Ce cours a bien été modifié.' }
        format.json { render :show, status: :ok, location: @course }
      else
        @course.slug = old_slug
        @parameters = [@course, url: course_path(@course.slug)]
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Participation.where({:course_id => @course.id}).delete_all
    Tagging.where({:course_id => @course.id}).delete_all
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Ce cours a bien été supprimé.' }
      format.json { head :no_content }
    end
  end

  private

    def is_owner
      if !belongs_to_current_user(@course) && !has_right_to_edit
        redirect_to login_path, alert: "Vous n'avez pas l'autorisation pour effectuer cette action."
      end
    end

    def set_course
      @course = Course.find_by_slug(params[:id])
    end

    def set_date
      params[:date] = DateTime.new(
        params["course"]["date(1i)"].to_i,
        params["course"]["date(2i)"].to_i,
        params["course"]["date(3i)"].to_i,
        params["course"]["date(4i)"].to_i,
        params["course"]["date(5i)"].to_i
      )
    end

    def course_params
      params.require(:course).permit(
        :title, :description, :level,
        :location, :video_link, :slideshare_link,
        :image_link, :user_id, :categorie_id,
        :tag_id, :tagging_id, :tags, :participation_id,
        :tagging, :date, :duration, :slug
      )
    end
end

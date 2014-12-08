class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :set_date, only: [:create]
  skip_before_filter :require_login, only: [:index, :show]

  include Course::CascadingUpdatable

  def index
    offset = params[:offset] || 0
    limit = 10
    @courses = Course.last_ones(offset, limit)
  end

  def show
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @course = Course.new(course_params)

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

        format.html { redirect_to @course, notice: 'Ce cours a bien été ajouté.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @course.update(course_params)

        # Deleting all the previous taggings
        self.clean_taggings

        # Updating the associated tags
        self.update_or_add_tags

        format.html { redirect_to @course, notice: 'Ce cours a bien été modifié.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Ce cours a bien été supprimé.' }
      format.json { head :no_content }
    end
  end

  private
    def set_course
      @course = Course.find(params[:id])
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
        :tagging, :date, :duration
      )
    end
end

class ParticipationController < ApplicationController
  before_action :set_participation, only: [:show, :edit, :update]

  def index
    @participations = Participation.all
  end

  def show
  end

  def new
    @participation = Participation.new
  end

  def edit
  end

  def create
    # Check whether the course exists
    begin
      target_course = Course.find(params[:course_id])
    rescue ActiveRecord::RecordNotFound
      redirect_to :back, alert: "Cours non trouvé."
      return
    end

    # Check whether the user is connected
    if current_user.nil?
      redirect_to :back, alert: "Veuillez vous connecter pour participer à ce cours."
    elsif target_course.users.include?(current_user)
      redirect_to :back, alert: "Vous ne pouvez participer à votre propre cours."
    else
      parameters = Hash.new
      parameters[:course_id] = params[:course_id]
      parameters[:user_id] = current_user.id
      parameters[:role] = "participant"
      parameters[:date] = DateTime.now

      @participation = Participation.new(parameters)

      respond_to do |format|
        if @participation.save
          format.html { redirect_to :back, notice: "Participation enregistrée!" }
        else
          format.html { redirect_to :back, alert: "Cours non trouvé." }
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @participation.update(participation_params)
        format.html { redirect_to :back, notice: 'Participation was successfully updated.' }
        format.json { render :show, status: :ok, location: @participation }
      else
        format.html { render :edit }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # Check whether the course exists
    begin
      # target_course = Course.find(params[:course_id])
      target_course = Course.find_by_slug(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to :back, alert: "Cours non trouvé."
      return
    end

    # Check whether the user is connected
    if current_user.nil?
      redirect_to :back, alert: "Veuillez vous connecter."
    else
      @participation = Participation.where({ course_id: target_course.id, user_id: current_user.id }).first
      @participation.destroy
      respond_to do |format|
        format.html { redirect_to course_path(target_course.slug), notice: "Participation annulée." }
      end
    end
  end

  private

    def set_participation
      @participation = Participation.find(params[:id])
    end

    def participation_params
      params.require(:participation).permit(:date, :role, :user_id, :course_id)
    end

end

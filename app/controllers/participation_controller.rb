class ParticipationController < ApplicationController
  before_action :set_participation, only: [:show, :edit, :update, :destroy]

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
    @participation = Participation.new(participation_params)

    respond_to do |format|
      if @participation.save
        format.html { redirect_to @participation, notice: 'Participation was successfully created.' }
        format.json { render :show, status: :created, location: @participation }
      else
        format.html { render :new }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @participation.update(participation_params)
        format.html { redirect_to @participation, notice: 'Participation was successfully updated.' }
        format.json { render :show, status: :ok, location: @participation }
      else
        format.html { render :edit }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @participation.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Participation was successfully destroyed.' }
      format.json { head :no_content }
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

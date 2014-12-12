class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :is_owner, only: [:edit, :update, :destroy]
  skip_before_filter :require_login, only: [:new, :create]

  include ActionView::Helpers::TextHelper
  include User::Identifiable
  include User::GravatarImplementable
  include Global::Slugable

  def to_param
    # Uses the slug as the page's url id
    to_slug(user_name)
  end

  def index
    @users = User.all.order({ :user_name => :asc })
    @users = @users.map do |user|
      user.short_bio = truncate(user.short_bio, length: 15, separator: ' ')
      user.avatar = user.avatar.present? ? user.avatar : full_url_for({ email: user.email, size: "70" })
      user
    end
  end

  def show
    @courses_seen = Participation.get_participations({ role: 'participant', user_id: @user.id })
    @courses_given = Participation.get_participations({ role: 'author', user_id: @user.id })
  end

  def new
    @user = User.new
    @parameters = [@user]
  end

  def edit
    @parameters = [@user, url: user_path(@user.slug)]
  end

  def create
    @user = User.new(user_params)
    @user.slug = to_slug(params[:user][:user_name])
    @user.role = "Utilisateur"

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_path(@user.slug), notice: 'Le compte a bien été ajouté.' }
        format.json { render :show, status: :created, location: @user }
      else
        @parameters = [@user]
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # Keep trace of the previous slug
    # if the new user_name is empty, therefore
    # the user page will still be linked properly
    old_slug = @user.slug
    @user.slug = to_slug(params[:user][:user_name])

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_path(@user.slug), notice: 'Le compte a bien été modifié.' }
        format.json { render :show, status: :ok, location: @user }
      else
        # Set back the previous slug if something went wrong
        @user.slug = old_slug
        @parameters = [@user, url: user_path(@user.slug)]
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Le compte a bien été supprimé.' }
      format.json { head :no_content }
    end
  end

  private

    def is_owner
      # Checks whether the current user have the right
      # to update the user. (i.e his own account or admin)
      if !is_superior_of?(@user) && !is_own_account?(@user)
        redirect_to login_path, alert: "Vous n'avez pas l'autorisation pour effectuer cette action."
      end
    end

    def set_user
      @user = User.find_by_slug(params[:id])
    end

    def user_params
      parameters = [
        :email, :password, :password_confirmation,
        :crypted_password, :salt, :user_name,
        :first_name, :last_name, :birth_date,
        :batch, :avatar, :personal_link,
        :short_bio, :city, :slug, (:role if self.is_admin? || is_superior_of?(@user))
      ]
      # Dynamically allows to change the role
      # according to your current status
      params.require(:user).permit(*parameters)
    end
end

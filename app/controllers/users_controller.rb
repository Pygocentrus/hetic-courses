class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :is_owner, only: [:edit, :update, :destroy]
  skip_before_filter :require_login, only: [:new, :create]

  include ActionView::Helpers::TextHelper
  include User::Identifiable
  include User::GravatarImplementable

  def index
    @users = User.all.order({:user_name => :asc})
    @users = @users.map do |user|
      user.short_bio = truncate(user.short_bio, length: 15, separator: ' ')
      user.avatar = user.avatar.present? ? user.avatar : full_url_for({ email: user.email, size: "70" })
      user
    end
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.role = "Utilisateur"

    respond_to do |format|
      if @user.save
        format.html { redirect_to(:users, notice: "Le compte a bien été ajouté.") }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Le compte a bien été modifié.' }
        format.json { render :show, status: :ok, location: @user }
      else
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
      if !is_superior_of?(@user) && !is_own_account?(@user)
        redirect_to login_path, alert: "Vous n'avez pas l'autorisation pour effectuer cette action."
      end
    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      parameters = [
        :email, :password, :password_confirmation,
        :crypted_password, :salt, :user_name,
        :first_name, :last_name, :birth_date,
        :batch, :avatar, :personal_link,
        :short_bio, :city, (:role if self.is_admin? || is_superior_of?(@user))
      ]
      params.require(:user).permit(*parameters)
    end
end

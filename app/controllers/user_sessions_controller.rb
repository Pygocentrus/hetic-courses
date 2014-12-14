class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(:courses, notice: 'Connexion réussie.')
    else
      flash.now[:alert] = 'La connexion a échoué.'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:courses, notice: 'Déconnexion effectuée.')
  end
end

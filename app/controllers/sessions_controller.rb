class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      sign_in admin
      redirect_back_or admin
    else
      flash.now[:error] = 'Combinacion de email/password invalida'
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_url
  end
  
end

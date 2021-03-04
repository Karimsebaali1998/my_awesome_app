# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_email(params[:session][:email])

    if user&.authenticate(params[:session][:password])
      login(user)
      redirect_to users_path
    else
      @alert = 'Email or password is invalid'
      render :new
    end
  end

  def destroy
    log_out
    @alert = 'Logged out'
    render :new
  end
end

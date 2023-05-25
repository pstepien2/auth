class SessionsController < ApplicationController
  def new
    # render login form in sessions/new.html.erb
  end

  def create
    # authenticate the user
    # 1. try to find the user by their unique identifier
    # 2. if the user exists -> check if they know their password
    # 3. if they know their password -> login is successful
    # 4. if the email does not exist or they do not know their password -> login fails
    flash["notice"] = "Nope."
    redirect_to "/sessions/new"
  end

  def destroy
    # logout the user
    flash["notice"] = "Goodbye."
    redirect_to "/sessions/new"
  end
end

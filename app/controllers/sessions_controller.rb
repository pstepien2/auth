class SessionsController < ApplicationController
  def new
    # render login form in sessions/new.html.erb
  end

  def create
    # authenticate the user
    # 1. try to find the user by their unique identifier
    @user = User.find_by({"email" => params["email"]})
    # 2. if the user exists -> check if they know their password
    if @user #this simply checks is the user found above is in the data base at all
      password_entered = params["password"]
      password_database = @user["password"]
      if BCrypt::Password.new(password_database) == password_entered
        # 3. if they know their password -> login is successful
        redirect_to "/companies"
        session["user_id"] = @user["id"]
        # 4. if the email does not exist or they do not know their password -> login fails
      else
        flash["notice"] = "Nope."
        redirect_to "/sessions/new"
      end
    else
      flash["notice"] = "Nope."
      redirect_to "/sessions/new"
    end
  end

  def destroy
    # logout the user
    flash["notice"] = "Goodbye."
    session["user_id"] = nil
    redirect_to "/sessions/new"
  end
end

class SessionsController < ApplicationController
  def new
  end

  def create
    #attempt to find user
    @user = User.find_by({"email" => params["email"]})

    #if user exists -> check they know the password
    if @user != nil
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Success! You're logged in!!"
        redirect_to "/places"
      else
        flash["notice"] = "Invalid username or password."
        redirect_to "/login"
      end
    else
      flash["notice"] = "Invalid username or password."
      redirect_to "/login"
    end
  end

  def destroy
    flash["notice"] = "Goodbye."
    session["user_id"] = nil
    redirect_to "/login"
  end
end
  
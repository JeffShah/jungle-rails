class SessionsController < ApplicationController

def new
end

def create
    user = User.find_by_email(params[:email])
    #if user exists & if password is correct
    if user && user.authenticate(params[:password])
    #save user id inside browser's cookie.
    #keep user logged in when navigating around the site
    session[:user_id] = user.id
    redirect_to '/'
    else
    #redirect to login form if login doesn't work.
    redirect_to '/login'
    end
end

def destroy
    session[:user_id] = nil
    redirect_to '/login'
end

end
class UsersController < ApplicationController
  get("/signup") do
    if !logged_in?
      erb :'users/create_user'
    else
      redirect "/users/#{current_user.slug}"
    end
  end

  post("/signup") do
    if params[:password] == params[:confirm_password]
      @user = User.new(:name => params[:username], :password => params[:password], :dci_number => params[:dci_number])
      if @user.save && params[:username] != ""
        session[:user_id] = @user.id
        redirect "/users/#{@user.slug}"
      else
        flash[:error] = "Invalid input, please try again."
        erb :'users/create_user'
      end
    else
      flash[:error] = "Please make sure your password matches your confirmed password."
      erb :'users/create_user'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      redirect "/users/#{current_user.slug}"
    end
  end

  post '/login' do
    @user = User.find_by(:name => params[:username])
    if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
      redirect "/users/#{@user.slug}"
    else
      flash[:error] = "Invalid login information."
      redirect "/login"
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/login'
    else
      redirect '/'
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    if logged_in?
      if @user.id == current_user.id
        erb :'/users/show'
      else
        flash[:error] = "You cannot view another user's profile."
        redirect "/users/#{current_user.slug}"
      end
    else
      redirect '/login'
    end
  end
end

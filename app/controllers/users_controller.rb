class UsersController < ApplicationController
  get "/signup" do
    if !logged_in?
      erb :'users/create_user'
    else
      redirect '/decks'
    end
  end

  post "/signup" do
    if params[:password] == params[:confirm_password]
      @user = User.new(:name => params[:username], :password => params[:password], :dci_number => params[:dci_number])
      if @user.save && params[:username] != ""
        session[:user_id] = @user.id
        redirect '/decks'
      else
        redirect "/signup"
      end
    else
      redirect "/signup"
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      redirect '/decks'
    end
  end

  post '/login' do
    @user = User.find_by(:name => params[:username])
    if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
      @this_user = current_user
      redirect '/decks'
    else
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
    binding.pry
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show'
  end
end

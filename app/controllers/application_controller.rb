require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, "sdfadlkjhgadsdsgadfgksahfnvlDSGAvavcdslkfASDfgdasgADSg"
    register Sinatra::Flash
  end

  get '/' do
    erb :index
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @user ||= User.find(session[:user_id])
    end

    def validate_user(object)
      if object
        object.user == current_user
      end
    end
  end

end

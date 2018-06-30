class ListsController < ApplicationController
  get '/lists' do
    if logged_in?
      erb :'/lists/lists'
    else
      redirect '/login'
    end
  end

  get '/tweets/new' do
    if logged_in?
      erb :'/tweets/create_tweet'
    else
      redirect '/login'
    end
  end
end

class DecksController < ApplicationController
  get '/decks' do
    if logged_in?
      erb :'/decks/decks'
    else
      redirect '/login'
    end
  end

  get '/decks/new' do
    if logged_in?
      erb :'/decks/create_deck'
    else
      redirect '/login'
    end
  end
end

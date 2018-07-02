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
      erb :'/decks/new_deck'
    else
      redirect '/login'
    end
  end

  post '/decks/new' do
    if params[:name] != ""
     @deck = Deck.create(:name => params[:name], :format => params[:format], :user_id => current_user.id)
     @deck.save
     redirect '/decks'
   else
     redirect '/decks/new'
   end
  end
end

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

  post '/decks' do
    if params[:deck_name] != ""
     @deck = Deck.create(:name => params[:deck_name], :format => params[:deck_format], :user_id => current_user.id)
     @deck.magic_card_ids = params[:cards]
     @deck.save
     redirect '/decks'
   else
     redirect '/decks/new'
   end
  end

  get '/decks/:slug' do
    @deck = Deck.find_by_slug(params[:slug])
    erb :'/decks/show_deck'
  end
end

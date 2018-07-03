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

  post '/decks/new' do
    if params[:card][:name] != ""
     @card = MagicCard.create(params[:card])
     @card.user_id = current_user.id
     @card.save
     erb :'/decks/new_deck'
   else
     erb :'/decks/new_deck'
   end
  end


  get '/decks/:slug' do
    @deck = Deck.find_by_slug(params[:slug])
    erb :'/decks/show_deck'
  end

  get '/decks/:slug/edit' do
    @deck = Deck.find_by_slug(params[:slug])
    erb :'/decks/edit_deck'
  end

  post '/decks/:slug/edit' do
    @deck = Deck.find_by_slug(params[:slug])
    if params[:card][:name] != ""
     @card = MagicCard.create(params[:card])
     @card.user_id = current_user.id
     @card.save
     erb :'/decks/edit_deck'
   else
     erb :'/decks/edit_deck'
   end
  end

  patch '/decks/:slug' do
    @deck = Deck.find_by_slug(params[:slug])
    if params[:deck][:name] != ""
      @deck.update(params[:deck])
      @deck.magic_card_ids = params[:cards]
      @deck.save
      redirect to "decks/#{@deck.slug}"
    else
      redirect "/decks/#{@deck.slug}/edit"
    end
    erb :'/decks/show_deck'
  end

  delete '/decks/:slug/delete' do
    @deck = Deck.find_by_slug(params[:slug])
    @user = current_user
    if logged_in?
      if @deck.user_id == current_user.id
        @deck.delete
        redirect '/decks'
      else
        "/decks/#{@deck.slug}"
      end
    else
      redirect '/login'
    end
  end
end

class DecksController < ApplicationController
  get '/decks' do
    if logged_in?
      erb :'/decks/decks'
    else
      flash[:error] = "You must log in to view your decks."
      redirect '/login'
    end
  end

  get '/decks/new' do
    if logged_in?
      erb :'/decks/new_deck'
    else
      flash[:error] = "You must log in to make a new deck."
      redirect '/login'
    end
  end

  post '/decks' do
    if logged_in?
      if params[:deck_name] != ""
       @deck = Deck.create(:name => params[:deck_name], :format => params[:deck_format], :user_id => current_user.id)
       @deck.magic_card_ids = params[:cards]
       @deck.save
       redirect '/decks'
     else
       flash[:error] = "Your new deck must have a name."
       redirect '/decks/new'
     end
   else
     flash[:error] = "You must log in to Make a new deck."
     redirect '/login'
   end
  end

  post '/decks/new' do
    if logged_in?
      if params[:card][:name] != ""
       @card = MagicCard.create(params[:card])
       @card.user_id = current_user.id
       @card.save
       erb :'/decks/new_deck'
     else
       flash[:error] = "Your new card must have a name."
       erb :'/decks/new_deck'
     end
   else
     flash[:error] = "You must log in to view your cards."
     redirect '/login'
   end
  end


  get '/decks/:slug' do #needs validation
    @deck = Deck.find_by_slug(params[:slug])

    if logged_in?
      if validate_user(@deck)
        erb :'/decks/show_deck'
      else
        flash[:error] = "You cannot view another user's deck."
        redirect '/decks'
      end
    else
      flash[:error] = "You must log in to view a deck."
      redirect '/login'
    end
  end

  get '/decks/:slug/edit' do #needs validation
    @deck = Deck.find_by_slug(params[:slug])

    if logged_in?
      if validate_user(@deck)
        erb :'/decks/edit_deck'
      else
        flash[:error] = "You can only edit your own decks."
        redirect '/decks'
      end
    else
      flash[:error] = "You must log in to edit a deck."
      redirect '/login'
    end
  end

  post '/decks/:slug/edit' do #needs validations
    @deck = Deck.find_by_slug(params[:slug])

    if logged_in?
      if params[:card][:name] != ""
        if validate_user(@deck)
         @card = MagicCard.create(params[:card])
         @card.user_id = current_user.id
         @card.save
         erb :'/decks/edit_deck'
       else
         flash[:error] = "You can only edit your own deck."
         redirect '/decks'
       end
     else
       flash[:error] = "Your deck must have a name."
       erb :'/decks/edit_deck'
     end
   else
     flash[:error] = "You must log in edit a deck."
     redirect '/login'
   end
  end

  patch '/decks/:slug' do #needs validation
    @deck = Deck.find_by_slug(params[:slug])

    if logged_in?
      if params[:deck][:name] != ""
        if validate_user(@deck)
          @deck.update(params[:deck])
          @deck.magic_card_ids = params[:cards]
          @deck.save
          redirect to "decks/#{@deck.slug}"
        else
          flash[:error] = "You can only edit your own decks."
          redirect '/decks'
        end
      else
        flash[:error] = "You must have a name for your deck."
        redirect "/decks/#{@deck.slug}/edit"
      end
      #erb :'/decks/show_deck'
    else
      flash[:error] = "You must log in to edit a deck."
      redirect '/login'
    end
  end

  delete '/decks/:slug/delete' do #needs validation
    @deck = Deck.find_by_slug(params[:slug])
    @user = current_user
    if logged_in?
      if validate_user(@deck)
        @deck.delete
        redirect '/decks'
      else
        flash[:error] = "You can only delete your own decks."
        "/decks/#{@deck.slug}"
      end
    else
      flash[:error] = "You must be logged in to delete a deck."
      redirect '/login'
    end
  end
end

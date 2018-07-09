class MagicCardsController < ApplicationController
  get '/cards' do
    if logged_in?
      erb :'/magic_cards/magic_cards'
    else
      flash[:error] = "You must log in to view your cards."
      redirect '/login'
    end
  end

  get '/cards/new' do
    if logged_in?
      erb :'/magic_cards/new_magic_card'
    else
      flash[:error] = "You must log in to create a new card."
      redirect '/login'
    end
  end

  post '/cards' do
    if logged_in?
      if params[:card][:name] != ""
       @card = MagicCard.create(params[:card])
       @card.user_id = current_user.id
       @card.save
       redirect '/cards'
     else
       flash[:error] = "You must have a card name to create a card."
       redirect '/cards/new'
     end
   else
     flash[:error] = "You must log in to make a new card."
     redirect '/login'
   end
  end

  get '/cards/:slug' do #needs validation
    @card = MagicCard.find_by_slug(params[:slug])

    if logged_in?
      if validate_user(@card)
        erb :'/magic_cards/show_magic_card'
      else
        flash[:error] = "You can only view your own cards."
        redirect '/cards'
      end
    else
      flash[:error] = "You must log in to view a card."
      redirect '/login'
    end
  end

  get '/cards/:slug/edit' do #needs validation
    @card = MagicCard.find_by_slug(params[:slug])

    if logged_in?
      if validate_user(@card)
        erb :'/magic_cards/edit_magic_card'
      else
        flash[:error] = "You canonot edit another user's card."
        redirect '/cards/:slug'
      end
    else
      flash[:error] = "You must log in to edit your card."
      redirect '/login'
    end
  end

  patch '/cards/:slug' do #needs validion
    @card = MagicCard.find_by_slug(params[:slug])
    if logged_in?
      if params[:card][:name] != ""
        if validate_user(@card)
          @card.update(params[:card])
          @card.save
          redirect to "cards/#{@card.slug}"
        else
          flash[:error] = "You cannot edit another user's card."
          redirect '/cards'
        end
      else
        flash[:error] = "Your card must have a name."
        redirect "/cards/#{@card.slug}/edit"
      end
      #erb :'/magic_cards/show_magic_card'
    else
      flash[:error] = "You must log in to edit your cards."
      redirect '/login'
    end
  end

  delete '/cards/:slug/delete' do #needs validation
    @card = MagicCard.find_by_slug(params[:slug])

    if logged_in?
      if validate_user(@card)
        @card.delete
        redirect '/cards'
      else
        flash[:error] = "You cannot delete someone else's card."
        redirect '/cards'
      end
    else
      flash[:error] = "You must log in to delete your cards."
      redirect '/login'
    end
  end

end

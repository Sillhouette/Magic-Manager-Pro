class MagicCardsController < ApplicationController
  get '/cards' do
    if logged_in?
      erb :'/magic_cards/magic_cards'
    else
      redirect '/login'
    end
  end

  get '/cards/new' do
    if logged_in?
      erb :'/magic_cards/new_magic_card'
    else
      redirect '/login'
    end
  end

  post '/cards' do
    if params[:card][:name] != ""
     @card = MagicCard.create(params[:card])
     @card.user_id = current_user.id
     @card.save
     redirect '/cards'
   else
     redirect '/cards/new'
   end
  end

  get '/cards/:slug' do
    @card = MagicCard.find_by_slug(params[:slug])
    erb :'/magic_cards/show_magic_card'
  end

  get '/cards/:slug/edit' do
    @card = MagicCard.find_by_slug(params[:slug])
    erb :'/magic_cards/edit_magic_card'
  end

  patch '/cards/:slug' do
    @card = MagicCard.find_by_slug(params[:slug])
    if params[:card][:name] != ""
      @card.update(params[:card])
      @card.save
      redirect to "cards/#{@card.slug}"
    else
      redirect "/cards/#{@card.slug}/edit"
    end
    erb :'/magic_cards/show_magic_card'
  end

  delete '/cards/:slug/delete' do
    @card = MagicCard.find_by_slug(params[:slug])
    @user = current_user
    if logged_in?
      if @card.user_id == current_user.id
        @card.delete
        redirect '/cards'
      else
        "/cards/#{@card.slug}"
      end
    else
      redirect '/login'
    end
  end

end

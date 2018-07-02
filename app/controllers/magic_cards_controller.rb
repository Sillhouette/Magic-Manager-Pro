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
    erb :'/magic_cards/show_magic_card'
  end
end

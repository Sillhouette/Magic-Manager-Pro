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
    @card = Magic_Card.find_by_slug(params[:slug])
    erb :'/cards/show_magic_card'
  end
end

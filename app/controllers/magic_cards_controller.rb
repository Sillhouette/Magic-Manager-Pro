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
end

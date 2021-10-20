Rails.application.routes.draw do
  resources :player_scores do
    collection do
      get 'maxscore', to: 'player_scores#maxscore'
      get 'lowscore', to: 'player_scores#lowscore'
      get 'avascore', to: 'player_scores#avascore'
      get 'playername', to: 'player_scores#showbyname'
    end
  end
end

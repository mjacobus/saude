Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "wizzard#estados"
  get '/estados', to: "wizzard#estados"
  get '/cidades', to: "wizzard#cidades", as: :cidades
  get '/estabelecimentos', to: "wizzard#estabelecimentos", as: :estabelecimentos
  get '/profissionais', to: "wizzard#profissionais", as: :profissionais
end

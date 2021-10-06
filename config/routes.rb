Rails.application.routes.draw do
  resources :consulta
  resources :medicos
  resources :enderecos
  resources :pacientes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

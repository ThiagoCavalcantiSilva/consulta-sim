Rails.application.routes.draw do
  resources :consulta
  root 'pagina_inicial#index'
  get 'inicio' => 'pagina_inicial#index'

  resources :medicos
  resources :pacientes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

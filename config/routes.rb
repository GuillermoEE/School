Rails.application.routes.draw do

  resources :accepteds
  resources :allaccepteds
  devise_for :users
  #parte publica
  get 'admisiones' => 'public#admisiones'

  get 'desarolladores' => 'public#desarolladores'

  get 'public/index'

  root 'public#index'

  get 'delateAll1' =>'accepteds#delateAll1'

  get 'index' => 'public#index'

  #gruups
  get 'generate' => 'groups#generate'

  get 'generarGru' => 'groups#saveGroups'

  resources :requests do
    collection { post :import}
  end
  resources :specialities





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  resources :patients

  get '/api_patient' => "patients#api_patient"

  get '/new_patient' => "patients#new_patient"

end

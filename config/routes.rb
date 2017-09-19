Rails.application.routes.draw do
  get 'mainpage/index'

  resources :resumes do

    resource :selfintro
    resources :educations do
      resource :details
    end
    resource :experiences do
      resource :details
    end
    resources :works do
      resource :details
    end

  end

  root 'mainpage#to_resume', :resumeid => 'test 4'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

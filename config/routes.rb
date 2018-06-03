Rails.application.routes.draw do
  root to: "application#index"
  get "batch_translate/:word", to: "application#batch_translate"
end

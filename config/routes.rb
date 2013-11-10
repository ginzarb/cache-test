CacheTest::Application.routes.draw do
  get "/books/no_cache_index", as: "book_index_no_cache"
  get "/books/cache_index", as: "book_index_cache"
  get "/books/query_cache_index", as: "book_index_query_cache"
  resources :authors
  resources :publishers
  resources :books
  root "index#index"
end

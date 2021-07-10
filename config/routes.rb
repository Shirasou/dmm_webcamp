Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'todolists/new'
  get 'top' => 'homes#top'
  post 'todolists' => 'todolists#create'
  get 'todolists' => 'todolists#index'
  get 'todolists/:id' => 'todolists#show', as: 'todolist'
  #as: '名前' は「名前付きルート」といい、コード内でURLをわかりやすく書くために使わる。
  #ここでは、「'todolists#show'の設定を、todolistとして利用できる」の意味
  get 'todolists/:id/edit' => 'todolists#edit', as: 'edit_todolist'
  patch 'todolists/:id' => 'todolists#update', as: 'update_todolist'
  delete 'todolists/:id' => 'todolists#destroy', as: 'destroy_todolist'
#上記順番はとても大事になる（上から順に動作するため）
end

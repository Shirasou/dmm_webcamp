class TodolistsController < ApplicationController
  def new
    #Viewへ渡すためのインスタンス変数にからのモデルオブジェクトを生産する。
    @list = List.new
    #コントローラーからviewに情報を渡す場合
  end

  def create
  #1.データを新規登録するためのインスタンス作成
  list = List.new(list_params)
  #2.データをデータベースに保存するためのsaveメソッド実行
  list.save
  #3.トップ画面へのリダイレクト
  redirect_to todolist_path(list.id)

  end

  def index
    @lists = List.all
    #Listモデルから全ての情報を@listsに飛ぶ
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    #viewに情報を渡す必要がないためローカル変数
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end

  def destroy
    list = List.find(params[:id]) #データ（レコード）を１件取得
    list.destroy #データ（レコード）を削除
    redirect_to todolists_path #投稿一覧画面へリダイレクト
  end

private
#ストロングぱらめーた
def list_params
  params.require(:list).permit(:title, :body, :image)
  #viewからコントローラーに情報を送るときはparamsになる
end

end



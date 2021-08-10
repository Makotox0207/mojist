class SessionsController < ApplicationController
  skip_before_action :require_login
  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      # ログインが成功したら、最初に訪れようとしていたページにリダイレクト
      redirect_back_or_to root_path, success: "ログインに成功しました"
    else
      flash.now[:danger] = "ログインに失敗しました"
      render :new
    end
  end

  def destroy
    logout
    redirect_back_or_to root_path, success: "ログアウトしました"
  end

end
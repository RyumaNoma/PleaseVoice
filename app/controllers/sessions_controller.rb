class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])

    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = user.name + "さんようこそ！！"
      redirect_to "/users/#{current_user.id}"
    else
      flash[:error] = "名前かパスワードに間違いがあります"
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = "ログアウトしました"
    redirect_to '/'
  end
end

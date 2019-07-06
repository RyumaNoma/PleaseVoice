class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      flash[:success] = @user.name + "さんようこそ！！"
      redirect_to "/users/#{@user.id}"
    else
      flash.now[:error] = "入力に不備があります"
      render 'new'
    end
  end

  def destroy
    user = User.find(params[:id])

    App.all.each do |app|
      if app.user_id == user.id
        app.delete
      end
    end

    user.delete

    flash[:success] = "アカウントを削除しました"
    redirect_to '/'
  end

  def show
    # for admin
    @all_user = User.all.size - 1
    @all_app = App.all.size - 1
    @all_reply = Reply.all.size

    @user = User.find(params[:id])
    @app = []

    App.all.each do |app|
      if app.user_id == @user.id
        @app.push(app)
      end
    end
  end

  def edit
    @user = User.new
  end

  def update
    puts params
    @user = User.find(current_user.id)

    @user.name = params[:user][:name]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save
      flash[:success] = "アカウント情報を更新しました"
      redirect_to "/users/#{@user.id}"
    else
      flash[:error] = "入力に不備があります"
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end

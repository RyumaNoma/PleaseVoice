class AppsController < ApplicationController
  def index
    @apps = App.all

    @apps = @apps.sort do |a, b|
      a.views <=> b.views
    end
  end

  def new
    @app = App.new
  end

  def create
    @app = App.new(app_params)

    if logged_in?
      @app.user_id = current_user.id

      if @app.save
        redirect_to "/apps/#{@app.id}"
      else
        flash.now[:error] = "入力に不備があります"
        render 'new'
      end
    else
      flash.now[:error] = "ログインしてください"
      render 'new'
    end
  end

  def destroy
    app = App.find(params[:id])

    Reply.all.each do |reply|
      if reply.app_id == app.id
        reply.delete
      end
    end
    app.delete

    flash[:success] = "削除しました"
    redirect_to "/users/#{current_user.id}"
  end

  def show
    @app = App.find(params[:id])

    @reply = []
    Reply.all.each do |reply|
      if reply.app_id == @app.id
        @reply.push(reply)
      end
    end
  end

  def edit
    @app = App.find(params[:id])
  end

  def update
    puts "============="
    puts params
    puts "============="
    @app = App.find(params[:id])

    @app.title = params[:app][:title]
    @app.url = params[:app][:url]
    @app.exp = params[:app][:exp]

    @app.save

    redirect_to "/apps/#{@app.id}"
  end

  private

  def app_params
    params.require(:app).permit(:user_id, :title, :url, :exp)
  end
end

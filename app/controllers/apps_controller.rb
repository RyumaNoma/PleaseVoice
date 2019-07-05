class AppsController < ApplicationController
  def index
    @apps = App.all
  end

  def new
    @app = App.new
  end

  def create
    @app = App.new(app_params)

    if @app.save
      redirect_to "/apps/#{@app.id}"
    else
      flash[:error] = "入力に不備があります"
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
    @app = App.find(params[:id])

    @app.title = params[:title]
    @app.url = params[:url]
    @app.exp = params[:exp]

    @app.save

    redirect_to "/apps/#{@app.id}"
  end

  private

  def app_params
    params.require(:app).permit(:user_id, :title, :url, :exp)
  end
end

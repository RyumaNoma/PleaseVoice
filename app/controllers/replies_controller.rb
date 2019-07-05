class RepliesController < ApplicationController
  def new
    @reply = Reply.new
  end

  def create
    @reply = Reply.new(reply_params)
    @reply.app_id = params[:app_id]
    @reply.user_name = current_user.name

    if @reply.save
      redirect_to "/apps/#{@reply.app_id}"
    else
      flash[:error] = "入力に不備があります"
      render 'new'
    end
  end

  def destroy
    reply = Reply.find(params[:id])

    reply.content = "[このメッセージは削除されました]"
    reply.save
    redirect_to "/apps/#{reply.app_id}"
  end

  private

  def reply_params
    params.require(:reply).permit(:app_id, :user_name, :content)
  end
end

class UsertasksController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @usertask = current_user.usertasks.build(usertask_params)
    if @usertask.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @usertasks = current_user.usertasks.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
  end
  
  private
  
  def usertask_params
    params.require(:usertask).permit(:status, :content)
  end
end

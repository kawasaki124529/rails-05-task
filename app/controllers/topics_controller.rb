class TopicsController < ApplicationController
  
  def index
    @topics =Topic.all.includes(:favorite_users)
		#if !topic.favorite_users.include?(current_user)
		#	@favorite_icon = 'like topic-index-icon'
		#	link_to "いいねする", favorites_path(topic_id: topic.id), method: :post, class: @favorite_icon
		#else
		#	@favorite_icon = 'liked topic-index-icon'
		#  link_to "いいねを取り消す", favorite_path(topic_id: topic.id, user_id: current_user.id), method: :delete, class: @favorite_icon
		#end
  end   
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = current_user.topics.new(topic_params)
    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = '登録に失敗しました'
      render :new
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end  
end  

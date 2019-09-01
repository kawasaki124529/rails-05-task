class CommentsController < ApplicationController
  
  #def index
   # @topic_comments = current_topic.topic_comments
  #end  
  
  #def index
   # @comments =Topic.all.includes(:favorite_users)
  #end
  
  def new
    @comment = Comment.new(topic_id: params[:topic_id])
  end
  
  def create
    #@comment.topic_id = params[:topic_id]
    #binding.pry
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to topics_path, success: 'コメントしました'
    else
      flash.now[:danger] = "コメントできませんでした"
      render :new
    end  
  end

  #def destroy
   # topic = Topic.find(params[:topic_id])
    #@comment = topic.comments.find(params[:id])
    #@comment.destroy
    #redirect_back(fallback_location: topic_path(topic))
  #end
  
  private
  def comment_params
    params.require(:comment).permit(:topic_id, :content)
  end
end
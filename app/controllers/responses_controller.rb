class ResponsesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]


  # def new
  #   @response = Response.new
  #   @post =Post.find[:post_id]
  # end

  def create

    # @response = Response.new(response_params)
    # get the post id from params and the user id from current_user and then build your response object
    @user = current_user
    @post = Post.find(params[:post_id])
    @posting_user = @post.user
    @response = Response.new
    @response.post = @post
    @response.user = @user

    if @response.save
      ResponseMailer.new_response(@response).deliver_now
      redirect_to @post, notice: "Response Sent Successfully"
    else
      flash[:alert] = @post.errors.full_messages.join(' , ')
      render :new
    end
  end



  # def edit
  #   @response = Response.find(params[:id])
  # end

  # def update
  #   @response = Response.find(params[:id])
  #
  #   if @response.update(response_params)
  #     flash[:notice] = "Response updated successfully"
  #     redirect_to response_path(@response)
  #   else
  #     flash[:alerts] = "Please check your edits"
  #     render :edit
  #   end
  # end

  # def destroy
  # @respose = Post.find(params[:id])
  # @respose.destroy
  # redirect_to response_path
  # end

end

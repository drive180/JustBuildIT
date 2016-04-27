class CommentsController < ApplicationController
	before _action :set_comment, only: [] 
  def edit
  end

  def create
  	@comment = Comment.new(blog_post_params)
  	respond_to do |format|
  		if @comment.save
  			format.html {redirect_to @blog_post_path,
  				(id: @comment. blog_post_id) notice:
  				"Comment was created successfully."}
  			else
  				format.html {render :new}
  			end
  		end
  end 

  def update
  	respond_to do |format|
  		if @comment.update(id: @comment.blog_post_path)
  		 format.html {redirect_to @blogpost,
  		 	notice: "Blog was updated 
  		 	sucessfully"}
  		 else
  		 		format.html {render :edit}
  		 	end 
  			
  		end
  end

  def destroy
  	@comment.destroy
  	respond_to do |format|
  		format.html {_redirect_to_blog_post_path(id: @comment.
  			blog_post_id) 
  		notice: "Your blog post was DESTROYED!!!!"}
  	end
  end

  private

  		def comment_params
  			params.require(:comments).permit
  			( :author, :comment_entry,:blog_post_id)
  		end

  		def set_bog_post
  			@blog_post = Blogpost.find(params[:id])

  		def set_comment
  			@comment = Comment.find(params[:id])

end

end

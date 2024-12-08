module Api
    class PostsController < ApplicationController
      def index
        query = params[:query]
        filter = params[:filter]
  
        @posts = Post.where("title LIKE ?", "%#{query}%")
        @posts = @posts.where(category: filter) if filter.present?
  
        render json: { posts: @posts }
      end
    end
  end
class ApiController < ApplicationController
    protect_from_forgery with: :null_session
    skip_before_action :authenticate_user!

    include Response

    def list_all_user_posts
        authentication_token = params[:authentication_token]
        return unless check_token_user_params(authentication_token)
    
        posts = Post.where(author_id: params[:user_id])
        json_response(posts)
      end
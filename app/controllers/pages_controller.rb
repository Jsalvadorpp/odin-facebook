class PagesController < ApplicationController

    def home
        @user = current_user
        @post = Post.new
    end
end

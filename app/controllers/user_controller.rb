class UserController < ApplicationController
    before_action :is_logged?

    def show
        @user = User.find_by(id: params['id'])
        @post = Post.new 
    end

end

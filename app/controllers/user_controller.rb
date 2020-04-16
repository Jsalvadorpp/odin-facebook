class UserController < ApplicationController

    def show
        @user = User.find_by(id: params['id'])
        @post = Post.new 
    end

end

class UserController < ApplicationController
    before_action :is_logged?

    def show
        @user = User.find_by(id: params['id'])
        @post = Post.new 
    end

    def search
        if params['search'].present?

            query = params['search']
            @users = User.where("lower(concat(name,' ',last_name)) like ?","%#{query.downcase}%")
                .or( User.where("lower(name) like ?", "%#{query.downcase}%") )
                .or( User.where("lower(last_name) like ?", "%#{query.downcase}%") )
                                      
        else
            @users = User.all
        end
    end

end

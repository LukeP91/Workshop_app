class UsersController < ApplicationController
  def show
    @reviews = Review.where("user_id = #{current_user.id}").order('created_at desc').limit(5)
  end
end

class UserDecorator < Draper::Decorator
  delegate_all

  def username
    "#{user.firstname} #{user.lastname}"
  end
end

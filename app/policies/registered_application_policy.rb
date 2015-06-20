class RegisteredApplicationPolicy < ApplicationPolicy

  # def index?
  #   true
  # end

  # class Scope
  #   attr_reader :user, :scope

  #   def initialize(user,scope)
  #     @user = user
  #     @scope = scope
  #   end

  #   def resolve
  #     registered_applications = []
  #     if user.role == 'admin'
  #       registered_applications = scope.all
  #     else
  #       all_registered_applications = scope.all
  #       all_registered_applications.each do |reg_app|
  #         if reg_app.user == user
  #           reg_app << registered_applications
  #         end
  #       end
  #     end
  #     registered_applications
  #   end
  # end

end

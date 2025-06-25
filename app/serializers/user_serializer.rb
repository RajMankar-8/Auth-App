class UserSerializer < ActiveModel::Serializer
  attributes :id, :email

  def email
	scope.admin? ? object.email : nil
  end
end
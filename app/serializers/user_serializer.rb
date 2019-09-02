class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :username, :plants
  has_many :plants



end
 
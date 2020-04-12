class User < ApplicationRecord
  has_one_attached :photo
  has_many_attached :images
  has_secure_password
  validates_length_of :password,
                      maximum: 72,
                      minimum: 8,
                      allow_nil: true,
                      allow_blank: false
 
  validates_presence_of :name, :email
end

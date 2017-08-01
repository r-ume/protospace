class User < ApplicationRecord

  # Properties
  # email, password, name, profile, position, occupation, avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # validation 
  validates :name, presence: true 

  # association
  has_many :prototypes

  # carrierwave
  mount_uploader :avatar, AvatarUploader
end

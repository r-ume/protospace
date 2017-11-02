# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  name                   :string(255)      default(""), not null
#  profile                :text(65535)      not null
#  position               :string(255)      default(""), not null
#  occupation             :text(65535)      not null
#  avatar                 :string(255)      default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Validation
  validates :name, :email, :password,
            :profile, :position,
            :occupation, :avatar,     presence: true
  validates :name, :email,            uniqueness: true
  validates :password,                length: { in: 6..128 }

  # Association
  has_many :prototypes
  has_many :comments
  has_many :likes, dependent: :destroy

  # Carrierwave
  mount_uploader :avatar, AvatarUploader

end

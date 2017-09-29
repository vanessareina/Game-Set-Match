class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :level, presence: true
         validates :city, presence: true
         validates :state, presence: true
         validates :preference, presence: true
         validates :age_group, presence: true
         validates :gender, presence: true

  after_create :send_welcome_mail

  def send_welcome_mail
    NewUserMailer.new_user(self).deliver
  end
end

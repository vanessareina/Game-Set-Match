class Post < ApplicationRecord

belongs_to :user, optional: true
has_many :responses

validates :title, presence: true
validates :level, presence: true
validates :city, presence: true
validates :state, presence: true
validates :preference, presence: true
validates :date, presence: true
validates :time, presence: true
validates :age_group, presence: true
validates :gender, presence: true

end

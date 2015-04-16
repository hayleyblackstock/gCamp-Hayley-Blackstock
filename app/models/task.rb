class Task < ActiveRecord::Base

  belongs_to :project
  validates :description, presence: true
  has_many :comments
  has_many :users, through: :comments


end

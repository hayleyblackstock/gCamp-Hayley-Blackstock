class Task < ActiveRecord::Base

  belongs_to :project
  validates :description, presence: true
  has_many :comments 

end

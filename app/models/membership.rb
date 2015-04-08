class Membership < ActiveRecord::Base

  belongs_to :project
  belongs_to :user

  enum role: {member: 0, owner: 1}

  validates :user_id, presence: true, uniqueness: {scope: :project_id, message: "has already been added to this project."}

end

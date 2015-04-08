class Membership < ActiveRecord::Base

  belongs_to :project
  belongs_to :user

  enum role: [:member, :owner]


end

class User < ActiveRecord::Base

  def full_name
    "#{first_name} #{last_name}"
  end

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :memberships, dependent: :destroy
  has_many :projects, through: :memberships
  has_many :comments
  has_many :tasks, through: :comments


  def project_owner(project)
     project.memberships.find_by(role: Membership.roles[:owner], user_id: id)
   end



end

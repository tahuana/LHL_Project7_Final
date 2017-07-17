class User < ApplicationRecord

  has_many :skills
  has_many :received_ratings, :class_name => 'Rating', :foreign_key => 'receiver_id'
  has_many :given_ratings, :class_name => 'Rating', :foreign_key => 'giver_id'

  has_many :comments
  has_many :mentor_projects, :class_name => 'Project', :foreign_key => 'mentor_id'
  has_many :mentee_projects, :class_name => 'Project', :foreign_key => 'mentee_id'

  has_secure_password

  validates_presence_of :name, :email
  validates :email, uniqueness: true, :email_format => { :message => 'is invalid' }

  # returns all projects for user where user is mentor and mentee
  def all_projects
    Project.where("mentee_id = ? OR mentor_id = ?", self.id, self.id)
  end
end

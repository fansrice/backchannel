class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_secure_password
  has_many :posts, :dependent => :destroy, :foreign_key => :auther_id, :primary_key => :id
  has_many :post_comments, :dependent => :destroy
  has_many :comment_votes, :dependent => :destroy
  has_many :post_votes, :dependent => :destroy
  before_destroy :cannot_delete_super_admin
  
  def cannot_delete_super_admin
    unless self.admin_type != "S"
      errors.add(:base, "Super admin #{self.name} cannot be deleted!")
      return false
    end
  end
end

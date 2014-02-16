class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_secure_password
  has_many :posts
  has_many :post_comments
  has_many :comment_votes
  has_many :post_votes
  before_destroy :cannot_delete_super_admin
  
  def cannot_delete_super_admin
    unless self.admin_type != "S"
      errors.add(:base, "Super admin #{self.name} cannot be deleted!")
      return false
    end
  end
end

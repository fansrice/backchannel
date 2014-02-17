class Post < ActiveRecord::Base
  #attr_accessible :title, :body
  validates :title, :body, :category_id, presence:true
  belongs_to :category
  belongs_to :user, :foreign_key => :auther_id, :primary_key => :id
  has_many :post_comments, :dependent => :destroy
  has_many :post_votes, :dependent => :destroy, :foreign_key => :post_id, :primary_key => :id
  
  def self.ranked
      #order("(ln( posts.votes_count + posts.comments_count) + (EXTRACT(EPOCH FROM created_at) - 1327654606)/9000) desc")
      order('(posts.votes_count + posts.comments_count) desc' )
    end

    def self.search(search,search_category)
      if search && search_category
      if search_category == 'Content'
        find(:all, :conditions =>['title Like ? OR body Like ?', "%#{search}%", "%#{search}%"])
      elsif search_category == 'User'
        includes(:user).where('users.name Like ?', "%#{search}%")
      elsif search_category == 'Category'
        includes(:category).where('categories.name Like ?', "%#{search}%")
      end
      else      
        find(:all)
      end
    end 
  
end

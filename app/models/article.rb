class Article < ActiveRecord::Base
  belongs_to :user
  has_many :images
  
  # articleにネストされたサムネイルを投稿する
  accepts_nested_attributes_for :images  
  
  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
end

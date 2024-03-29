class Blog < ApplicationRecord
  enum status: {Draft:0, Published:1}
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates_presence_of :title, :body
  has_many :comments, dependent: :destroy
  belongs_to :topic
end

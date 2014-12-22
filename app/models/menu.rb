class Menu < ActiveRecord::Base

  belongs_to :user
  has_many :menu_item, dependent: :destroy

  validates :user_id, presence: true
  validates :description, presence: true, length: { maximum: 140 }
end

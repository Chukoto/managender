class Question < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  belongs_to :user

  with_options presence: true do
    validates :category_id, numericality: { other_than: 0 }
    validates :title
    validates :text
  end
end

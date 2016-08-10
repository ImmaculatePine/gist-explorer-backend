class Label < ActiveRecord::Base
  belongs_to :user, required: true
  has_many :gist_labels, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :user_id }
end

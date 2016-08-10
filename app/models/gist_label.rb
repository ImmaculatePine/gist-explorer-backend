class GistLabel < ActiveRecord::Base
  belongs_to :label, required: true
  validates :gist_id, presence: true
end

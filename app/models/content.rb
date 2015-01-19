class Content < ActiveRecord::Base
  validates :resource, presence: true
  belongs_to :topic
end

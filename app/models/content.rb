class Content < ActiveRecord::Base
  validates :resource, presence: true
  belongs_to :topic
  has_many :sources
end

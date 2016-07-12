class Chat < ActiveRecord::Base
  validates :name, presence: true
end

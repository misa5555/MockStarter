class Back < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates :amount, numericality: { greater_than: 0}
end

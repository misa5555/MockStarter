class Project < ActiveRecord::Base
  validates :title, :target_amount, presence: true
  belongs_to(
    :creator,
    class_name: 'User',
    foreign_key: :creator_id,
    primary_key: :id
  )
  belongs_to :tag

  has_many :backs 
  
  has_many(
    :backers,
    through: :backs,
    source: :user
  )
  
  has_many :comments
  
  has_attached_file :project_photo, :styles => {
    big: "400x400>",
    small: "305x225#",
  }
  validates_attachment_content_type(
    :project_photo,
    :content_type => /\Aimage\/.*\Z/
  )

  def back_total
    sum = 0
    self.backs.each do |back|
      sum += back.amount
    end
    sum
  end
  
  def funded_percentage
    percentage = 0
    if self.target_amount > 0
      percentage = (back_total.to_f / self.target_amount.to_f)*100
    end
    percentage
  end

  def days_to_go
    (self.end_date - Date.today).to_i
  end
end

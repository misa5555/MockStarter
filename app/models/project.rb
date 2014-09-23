class Project < ActiveRecord::Base
  belongs_to(
    :creator,
    class_name: 'User',
    foreign_key: :creator_id,
    primary_key: :id
  )
  belongs_to :tag
end

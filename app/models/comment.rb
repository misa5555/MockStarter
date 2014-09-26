class Comment < ActiveRecord::Base
  validates :body, :author_id, :project_id, presence: true
  belongs_to :project
  belongs_to(
    :author,
    class_name: 'User',
    foreign_key: :author_id,
    primary_key: :id
  )
  # default_scope -> { order('created_at DESC') }
end

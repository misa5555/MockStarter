class User < ActiveRecord::Base
  validates :username, :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  attr_reader :password

  after_initialize :ensure_session_token
  
  has_many(
    :projects,
    class_name: 'Project',
    foreign_key: :creator_id,
    primary_key: :id
  )
  has_many :backs

  has_many(
    :support_projects,
    through: :backs,
    source: :project
  )
  
  has_many(
    :comments,
    class_name: 'Comment',
    foreign_key: :author_id,
    primary_key: :id
  )

  has_attached_file :avator, :styles => {
    :big => "600x600>",
    :middle => "100x100#",
    :small => "50x50#"
  }
  validates_attachment_content_type(
    :avator,
    :content_type => /\Aimage\/.*\Z/
  )
  
  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user && user.valid_password?(password)
    user
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def valid_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end
  
  def backing_to(project)
    self.backs.where(project_id: project.id).first
  end
  private
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end 

end

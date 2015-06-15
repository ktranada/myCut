# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  photo_url       :string
#  username        :string           not null
#

class User < ActiveRecord::Base
  attr_reader :password

  after_initialize :ensure_session_token!
  has_many(:reviews, class_name: "Review", foreign_key: :author_id, dependent: :destroy)
  has_many(:shops, class_name: "Shop", foreign_key: :moderator_id, dependent: :destroy)

  validates :email, :username, :session_token, presence: true
  validates :email, uniqueness: true
  validates :password_digest, presence: { message: "Password can't be blank"}
  validates :password, length: { minimum: 6, allow_nil: true }

  # has_attached_file :avatar,
  #   :styles => { :med => "300x300>", :thumb => "100x100>" },
  #   :default_url => "/images/:style/missing.png"
  #
  #
  # validates_attachment_content_type :avatar,
  #     :content_type => /\Aimage\/.*\Z/,
  #     size: { in: 0..3.megabytes }


  def self.find_by_credentials(user_params)
    user = User.find_by_email(user_params[:email])
    user.try(:is_password?, user_params[:password]) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
    self.session_token
  end

  private

  def ensure_session_token!
    self.session_token ||= SecureRandom::urlsafe_base64(16)
  end


end

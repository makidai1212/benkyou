class User < ApplicationRecord
  attr_accessor :remember_token
  # 強制的に小文字切り替え
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  # 定数に正規表現を代入
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                  format: { with: VALID_EMAIL_REGEX },
                  uniqueness: { case_sensitive: true }

  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  # パスワードのいろんな機能が使えるようになる
  has_secure_password
  # CarrirWaveを使ったプロフィール画像投稿機能用
  mount_uploader :image, ImageUploader
  # たくさんのプロジェクトを持つ
  has_many :projects,  dependent: :destroy

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember 
    self.remember_token = User.new_token 
    update_attribute(:remember_digest, User.digest(self.remember_token))
  end

  # 渡されたトークンがremember_digestと一致したらtrueを返す
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).id_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end


end
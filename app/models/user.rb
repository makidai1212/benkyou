class User < ApplicationRecord
  # 強制的に小文字切り替え
  before_save { self.email = email.downcase }
  valiate :name, presence: true, length: { maximum: 50 }
  # 定数に正規表現を代入
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  valiate :email, presence: true, length: { maximum: 255 },
                  format{ with: VALID_EMAIL_REGEX },
                  uniqueness: { case_sensitive: true }
  # パスワードのいろんな機能が使えるようになる
  has_secure_password
  validate :password, presence: true, length: { minimum: 6 }
end

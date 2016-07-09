class User < ActiveRecord::Base
  # 保存前にすべて小文字にして保存する
  before_save { self.email = self.email.downcase }
  validates(:code, {presence: true})
  # メールアドレスの正規表現
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates(:email, {presence: true,
                     format: { with: VALID_EMAIL_REGEX },
                     uniqueness: {case_sensitive: false} # 大文字、小文字の区別をする
                    })
  validates :password, presence: true, length: { minimum: 6 }
  
  has_secure_password
end
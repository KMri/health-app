class User < ActiveRecord::Base
  has_one :user_info, dependent: :destroy
  has_many :conditions, foreign_key: "user_id", dependent: :destroy
  
  has_many :user_dkinds
  has_many :dkinds, through: :user_dkinds
  has_many :articles, dependent: :destroy
  accepts_nested_attributes_for :user_info, allow_destroy: true
  
  # 保存前にすべて小文字にして保存する
  before_save { self.email = self.email.downcase }
  
  
  validates(:code, {presence: {message: "入力してください"}, uniqueness: {message: "既に使用されています"}})
  # メールアドレスの正規表現
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates(:email, {presence: {message: "入力してください"},
                     format: { with: VALID_EMAIL_REGEX },
                     uniqueness: {case_sensitive: false} # 大文字、小文字の区別をする
                    })
  validates(:password, presence: {message: "入力してください"}, length: {minimum: 6, message: "6文字以上を入力してください"}, allow_blank: true, on: [:update])
  validates(:password, presence: {message: "入力してください"}, length: {minimum: 6, message: "6文字以上を入力してください"}, confirmation: {message: "passwordと一致しません"}, on: [:create])
  validates(:is_man, inclusion:{message: "選択してください", in: [true, false]})
  validates(:birthday, {presence: {message: "選択してください"}})
  # updateのときは、パスワード、Emailを必須にしない
  # validates(:password, length: { minimum: 6 }, allow_blank: :update)
  # validates(:email, {format: { with: VALID_EMAIL_REGEX },
  #                   uniqueness: {case_sensitive: false} # 大文字、小文字の区別をする
  #                   }, on: :update)
  
  has_secure_password
end

class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications # has_many :authenticationsより下に書く

  # バリデーション
  validates :name, uniqueness: true
  validates :email, uniqueness: true, presence: true
  validates :password, confirmation: true, presence: true, # パスワード確認を使用
  if: -> { new_record? || changes[:crypted_password]} #　新規登録とパスワード変更のときだけ発動
end

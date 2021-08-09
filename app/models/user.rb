class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, confirmation: true, presence: true, # パスワード確認を使用
  if: -> { new_record? || changes[:crypted_password]} #　新規登録とパスワード変更のときだけ発動
end

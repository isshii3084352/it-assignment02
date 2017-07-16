class Project < ApplicationRecord
  validates :title,
  presence: { message: "エラー：プロジェクト名が空白です。"},
  length: { minimum: 3, maximum: 20, message: "エラー：プロジェクト名は最小3文字、最大20文字です。" }
  # project.title は空白NGと設定した。
end
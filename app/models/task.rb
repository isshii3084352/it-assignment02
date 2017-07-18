class Task < ApplicationRecord
  belongs_to :project
  validates :title,
  presence: { message: "エラー：タスク名が空白です。"},
  length: { minimum: 1, maximum: 30, message: "エラー：タスク名は最小1文字、最大30文字です。" }
  scope :unfinished, -> { where(done: false) }
  mount_uploader :image, ImageUploader
end

class Post < ApplicationRecord
  validates :title,
      presence: true,
      length: { maximum: 20 }

  validates :start_date, presence: true

  validates :end_date,
      presence: true

  validate :dates_are_valid

  validates :body, length: { maximum: 500 }

  private

  def dates_are_valid
    return if start_date.blank? || end_date.blank?
    if end_date < start_date
      errors.add(:end_date, "は開始日以降の日付を選択してください")
    end
  end
end

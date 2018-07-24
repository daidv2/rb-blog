class User < ApplicationRecord
  validates :email,
    length: {in: 2...10, too_long: 'Ban da nhap email qua dai'},
    presence: true

  validate :check_name_valid

  def check_name_valid
    if(name.present? && name == email)
      errors.add(:name, 'Ten khong duoc trung voi email')
    end
  end
end

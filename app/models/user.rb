class User < ApplicationRecord
  validates :email,
            length: {in: 2..255, too_long: 'Ban da nhap email qua dai'},
            presence: true,
            uniqueness: {case_sensitive: false}

  validates :name, presence: true, length: {in: 4..255}

  validate :check_name_valid

  # uncomment in Gemfile gem 'bcrypt', '~> 3.1.7'
  has_secure_password

  def check_name_valid
    if (name.present? && name == email)
      errors.add(:name, 'Ten khong duoc trung voi email')
    end
  end
end

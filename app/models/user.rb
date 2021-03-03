# frozen_string_literal: true

class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :role, inclusion: { in: %w[member admin], message: '%<value>s is not a valid role' }

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_name=(val)
    pieces = val.split
    self.first_name = pieces[0]
    self.last_name = pieces[1]
  end
end

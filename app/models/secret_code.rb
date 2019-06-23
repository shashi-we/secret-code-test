class SecretCode < ApplicationRecord
  belongs_to :user, optional: true
  validates :code, presence: true, uniqueness: true
end

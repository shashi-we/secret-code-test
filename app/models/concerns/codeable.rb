module Codeable
  extend ActiveSupport::Concern

  included do
    attr_accessor :code
    validates_presence_of :code, unless: :admin?
    validate :valid_code?, unless: :admin?

    after_commit :add_secret_code, on: :create, unless: :admin?
  end

  def add_secret_code
    self.secret_code = valid_code
  end

  def valid_code?
    errors.add(:code, "invalid code") unless valid_code
  end

  def valid_code
    SecretCode.where(code: self.code, user: nil).first
  end
end

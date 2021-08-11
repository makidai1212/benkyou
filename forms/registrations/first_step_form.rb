require "reform/form/validation/unique_validator"
module Registrations
  class FirstStepForm < Reform::Form

    property :first_name
    property :family_name
    property :nickname
    property :phone_number

    validates :first_name, presence: true
    validates :family_name, presence: true
    validates :nickname, presence: true, unique: true
    validates :phone_number, presence: true, unique: true

  end
end

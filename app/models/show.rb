class Show < ApplicationRecord

    belongs_to :user

    validates :name, presence: true, length: {minimum: 2}
    validates :priority, presence: true, length: {minimum: 4}
end

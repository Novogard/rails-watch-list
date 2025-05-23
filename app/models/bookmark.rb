class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  validates :movie, :list, presence: true
  validates :movie, uniqueness: { scope: :list,
                                  message: 'Should happen once per list' }
end

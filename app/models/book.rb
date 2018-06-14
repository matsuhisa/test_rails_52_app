class Book < ApplicationRecord
  def new_arrivals?
    (created_at..created_at.since(7.days)).cover?(Time.zone.now)
  end
end

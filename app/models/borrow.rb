class Borrow < ApplicationRecord
    user: references
    book: references
    started_at: datetime
    ended_at: datetime | null
end

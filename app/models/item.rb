class Item < ApplicationRecord
  include PgSearch
  pg_search_scope :pg_search, against: [:content],:using => {tsearch: {prefix: true, any_word: true, dictionary: "russian"}}

  belongs_to :tender
end

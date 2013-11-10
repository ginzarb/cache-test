module BookHelper
  def cache_key_for_books
    count          = Book.count
    max_updated_at = Book.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "books/all-#{count}-#{max_updated_at}"
  end
end

module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end

  def checked_value(rating)
    return true unless @rating_hash
    @rating_hash[:rating].include? rating
  end
end

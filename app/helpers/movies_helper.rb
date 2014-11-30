module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end

  def checked_value(rating)
    return true unless @ratings
    @ratings.include? rating
  end

  def table_head_class(value)
    (@order == value) ? "hilite" : nil
  end

  def rating_hash(ratings)
    ratings.reduce({}) do |hash, item|
      hash.merge(item.to_sym => 1)
    end 
  end
end

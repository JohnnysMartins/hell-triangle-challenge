class HellTriangle
  def initialize(triangle)
    @triangle = triangle
  end

  def total_sum
    if is_valid_triangle?
      return total_calculates
    end
    return nil
  end

  private

  def total_calculates
    while @triangle.length > 1
      last_row = @triangle.pop
      last_but_one_row = @triangle.pop
      value = last_but_one_row.map.with_index { |number, index|
        number + [last_row[index], last_row[index + 1]].max
      }
      @triangle.push(value)
    end
    return @triangle[0][0]
  end

  def is_valid_triangle?
    if !(@triangle.kind_of? Array) || @triangle.empty?
      return false
    end

    return is_valid_triangle_row?
  end

  def is_valid_triangle_row?
    (0...@triangle.length).each do |i|
      row = @triangle[i]

      if !(row.kind_of? Array) && row.length == (i + 1)
        return false
      end

      if !is_item_valid?(row)
        return false
      end
    end
    return true
  end

  def is_item_valid?(row)
    row.each do |item|
      return false unless item.kind_of? Integer
    end
    return true
  end
end

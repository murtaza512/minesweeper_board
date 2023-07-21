module RandomizeMines
  extend ActiveSupport::Concern
  def locations(rows = 0, cols = 0, mines = 0)
    dimension = rows * cols

    mines_location = (0..dimension - 1).to_a.sample(mines)
  end

  def neighbours(index, rows, cols)
    neighbours = []
    directions = [-cols - 1, -cols, -cols + 1, -1, 1, cols - 1, cols, cols + 1]
    
    directions.each do |direction|
      neighbour_index = index + direction
      if neighbour_index >= 0 && neighbour_index < rows * cols &&
         !((index % cols) == 0 && (direction == -1 || direction == (cols - 1) || direction == (-cols - 1))) && 
         !((index % cols) == (cols - 1) && (direction == 1 || direction == (-cols + 1) || direction == (cols + 1)))
        neighbours << neighbour_index
      end
    end
    
    neighbours.uniq
  end

  def grid(mines, rows = 0, cols = 0)
    grid = Array.new(rows).map {|_| Array.new(cols)}

    mines_hash = mines.product([true]).to_h

    rows.times do |r|
      cols.times do |c|
        index = r * cols + c
        if mines_hash[index]
          grid[r][c] = -1
        else
          neighs = neighbours(index, rows, cols)
          grid[r][c] = mines_hash.values_at(*neighs).compact.size
        end
      end
    end

    grid
  end
end

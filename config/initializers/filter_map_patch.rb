module Enumerable
  def filter_map
    map { |e| yield e }.compact
  end
end

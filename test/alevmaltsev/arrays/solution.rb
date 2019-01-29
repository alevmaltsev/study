module Alevmaltsev
  module Arrays
    class << self
      def replace(array)
        max_value = array.max
        array.map! { |item| item > 0 ? max_value : item }
      end

      def search(array, query, index = 0, rindex = array.length - 1)
        return -1 if index > rindex
        middle = (index + rindex) / 2
        return middle if array[middle] == query
        array[middle] > query ? rindex = middle - 1 : index = middle + 1
        search(array, query, index, rindex)
      end
    end
  end
end

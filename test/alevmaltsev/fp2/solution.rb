module Alevmaltsev
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for el in self
          yield el
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        new_array = MyArray.new
        my_each { |el| new_array.push yield el }
        new_array
      end

      # Написать свою функцию my_compact
      def my_compact
        new_array = MyArray.new
        my_each { |el| new_array.push el unless el.nil? }
        new_array
      end

      # Написать свою функцию my_reduce
      def my_reduce(memo = nil)
        new_array = MyArray.new(self)
        memo = memo.nil? ? new_array.shift : memo
        new_array.my_each { |el| memo = yield el, memo }
        memo
      end
    end
  end
end

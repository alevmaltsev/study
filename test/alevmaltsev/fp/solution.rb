module Alevmaltsev
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        necessary_rating_array = []
        array.each do |film|
          if !film['country'].nil? && film['country'].split(',').length >= 2 && !film['rating_kinopoisk'].to_f.zero?
            necessary_rating_array.push(film['rating_kinopoisk'].to_f)
          end
        end
        necessary_rating_array.reduce(:+) / necessary_rating_array.length
      end

      def chars_count(films, threshold)
        films.reduce(0) { |sum, film| film['rating_kinopoisk'].to_f >= threshold.to_f && film['name'].include?('и') ? sum + 1 : sum }
      end
    end
  end
end

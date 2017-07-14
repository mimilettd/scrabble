class Scrabble
  attr_reader :score, :word

  def initialize
    @word = word
  end

  def score(word)
    if word.nil? || word == ""
      return 0
    else
      value = word.upcase.chars.map do |letter|
      point_values[letter]
      end
      value.inject(&:+)
    end
  end

  def score_with_multipliers(word, multiplier, doubler = 1)
    if word.length < 6
      score_with_multipliers_no_bonus(word, multiplier, doubler)
    else
      score_with_multipliers_and_bonus(word, multiplier, doubler)
    end
  end

  def score_with_multipliers_no_bonus(word, multiplier, doubler = 1)
    value = word.upcase.chars.map do |letter|
      point_values[letter]
    end
    new_value = value.zip(multiplier).map do |value, multiplier|
      (value * multiplier) * doubler
    end
    new_value.inject(&:+)
  end

  def score_with_multipliers_and_bonus(word, multiplier, doubler = 1)
    value = word.upcase.chars.map do |letter|
      point_values[letter]
    end
    new_value = value.zip(multiplier).map do |value, multiplier|
      (value * multiplier) * doubler
    end
    sum = new_value.inject(&:+)
    sum + (10 * doubler)
  end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end

end

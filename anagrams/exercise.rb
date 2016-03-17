
# O(n!)
def first_anagram?(string1, string2)
  anagrams = string1.chars.permutation.map do |array|
    array.join("")
  end

  anagrams.include?(string2)
end

# O(n^2)
def second_anagram?(string1, string2)
  chars1 = string1.chars
  chars2 = string2.chars

  string1.chars.each do |char1|
    found = chars2.index(char1)

    chars2.delete_at(found) if found
  end

  string2.chars.each do |char2|
    found = chars1.index(char2)

    chars1.delete_at(found) if found
  end


  chars1.empty? && chars2.empty?
end

# O(nlogn) depends on sort implementation
def third_anagram?(string1, string2)
  string1.chars.sort == string2.chars.sort
end


# O(n)
def fourth_anagram?(string1, string2)

  counts = Hash.new(0)

  string1.each_char { |char| counts[char] += 1 }
  string2.each_char { |char| counts[char] -= 1 }

  counts.all? { |_, count| count.zero? }
end

str1 = 'tac'
str2 = 'cat'
str3 = 'vat'

p fourth_anagram?(str1, str2)
p fourth_anagram?(str1, str3)

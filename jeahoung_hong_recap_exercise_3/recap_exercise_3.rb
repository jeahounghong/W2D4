require "byebug"
def no_dupes?(arr)
    hash = Hash.new{0}
    arr.each do |el|
        hash[el] += 1
    end

    arr = []
    hash.each do |k,v|
        arr << k if v == 1
    end
    return arr
end
p "NO DUPES"
p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []
puts

def no_consecutive_repeats?(arr)
    return true if arr.length < 2
    (0...arr.length - 1).each do |i|
        return false if arr[i] == arr[i+1]
    end
    true
end
p "NO CON DUPES?"
p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])       
puts 

def char_indices(str)
    hash = Hash.new { |h, k| h[k] = [] }
    str.each_char.with_index do |c,i|
        hash[c] << i
    end
    hash
end
p "CHAR INDICES"
p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}
puts

def longest_streak(str)
    return str if str.length < 2
    str2 = ""
    i = 0
    while i < str.length  do
        #debugger
        if str[i] != str[i+1]
            str2 += str[i]
        else
            count = 0
            j = 1
            while str[i] == str[i+j] do 
                count += 1
                j += 1
            end
            i += count 
            str2 += str[i] + (count + 1).to_s
        end
        i += 1
    end

    max_idx = 0
    str2.each_char.with_index do |c,i|
        
        if c.to_i.to_s == c
            max_idx = (str2[max_idx].to_i <= str2[i].to_i) ? i : max_idx
        end
    end
    
    answer = ""
    (str2[max_idx].to_i).times do
        answer += str2[max_idx - 1]
    end
    answer
end
p "LONGEST STREAK"
# Examples
p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'
puts
def bi_prime?(num)
    return false if num < 3
    (2..num).each do |i|
        (2..num).each do |j|
            if prime(j) && prime(i) && j*i == num
                return true
            end
        end
    end
    false
end
def prime(num)
    return false if num < 2
    return true if num == 2
    (2...num).each do |i|
        return false if num % i == 0
    end
    true
end
p "BI PRIME"
p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false
puts

def vigenere_cipher(str, arr)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    new_str = ""
    str.each_char.with_index do |c,i|
        amount = arr[i % arr.length]
        new_str += alphabet[(alphabet.index(c) + amount) % 26]
    end
    new_str
end
p "VIGENERE CIPHER"
p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"
class Freq
  attr_accessor :k 
  def initialize()
   print "enter the string: "
   s= STDIN.gets.chomp
   st= s.split(' ')
   k= Hash.new(0)
   for i in st
     k[i]+=1
   end
   k= k.sort_by{|word, count| -count}
   k.each{|word, count| puts"#{word}:#{count}"} 
  end
end

f = Freq.new()


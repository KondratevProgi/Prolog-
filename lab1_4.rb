# massiv=Array.new()
massiv=[7,2,3,3,3,3]
puts massiv
  
puts "------------------------"
res=massiv.rotate(3)

puts res

puts "------------------------"
puts (massiv[massiv.index(massiv.min)-1])

puts "------------------------"

n=4
puts(massiv[n-1]>massiv[n]&&massiv[n+1]>massiv[n])

puts "------------------------"

sum=massiv.sum().to_f/massiv.size
puts massiv.select{|i| i<sum}

puts "------------------------last"
newarr=Array.new()
newarr.append(massiv.select{|i| massiv.count(i)>3})
newarr=newarr.uniq
puts newarr

puts "------------------------"

str = "There are no facts only interpretations"
p str.split(' ').map{ |w| w[0] + w.split('')[1..-2].shuffle.join + w[-1] } * ' '

s = "абв1где25жзи"
p s.split('').sort.join


puts "------------------------"
#Data

def method_d(str)
return str.scan(/(\s|^)+(3[0-1]|0[1-9]|[12][1-9])(\s)+(января|февраля|марта|апреля|мая|июня|июля|августа|сентября|октября|ноября|декабря){1}(\s)+([1-9][0-9]{3}|[1-9][0-9]{2})/)
end


p method_d("23 ноября 2003")

puts "------------------------"

s = "ягодаанго4овыаыа6ываыв3"
p( s.scan(/[6-9]/).size )

puts "------------------------"
s = "абВГдеЖ"
a = ("а".."я").to_a + ("А".."Я").to_a
puts(( a - s.scan(/[а-яА-Я]/) ).to_s )




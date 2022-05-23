
x=ARGV[0].to_i
# puts x

 # sum=0
 # while x>0
 # 	sum=sum+(x%10)
 # 	x=x/10
 # end
 # puts sum
# задание 2
def method_sum(x)
	sum=0
	while x>0
		sum=sum+(x%10)
		x=x/10
	end
	return sum
end

def method_min(x)
	min=x%10
	while x>0
		if x%10<min
			min=x%10
		end
		x=x/10
	end
	return min
end

def method_max(x)
	max=x%10
	while x>0
		if x%10>max
			max=x%10
		end
		x=x/10
	end
	return max
end

def neprost(x)
	for i in (2..x/2)
		if x%i==0
			return true
		end
	end
	return false
end

def method_neprost_del(x)
	sum=0
	for i in (2..x/2)
		if x % i==0 and neprost(i)
			sum=sum+i
		end
	end
	if neprost(x)
		sum=sum+x
	end
	return sum
end

def method_min3(x)
	min3=0
	while x>0
		if x%10<3
			min3=min3+1
		end
		x=x/10
	end
	return min3
end

def nod(a,b)
	while a!=0 and b!=0
		if a>b
			a=a%b
		else
			b=b%a
		end
	end
	return a+b
end

def method_sum_prost(x)
	sum=0
	while x>0
		if neprost(x%10)==false
			sum=sum+(x%10)
		end
		x=x/10
	end
	return sum
end

def method_last(x)
	sum_pros=method_sum_prost(x)
	count=0
	for i in (1..x)
		if x % i != 0 and nod(x,i)!=1 and nod(sum_pros,i)==1
			p i
			count = count + 1
		end
	end
	return count
end



if ARGV[1]==nil
 	puts "Hello word!"
else
	puts eval(ARGV[1]+"("+x.to_s+")")
end
puts method_sum(x)
puts method_min(x)
puts method_max(x)

# puts method_last(x)
# i=1
# count=0
# loop do
# 	puts i
# 	if method_last(i) != 0
# 		puts "нужное число #{i}"
# 		break
# 	end
# 	i+=1
# end



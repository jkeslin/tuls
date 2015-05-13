tuls = [*1..100]
poopy = []
poopy.push(tuls.map{ |e| e %3 == 0 && e %5 ==0 ? "fizzbuzz": 
	e %3 == 0 ? "fizz" : 
	e %5 == 0 ? "buzz" : 
	e })
puts poopy
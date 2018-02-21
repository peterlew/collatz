import sys

def doCollatz(n):
	sys.stdout.write(str(n) + " ")	
	if(n == 1):
		print()
		return
	if(n % 2 == 0):
		return doCollatz(n // 2)
	return doCollatz(3 * n + 1)

def address(n):
	addr = [0]
	while(n != 1):
		if(n % 2 == 0):
			addr[0] += 1
			n = n // 2
		else:
			addr.insert(0, 0)
			n = 3 * n + 1
	return addr

for i in range(1, 100):
	print(str(i) + ": " + str(address(i)))

def numFromAddress(addr):
	n = 1
	while addr != [0]:
		if addr[0] == 0:
			addr = addr[1:] 
			n = (n - 1) // 3
		else:
			addr[0] -= 1
			n *= 2
	return n


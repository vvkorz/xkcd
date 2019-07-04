with open("temp.txt", "r") as f:
	url_name = f.readline().strip('"\n')
print(url_name)

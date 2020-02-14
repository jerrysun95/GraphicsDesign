import string
bookName = "98.txt"
allwords = "allwords.txt"
uniquewords = "uniquewords.txt"
wordfrequency = "wordfrequency.txt"

def main():
	findallWords()
	findunWords()
	wordfrequency()


def findallWords():
	data = open(bookName,'r')
	data2 = open(uniquewords,'w')
	words = []
	for line in data:
		line = line.lower()
		line = line.strip("\n")
		lst = line.split(" ")
		for i in lst:
			i = i.strip(string.punctuation)
			if i == " " or i == "":
				i = i + "i got it"
				data2.write(i)
			else:
				i = i + "\n"
				data2.write(i)


def findunWords():
	data = open(allwords,'r')
	data2 = open(uniquewords,'w')
	wordset = set()
	for word in data:
		word = word.strip("\n")
		wordset.add(word)

	for word in wordset:
		word = word + "\n"
		data2.write(word)


def wordfrequency():
	wordDict = {}
	data = open(allwords,'r')
	data2 = open("wordfrequency.txt",'w')
	for word in data:
		word = word.strip("\n")
		if word not in wordDict:
			wordDict[word] = 1
		else:
			wordDict[word] += 1

	for word in wordDict:
		number = wordDict[word]
		result = word + " " + str(number) + "\n"
		data2.write(result)


main()



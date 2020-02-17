import re 
def findallWords():
	data = open("PrideandPrejudice.txt",'r')
	data2 = open("allwords.txt",'w')
	words = []
	for line in data:
		line = line.lower()
		line = line.strip("\n")
		# remove all punctuation 
		line = re.sub("[^a-zA-Z\s]+", "", line)
		lst = line.split(" ")
		for i in lst:
			if i == "  " or i == "":
				continue 
			else:
				i = i + "\n"
				data2.write(i)


def findunWords():
	data = open("allwords.txt",'r')
	data2 = open("uniquewords.txt",'w')
	wordset = set()
	for word in data:
		word = word.strip("\n")
		wordset.add(word)

	for word in wordset:
		word = word + "\n"
		data2.write(word)


def wordfrequency():
	wordDict = {}
	data = open("allwords.txt",'r')
	data2 = open("wordfrequency.txt",'w')
	for word in data:
		word = word.strip("\n")
		if word not in wordDict:
			wordDict[word] = 1
		else:
			wordDict[word] += 1

	# get the freq
	freqDict = {}
	for word in wordDict:
		if wordDict[word] not in freqDict:
			freqDict[wordDict[word]] = 1
		else:
			freqDict[wordDict[word]] += 1
	
	# sorting and print to txt 
	for freq in sorted(freqDict.keys()):
		number = freqDict[freq]
		result = str(freq) + ": " + str(number) + "\n"
		data2.write(result)



def main():
	findallWords()
	findunWords()
	wordfrequency()

main()



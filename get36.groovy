#!/usr/bin/env groovy
String baseDir = "."
long numOfWords = args[0].toInteger()
String fileFull = args[1]
String file24Words = args[2]

def listOfAll = new File(baseDir, fileFull).collect {it}
def listOfMy = new File(baseDir, file24Words).collect {it}
def list = listOfAll -listOfMy
long sizeFile = list.size()

for( int i = 0; i < numOfWords; i++){
	int rnd = Math.abs(new Random().nextInt() % sizeFile--)
	println list.removeAt(rnd)
}
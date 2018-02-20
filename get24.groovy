#!/usr/bin/env groovy

//args.each{println it}

String fileName = args[1]
String baseDir = "."
long numOfWords = args[0].toInteger()

//println fileName


// new File(baseDir, fileName).eachLine { line, nb ->
//      println "Line $nb: $line"
// }

def list = new File(baseDir, fileName).collect {it}
long sizeFile = list.size()

for( int i = 0; i < numOfWords; i++){
	int rnd = Math.abs(new Random().nextInt() % sizeFile--)
//	println "$i: of $sizeFile : "
	println list.removeAt(rnd)
}

// def listA = list.findAll { it[0] == "a" }

// sizeFile = listA.size()

// println sizeFile
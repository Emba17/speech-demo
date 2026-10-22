
.PHONY: build run clean

build: ttsDemo.jar

Speaker.class: Speaker.java
	javac -cp ".:/usr/share/java/freetts-1.2.2.jar" Speaker.java

Main.class: Main.java | Speaker.class
	javac -cp ".:/usr/share/java/freetts-1.2.2.jar" Main.java

ttsDemo.jar: Main.class Speaker.class
	jar cfe ttsDemo.jar Main *.class

run: ttsDemo.jar
	java -cp "ttsDemo.jar:/usr/share/java/*" Main

clean:
	rm -f *.class ttsDemo.jar


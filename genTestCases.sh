#!/bin/sh
if [ -f "evosuite-1.0.1.jar" ]
then
echo "==============Evosuite jar already exists================"
echo "==============Skipping the download======================"
else
echo "==============Downloading the Evosuite jar==============="
wget http://evosuite.org/files/evosuite-1.0.1.jar
fi

echo "==============Compiling the source======================="
javac ./src/main/java/Calculator.java

echo "=====Generating the test cases for the compiled source========"
cd ./src/test/java
java -jar ../../../evosuite-1.0.1.jar -class Calculator -projectCP ~/JenkinsOnEC2MavenProject/src/main/java/

echo "==============Successfully completed=========================="
exit 0

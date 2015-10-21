Prerquisites:
1. Java 8
2. Maven ~> 3.1
	a. Maven should use Java 8(Java_Home should point to Jre 8)
3. Add evosuite-standalone-runtime as a maven dependency in pom file (not a plugin)
4. Evosuite is not present in maven central. Explicity add its repository location
5. Add surefire plugin in pom file version 2.14.1

Steps:
1. Compile all the java classes
	javac /path/to/javafiles

2. Generate test cases using evosuite referencing all class files
	- Navigate to the src/test/java folder
	- Execute following command:
		java -jar evosuite-1.0.1.jar -class <class-file-name> -projectCP <class-path-to-source-directory>
	
	e.g. java -jar ~/Downloads/evosuite-1.0.1.jar -class BankAccount -projectCP ~/devops/JenkinsOnEC2MavenProject/src/main/java/

3. Go to project root folder and execute commands:

	maven clean test


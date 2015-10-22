* Prerequisites for Evosuite
	* Java 8
	* Maven should use Java 8
	* Add `evosuite-standalone-runtime` as a maven dependency in `pom.xml` file (not a plugin dependency)
	* Evosuite is not present in maven central. Explicity add its repository location
	* Add surefire plugin in pom file version 2.14.1

* Steps:
	1. Compile the required java classes for which the test cases need to be generated: `javac <java_src_file_path`
	2. Generate test cases using evosuite:
		1. Navigate to the src/test/java folder
		2. Execute following command:
		`java -jar evosuite-1.0.1.jar -class <class-name> -projectCP <class-path-to-source-directory>` <br>e.g. `java -jar ~/Downloads/evosuite-1.0.1.jar -class BankAccount -projectCP ~/devops/JenkinsOnEC2MavenProject/src/main/java/`
	3. Go to project root folder and execute commands: `mvn clean package`


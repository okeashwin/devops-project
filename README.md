# Milestone 2 Requirements

* The ability to run unit tests, measure coverage, and report the results.
	* We achieved this using JaCoCo. We also integrated JaCoCo coverage with Jenkins using an available Jenkins plugin.

* Using hooks or post-build scripts, have the ability to reject a commit if it fails a minimum testing criteria (e.g. failed test case, or less than 50% statement coverage) and analysis criteria (e.g. cannot commits that generate a particular FindBugs rule, such as "Method concatenates strings using + in a loop").
	* We have a check for this in the `post-commit` script. 
	* The `post-commit` script waits until the the current build gets completed.
	* Jenkins is configured such that the build is marked as UNSTABLE if it does not meet the set testing coverage threshold.
	* Once the build is complete, the `post-commit` collects the build status and rejects the code commit if it was unstable.
	* This is well demonstrated in the screencast ( Link is below)

* The ability to improve testing coverage using one of the techniques covered in class: constraint-based test generation, fuzzing, etc. You can use an existing tool or implement your own approach.
	* We have done this using a test suite generator called 'Evosuite'. A section below gives the steps to set Evosuite up on an Ubuntu system.

* The ability to run an existing static analysis tool on the source code (e.g. FindBugs, PMD, CheckStyle, NCover, Lint, etc.), process its results, and report its findings.
	* FindBugs was used to achieve this. There is a Jenkins plugin for FindBugs as well, which lets us view FindBug reports on Jenkins itself.

* The ability to extend an existing analysis tool with a custom analysis, or implement a new analysis from scratch. For example, you could write a static analysis that checks for the ratio of comments to code, or finds parse errors in SQL string statements. You could introduce security checks, a dynamic analysis, a data-flow analysis or a data-flow based test coverage.
	* 

* The ability to parse a code files and json files in order to detect the presence of AWS/digital ocean security tokens. The ability to check commited files that are private ssh keys. Using hooks, reject the commit if any violation occurs.
	* This is handled in a `pre-commit` hook.
	* `pre-commit` hook searches for a pattern matching a regex in the files outgoing for the current commit.

## Link to the Screencast 
* The demo can be found here : https://www.youtube.com/watch?v=1IJR5slB2z0

## Prerequisites for Evosuite
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


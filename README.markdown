### Build section

#### Objectives
##### The ability to trigger a build in response to a git commit via a [git hook](http://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks)
`post-commit` script submits a build request to Jenkins upon a commit. 
##### The ability to execute a build job via a script or build manager (e.g., shell, maven), which ensures a clean build each time
This is done by a Jenkins configuration setting . This issues the command `mvn clean package` before every build. This config setting is here : Jenkins project page -> configure -> Build -> Add Build step -> "Invoke top level Maven targets" -> "Goals" : clean package
##### The ability to determine failure or success of a build job, and as a result trigger an external event (run post-build task, send email, etc)
This is done by Jenkins configuration settings. Upon a successful build, test reports are published. Email notifications are sent upon failed builds. Both these settings are here : Jenkins project page -> configure-> Post-build actions
##### The ability to have multiple jobs corresponding to multiple branches in a repository. Specifically, a commit to a branch, `release`, will trigger a `release build job`. A commit to a branch, `dev`, will trigger a `dev build job`
This is done as a part of `post-commit` script. Using the Jenkins REST API, we query if the jobname `<project_name>_<git_branch>` exists. If this job is not yet created on Jenkins, we create this on Jenkins and issue a build request. Otherwise, only, the build request is submitted.
##### The ability to track and display a history of past builds (a simple list works) via http
Jenkins UI provides this utility to track current builds and see the history of past builds.

#### Link to the Screencast
https://www.youtube.com/watch?v=q2N8mCYphwU&feature=youtu.be

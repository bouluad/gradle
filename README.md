# gradle
To use Gradle to push artifacts into an Artifactory repository using the Maven Publish Plugin, you can follow the steps below:

1 - Add the Artifactory repository URL and credentials to your Gradle build file. This can be done by adding the following code snippet to your build.gradle file:

'''
publishing {
    repositories {
        maven {
            url = "https://<ARTIFACTORY_URL>/artifactory/<REPOSITORY_NAME>"
            credentials {
                username = "<USERNAME>"
                password = "<PASSWORD>"
            }
        }
    }
}
'''
Replace <ARTIFACTORY_URL> with the URL of your Artifactory instance, <REPOSITORY_NAME> with the name of the repository you want to publish to, <USERNAME> with your Artifactory username, and <PASSWORD> with your Artifactory password.
 
2 - Apply the Maven Publish Plugin to your Gradle build file by adding the following code snippet:
  apply plugin: 'maven-publish'
3 - Define the publication you want to create by adding the following code snippet:
  '''
publishing {
    publications {
        mavenJava(MavenPublication) {
            from components.java
            artifact sourceJar {
                classifier "sources"
            }
            artifact javadocJar {
                classifier "javadoc"
            }
        }
    }
}
'''
This defines a Maven publication named mavenJava that includes the Java component of your project, as well as separate artifacts for the source code and Javadoc.
4 - Finally, use the publish task to push the artifacts to the Artifactory repository by running the following command:
  ./gradlew publish
This will build and publish the artifacts to the Artifactory repository specified in step 1.

Note: Make sure that the necessary dependencies and configurations are present in your build file before running the publish task.
  
This code uses the System.getenv() method to retrieve the values of the ARTIFACTORY_USERNAME and ARTIFACTORY_PASSWORD environment variables and assigns them to the username and password properties of the credentials block.

Make sure that you have set these environment variables before running the Gradle build. You can set them on the command line by running the following commands (replace <USERNAME> and <PASSWORD> with your Artifactory credentials):
 
 '''
  export ARTIFACTORY_USERNAME=<USERNAME>
export ARTIFACTORY_PASSWORD=<PASSWORD>

  '''

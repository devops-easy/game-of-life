### Sonarqube installation
* Sonarqube needs java to run, by using sonarqube you can check code quality of developer code.
* Many organization uses this tool for code quality test.

``` sudo yum install java-1.8.0-openjdk-devel.x86_64 -y ```
## Sonarqube version
* In our organization they are using Sonarqube 6.7.7 so i am going with that if you want any other versions    [click here](https://www.sonarqube.org/downloads/)

``` cd /opt/ ```

```  
      sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-6.7.7.zip
      sudo unzip sonarqube-6.7.7.zip
      sudo chown ec2-user:ec2-user -R sonarqube-6.7.7
      cd sonarqube-6.7.7/bin/linux-x86-64/
      ./sonar.sh start
      ./sonar.sh status

 ```
 * Now go to browser sonarqube will be get ``` http-url:9000 ```
 * Login into sonar default usename & password are admin, generate token because we use that token in jenkins to integrate, also download sonarqube scanner plugin in Jenkins.After that go to configure system in Jenkins add sonarqube details.
 * Thats all your sonarqube installation completed, you can use pipeline project to implement.


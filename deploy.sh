JAR_NAME=$1
USER_HOME=$2
echo 'Stopping Tomcat service...'	
echo $JAR_NAME	
echo $USER_HOME
sudo service tomcat stop
echo 'Sending jar file... '
sudo cp -f /tmp/$JAR_NAME.jar $USER_HOME/$JAR_NAME.jar
sudo nohup java -jar $USER_HOME/$JAR_NAME.jar &

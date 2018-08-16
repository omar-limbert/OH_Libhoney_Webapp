JAR_NAME=$1
echo 'Stopping Tomcat service...'	
echo $JAR_NAME	
sudo service tomcat stop
echo 'Sending jar file... '
sudo cp -f /tmp/$JAR_NAME.jar $HOME/$JAR_NAME.jar
sudo nohup java -jar $HOME/$JAR_NAME.jar &

echo 'Sending jar file...'
sudo cp -f /tmp/${jar_name}.jar $HOME/${jar_name}.jar
sudo rm /tmp/${jar_name}.jar
sudo nohup java -jar $HOME/${jar_name}.jar &

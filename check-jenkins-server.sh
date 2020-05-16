echo "Table of Contents" > jenkins-check.txt
echo "This file contains the output as the result of checking for Git, Jenkins and Maven as well as user data from the initial boot sequence." >> jenkins-check.txt

echo "" >> jenkins-check.txt
echo "-----------------------------------------------" >> jenkins-check.txt
echo "uname -a" >> jenkins-check.txt
echo "-----------------------------------------------" >> jenkins-check.txt
uname -a >> jenkins-check.txt

# check to see if git is installed
echo "" >> jenkins-check.txt
echo "-----------------------------------------------" >> jenkins-check.txt
echo "Git Version" >> jenkins-check.txt
echo "-----------------------------------------------" >> jenkins-check.txt
git --version >> jenkins-check.txt

# --------------------------------------------------------
# this wasn't working, but is covered by Maven
# check to see if java is installed
# echo "" >> jenkins-check.txt
# echo "Java Version" >> jenkins-check.txt
# java -version >> jenkins-check.txt
# --------------------------------------------------------

# does the Jenkins directory exist
echo "" >> jenkins-check.txt
echo "-----------------------------------------------" >> jenkins-check.txt
echo "Jenkins directory entry count (/var/lib/jenkins)" >> jenkins-check.txt
echo "-----------------------------------------------" >> jenkins-check.txt
ls -l /var/lib/jenkins | wc -l >> jenkins-check.txt

# is Maven installed
echo "" >> jenkins-check.txt
echo "-----------------------------------------------" >> jenkins-check.txt
echo "Maven Check" >> jenkins-check.txt
echo "-----------------------------------------------" >> jenkins-check.txt
mvn -v >> jenkins-check.txt

# is Jenkins running
# ps ax | grep Jenkins
echo "" >> jenkins-check.txt
echo "-----------------------------------------------" >> jenkins-check.txt
echo "Jenkins PID" >> jenkins-check.txt
echo "-----------------------------------------------" >> jenkins-check.txt
# pgrep -u jenkins >> jenkins-check.txt
ps aux | grep jenkins | grep -v grep >> jenkins-check.txt

# curl userdata
echo "" >> jenkins-check.txt
echo "-----------------------------------------------" >> jenkins-check.txt
echo "User Data during Initial Boot Sequence" >> jenkins-check.txt
echo "-----------------------------------------------" >> jenkins-check.txt
curl http://169.254.169.254/latest/user-data >> jenkins-check.txt

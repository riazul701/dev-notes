Website List:
Phing: https://www.phing.info/
Install PHP PEAR: https://pear.php.net/manual/en/installation.getting.php
Net_FTP PEAR Package: https://pear.php.net/package/Net_FTP

Working Steps:
1. Download "go-pear.phar" from this url https://pear.php.net/go-pear.phar
2. Move "go-pear.phar" to "C:\pear" folder.
3. Run command "php go-pear.phar" to install PEAR and choose "system" during installation.
4. Goto "C:\pear\pear" folder and run command "php pearcmd.php install Net_FTP" to install Net_FTP pear package.
5. Run command "php pearcmd.php list" to check Net_FTP package is installed.
6. Download "phing-2.17.4.phar" from this url https://www.phing.info/ and place it at project root.
7. Inside project root folder create file "build.xml", get contents for this file from this url https://www.sitepoint.com/using-phing/
8. Run command "php phing-2.17.4.phar" to start deploying project.

Sample "build.xml" file
<?xml version="1.0" encoding="UTF-8"?>
<project name="HelloWorld" default="welcome" basedir="." description="a demo project">
 <property name="message" value="Hello World!"/>
 <!-- <property name="buildDir" value="build"/> -->
 <!-- <property name="srcDir" value="src"/> -->
 <property name="ftp.host" value="ftp.example.com"/>
 <property name="ftp.port" value="21"/>
 <property name="ftp.username" value="user"/>
 <property name="ftp.password" value="password"/>
 <property name="ftp.dir" value="/public_html/"/>
 <property name="ftp.mode" value="ascii"/>

 <target name="welcome">
  <echo msg="${message}"/>
 </target>

 <ftpdeploy
  host="${ftp.host}"
  port="${ftp.port}"
  username="${ftp.username}"
  password="${ftp.password}"
  dir="${ftp.dir}"
  mode="${ftp.mode}">
  <fileset dir = ".">
    <include name = "**"/>
  </fileset>
 </ftpdeploy>
</project>
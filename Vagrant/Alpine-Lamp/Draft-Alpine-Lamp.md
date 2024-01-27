## Alpine PHP Version:
Repository URL: https://mirrors.edge.kernel.org/alpine/
1. https://mirrors.edge.kernel.org/alpine/v3.0/main/x86_64/  -->  php-5.5.35-r0.apk
2. https://mirrors.edge.kernel.org/alpine/v3.1/main/x86_64/  -->  php-5.6.27-r0.apk
3. https://mirrors.edge.kernel.org/alpine/v3.2/main/x86_64/  -->  php-5.6.27-r0.apk
4. https://mirrors.edge.kernel.org/alpine/v3.3/main/x86_64/  -->  php-5.6.31-r0.apk
5. https://mirrors.edge.kernel.org/alpine/v3.4/main/x86_64/  -->  php5-5.6.36-r0.apk
6. https://mirrors.edge.kernel.org/alpine/v3.5/main/x86_64/  -->  php5-5.6.38-r0.apk
7. https://mirrors.edge.kernel.org/alpine/v3.6/community/x86_64/  -->  php5-5.6.40-r0.apk
8. https://mirrors.edge.kernel.org/alpine/v3.7/community/x86_64/  -->  php5-5.6.40-r0.apk
9. https://mirrors.edge.kernel.org/alpine/v3.8/community/x86_64/  -->  php5-5.6.40-r0.apk  [Selected - generic/alpine38]
10. https://mirrors.edge.kernel.org/alpine/v3.9/community/x86_64/  -->  php7-7.2.33-r0.apk  [Selected - generic/alpine39]
11. https://mirrors.edge.kernel.org/alpine/v3.10/community/x86_64/  -->  php7-7.3.14-r0.apk
12. https://mirrors.edge.kernel.org/alpine/v3.11/community/x86_64/  -->  php7-7.3.22-r0.apk
13. https://mirrors.edge.kernel.org/alpine/v3.12/community/x86_64/  -->  php7-7.3.33-r0.apk  [Selected - generic/alpine312]
14. https://mirrors.edge.kernel.org/alpine/v3.13/community/x86_64/  -->  php7-7.4.26-r0.apk
15. https://mirrors.edge.kernel.org/alpine/v3.14/community/x86_64/  -->  php7-7.4.33-r0.apk
16. https://mirrors.edge.kernel.org/alpine/v3.15/community/x86_64/  -->  php7-7.4.33-r0.apk  [Selected - generic/alpine315]
17. https://mirrors.edge.kernel.org/alpine/v3.16/community/x86_64/  --> php8-8.0.25-r0.apk
18. https://mirrors.edge.kernel.org/alpine/v3.17/community/x86_64/  --> php81-8.1.12-r0.apk  [Selected - generic/alpine317]
19. 
20. 


* phpmyadmin has been installed to:
*     /usr/share/webapps/phpmyadmin
* phpmyadmin config file has been installed to:
*     /etc/phpmyadmin/config.inc.php
* If you use apache2:
*     1) Change the ownership of the config directory:
*            chown -R apache:apache /etc/phpmyadmin
*     2) See if you need to modify the apache2 config:
*            /etc/apache2/conf.d/phpmyadmin.conf
*     3) Restart apache2 when done.






$cfg['Servers'][$i]['AllowNoPassword'] = false;

sed -i 's/original/new/g' file.txt

sed -i 's/$cfg['Servers'][$i]['AllowNoPassword'] = false;/$cfg['Servers'][$i]['AllowNoPassword'] = true;/g' /etc/phpmyadmin/config.inc.php

sed -i 's/$cfg[\'Servers\'][$i][\'AllowNoPassword\'] = false;/$cfg[\'Servers\'][$i][\'AllowNoPassword\'] = true;/g' /etc/phpmyadmin/config.inc.php





$cfg['Servers'][$i]['AllowNoPassword']=false;
sed -i 's/$cfg\['\''Servers'\''\]\[$i\]\['\''AllowNoPassword'\''\]=false;/$cfg\['\''Servers'\''\]\[$i\]\['\''AllowNoPassword'\''\]=true;/g' test.txt
$cfg['Servers'][$i]['AllowNoPassword'] = false;
sed -i 's/$cfg\['\''Servers'\''\]\[$i\]\['\''AllowNoPassword'\''\] = false;/$cfg\['\''Servers'\''\]\[$i\]\['\''AllowNoPassword'\''\] = true;/g' test.txt



aaa['111']
sed -i 's/aaa\['\''111'\''\]/bbb['\''222'\'']/g' test.txt
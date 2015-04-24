# Concerto

This is a personal repository containing a copy of the R source code for Concerto v4.  This package was developed by [http://www.psychometrics.cam.ac.uk/newconcerto](The Psychometrics Centre) at [http://www.cam.ac.uk/](the University of Cambridge).  Additional information regarding the installation of this platform can be found at [https://code.google.com/p/concerto-platform/wiki/Resources?tm=6](Concerto Wiki Page).

Depending on your platform you may need to add

```<IfModule mod_php5.c>``` 

```   php_value short_open_tag 1``` 

```</IfModule>```
 
 to your /etc/apache2/apache.conf file in order to turn on short open tags.  Assuming that you already have Apache2 and MySql loaded on your system, these were some of the php packages that I installed to get everything communicating:
 
 ```sudo apt-get install php-db php5-mysqlnd php5-mysqlnd-ms mysql-utilities ```

The phpini.Rds and SETTINGSphp.Rds datasets contain the php.ini file and the SETTINGS.php file that were used to get the platform up and running.  In each case there were only small modifications that needed to be made, but you can easily load these data files and print out a configuration file and be up and running by including your MySql password in the resulting SETTINGS.php file (assuming you've already created the Concerto database in MySql).

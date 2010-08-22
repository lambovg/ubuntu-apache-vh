#!/bin/bash

echo "Enter a domain (e.g. example.com):";
read domain;

echo "Enter a project namespace (com/uvwebs):";
read projectNs;

echo "Enter a project type (e.g bash):";
read projectType;

echo "
<VirtualHost *:80>
	ServerAdmin g7@localhost

    ServerName $domain
    ServerAlias www.$domain

    DirectoryIndex index.php

	DocumentRoot /var/www/project/$projectNs/$projectType/$domain/
	<Directory /var/www/project/$projectNs/$projectType/$domain>
		Options Indexes FollowSymLinks MultiViews ExecCGI
		AllowOverride All
		Order allow,deny
		allow from all
	</Directory>

	ErrorLog /var/log/apache2/error-$domain.log

	# Possible values include: debug, info, notice, warn, error, crit,
	# alert, emerg.
	LogLevel warn

	CustomLog /var/log/apache2/access-$domain.log combined

</VirtualHost>
";


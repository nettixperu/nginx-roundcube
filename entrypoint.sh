#!/bin/bash
yum install

### SET RANDOM DES_KEY FOR  IMAP PASSWORD IN THE SESSION RECORD
ROUNDCUBE_RANDOM=`perl -e 'my @chars = ("A".."Z", "a".."z"); my $string; $string .= $chars[rand @chars] for 1..24; print $string;'` # returns exactly 24 random chars
sed -i "s/ROUNDCUBE_RANDOM/$config['des_key']/g" /var/www/html/webmail/config/config.inc.php

# exec CMD

/opt/startup-roundcube.sh


echo ">> exec docker CMD"
echo "$@"
exec "$@"
#exec nginx

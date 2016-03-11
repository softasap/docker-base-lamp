FROM octohost/nginx:1.8

RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys E5267A6C; \
    echo 'deb http://ppa.launchpad.net/ondrej/php5/ubuntu trusty main' > /etc/apt/sources.list.d/ondrej-php5-trusty.list; \
    apt-get update ; \
    apt-get -y install php5-fpm php5-mysql php-apc php5-imagick php5-imap php5-mcrypt php5-curl php5-cli php5-gd php5-pgsql php5-sqlite php5-common php-pear curl php5-json php5-memcache ; \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# We need to set security.limit_extensions to FALSE in www.conf to fix an access denied message from nginx. 
# For more info see: http://stackoverflow.com/a/23393266
RUN   sed -i -e '/;security.limit_extensions = .php .php3 .php4 .php5/ s/;security.limit_extensions = .php .php3 .php4 .php5/security.limit_extensions = FALSE/' /etc/php5/fpm/pool.d/www.conf; 


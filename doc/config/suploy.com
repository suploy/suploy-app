# You may add here your
# server {
# ...
# }
# statements for each of your virtual hosts to this file

##
# You should look at the following URL's in order to grasp a solid understanding
# of Nginx configuration files in order to fully unleash the power of Nginx.
# http://wiki.nginx.org/Pitfalls
# http://wiki.nginx.org/QuickStart
# http://wiki.nginx.org/Configuration
#
# Generally, you will want to move this file somewhere, and start with a clean
# file but keep this around for reference. Or just disable in sites-enabled.
#
# Please see /usr/share/doc/nginx-doc/examples/ for more detailed examples.
##

server {
  listen   80; ## listen for ipv4; this line is default and implied

  root /var/www/mupaas.com/public;
  index index.html index.htm;

  server_name suploy.com;

  location / {
    # First attempt to serve request as file, then
    # as directory, then fall back to index.html
    try_files $uri $uri/ /index.html;
    # Uncomment to enable naxsi on this location
    # include /etc/nginx/naxsi.rules
  }

}

server {
  listen 80;

  server_name node.suploy.com;
  location / {
    proxy_pass http://localhost:5000;
  }
}

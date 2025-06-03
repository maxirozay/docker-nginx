Deploy a nginx server with ssl and brotli with docker

# setup
1. rename/edit `nginx/conf.d/example.conf` to add your website
2. `./deploy.sh`
3. get the certificate
4. uncomment the ssl config from your site .conf file
5. reload nginx

# commands

reload nginx
`sudo docker compose exec webserver nginx -s reload`

get certificate
`sudo docker compose run --rm --entrypoint "" certbot certbot certonly --webroot --webroot-path /var/www/certbot/ -d example.org`

renew certificate
`sudo docker compose run --rm --entrypoint "" certbot certbot renew`

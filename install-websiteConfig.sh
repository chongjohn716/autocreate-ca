cd /root/ca;
openssl genrsa -aes256 \
      -out intermediate/private/www.vue-pwa-demo.com.key.pem 2048;
chmod 400 intermediate/private/www.vue-pwa-demo.com.key.pem;
openssl req -config intermediate/openssl.cnf \
      -key intermediate/private/www.vue-pwa-demo.com.key.pem \
      -new -sha256 -out intermediate/csr/www.vue-pwa-demo.com.csr.pem;
openssl ca -config intermediate/openssl.cnf \
      -extensions server_cert -days 375 -notext -md sha256 \
      -in intermediate/csr/www.vue-pwa-demo.com.csr.pem \
      -out intermediate/certs/www.vue-pwa-demo.com.cert.pem;
chmod 444 intermediate/certs/www.vue-pwa-demo.com.cert.pem;
openssl x509 -noout -text \
      -in intermediate/certs/www.vue-pwa-demo.com.cert.pem;
openssl verify -CAfile intermediate/certs/ca-chain.cert.pem \
      intermediate/certs/www.vue-pwa-demo.com.cert.pem;

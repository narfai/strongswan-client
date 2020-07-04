# Strongswan VPN client

## Running

```
docker run -ti --rm \
    -v $(pwd)/ca_cert.pem:/vpn-user/ca_cert.pem \
    -v $(pwd)/crt.pem:/vpn-user/crt.pem \
    -v $(pwd)/key.pem:/vpn-user/key.pem \
    -e ENV VPN_SERVER_DOMAIN="vpn.example.com" \
    -e ENV VPN_SERVER_CA="/vpn-user/ca_cert.pem" \
    -e ENV VPN_USER_CERTIFICATE="/vpn-user/crt.pem" \
    -e ENV VPN_USER_KEY="/vpn-user/key.pem" \
    fcadeillan/strongswan-client
```

## Overide vpn conf

```
docker run -ti --rm \
    -v $(pwd)/ipsec.conf:/install/ipsec.conf \
    -v $(pwd)/ipsec.secrets:/install/ipsec.secrets \
    [...]
    fcadeillan/strongswan-client
```


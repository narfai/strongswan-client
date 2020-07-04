FROM alpine

RUN apk add --no-cache --update strongswan curl

COPY ipsec.conf  /install/ipsec.conf
COPY ipsec.secrets  /install/ipsec.secrets

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/bin/ash", "/entrypoint.sh"]
CMD ["run"]

ENV VPN_SERVER_DOMAIN="vpn.example.com"
ENV VPN_SERVER_CA="/vpn-user/ca_cert.pem"
ENV VPN_USER_CERTIFICATE="/vpn-user/crt.pem"
ENV VPN_USER_KEY="/vpn-user/key.pem"
ENV VPN_PROFILE="default"

VOLUME /vpn-user

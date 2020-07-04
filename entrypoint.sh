#!/bin/ash

echo 1 > /proc/sys/net/ipv4/ip_forward

install -D -m 644 /install/ipsec.conf /etc/ipsec.conf
install -D -m 644 /install/ipsec.secrets /etc/ipsec.secrets

cp -v "${VPN_SERVER_CA}" /etc/ipsec.d/cacerts/ca_cert.pem
cp -v "${VPN_USER_CERTIFICATE}" /etc/ipsec.d/certs/crt.pem
cp -v "${VPN_USER_KEY}" /etc/ipsec.d/private/key.pem

sed -e "s/VPN_SERVER_DOMAIN/${VPN_SERVER_DOMAIN}/g" /install/ipsec.conf > /etc/ipsec.conf

ipsec start

echo "Wait ipsec starting ( 2s ) ..."
sleep 2

ipsec up "${VPN_PROFILE}"

case "${1}" in
    shell|sh|ash)
        shift
        /bin/ash ${@}
        ;;
    *)
        echo "Wrong command"
        exit 1
        ;;
esac
shift

ipsec down "${VPN_PROFILE}"

exit 0

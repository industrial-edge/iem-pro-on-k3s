#!/bin/bash

path=$(dirname "$0")
IEM_NAME=$1
mkdir -p "${path}"/out

# Constants for certificate validity
ROOT_CERT_DAYS=3650           # 10 years
INTERMEDIATE_CERT_DAYS=1825   # 5  years
SERVER_CERT_DAYS=365        # 1  year

# Check the length of the DNS name
length=${#IEM_NAME}
if [ $length \> 63 ]
then 
    echo "WARNING: string too long for CN, will be adjusted"
    arrCN=(${IEM_NAME//./ })
    IEM_NAME_CN=*.${arrCN[-3]}.${arrCN[-2]}.${arrCN[-1]}
    echo "new CN $IEM_NAME_CN"
else 
    IEM_NAME_CN=$IEM_NAME
fi

# 1. Gernate Root Cert
openssl genrsa -out "${path}"/out/rootCert.key 4096
openssl req -x509 -new -nodes -key "${path}"/out/rootCert.key -sha256 -days ${ROOT_CERT_DAYS} -out "${path}"/out/rootCert.crt -config "${path}"/rootCert.conf

# 2. Generate Intermediate Cert
openssl genrsa -out "${path}"/out/intermediateCert.key 4096
openssl req -new -key "${path}"/out/intermediateCert.key -out "${path}"/out/intermediateCert.csr -config "${path}"/intermediateCert.conf
openssl x509 -req -in "${path}"/out/intermediateCert.csr -CA "${path}"/out/rootCert.crt -CAkey "${path}"/out/rootCert.key -CAcreateserial -out "${path}"/out/intermediateCert.crt -days ${INTERMEDIATE_CERT_DAYS} -sha256 -extfile "${path}"/intermediateCert-ext.conf

# 3. Generate Server Certificate (IEM Certificate)
openssl genrsa -out "${path}"/out/serverCert.key 4096
openssl req -new -key "${path}"/out/serverCert.key -out "${path}"/out/serverCert.csr -subj "/C=DE/ST=Dummy/L=Dummy/O=Dummy/CN=$IEM_NAME_CN" -config <(cat "${path}"/serverCert.conf <(printf "\\n[alt_names]\\nDNS=%s" "${IEM_NAME}"))
openssl x509 -req -in "${path}"/out/serverCert.csr -CA "${path}"/out/intermediateCert.crt -CAkey "${path}"/out/intermediateCert.key -CAcreateserial -out "${path}"/out/serverCert.crt -days ${SERVER_CERT_DAYS} -sha256 -extfile <(cat "${path}"/serverCert-ext.conf <(printf "\\n[alt_names]\\nDNS=%s" "${IEM_NAME}"))

# Create Chain File
cat "${path}"/out/serverCert.crt "${path}"/out/intermediateCert.crt > "${path}"/out/chain_without_rootCert.crt
cat "${path}"/out/serverCert.crt "${path}"/out/intermediateCert.crt "${path}"/out/rootCert.crt > "${path}"/out/fullChain.crt

# Verify the generated certificates
openssl verify -CAfile "${path}"/out/rootCert.crt "${path}"/out/intermediateCert.crt
openssl verify -CAfile "${path}"/out/rootCert.crt -untrusted "${path}"/out/intermediateCert.crt "${path}"/out/serverCert.crt

# Cleanup
rm "${path}"/out/*.srl 2>/dev/null
rm "${path}"/out/*.csr 2>/dev/null

# Output the generated files
echo
echo "========================================"
echo
echo "Generated certificates:"
echo "Root Cert: ${path}/out/rootCert.crt"
echo "Intermediate Cert: ${path}/out/intermediateCert.crt"
echo "IEM Certificate: ${path}/out/serverCert.crt"
echo
echo "Generated keys:"
echo "Root Cert Key: ${path}/out/rootCert.key"
echo "Intermediate Cert Key: ${path}/out/intermediateCert.key"
echo "IEM Key: ${path}/out/serverCert.key"
echo
echo "Generated certificate Chains:"
echo "Certificate Chain excluding the Root Cert: ${path}/out/chain_without_rootCert.crt"
echo "Full Chain: ${path}/out/fullChain.crt"

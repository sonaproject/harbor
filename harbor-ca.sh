#!/usr/bin/env bash
set -euxo pipefail
tdnf install -y ca-certificates
tdnf install -y openssl-c_rehash
TRUSTED_CERT="-----BEGIN CERTIFICATE-----
MIIC9TCCAd2gAwIBAgIRAKKJWEQYTes2bE8W81CrVSowDQYJKoZIhvcNAQELBQAw
FDESMBAGA1UEAxMJaGFyYm9yLWNhMB4XDTIwMTExMTEzMjUwMVoXDTIxMTExMTEz
MjUwMVowFDESMBAGA1UEAxMJaGFyYm9yLWNhMIIBIjANBgkqhkiG9w0BAQEFAAOC
AQ8AMIIBCgKCAQEAvpGoH8zkB248gGMm7TCDSQ5pAahOa0/qpu/CdsT0HUhzmIIW
OnwDy/FhdRMypieiyxl69TFG5Wcu2+1YQojuOPpVpnwqvUDZlEsfPWD5P/eEvAgV
uddJAxtiKnSB2fmLEQUxN6VAnGL0V0qWntaV0FtnnRZCMPb3t9DZmvnUnbQXa0Tp
HWtVXzKo7rWrJc7U+08PvLb97YLAuI6OTeAOca7NybFHtsNg/46WFHHZDu0NCwtD
e9/w5Ph/uf2JUcoKekQrFk0bGs3d0QK2PMOK+UttlgHh2lr+fAh1tunwIpJFzBrP
euHaieQbuWQxPwdbXLD3t8CKp3Pgmru+keMGBQIDAQABo0IwQDAOBgNVHQ8BAf8E
BAMCAqQwHQYDVR0lBBYwFAYIKwYBBQUHAwEGCCsGAQUFBwMCMA8GA1UdEwEB/wQF
MAMBAf8wDQYJKoZIhvcNAQELBQADggEBAE0+OgMUZgydafXVfLc9OZqfTo1+PkCB
37Fk6UqpjDT3VvMnCbjM3B6ny6uDnEnL1EDWm2kPAoOba7p2//lg9VrY9dHbGPBq
I4ohQrehdf0b4mQwzqicfAZp5N43Ec+TM23cmDnt+oRH04V3C0euAZRTs2QLNZrr
tdxvpZknZfRyQGf+8Y6rW07DWswdGrxgp+izx+BkBajAeqXbkHNApEpGvljwfic+
URjgLzMK0Vlto23+XnDaOuhDqzYgLkide2Bhu4inpiZTjB5R160NMRaa228wroj5
L1Lg5+Xt9hZXzEh4GNAgfe+yJp3MtYRnvGdTmnaiIS4iGY3nIvXCc88=
-----END CERTIFICATE-----
"
echo "$TRUSTED_CERT" > /etc/ssl/certs/my-trusted-cert-2.pem
/usr/bin/rehash_ca_certificates.sh
echo "Finished, restarting containerd"
systemctl restart containerd
echo "done"

#
# images tagged with the '*-akeyless' are the ones which support non-root
FROM akeyless/base:latest-akeyless

ARG IMAGE_NAME

# Make sure that /usr/local/bin is group writable
#   required for:
#     cp -rf /akeyless_shared_vol/akeyless-api-proxy/op/op /usr/local/bin
#
RUN /bin/sh -c chmod 775 /usr/local/bin


CMD ["/bin/sh" "-c" "/bin/bash /akeyless/docker_entrypoint.sh"]

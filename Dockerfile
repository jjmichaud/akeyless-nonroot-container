#
# images tagged with the '*-akeyless' are the ones which support non-root
FROM akeyless/base:latest-akeyless

ARG IMAGE_NAME

# Make sure that /usr/local/bin is group writable
#   required for:
#     cp -rf /akeyless_shared_vol/akeyless-api-proxy/op/op /usr/local/bin
#
# We need to switch back to the root user to perform this action
#
USER root
RUN chmod 775 /usr/local/bin

# switch back to the non-root user before starting the entrypoint 
#
USER 1001

# set the ENV variables again
#
ENV PATH=/akeyless/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV TMPDIR=/akeyless/tmp
ENV SPLUNK_FORWARDER_AUTOSTART=true


CMD ["/bin/sh", "-c", "/bin/bash /akeyless/docker_entrypoint.sh"]

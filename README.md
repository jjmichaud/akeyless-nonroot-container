akeyless-nonroot-container
===============

This is based on the [akeyless/base](https://hub.docker.com/r/akeyless/base/tags) docker image.

For OKD/Openshift it is preferable to run containers as an arbitrary user and NOT `root`. There are
[guidelines that they have published](https://docs.openshift.com/container-platform/4.9/openshift_images/create-images.html#images-create-guide-openshift_create-images)
to help create images that run best on OKD/Openshift. Specifically we want to make sure to follow the section on **Support arbitrary user ids**.

At the moment, only the Akeyless images that are tagged with the `*-akeyless` actually support non-root usage. Akeyless does not support arbitrary ids as they hardcode a specific user, but non-root is still better than running as uid 0.


Unfortunately they do not seem to publish the git repo where this is built from.  It does not appear to be one of their public repos in https://github.com/akeylesslabs.  Therefore we cannot build an image from the ground up, but initially we can just use their published image and add our own layer changes.


Build image
```
docker login
make
```


Prints out commands to push the image
```
make push
```

Random Notes
============

You can see the upstream Dockerfile contents in [dockerhub](https://hub.docker.com/layers/akeyless/base/latest-akeyless/images/sha256-5e720d5b2aab7bf8a6f54737b23d5f7c15caf1ad37689451cadacc302f037382?context=explore), but it is hard to generate your own file from it.


You can download most of the Dockerfile this way
```
docker history --no-trunc akeyless/base:latest-akeyless | colrm 1 88 | tac > Dockerfile.upstream1
```

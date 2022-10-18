akeyless-nonroot-container
===============

This is based on the [akeyless/base](https://hub.docker.com/r/akeyless/base/tags) docker image.

Unfortunately they do not seem to publish the git repo where this is built from.  It does not appear to be one of their public repos in https://github.com/akeylesslabs

However we can see the Dockerfile contents in [dockerhub](https://hub.docker.com/layers/akeyless/base/latest-akeyless/images/sha256-5e720d5b2aab7bf8a6f54737b23d5f7c15caf1ad37689451cadacc302f037382?context=explore)

While the current image as of 10/18/2022 does run as non-root, there are some problems with spinning up the image as some commands still expect root permissions.

For OKD/Openshift it is preferable to run containers as an arbitrary user and NOT `root`. There are
[guidelines that they have published](https://docs.openshift.com/container-platform/4.9/openshift_images/create-images.html#images-create-guide-openshift_create-images)
to help create images that run best on OKD/Openshift. Specifically we want to make sure to follow the section on **Support arbitrary user ids**.


Build image
```
docker login
make
```


Prints out commands to push the image
```
make push
```


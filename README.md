# docker_kaniko-executor

[Kaniko][] executor image build for my [Raspberry Pi cluster][].

[Kaniko]:               https://github.com/GoogleContainerTools/kaniko
[Raspberry Pi cluster]: https://farkasmate.github.io/raspberry_pi_cluster/

## Build

To build the `docker-registry.csikoste.com/kaniko-executor-arm` image on the Raspberry Pi cluster, run:

```
skaffold build
```

## Dev

To build an `amd64` image from the `master` branch locally, run:

```
skaffold build --profile dev
```

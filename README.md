# docker_kaniko-build

[Kaniko][] executor and warmer image build configs for my [Raspberry Pi cluster][].

[Kaniko]:               https://github.com/GoogleContainerTools/kaniko
[Raspberry Pi cluster]: https://farkasmate.github.io/raspberry_pi_cluster/

## Build

To build the `docker-registry.csikoste.com/kaniko-executor-arm` and `docker-registry.csikoste.com/kaniko-warmer-arm` images on the Raspberry Pi cluster, run:

```
skaffold build
```

The built private images are re-tagged and shared as `matefarkas/kaniko-executor:<kaniko_version>-arm` and `matefarkas/kaniko-warmer:<kaniko_version>-arm`.

## Dev

To build `amd64` images from the `master` branch locally, run:

```
skaffold build --profile dev
```

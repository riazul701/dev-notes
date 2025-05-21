# Commands/Usage

## Linux Commands

* sudo su
* sudo service docker start
* sudo service docker stop

## General Commands

## Storage Cleanup

* [Is it safe to clean docker/overlay2/](https://stackoverflow.com/questions/46672001/is-it-safe-to-clean-docker-overlay2)

* Docker uses /var/lib/docker to store your images, containers, and local named volumes. Deleting this can result in data loss and possibly stop the engine from running. The overlay2 subdirectory specifically contains the various filesystem layers for images and containers.
* To cleanup unused containers and images, see docker system prune. There are also options to remove volumes and even tagged images, but they aren't enabled by default due to the possibility of data loss:
```shell
$ docker system prune --help

Usage:  docker system prune [OPTIONS]

Remove unused data

Options:
  -a, --all             Remove all unused images not just dangling ones
      --filter filter   Provide filter values (e.g. 'label=<key>=<value>')
  -f, --force           Do not prompt for confirmation
      --volumes         Prune volumes
```
* What a prune will never delete includes:
  * running containers (list them with docker ps)
  * logs on those containers (see this post for details on limiting the size of logs)
  * filesystem changes made by those containers (visible with docker diff)
* Additionally, anything created outside of the normal docker folders may not be seen by docker during this garbage collection. This could be from some other app writing to this directory, or a previous configuration of the docker engine (e.g. switching from AUFS to overlay2, or possibly after enabling user namespaces).
* What would happen if this advice is ignored and you deleted a single folder like overlay2 out from this filesystem? The container filesystems are assembled from a collection of filesystem layers, and the overlay2 folder is where docker is performing some of these mounts (you'll see them in the output of mount when a container is running). Deleting some of these when they are in use would delete chunks of the filesystem out from a running container, and likely break the ability to start a new container from an impacted image. See [this question](https://stackoverflow.com/questions/67591341/oci-runtime-create-failed-container-linux-go345-starting-container-process-ca) for one of many possible results.
* To completely refresh docker to a clean state, you can delete the entire directory, not just sub-directories like overlay2:
```shell
# danger, read the entire text around this code before running
# you will lose data
sudo -s
systemctl stop docker
rm -rf /var/lib/docker
systemctl start docker
exit
```
* The engine will restart in a completely empty state, which means you will lose all:
  * images
  * containers
  * named volumes
  * user created networks
  * swarm state

# Cmd-Docker.md

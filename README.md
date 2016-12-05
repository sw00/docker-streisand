A Docker image to run [Streisand](https://github.com/jlund/streisand).

To use you will need to generate an ssh key first or mount a directory with existing keys.

# Quickstart

1. Create a data container.

```
docker run --name streisand-data sw00/streisand
```

2. Generate a new default SSH key.

```
docker run -it --rm --volumes-from=streisand-data \
	sw00/streisand \
	ssh-keygen -t rsa -b 4096 -f /root/.ssh/id_rsa -N ''
```

3. Execute streisand.

```
docker run -it --rm --volumes-from=streisand-data sw00/streisand
```

4. Retrieve generated docs.

```
docker run --rm --volumes-from=streisand-data -v $(pwd):/output sw00/streisand cp -r /streisand/generated-docs /output
```

5. Generated docs can now be found at `./generated-docs/streisand.html`.


# Additional Information

## The Docker Image

The `sw00/streisand` image declares the following two volume mounts:

* `/root/.ssh/`: streisand expects your provider's default ssh key, here saved as `id_rsa.pub`.

* `/streisand/generated-docs/`: upon completion, streisand will publish connection information in this directory as html files.


# Caveats

Currently only <s>supports</s>tested on the DigitalOcean provider.

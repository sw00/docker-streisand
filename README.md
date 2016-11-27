A Docker image to run [Streisand](https://github.com/jlund/streisand).

To use you will need to generate an ssh key first or mount a directory with existing keys.

# Generate a key in a data container

Run ssh-keygen in a data container:

`docker run -it --name streisand-data sw00/streisand ssh-keygen -t rsa -b 4096 -f /root/.ssh/id_rsa`

Follow the prompts to create the new ssh key.

Mount the data container and run streisand:

`docker run -it --name streisand --volumes-from streisand-data sw00/streisand`

# Use a pre-existing key

Assuming keys are in the current directory, denoted by `$(pwd)`, you can run:

`docker run -it -v $(pwd):/root/.ssh --name streisand sw00/streisand`

# Retrieve generated docs 

Streisand generates docs with details on how to connect to the newly configured server.
To retrieve them from the container:

```
docker exec streisand tar -C /streisand -cz - generated-docs > streisand.tgz &&\
tar xvf streisand.tgz
```

Then simply open `./generated-docs/streisand.html` on your local machine.

# Caveats

Currently only <s>supports</s>tested on DigitalOcean provider.

### Instruction

Let's assume docker is installed and running on the host.
##### 1. step: get the ubuntu package for Docker
` wget https://partner-images.canonical.com/core/xenial/current/ubuntu-xenial-core-cloudimg-amd64-root.tar.gz`
##### 2. step: build the image
`docker build .` (get the image ID)
##### 3. step: start the container  
`docker run -t -i {your image ID}`

### Result

You will be able to use `awscli`, `python` and `composer` in the shell prompt.
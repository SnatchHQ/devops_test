# SnatchHQ DevOps Technical Test

1. Testing use of Docker, Nginx, PHP and hosting.
2. Test scripting using BASH
3. Cloudformation

### Task 1 Development with Docker ###

**Requirements:**

```shell
Create a folder called 'docker' and using Docker, set-up a standard web 
development environment using nginx and php-fpm capable of hosting a supplied 
website in the 'site' folder. Additionally, ensure that curl package is 
installed. Provide us with instructions on how to run the environment.
```

**Deliverables:**

* A pull request (PR) from a branch named 'docker'
* Able to launch environment locally and accessible by a web browser
* Webpage should be changeable without rebuilding the image
* Webpage should be hosted at http://localhost:8080

**Bonus:**

* Use best practices to ensure one process per container, so that each component (nginx, php-fpm, docroot) should exist in seperate containers.

---

### Task 2 Additional Provisioning ###

**Requirements:**

```shell
Write a seperate bash shell script that would be used to add additional 
provisioning by installing python, aws-cli and composer.
```

**Deliverables:**

* A pull request (PR) from a branch named 'provisioning'
* Binaries are installed on the running container and can be run within $PATH

---

### Task 3 CloudFormation ###

**Requirements:**

```shell
Build a cloudformation stack (do not use AWS Cloudformation designer) consisting of:

* An EC2 Instance
* A Load Balancer (ELB)
```

**Deliverables:**

* Follow best practice security principles
* A pull request (PR) from a branch named 'cloudformation'
* A cloudformation JSON script that will launch an EC2 instance behind an ELB in a folder called /cloudformation

**Bonus:**

* Automatically install docker when the EC2 launches. 




Cloudformation
===
This stack SnatchTest provisions a highly available test web 
page.

Requirements
===
* A keypair (if you want to inspect/access the EC2 instances)
* IP address from which the webpage will be available

Architecture
===
As detailed in this [exported PNG](SnatchTestVPC1-designer.png), there is an ELB acting as the front-end for 2 EC2 instances, which reside in a private subnet. These instances can access the internet through a NAT gateway instance in the public subnet. The security groups provided lock down access to the specified IP only.

Screenshots
===
[sshot1](sshot1.PNG)
[sshot2](sshot2.PNG)
[sshot3](sshot3.PNG)
[sshot4](sshot4.PNG)

Notes:
===
* The installation of docker is omitted this time, hoping the use of 
"user data" is properly demonstrated through the installation of other 
packages, ie. in the case of the NAT gateway instance.
* Available to run in the London region (eu-west-2).
* The NAT gateway service is not available in the free-tier, hence the use of a NAT gateway instance.

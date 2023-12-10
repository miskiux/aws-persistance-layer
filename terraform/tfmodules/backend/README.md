## Backend infrastructure

#### EC2 instances on private subnets
Instances' ports are not exposed to the internet.

#### EC2 Instance Connect Endpoint

Once you create an EC2 Instance Connect Endpoint in a subnet, you can use the endpoint to connect via SSH to any instance in any subnet in your VPC. 
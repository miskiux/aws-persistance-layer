## Backend infrastructure

#### EC2 instances on private subnets
Instances' ports are not exposed to the internet.

#### SSH via EC2 Instance Connect Endpoint and mount EFS manually unto EC2

```http
sudo su -

# Create mount directory
mkdir /mnt-efs

# Use NFSv4 Client to mount EFS to mount directory
mount -t nfs4 ${file_system_dns_name}:/ /mnt-efs

# Check ec2 file system
df -h
```
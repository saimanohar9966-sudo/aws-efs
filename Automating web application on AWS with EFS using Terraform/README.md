The task in Hand:
1. Create VPC, Subnet, Internet gateway, Route table
2. Create the key & Create a Security group which allow the port 80 for http, 22 for ssh, 2049 for NFS
Launch EC2 instance.
3. Launch one Volume using the EFS service and attach it in your vpc, then mount that volume into /var/www/html
4. Developer have uploded the code into github repo also the repo has some images.
5. Copy the github repo code into /var/www/html
6. Create S3 bucket, and copy/deploy the images from github repo into the s3 bucket and change the permission to public readable.
7. Create a Cloudfront using s3 bucket(which contains images) and use the Cloudfront URL to update in code in /var/www/html
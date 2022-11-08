# Nebula Techical Challenge Using AWS and Terraform

In this challenge, i was required to create a website where a visitor can provide their name and the website responds with

 Hello (name that was provided) , your IP address is (IP address of visitor). 
 

## Proposed Solution
The diagram below shows an overveiw of how the solution functions.
![Proposed solution](https://github.com/King2k5ng/nebula-challenge-cf/blob/main/nebula_project.png)


In this solution, I create a webpage that is hosted on an S3 bucket and served using a CloudFront distribution. 
Resources are deployed using Terraform. This solution takes into consideration Cost Optimisation and Scalability 


### Solution Details

This solution creates an S3 bucket that hosts my static website’s files(the files in the assets folder). 
The website is only accessible via CloudFront, not directly from S3.
The CloudFront Distribution uses the S3 bucket's website endpoint as the origin, with anonymous (public) access allowed.
Teraform is  used to deploy the resources needed for the solution and upload the objects to the S3 buckets


### Prerequisites
* AWS account
* AWS CLI
* Terraform

### Deploying Solution
for this solution Terraform deploys your resources and also handles loading the webpage file to the designated S3 bucket.
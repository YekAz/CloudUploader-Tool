# CloudUploader-Tool

## OVERVIEW

This is a bash-based CLI tool that allows you to quickly upload files to Amazon S3 cloud storage solution, giving you a simple and seamless upload experience. It aims to offer a user-friendly experience similar to popular storage services.
 
## PRE-REQUISITES

In order to have a smooth experience using the uploader tool, the following requirements needs to be put in place;

+ Bash
+ Download and configure the AWS CLI (Amazon Web Services Command Line Interface).
+ pv (Pipe Viewer) for progress bar (install with sudo apt-get install pv)

## INSTALLATION & CONFIGURATION

Follow the steps bellow to install and configure the CloudUploader CLI Tool;

+ Ensure you have the latest version of Git installed on your terminal. To check your version of Git, run the coomand 'git version' or 'git --version' or 'git -v' to check.

   If git is not installed on your machine, run the commands below to install Git;

	'''
	 sudo apt update
	 sudo apt install git
	'''

+ Clone this  repository

	'''
	 git clone https://github.com/YekAz/CloudUploader-Tool
	'''

+ Navigate to the tool directory on your machine

	'''
	 cd CloudUploader-Tool
	'''

+ Run the installation script

	'''
	 ./install.sh
	'''

+ Configure the tool with your AWS credentials by including your credentials as variables on your system in the format below;

	'''
	 AWS_ACCESS_KEY_ID="your aws access key"
	 AWS_SECRET_ACCESS_KEY="your aws secret access key"
	 AWS_DEFAULT_REGION="your aws default region"
	 S3_BUCKET="your bucket name"
	'''
	
## USAGE EXAMPLES

+ To upload a single file, use the command;

	'''
	 clouduploader.sh -f /path/to/your/file.txt
	'''

+ To upload multiple files, use the command;

	'''
	 clouduploader.sh -f /path/to/file1.txt /path/to/file2.txt
	'''

## ADVANCED FEATURES

This CloudUploader CLI tool offers the following advanced features for your usage and convinience.

+ **Multiple File Upload**

   CloudUploader supports uploading multiple files at once. To upload multiple files, provide the paths separated by a space after the -f option as stated in the usage example above.

+ **File Synchronization**

   This tool offers a synchronization feature which detects if the file or files you are uploading is already in your Amazon S3 cloud storage. The tool then prompts you if you want to overwrite,skip or rename the file. Selecting any of the three options is as easy as pressing a button and then pressing enter.

+ **Progress Bar**

   This tool has a progress bar indicating the percentage cmpletion as your file uploads. This gives you a better feedback as you upload your file. Ensure you meet the third  pre - requisite above in order to enjoy this feature.

+ **Shareable Link**

   When your upload is complete, this tools gives you an option to generate a shareable link a shareable link of your upload. With this you can share a link to you uploads with friends, colleagues or co-workers.

## COMMON ISSUES AND TROUBLESHOOTING

1. **AWS CLI is not installed:**

 	**Issue:** The AWS CLI is a requirement for CloudUploader, and if it's not installed, the tool won't work.
 
 	** Troubleshooting: **
 	+ Install the AWS CLI using the 'user guide' on the AWS CLI documentation:' https://docs.aws.amazon.com/cli/'

2. ** Incorrect AWS Configuration: **

 	** Issue: ** Incorrect or missing AWS credentials or configuration.

 	**Troubleshooting:**
 	+ Ensure that AWS credentials are correctly configured on your system.
 	+ Run 'aws configure' on your terminal to set up AWS CLI credentials interactively.

3. **Invalid S3 Bucket Name:**

 	**Issue:** The S3 bucket you specified does not exist or there is a mistake in the name.

 	**Troubleshooting:**
 	+ Double-check the S3 bucket name specified in the configuration.
 	+ Ensure the bucket exists and is accessible by the configured AWS credentials.

4. **Permission Issues:**

 	**Issue:** Permission denied errors during installation or execution.

 	**Troubleshooting:**
 	+ Ensure that the you have the necessary permissions to install and execute the script. Give yourself execution permission with the command ' chmod x+ ' while in the directory the file is uploaded.

 	+ Use sudo (for running installation command) when required, but be cautious with elevated privileges.

5. **File Upload Failures:**

 	**Issue:** Failure during file upload to S3.

 	**Troubleshooting:**
 	+ Check that your AWS S3 configurations are correct.
 	+ Verify that the specified file path is correct.

6. **Shareable Link Generation Issues:**

 	**Issue:** Problems generating or displaying shareable links.

 	**Troubleshooting:**
 	+ Confirm that the uploaded file is in the specified S3 bucket.

7. **Script not in $PATH:**

  	**Issue:** You might have trouble running the script if it's not in a directory listed in the $PATH.

  	**Troubleshooting:**
  	+ Add the directory containing the script to the $PATH or execute it with the full path.

8. pv (Pipe Viewer) is not installed:

  	**Issue:** pv is used for the progress bar feature, and if it's not installed, you won't see a progress indicator.

  	**Troubleshooting:**
  	+ Install pv using the package manager for your system

	'''
	sudo apt-get install pv
	'''	 

9. 	**Network Issues:**

  	**Issue:** Issues related to network connectivity, DNS resolution, or firewall blocking.

  	**Troubleshooting:**
  	+ Check your internet connectivity.
  	+ Verify your DNS settings and try again using a different DNS server.
  	+ Ensure there are no firewall or proxy issues. 

 > ENJOY!!! and please give feedbacks on youur experience with the tool.

#!/bin/bash

# Read AWS credentials and configuration from environment variables or use defaults
AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID"
AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY"
AWS_DEFAULT_REGION="$AWS_DEFAULT_REGION"
S3_BUCKET="$S3_BUCKET"

# Check for required options
if [ -z "$AWS_ACCESS_KEY_ID" ] || [ -z "$AWS_SECRET_ACCESS_KEY" ] || [ -z "$AWS_DEFAULT_REGION" ] || [ -z "$S3_BUCKET" ]; then
  echo "AWS credentials and configuration not set. Please configure the script with your AWS details."
  exit 1
fi

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
  key="$1"

  case $key in
    -f)
      shift
      FILES+=("$@")
      break
      ;;
    *)
      echo "Unknown option: $key"
      exit 1
      ;;
  esac
done

# Check for required options
if [ ${#FILES[@]} -eq 0 ]; then
  echo "Usage: $0 -f <file_path1> [file_path2 file_path3 ...]"
  exit 1
fi

# Iterate over each file and upload to S3
for FILE_PATH in "${FILES[@]}"; do

# Extract file name from path
FILE_NAME=$(basename "$FILE_PATH")

# Check if the file already exists in S3
if aws s3 ls "s3://$S3_BUCKET/$FILE_NAME" 2>/dev/null; then
  # File exists, prompt user for action
  read -p "File '$FILE_NAME' already exists in S3. Do you want to (O)verwrite, (S)kip, or (R)ename the file? [O/S/R]: " CHOICE    
    
    case $CHOICE in
    [Oo])
      # Overwrite the existing file
      pv "$FILE_PATH" | aws s3 cp - "s3://$S3_BUCKET/$FILE_NAME"
      ;;
    [Ss])
      # Skip the upload
      echo "Skipped uploading '$FILE_NAME' to S3."
      ;;
    [Rr])
      # Rename the file and upload
      NEW_NAME="${FILE_NAME}_$(date +%Y%m%d%H%M%S)"
      pv "$FILE_PATH" | aws s3 cp - "s3://$S3_BUCKET/$NEW_NAME"
      echo "File renamed to '$NEW_NAME' and uploaded to S3 bucket."
      ;;
    *)
      # Invalid choice
      echo "Invalid choice. Exiting without uploading."
      exit 1
      ;;
  esac
else

  # File doesn't exist, upload it
  pv "$FILE_PATH" | aws s3 cp - "s3://$S3_BUCKET/$FILE_NAME"
fi

# Check the exit status of the upload command
if [ $? -eq 0 ]; then
  echo "File '$FILE_NAME' successfully uploaded to S3 bucket."
    
# Provide an option to generate and display a shareable link
    read -p "Do you want to generate and display a shareable link for '$FILE_NAME'? (Y/N): " LINK_CHOICE

    case $LINK_CHOICE in
      [Yy])
        # Generate and display a shareable link
        S3_LINK=$(aws s3 presign "s3://$S3_BUCKET/$FILE_NAME")
        echo "Shareable link for '$FILE_NAME': $S3_LINK"
        ;;
      [Nn])
        # Continue without generating a link
        ;;
      *)
        echo "Invalid choice. Continuing without generating a link."
        ;;
    esac
   else
    echo "Error uploading file '$FILE_NAME' to S3. Check your configuration and try again."
  fi
done







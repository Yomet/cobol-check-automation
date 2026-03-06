#!/bin/bash
# zowe_operations.sh

# Convert username to lowercase
LOWERCASE_USERNAME=$(echo "$ZOWE_USERNAME" | tr '[:upper:]' '[:lower:]')
PARAM_STRING="-H 204.90.115.200 -P 10443 -u $ZOWE_USERNAME --pw $ZOWE_PASSWORD --ru false"

# Check if directory exists, create if it doesn't
echo "Running the first zowe command"
if ! zowe zos-files list uss-files "/z/$LOWERCASE_USERNAME/cobolcheck" $PARAM_STRING &>/dev/null; then
  echo "Directory does not exist. Creating it..."
  zowe zos-files create uss-directory /z/$LOWERCASE_USERNAME/cobolcheck $PARAM_STRING 
else
  echo "Directory already exists."
fi
# Upload files
echo "Uploading the cobol-check directory"
zowe zos-files upload dir-to-uss "./cobolcheck" "/z/$LOWERCASE_USERNAME/cobolcheck" --recursive --binary-files "cobol-check-0.2.9.jar" $PARAM_STRING 
echo "Uploading the jar file"
zowe zos-files upload file-to-uss "./cobol-check-0.2.19.jar" "/z/$LOWERCASE_USERNAME/cobolcheck/bin/cobol-check-0.2.19.jar" --binary $PARAM_STRING 
# Verify upload
echo "Verifying upload:"
zowe zos-files list uss-files "/z/$LOWERCASE_USERNAME/cobolcheck" $PARAM_STRING 


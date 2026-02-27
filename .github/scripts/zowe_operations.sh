#!/bin/bash
# zowe_operations.sh

# Convert username to lowercase
LOWERCASE_USERNAME=$(echo "$ZOWE_USERNAME" | tr '[:upper:]' '[:lower:]')
# Check if directory exists, create if it doesn't

#Debugging the zowe CLI installation
echo "Testing the connection to z/OSMF using hardcoded values"
zowe zosmf check status --host "204.90.115.200" --port "10443" --user "Z79951" --pass "SAI29IZI"

#echo "Running the first zowe command"
#if ! zowe zos-files list uss-files "/z/$LOWERCASE_USERNAME/cobolcheck" &>/dev/null; then
#  echo "Directory does not exist. Creating it..."
#  zowe zos-files create uss-directory /z/$LOWERCASE_USERNAME/cobolcheck
#else
#  echo "Directory already exists."
#fi
## Upload files
#zowe zos-files upload dir-to-uss "./cobol-check" "/z/$LOWERCASE_USERNAME/cobolcheck" --recursive --binary-files "cobol-check-0.2.9.jar"
## Verify upload
#echo "Verifying upload:"
#zowe zos-files list uss-files "/z/$LOWERCASE_USERNAME/cobolcheck"

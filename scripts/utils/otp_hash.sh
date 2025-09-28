#!/bin/bash

PROJECT_ROOT_DIR=$(echo "$(pwd)" | sed 's|/scripts.*||')

# Loading environment variables
source $PROJECT_ROOT_DIR/android/key.properties

KEY_ALIAS=$keyAlias
PACKAGE_NAME=$(grep 'applicationId' $PROJECT_ROOT_DIR/android/app/build.gradle | sed 's/.*applicationId "//;s/".*//')

echo "Key alias: $KEY_ALIAS"
echo "Package name: $PACKAGE_NAME"

# Get password from user input from key.properties keyPassword field
echo "Enter the password for the keystore: "
read -s KEY_PASSWORD

# Get certificate from deployment_cert.der file and import it to certificate.jks keystore
keytool -importcert -alias $KEY_ALIAS -file deployment_cert.der -keystore certificate.jks -storepass $KEY_PASSWORD -noprompt

# Get hash from certificate and package
RESULT=$(keytool -exportcert -alias $KEY_ALIAS -keystore certificate.jks -storepass $KEY_PASSWORD | xxd -p | tr -d "[:space:]" | echo -n $PACKAGE_NAME `cat` | shasum -a 256 | tr -d "[:space:]-" | xxd -r -p | base64 | cut -c1-11)

# Output the result
echo "Generated result: $RESULT"

# Remove certificate and keystore
rm certificate.jks
rm deployment_cert.der
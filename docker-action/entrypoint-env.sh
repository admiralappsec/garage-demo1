#!/usr/bin/env sh

if [ -z "$contrast_security_credentials_file" ]; then
    echo "No Contrast Security configuration file passed via input"
    echo "Using individual inputs as environment variables..."
    export CONTRAST_API_URL $contrast_api_url
    export CONTRAST_API_USERNAME $contrast_api_username
    export CONTRAST_API_API_KEY $contrast_api_api_key
    export CONTRAST_API_SERICE_KEY $contrast_api_service_key
    export CONTRAST_AGENT_JAVA_STANDALONE_APP_NAME $contrast_agent_java_standalone_app_name
    export CONTRAST_APPLICATION_VERSION $contrast_application_version
    echo "environment variable mapping complete."
    echo "contrast-api-url: $CONTRAST_API_URL"
    echo "contrast-api-username: $CONTRAST_API_USERNAME"
    echo "contrast-api-api-key: $CONTRAST_API_API_KEY"
    echo "contrast-api-service-key: $CONTRAST_API_SERICE_KEY"
    echo "contrast-agent-java-standalone-app-name: $CONTRAST_AGENT_JAVA_STANDALONE_APP_NAME"
    echo "contrast-application-version: $CONTRAST_APPLICATION_VERSION"
    echo "-----------------------------"
else
    echo "contrast_security_credentials_file value:"
    $contrast_security_credentials_file | jq '.'
    echo "Contrast Security configuration file found"
    echo "parsing configuration file and setting to environment variables..."
    export CONTRAST_API_URL $($contrast_security_credentials_file | jq '.contrast-api-url')
    export CONTRAST_API_USERNAME $($contrast_security_credentials_file | jq '.contrast-api-username')
    export CONTRAST_API_API_KEY $($contrast_security_credentials_file | jq '.contrast-api-api-key')
    export CONTRAST_API_SERICE_KEY $($contrast_security_credentials_file | jq '.contrast-api-service-key')
    export CONTRAST_AGENT_JAVA_STANDALONE_APP_NAME $($contrast_security_credentials_file | jq '.contrast-agent-java-standalone-app-name')
    export CONTRAST_APPLICATION_VERSION $($contrast_security_credentials_file | jq '.contrast_application_version')
    echo "parsing and mapping complete."
    echo "contrast-api-url: $CONTRAST_API_URL"
    echo "contrast-api-username: $CONTRAST_API_USERNAME"
    echo "contrast-api-api-key: $CONTRAST_API_API_KEY"
    echo "contrast-api-service-key: $CONTRAST_API_SERICE_KEY"
    echo "contrast-agent-java-standalone-app-name: $CONTRAST_AGENT_JAVA_STANDALONE_APP_NAME"
    echo "contrast-application-version: $CONTRAST_APPLICATION_VERSION"
    echo "-----------------------------"
fi

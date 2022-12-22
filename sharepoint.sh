PSMAXBYTES=327680


function PSGetToken()
{
    local INPUT_AZURE_TENANT_ID=$1
    local INPUT_AZURE_CLIENT_ID=$2
    local INPUT_AZURE_CLIENT_SECRET=$3

    local URL="https://login.microsoftonline.com/$INPUT_AZURE_TENANT_ID/oauth2/v2.0/token"
    local RESPONSE=$(echo -n '[' && curl -X POST --data-urlencode "grant_type=client_credentials" --data-urlencode "client_id=$INPUT_AZURE_CLIENT_ID" --data-urlencode "client_secret=$INPUT_AZURE_CLIENT_SECRET" --data-urlencode "scope=https://graph.microsoft.com/.default" -w ',%{json}]' "$URL")
    echo $RESPONSE
    #local TOKEN_TYPE=$(echo $RESPONSE | jq -r '.[0].token_type')
    #local TOKEN=$(echo $RESPONSE | jq -r '.[0].access_token')
    #PSAUTHENTICATION_HEADER="Authorization: $TOKEN_TYPE $TOKEN"
}

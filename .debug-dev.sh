export ARM_SUBSCRIPTION_ID="8b521544-a3c1-493d-ad92-9ee6c75a609c"

export TF_VAR_environement_name="dev"
export TF_VAR_application_name="observability"

export BACKEND_RESOURCE_GROUP="rg-tfstate-dev"
export BACKEND_STORAGE_ACCOUNT="st3ue6ub01on"
export BACKEND_CONTAINER="tfstate"
export BACKEND_KEY=$TF_VAR_application_name-$TF_VAR_environement_name

terraform init \
    -backend-config="resource_group_name=${BACKEND_RESOURCE_GROUP}" \
    -backend-config="storage_account_name=${BACKEND_STORAGE_ACCOUNT}" \
    -backend-config="container_name=${BACKEND_CONTAINER}" \
    -backend-config="key=${BACKEND_KEY}"

# MSYS_NO_PATHCONV=1 terraform import azurerm_resource_group.main "/subscriptions/8b521544-a3c1-493d-ad92-9ee6c75a609c/resourceGroups/rg-observability-dev"
# MSYS_NO_PATHCONV=1 terraform import azurerm_log_analytics_workspace.main "/subscriptions/8b521544-a3c1-493d-ad92-9ee6c75a609c/resourceGroups/rg-observability-dev/providers/Microsoft.OperationalInsights/workspaces/log-observability-dev"

terraform $*

rm -rf .terraform
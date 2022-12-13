# run this under ./udemy-terraform-course-note

# setup the .terraform path , 
# that we do not need to download the provider plugin everytime 
# while execute terraform init
export TF_DATA_DIR=./.terraform

# set up a access key for the cloud provider
export TF_VAR_access_key="*********************"
export TF_VAR_secret_key="*********************"

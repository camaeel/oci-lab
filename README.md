# oci-lab

Project will provide easy way to setup "home lab" using free resources from Oracle Cloud.


## Setup 

1. Create `env` file in root contining private identificators using `env.sample`
1. Go to `terraform` directory
1. Source env: `. ../env`
1. `terraform init -backend-config="bucket=${TF_BACKEND_BUCKET}"`

## Run

1. Go to terminal
1. Source env: `. ../env`
1. `tf plan`
1. `tf apply`

# oci-lab

Project will provide easy way to setup "home lab" using free resources from Oracle Cloud.

## Result of experiment

This cloud solution is completely unstable and very hard to use. I would advise to buy a bunch of raspberry PIs rather than use this solution. 

Support is non-existent.   

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

# Register gitlab runner:

```
gitlab-runner register --url https://gitlab.com/ --registration-token $REGISTRATION_TOKEN \
--docker-volumes /var/run/docker.sock:/var/run/docker.sock \
--tag-list oci,arm64 --name oci-arm64 --executor docker --non-interactive\
```
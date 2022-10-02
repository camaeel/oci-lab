# oci-lab

Project will provide easy way to setup "home lab" using free resources from Oracle Cloud.

## Result of experiment

This cloud solution is completely unstable and very hard to use. I would advise to buy a bunch of raspberry PIs rather than use this solution. 
Support is non-existent and documentation needs some improvements.   

At the end I decided to use free resources to provision gitlab runner to build arm based images.

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

## Connect to ssh
1. Configure on local machine:
    ```
    Host *
      HostkeyAlgorithms +ssh-rsa
      PubkeyAcceptedAlgorithms +ssh-rsa
    ```

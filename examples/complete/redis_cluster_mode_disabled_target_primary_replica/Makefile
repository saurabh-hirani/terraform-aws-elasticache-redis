.PHONY: all get plan apply destroy

all: init get plan apply

init:
	terraform init -backend=true -backend-config="bucket=${TF_STATE_S3}" -backend-config="key=redis/redis-cluster-mode-disabled-target-primary-replica.tfstate"

get:
	terraform get

plan:
	terraform plan -var-file=../common.tfvars

apply:
	terraform apply -auto-approve -var-file=../common.tfvars

output:
	terraform output -json

destroy:
	terraform destroy -auto-approve -var-file=../common.tfvars

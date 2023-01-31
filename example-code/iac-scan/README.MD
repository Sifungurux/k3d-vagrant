kubectl apply -f git-clone.yaml
kubectl apply -f iac-scan-kics.yaml
kubectl apply -f iac-scan-checkov.yaml

kubectl apply -f kics-pipelineRun.yml
kubectl apply -f checkov-pipelineRun.yml

kubectl apply -f ../task/
kubectl apply -f ../pipeline/
kubectl apply -f ../PipelineRun/

watch tkn pipeline list

tkn pipeline logs

sudo find /var/lib/docker/ -name results.sarif
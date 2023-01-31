tkn t delete container-image-scan
tkn p delete container-image-scan-pipeline
tkn pr delete vulnerability-image-scanning

kubectl apply -f task/trivy-image-scan.yaml
kubectl apply -f pipeline/scan-image-pipeline.yaml
kubectl apply -f pipelineRun/container-image-scan-test.yaml



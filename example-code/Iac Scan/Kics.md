# KICS - IaC scanning

Kics support multiple IaC language

    Ansible
    Docker
    gRPC
    Helm
    Knative
    Kubernetes
    OpenAPI
    Pulumi
    Terraform

This is a expected list of language that Kics support that will be used in the vagrant project.
It is able to do a secret scanning as well

With queries that are customizable it is able to extend the usability wih higher or exotic query checks.
Policy language used is [rego](https://www.openpolicyagent.org/docs/latest/policy-language/)

Policies are rated from High to low

## Limitations

Ansible

At the moment, KICS does not support a robust approach to identifying Ansible samples. The identification of these samples is done through exclusion. Ansible is last resort for yaml files.

Terraform

Although KICS support variables and interpolations, KICS does not support functions and enviroment variables.

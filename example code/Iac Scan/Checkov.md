# Checkov scanning

Checkov has the the abillity to scan multiple frameworks like Terraform, Helm and Dockerfiles. But it also have the abillity to output mulitple output formats like

- SBOM(json and XML)
- junitxml
- sarif

It is possible to create custom policies to scan against but also excluding test and do a soft fail with a baseline creation.
Policies a re created in python
By setting framework to a specific type it can be concentrading its scan.

Secreat scanning is included

Checks are not rated from High to low but failed or passed.
Checkov // Bridgecrew has an enterprise verstion that require a API key. That offers a biggee suite of scannings abilities and functions
Features and fuctions like

- Incident insights
- Pull request fixes
- Runtime remediations
- Dashboards
- Supply Chain Graph visualization
- Compliance reporting

It requeres an online account at bridegegrew to use enterprise version 

Trivy scan
bridgecrew/checkov:latest amd64
All 130
Critical 3
High 24
Medium 13
Low -

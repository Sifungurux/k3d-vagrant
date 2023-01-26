# Fluxcd with vagrant K3D

This is a good introduction blog for understanding flux and how it works with git. In this blog github is used

## Starting with FLUX

- Install
- Bootstrap

### Install

```bash
curl -s https://toolkit.fluxcd.io/install.sh | sudo bash
```

## Bootstraping flux

When creating your token use classic version.

```bash
export GITHUB_TOKEN=*your-gitlab-token-here* # 1

flux bootstrap \
  github \                      # 2
  --owner *your-github-user* \  # 3
  --repository cluster-name \   # 4
  --personal \                  # 5
  --private \                   # 6
  --path cluster \              # 7
  --branch master               # 8
```

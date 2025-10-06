# Kubernetes Learning Environment Helm Chart

Multi-tenant Kubernetes Helm chart to deploy an isolated and resource controlled sandbox environment for developers and engineers to safely experiment and learn.

## 🎯 What This Chart Does

HELO Education Helm Chart complete educational sandbox environment in your Kubernetes cluster, featuring:

- **🔒 Secure Isolation**: Provisions individual namespaces with strict RBAC controls
- **📊 Resource Quotas**: Configurable limits for CPU, memory, storage, and GPU usage
- **🚀 GitOps Ready**: ArgoCD integration for application deployment workflows
- **🔐 OIDC Integration**: Seamless integration with your Kubernetes OIDC provider

## 🏗️ What Gets Created

When you install this chart, it creates:

### Core Resources

- **Namespace**: Isolated environment for the individual developer
- **Resource Quotas**: CPU, memory, storage, and GPU limits
- **RBAC**: Roles, RoleBindings, Cluster and ClusterRoleBindings
- **ArgoCD Resources**: Isolated AppProject and Application for GitOps

### Security Features

- **Namespace Isolation**: Complete separation from other workloads
- **Resource Boundaries**: Reduces the risk of cluster resource exhaustion
- **RBAC Controls**: Fine-grained permissions with OIDC integration
- **Network Policies**: Network segmentation

## 🎓 Educational Use Cases

Perfect for:

- **Kubernetes Training**: Hands-on learning environments
- **Developer Scratchpad**: Safe spaces to experiment
- **Workshop Environments**: Isolated sandboxes for each participant
- **CI/CD Learning**: GitOps workflows with ArgoCD

## 💻 Resource Format Requirements

- **CPU**: Whole numbers (`4`) or millicores ending in `00m` (`4000m`, `1500m`)
- **Memory**: Must end in `Gi` or `Mi` (`8Gi`, `2048Mi`)
- **Storage**: Must end in `Gi` only (`20Gi`, `50Gi`)

## 🆘 Support

- **Issues**: [GitHub Issues](https://github.com/GoodMannersHosting/home-enterprise-education-helm/issues)
- **Discussions**: [GitHub Discussions](https://github.com/GoodMannersHosting/home-enterprise-education-helm/discussions)

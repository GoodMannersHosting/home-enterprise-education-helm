# learning-environment

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

A comprehensive multi-tenant Kubernetes learning environment that provides isolated, resource-controlled namespaces for developers and engineers to safely experiment and learn. Features automated RBAC with OIDC integration, configurable resource quotas (CPU, memory, storage, GPU), ArgoCD-powered GitOps application deployment, and granular security controls - delivering a complete sandbox environment for hands-on Kubernetes education in production clusters.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| argo.appOfAppsNamespace | string | `"argocd"` | Default namespace for the ArgoCD Installation |
| argo.clusterResources.blacklist | list | [{"group": "*", "kind": "*"}] | Pass the blacklist to allow fine control over what is permitted to be deployed in the cluster. |
| argo.clusterResources.whitelist | list | [{"group": "", "kind": "persistentvolumes"}] | Pass the whitelist to allow fine control over what is permitted to be deployed in the cluster. |
| argo.customRolePolicies | list | `[]` | Optional: Custom role policies for ArgoCD RBAC (https://argo-cd.readthedocs.io/en/stable/operator-manual/rbac/) |
| argo.namespaceResources.blacklist | list | `[{"group":"","kind":"ResourceQuota"},{"group":"ceph.rook.io","kind":"*"},{"group":"argoproj.io","kind":"appprojects"}]` | Pass the blacklist to allow fine control over what is permitted to be deployed in the project namespace. |
| argo.namespaceResources.whitelist | list | `[{"group":"*","kind":"*"}]` | Pass the whitelist to allow fine control over what is permitted to be deployed in the project namespace. |
| argo.pathOverride | string | `""` | Optional complete path override within the repository for all applications |
| argo.pathPrefix | string | `""` | Optional path prefix within the repository for all applications |
| argo.pathSuffix | string | `"applications"` | Optional path suffix within the repository for all applications |
| argo.targetRepoURL | string | `"https://github.com/GoodMannersHosting/home-enterprise-education.git"` | Git repository URL containing the customer ArgoCD applications |
| argo.targetRevision | string | `"main"` | Git branch or tag to use from the targetRepoURL |
| clusterRole.enabled | bool | `true` | Enable cluster role binding for the project namespace. |
| oidc.enabled | bool | `true` | Enable OIDC Groups for Role-Based Access Control (RBAC) |
| oidc.groupPrefix | string | `"oidc:/"` | OIDC Provider Group Prefix (e.g., "oidc:/", "oidc:group/") |
| projectName | string | `"k8s-student"` | Namespace and project name for the student environments. |
| projectNamespaceLabels | object | `{}` |  |
| quotas.compute.cpu | string | `"6000m"` | Compute resource quotas for the project namespace. Can be an integer or m (milli) suffix for CPU; must end in '00m' if using millicores. |
| quotas.compute.ephemeralStorage | string | `"20Gi"` | Ephemeral storage resource quota for the project namespace. Must end in 'Gi'. |
| quotas.compute.memory | string | `"12Gi"` | Memory resource quota for the project namespace. Must end in 'Mi' or 'Gi'. |
| quotas.gpu.count | string | `"0"` | GPU resource quota for the project namespace. Set to 0 for no GPUs allowed. |
| quotas.gpu.enabled | bool | `true` | Enable GPU quota for the project namespace. |
| quotas.storage.maxPvc | string | `"10"` | Maximum number of Persistent Volume Claims (PVCs) allowed in the project namespace. Set to 0 for no PVCs allowed. |
| quotas.storage.requests.max | string | `"8Gi"` | Maximum storage request size for PVCs in the project namespace. Must end in 'Gi'. |
| quotas.storage.requests.min | string | `"1Gi"` | Minimum storage request size for PVCs in the project namespace. Must end in 'Gi'. |
| rbac.fullAccessNamespacedResources | bool | true | Enable full access to all namespaced resources in the project namespace.    This is the recommended setting for student namespaces to allow maximum flexibility. |
| rbac.readOnlyAllowedClusterResources | list | `[{"apiGroups":["storage.k8s.io"],"resources":["storageclasses"]},{"apiGroups":[""],"resources":["namespaces","persistentvolumes","nodes","persistentvolumeclaims"]}]` | Enable read-only access to a restricted set of cluster-wide resources.    This is useful to allow students to view cluster resources without granting full access. |
| rbac.readOnlyRestrictedNamespacedResources | list | `[{"apiGroups":[""],"resources":["resourcequotas"]},{"apiGroups":["ceph.rook.io"],"resources":["*"]},{"apiGroups":["appproject.argoproj.io"],"resources":["*"]}]` | Enable read-only access to a restricted set of namespaced resources in the project namespace. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)

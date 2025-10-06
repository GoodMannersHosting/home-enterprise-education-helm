{{/*
Helper Templates for k8s-student chart
*/}}

{{- define "projectName" -}}
{{- .Values.projectName | required "projectName is required" -}}
{{- end -}}

{{- define "projectNamespaceLabels" -}}
{{- if .Values.projectNamespaceLabels }}
{{ printf "labels:" | indent 2 }}
{{- range $key, $value := .Values.projectNamespaceLabels }}
{{ $key | indent 4 }}: {{ $value | quote }}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "argo.pathSuffix" -}}
{{- .Values.argo.pathSuffix | default "applications" -}}
{{- end -}}

{{- define "argo.pathPrefix" -}}
{{- .Values.argo.pathPrefix | default "" -}}
{{- end -}}

{{- define "argo.pathOverride" -}}
{{- .Values.argo.pathOverride | default "" -}}
{{- end -}}

{{- define "argo.namespaceResourceBlacklist" -}}
{{- if .Values.argo.namespaceResources.blacklist }}
{{- range .Values.argo.namespaceResources.blacklist }}
- group: {{ .group | quote }}
  kind: {{ .kind | quote }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "argo.namespaceResourceWhitelist" -}}
{{- if .Values.argo.namespaceResources.whitelist }}
{{- range .Values.argo.namespaceResources.whitelist }}
- group: {{ .group | quote }}
  kind: {{ .kind | quote }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "argo.clusterResourceBlacklist" -}}
{{- if .Values.argo.clusterResources.blacklist }}
{{- range .Values.argo.clusterResources.blacklist }}
- group: {{ .group | quote }}
  kind: {{ .kind | quote }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "argo.clusterResourceWhitelist" -}}
{{- if .Values.argo.clusterResources.whitelist }}
{{- range .Values.argo.clusterResources.whitelist }}
- group: {{ .group | quote }}
  kind: {{ .kind | quote }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "limitCPU" -}}
{{- $cpu := .Values.quotas.compute.cpu | default "4000m" -}}
{{- if hasSuffix "m" $cpu -}}
  {{- $value := $cpu | trimSuffix "m" | int -}}
  {{- $rounded := div (add $value 50) 100 | mul 100 -}}
  {{- printf "%dm" $rounded | quote -}}
{{- else -}}
  {{- $value := $cpu | int -}}
  {{- printf "%d" $value | quote -}}
{{- end -}}
{{- end -}}

{{- define "limitMemory" -}}
{{- $mem := .Values.quotas.compute.memory | default "8Gi" -}}
{{- if hasSuffix "Gi" $mem -}}
  {{- $value := $mem | trimSuffix "Gi" | int -}}
  {{- printf "%dGi" $value | quote -}}
{{- else if hasSuffix "Mi" $mem -}}
  {{- $value := $mem | trimSuffix "Mi" | int -}}
  {{- $rounded := div (add $value 50) 100 | mul 100 -}}
  {{- printf "%dMi" $rounded | quote -}}
{{- else -}}
  {{- $value := $mem | int -}}
  {{- printf "%dMi" $value | quote -}}
{{- end -}}
{{- end -}}

{{- define "limitEphemeralStorage" -}}
{{- $ephemeral := .Values.quotas.compute.ephemeralStorage | default "20Gi" -}}
{{- if hasSuffix "Gi" $ephemeral -}}
  {{- $value := $ephemeral | trimSuffix "Gi" | int -}}
  {{- printf "%dGi" $value | quote -}}
{{- else -}}
  {{- fail (printf "ephemeralStorage must be specified in Gi units (e.g., '20Gi'), got: %s" $ephemeral) -}}
{{- end -}}
{{- end -}}

{{- define "limitGPU" -}}
{{- $gpu := .Values.quotas.gpu.count | default "0" -}}
{{- $gpu | int -}}
{{- end -}}

{{- define "limitPersistentVolumeClaims" -}}
{{- $pvc := .Values.quotas.compute.persistentVolumeClaims | default 10 -}}
{{- printf "%d" $pvc | quote -}}
{{- end -}}
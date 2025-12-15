{{/* 
Return a nodePort based on .Values.env
dev=30080, stage=30081, uat=30082, prod=30083
*/}}
{{- define "helmWrapper.nodePort" -}}
{{- $map := dict "dev" 30079 "stage" 30080 "uat" 30081 "prod" 30082 -}}
{{- $env := .Values.env | default "dev" -}}
{{- $val := index $map $env -}}
{{- if not $val }}{{ fail (printf "Unknown environment '%s'" $env) }}{{ end -}}
{{- $val -}}
{{- end }}
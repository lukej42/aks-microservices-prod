{{/*
Return the full name of the release
*/}}
{{- define "app.fullname" -}}
{{ .Release.Name }}
{{- end -}}
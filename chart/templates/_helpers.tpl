{{- define "liveness_probe" }}
livenessProbe:
  httpGet:
    path: /
    port: {{ .Values.ports.http }}
  initialDelaySeconds: {{ .Values.livenessProbe.initialDelaySeconds }}
  periodSeconds: {{ .Values.livenessProbe.periodSeconds  }}
  failureThreshold: {{ .Values.livenessProbe.failureThreshold }}
{{- end }}

{{- define "readiness_probe" }}
readinessProbe:
  httpGet:
    path: /
    port: {{ .Values.ports.http }}
  initialDelaySeconds: {{ .Values.readinessProbe.initialDelaySeconds }}
  periodSeconds: {{ .Values.readinessProbe.periodSeconds }}
  failureThreshold: {{ .Values.readinessProbe.failureThreshold }}
{{- end }}

{{- define "common_envs" -}}
- name: REDIS_ADDR
  value: {{ .Values.environment.redis.addr | quote }}
{{- end }}

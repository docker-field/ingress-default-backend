FROM nginx:1.15.8-alpine

COPY root /

HEALTHCHECK --interval=5s --timeout=5s CMD wget -q -O - -U "healthcheck" http://localhost:80/ || exit 1

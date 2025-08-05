# 1. Base image
FROM n8nio/n8n:latest

# 2. Make sure the workflow folder exists & is writeable
USER root
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

# 3. Copy the workflow JSON into the image
USER node
COPY workflows/ai-digest.json /tmp/ai-digest.json

# 4. On container start, import the workflow, then start n8n
ENTRYPOINT ["/bin/sh", "-c", "\
  n8n import:workflow --input /tmp/ai-digest.json --overwrite && \
  n8n start --tunnel \
"]

# Use the official n8n base image
FROM n8nio/n8n:latest

# Copy your exported workflow(s) into the container
COPY workflows/ai-digest.json /data/workflows/ai-digest.json

# RUN npm install --global some-n8n-plugin

# Ensure the container starts n8n with your workflows preloaded
ENTRYPOINT ["n8n", "start", "--tunnel"]
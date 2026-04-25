# Dockerfile – Serve landing page on Google Cloud Run using a minimal Node static server

FROM node:20-alpine
WORKDIR /app

# Copy landing assets (HTML, CSS, assets)
COPY . .

# Install a tiny static file server globally
RUN npm install -g serve

# Create an index entrypoint so the root URL resolves correctly
RUN cp landing.html index.html

# Cloud Run expects the container to listen on $PORT (default 8080)
ENV PORT=8080
EXPOSE 8080

# Run the static server
CMD ["serve", "-s", ".", "-l", "tcp://0.0.0.0:8080"]

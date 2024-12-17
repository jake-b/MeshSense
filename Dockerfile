FROM node:20-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libfuse2 \
    curl \
    ca-certificates \
    git \
    libdbus-1-3 \
    dbus \
    g++ \
    cmake \
    && rm -rf /var/lib/apt/lists/*

# Create DBus system directory and configure
RUN mkdir -p /var/run/dbus \
    && dbus-uuidgen > /var/lib/dbus/machine-id

# Create app directory and clone repository
WORKDIR /app
RUN git clone https://github.com/Affirmatech/MeshSense.git
WORKDIR /app/MeshSense

# Copy and apply the no-bluetooth patch.
# Discussed here: https://github.com/Affirmatech/MeshSense/issues/22
COPY no-bluetooth.patch /no-bluetooth.patch
RUN git apply /no-bluetooth.patch

# Install dependencies
RUN echo "Installing UI dependencies..." && \
    cd ui && npm install --legacy-peer-deps && cd .. && \
    echo "Installing API dependencies..." && \
    cd api && npm install --legacy-peer-deps && cd ..

# Expose ports
EXPOSE 5920 5921

# Set Environment
ENV ACCESS_KEY=mySecretKey

# Start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Start DBus and the application
ENTRYPOINT ["/bin/bash", "-c", "dbus-daemon --system --fork && /start.sh"]

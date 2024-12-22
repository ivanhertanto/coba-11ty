# Use the official Node.js LTS image as the base image
FROM node:lts

# Install git, curl, and wget
RUN \
     echo "**** install runtime dependencies ****" && \
     apt-get update && \
     apt-get install -y \
     git \
     curl \
     wget && \
     echo "**** clean up ****" && \
     apt-get clean && \
     rm -rf \
     /tmp/* \
     /var/lib/apt/lists/* \
     /var/tmp/*

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application
CMD ["node", "app.js"]
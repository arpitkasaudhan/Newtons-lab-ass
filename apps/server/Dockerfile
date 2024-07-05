# Use the official Node.js image.
FROM node:20.11.0

# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
COPY package*.json ./
COPY pnpm-lock.yaml ./

# Install pnpm package manager
RUN npm install -g pnpm

# Install dependencies.
RUN pnpm install

# Copy local code to the container image.
COPY . .

# Build the NestJS application.
RUN pnpm run build

# Expose the port that the app runs on
EXPOSE 3000

# Run the web service on container startup.
CMD ["node", "dist/main"]

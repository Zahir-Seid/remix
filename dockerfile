# Use official Node.js 22 LTS image as a base
FROM node:22-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install --frozen-lockfile

# Copy the rest of the app files
COPY . .

# Build the Remix app
RUN npm run build

# Expose the port that Remix uses
EXPOSE 5173

# Start the Remix app
CMD ["npm", "run", "dev"]


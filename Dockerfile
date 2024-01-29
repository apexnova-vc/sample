# Use an official Node.js runtime as the base image
FROM node:21

# Set the working directory in the container to /app
WORKDIR /app

# Copy package.json and package-lock.json into the working directory
COPY package*.json ./

# Install Puppeteer dependencies
# If you want to skip downloading the Chromium bundled with Puppeteer and use system-installed Chrome, set PUPPETEER_SKIP_CHROMIUM_DOWNLOAD to true
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

# Install any needed packages specified in package.json
RUN npm ci

# Bundle the app source inside the Docker image
COPY . .

# Make port 3000 available to the world outside this container
EXPOSE 3000

# Add metadata to the image to describe which repo this image belongs to
LABEL org.opencontainers.image.source="https://github.com/apexnova-vc/sample_web"

# Define the command to run the app, change this to your production start command
CMD ["npm", "run", "start"]
# Downloading even stable version

FROM node:20-alpine

RUN apk --no-cache add curl

# Set the working directory
WORKDIR /frontend

# Copy package.json and package-lock.json
COPY package*.json /frontend/
COPY yarn.lock /frontend/


# Install dependencies
RUN yarn install

# Copy the rest of the application
COPY . .

# Expose the backend port
EXPOSE 5173

# Command to run the backend
CMD [ "yarn", "dev" ]


FROM cypress/browsers:node16.18.0-chrome90-ff88

# avoid too many progress messages
# https://github.com/cypress-io/cypress/issues/1243
ENV CI=1

# disable shared memory X11 affecting Cypress v4 and Chrome
# https://github.com/cypress-io/cypress-docker-images/issues/270
ENV QT_X11_NO_MITSHM=1
ENV _X11_NO_MITSHM=1
ENV _MITSHM=0

# give every user read access to the "/root" folder where the binary is cached
# we really only need to worry about the top folder, fortunately
RUN chmod 755 /root

# should be root user
RUN echo "whoasmi: $(whoami)"
RUN npm config -g set user $(whoami)

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY Dockerfile/package*.json ./

ENV CYPRESS_CACHE_FOLDER=/app/.cache/Cypress
# Install the project dependencies
RUN npm ci

# Copy the rest of the application files to the container
COPY . .

ENV DIR NODIR

# Set the command to run the Cypress tests
ENTRYPOINT ["npx", "cypress", "run"]

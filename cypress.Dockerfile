FROM cypress/browsers:node16.18.0-chrome90-ff88

# avoid too many progress messages
# https://github.com/cypress-io/cypress/issues/1243
ENV CI=1


# disable shared memory X11 affecting Cypress v4 and Chrome
# https://github.com/cypress-io/cypress-docker-images/issues/270
ENV QT_X11_NO_MITSHM=1
ENV _X11_NO_MITSHM=1
ENV _MITSHM=0


RUN npm install -g "cypress@7.7.0"

WORKDIR /e2e

COPY . .

ENTRYPOINT ["cypress", "run"]

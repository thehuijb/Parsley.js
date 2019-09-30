FROM mhart/alpine-node:10

LABEL maintainer="Parsley.js"

ENV NODE_ENV development
ENV PARSLEY_HOME /parsley
ENV PATH $PARSLEY_HOME/node_modules/.bin:$PATH

# Change CWD to the Pattern Lab location.
WORKDIR $PARSLEY_HOME

RUN apk update && apk add --no-cache git && apk add --no-cache g++ && apk add --no-cache make && apk add --no-cache libsass && apk add --no-cache python && apk add --no-cache tzdata

# Set TimeZone
ENV TZ Europe/Amsterdam

# Copy project files to container.
COPY package.json $PARSLEY_HOME/package.json

# Install the default demo site.
RUN npm install

VOLUME ["$PARSLEY_HOME"]

# Auto build the Pattern Lab.
CMD ["gulp build"]

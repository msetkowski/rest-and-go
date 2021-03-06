# Dockerfile References: https://docs.docker.com/engine/reference/builder/


FROM golang:1.12

# Add Maintainer Info
LABEL maintainer="Maciej Setkowski <maciej.setkowski@gmail.com>"

# Set the Current Working Directory inside the container
WORKDIR $GOPATH/src/rest-and-go

# Copy everything from the current directory to the PWD(Present Working Directory) inside the container
COPY . .

# Download all the dependencies
# https://stackoverflow.com/questions/28031603/what-do-three-dots-mean-in-go-command-line-invocations
RUN go get -d -v ./...

# Install the package
RUN go install -v ./...

# This container exposes port 8080 to the outside world
EXPOSE 8080

# Run the executable
CMD ["rest-and-go"]
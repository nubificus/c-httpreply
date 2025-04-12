# Use the official GCC image for building
FROM gcc:bullseye as build_linux

# Install necessary libraries and tools (if required by your project)
RUN apt-get update && apt-get install -y \
    make \
    libc6-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /src

# Copy the source code into the container
COPY . .

# Compile the program statically linked for Linux
RUN gcc -o httpreply -static main.c

FROM alpine:3
RUN apk add --no-cache ca-certificates

# Copy the binary to the production image from the builder stage.
COPY --from=build_linux /src/httpreply /usr/bin/httpreply

# Run the web service on container startup.
CMD ["/usr/bin/httpreply"]

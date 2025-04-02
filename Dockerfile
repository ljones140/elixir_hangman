# Use the official Elixir image as the base image
FROM elixir:latest

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the mix.exs and mix.lock files to the working directory
COPY mix.exs mix.lock ./

# Copy the dictionary dependency
COPY ../dictionary ./dictionary

# Install mix dependencies
RUN mix do local.hex --force, local.rebar --force, deps.get

# Copy the rest of the application code to the working directory
COPY . .

# Compile the project
RUN mix compile

# Expose the port the application runs on (if applicable)
EXPOSE 4000

# Define the command to run the application
CMD ["mix", "run", "--no-halt"]

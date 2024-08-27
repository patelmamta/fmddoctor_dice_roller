#!/bin/bash

# Install RSpec if it's not installed
if ! gem list -i rspec > /dev/null 2>&1; then
  echo "Installing RSpec..."
  gem install rspec
fi

# Run the Ruby program
echo "Running the Ruby Program:"
ruby dice_roller_cli/dice_roller.rb

# Run RSpec tests
echo "Running RSpec Tests:"
rspec spec/dice_roller_spec.rb

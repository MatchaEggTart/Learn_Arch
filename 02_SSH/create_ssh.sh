#!/bin/bash

echo "What's your email to use github"
read email
# echo ${email}

ssh-keygen -t rsa -C "${email}"

# echo "first: $0"
# echo "second: $1"
# echo "third: $2"

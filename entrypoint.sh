#!/bin/bash
set -e

# Create SSL directory
SSL_DIR=$(mktemp -d)

# Start moshi server
exec python -m moshi.server --ssl "$SSL_DIR"

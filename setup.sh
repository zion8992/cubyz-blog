#!/usr/bin/env bash

# This script is used to setup and run for github pages
set -e

sudo snap install hugo
hugo --minify --baseURL "${PAGES_BASE_URL}/"

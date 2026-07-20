#!/usr/bin/env bash
set -e

sudo snap install hugo
hugo --minify --baseURL "${PAGES_BASE_URL}/"

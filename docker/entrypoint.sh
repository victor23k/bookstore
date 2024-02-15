#!/usr/bin/env bash

mix deps.get
mkdir priv/static/uploads

exec "$@"

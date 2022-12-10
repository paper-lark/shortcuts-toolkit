#!/usr/bin/env bash

ROOT="$(git rev-parse --show-toplevel)"
swift-format format --configuration "${ROOT}/.swift-format" -r "${ROOT}/shortcuts-toolkit" -i

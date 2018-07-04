#!/bin/bash
gcloud compute instances create reddit-app-packer --image-family reddit-full --restart-on-failure --tags puma-server

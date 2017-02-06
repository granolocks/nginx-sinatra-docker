#!/bin/bash
cd /app

unicorn -D -c /app/unicorn.rb -E development

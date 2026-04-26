#!/bin/sh

# 用环境变量替换默认 API URL
API_URL=${API_URL:-https://api.openai.com}
DEFAULT_API_URL=${DEFAULT_API_URL-}

# 查找所有 js 文件并将占位符替换为实际的 API_URL
escaped_default_api_url=$(printf '%s' "$DEFAULT_API_URL" | sed 's/[|&]/\\&/g')

find /usr/share/nginx/html/assets -type f -name "*.js" -exec sed -i "s|__VITE_DEFAULT_API_URL_PLACEHOLDER__|$escaped_default_api_url|g" {} +

exec "$@"

#!/bin/bash

mkdir -p ..
cd ..

if [ ! -d "poly-livre-backend" ]; then
  git clone https://github.com/HoodieYlya13/poly-livre-backend.git
fi

if [ ! -d "poly-livre-frontend" ]; then
  git clone https://github.com/HoodieYlya13/poly-livre-frontend.git
fi

cd poly-livre-fullstack-infrastructure

if [ -f ".env.local" ]; then
  cp .env.local ../poly-livre-frontend/.env.local
else
  cat <<EOF > ../poly-livre-frontend/.env.local
NEXT_PUBLIC_TESTING_MODE=true
UPSTASH_REDIS_REST_URL="https://example.upstash.io"
UPSTASH_REDIS_REST_TOKEN="dummy_token_for_testing_purposes"
EOF
fi

echo "Installing frontend dependencies..."
(cd ../poly-livre-frontend && npm install)

docker compose up --build
# load environment variables
if [ ! -f .env ]; then
    echo "Missing .env file. Exiting."
    exit 1
fi

set -a
. ./.env
set +a

./glance --config ./config.yml

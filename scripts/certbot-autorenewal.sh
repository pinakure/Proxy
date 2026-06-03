#!/bin/bash
trap exit TERM; while :; do certbot renew; sleep 12h & wait $${!}; done

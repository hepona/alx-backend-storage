#!/usr/bin/env python3
import redis
r = redis.Redis(host='foo.bar.com', port=12345)
r.ping()
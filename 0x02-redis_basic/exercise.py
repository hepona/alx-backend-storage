#!/usr/bin/env python3
import redis
import uuid
from typing import Union

"""0x02. Redis basic"""


class Cache:
    """cache classs"""

    def __init__(self):
        """init"""
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        """store str to Redis"""
        ky = str(uuid.uuid1())
        self._redis.set(ky, data)
        return ky

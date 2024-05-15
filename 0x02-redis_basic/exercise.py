#!/usr/bin/env python3
import redis
import uuid
from typing import Union, Optional, Callable
from functools import wraps

"""0x02. Redis basic"""


def count_calls(method: Callable) -> Callable:
    """count all"""

    @wraps(method)
    def wrapper(self, *args, **kwds):
        """ """
        key = method.__qualname__
        self._redis.incr(key)
        return method(self, *args, **kwds)

    return wrapper


class Cache:
    """cache classs"""

    def __init__(self):
        """init"""
        self._redis = redis.Redis()
        self._redis.flushdb()

    @count_calls
    def store(self, data: Union[str, bytes, int, float]) -> str:
        """store str to Redis"""
        ky = str(uuid.uuid1())
        self._redis.set(ky, data)
        return ky

    def get(
        self, key: str, fn: Optional[Callable] = None
    ) -> Union[str, bytes, int, float]:
        """convert the data back to the desired format"""
        data = self._redis.get(key)
        if fn is not None:
            return fn(data)
        return data

    def get_str(self, key: str) -> Union[str, None]:
        """auto parametrize Cache.get with the correct conversion function"""
        return self.get(key, fn=str)

    def get_int(self, key: str) -> Union[str, None]:
        """auto parametrize Cache.get with the correct conversion function"""
        return self.get(key, fn=int)

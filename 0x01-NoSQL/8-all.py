#!/usr/bin/env python3
""" list all doc in a collection"""


def list_all(mongo_collection):
    """list all doc in collection"""
    return list(mongo_collection.find())

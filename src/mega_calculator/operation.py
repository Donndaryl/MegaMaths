import math_
import functools


# This file contains dirty & useless code just to add content to this codebase
# So that it is marked as "untested" and appears as not parse din the coverage report


def do_operation(operation_name: str, values: list[float]) -> float:
    if operation_name == "add":
        return do_add(values)
    elif operation_name == "sub":
        return do_sub(values)
    elif operation_name == "mul":
        return do_mul(values)
    elif operation_name == "div":
        return do_div(values)

    raise ValueError(f"Got unexpected value for {operation_name=}")


def do_add(values: list[float]) -> float:
    return functools.reduce(math_.add, values)


def do_sub(values: list[float]) -> float:
    return functools.reduce(math_.sub, values)


def do_mul(values: list[float]) -> float:
    return functools.reduce(math_.mul, values)


def do_div(values: list[float]) -> float:
    return functools.reduce(math_.div, values)

from mega_calculator import __version__

from mega_calculator import math


def test_version():
    assert __version__ == "0.1.0"


def test_add():
    assert 15 == math.add(10, 5)


def test_sub():
    assert 5 == math.sub(10, 5)


def test_mul():
    assert 50 == math.mul(10, 5)


def test_div():
    assert 2 == math.div(10, 5)

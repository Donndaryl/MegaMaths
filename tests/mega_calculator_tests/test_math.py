from src.mega_calculator import __version__

from src.mega_calculator import math_


def test_version():
    assert __version__ == "0.1.0"


def test_add():
    assert 15 == math_.add(10, 5)


def test_sub():
    assert 5 == math_.sub(10, 5)


def test_mul():
    assert 50 == math_.mul(10, 5)


def test_div():
    assert 2 == math_.div(10, 5)

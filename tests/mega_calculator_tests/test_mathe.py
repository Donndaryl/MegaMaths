from src.mega_calculator import __version__

from src.mega_calculator import mathe


def test_version():
    assert __version__ == "0.1.0"


def test_add():
    assert 15 == mathe.add(10, 5)


def test_sub():
    assert 5 == mathe.sub(10, 5)


def test_mul():
    assert 50 == mathe.mul(10, 5)


def test_div():
    assert 2 == mathe.div(10, 5)

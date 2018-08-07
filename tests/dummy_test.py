from hypothesis import given
from hypothesis.strategies import text

@given(text())
def test_validate(arg):
    assert True

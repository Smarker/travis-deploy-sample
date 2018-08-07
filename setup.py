from setuptools import setup

setup(
    name="pybatchai",
    version='0.0.1',
    install_requires=[
        'blobxfer'
    ],
    extras_require={
        'dev': [
            'hypothesis',
            'pytest'
        ]
    },
    entry_points={
        'console_scripts': ['pybatchai=pybatchai:cli']
    }
)

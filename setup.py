from setuptools import setup

setup(
    name="travis-deploy-sample",
    version='0.0.1',
    install_requires=[
        'blobxfer'
    ],
    extras_require={
        'dev': [
            'hypothesis',
            'pytest'
        ]
    }
)

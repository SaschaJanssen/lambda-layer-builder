#!/bin/bash

PYTHON='python3.7'

python3 -m venv venv && \
    . venv/bin/activate && \
    pip install --upgrade pip && \
    pip install virtualenv

pip install -r requirements.txt
pip uninstall -y matplotlib

mkdir ./python && mv ./venv/lib ./python/

# cleanup
find "./python/lib/${PYTHON}/site-packages" -name "test" | xargs rm -rf && \
find "./python/lib/${PYTHON}/site-packages" -name "tests" | xargs rm -rf && \
find "./python/lib/${PYTHON}/site-packages" -name "__pycache__" -type d | xargs rm -rf && \
find "./python/lib/${PYTHON}/site-packages" -name '*.pyc' -delete

rm -rf ./python/lib/${PYTHON}/site-packages/easy-install*
rm -rf ./python/lib/${PYTHON}/site-packages/wheel*
rm -rf ./python/lib/${PYTHON}/site-packages/setuptools*
rm -rf ./python/lib/${PYTHON}/site-packages/virtualenv*
rm -rf ./python/lib/${PYTHON}/site-packages/pip*

rm -rf ./python/lib/${PYTHON}/site-packages/pystan/stan/src
rm -rf ./python/lib/${PYTHON}/site-packages/pystan/stan/lib/stan_math/lib

echo "Uncompressed layer size $(du -sh ./python/* | cut -f1)"

# compress and cleanup
zip -9qr layer.zip ./python/
rm -rf venv python
echo "Compressed layer size: $(du -mh layer.zip | cut -f1)"

#!/bin/bash

# Script that can be used with git-bisect
# cd pixi
# git clone https://github.com/petermcevoy/pixi_pypy_editable_regression.git
# git bisect start v0.24.0 v0.23.0 # marking 0.23 as good and 0.24 as bad
# git bisect run ./pixi_pypy_editable_regression/bisect_check.sh

set -e

# Run once, here we can expect a pypi reinstall
cargo run -- run -v --manifest-path pixi_pypy_editable_regression/pixi.toml echo 'hello' || true

# Run second time, here we expect nothing to happen
cargo run -- run -v --manifest-path pixi_pypy_editable_regression/pixi.toml echo 'hello' 2>&1 | grep "pixi::install_pypi: nothing to do"

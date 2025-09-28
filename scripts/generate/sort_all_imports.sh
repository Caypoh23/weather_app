#!/bin/bash

# Execute on sort_all_imports package
fvm dart run melos exec --depends-on=import_sorter -- fvm dart run import_sorter:main
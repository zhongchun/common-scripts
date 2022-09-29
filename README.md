# common-scripts

- [Introduction](#1)
- [Directories](#2)
- [How to use](#3)

## <span id='1'>Introduction</span>
Some common scripts.

## <span id='2'>Directories</span>
```shell
common-scripts
├── README.md
└── shell
    ├── mysql
    │   ├── export_from_mysql.sh
    │   └── import_to_mysql.sh
    └── utils
        ├── getWeek.sh
        ├── remove.sh
        └── run.sh

3 directories, 6 files
```

## How to use
### rm
Should add `alias` as follows in your `.bashrc` or `.zshrc` or other shell settings file.
```shell
alias rm="$HOME/Tools/util/remove.sh"
```

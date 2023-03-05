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

## <span id='3'>How to use</span>
### Create a backup `rm`
1. Add execute permission `chmod +x remove.sh`
2. Should add `alias` as follows in your `.bashrc` or `.zshrc` or other shell settings file.
```shell
alias rm="$HOME/Tools/util/remove.sh"
```
3. And then execute `source .bashrc` or `source .zshrc`

To be continued.


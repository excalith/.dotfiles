#!/usr/bin/env bash

awk -vOFS='' '
    NR==FNR {
        all[i++] = $0;
        difffiles[$1] = $0;
        next;
    }
    ! ($2 in difffiles) {
        print; next;
    }
    {
        gsub($2, difffiles[$2]);
        print;
    }
    END {
        if (NR != FNR) {
            # Had diff output
            exit;
        }
        # Had no diff output, just print lines from git status -s
        for (i in all) {
            print all[i];
        }
    }
' \
    <(git diff --color --stat=$(($(tput cols))) HEAD | sed '$d; s/^ //')\
    <(git -c color.status=always status -s)
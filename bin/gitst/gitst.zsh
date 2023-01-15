#!/usr/bin/env bash
# Found from https://www.reddit.com/r/git/comments/avv34g/nicer_gitstatus/

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
        # Had no diff output, just print lines from git status -sb
        for (i in all) {
            print all[i];
        }
    }
' \
    <(git diff --color --stat=$(($(tput cols) - 3)) HEAD | sed '$d; s/^ //') \
    <(git -c color.status=always status -sb)

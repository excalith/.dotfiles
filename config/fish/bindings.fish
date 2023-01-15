# function bind_enter
#     set -l lastline $history[1]
#     set -l cmdline (commandline)
#     if test -z (string trim "$cmdline")
#         commandline -r $lastline
#         commandline -f execute
#     else
#         commandline -f execute
#     end
# end

# bind \r bind_enter
# Actual prompt
if [[ $EUID != 0 ]] {

PROMPT=$'%{\e[0;32m%}%~%{\e[0;34m%} $ %{\e[0m%}'
} else {
PROMPT=$'%{\e[0;32m%}%~%{\e[0;31m%} # %{\e[0m%}'
}


source /etc/bash_completion_lib/bash_completion_lib
source ~/.profile

function col_begin() { echo -ne "\[\e[38;5;$1m\]"; }
function col_end() { echo -ne '\[\e[m\]'; }
PS1="`col_begin 187`\u@\h `col_begin 174`\w \$`col_end` "

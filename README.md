<b>findandmd5.sh</b> <i>&lt;dir1&gt;</i> <i>&lt;dir2&gt;</i> &mdash; scan directories <i>dir1</i> and <i>dir2</i> recursivelly for ordinary files, calculate their md5 sums, output filenames with the same md5 sums. Script creates two files with md5 sums in current directory.

<b>rlog-test.c</b> &mdash; Program infinitly writes messages to syslog.<br>
<b>rlog-reconfig_and_start.sh</b> <i>&lt;id&gt;</i> &mdash; Creates rsyslogd config file for <i>id</i>, reloads rsyslogd, starts application have builded from rlog-test.c with <i>id</i> as argument.

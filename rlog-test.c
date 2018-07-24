#include<stdio.h>
#include<stdlib.h>
#include<syslog.h>
#include<unistd.h>
 
 
int main(int argc,char**argv)
{
int i;
char msg[100];
char id[10]="UNKNOWN";
if(argc==2)
  {
  sprintf(id,"%s",argv[1]);
  }
openlog(id, LOG_NDELAY, LOG_LOCAL0);
for(i=1;;++i)
  {
  sprintf(msg,"log message #%d",i);
  puts(msg);
  syslog(LOG_DEBUG, msg);
  sleep(1);
  }
closelog();
return 0;
}


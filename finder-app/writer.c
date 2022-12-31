#include <stdio.h>
#include <syslog.h>
#include <string.h>
#include <errno.h>

int main(int argc, char *argv[]) {
  // Open up syslog connection
  openlog("writer", LOG_PID | LOG_CONS, LOG_USER);

  // Make sure have sufficient  arguments before proceding
  if (argc != 3) {
    printf("Wrong number of arguments provided, 2 required!\n");
    syslog(LOG_ERR, "Wrong number of arguments provided, 2 required!"); 
    return 1;
  }

  // Retrieve string and file from arguments
  const char *filedest = argv[1];
  const char *str = argv[2];

  // Open up file to write to
  FILE *fp = fopen(filedest, "w");
  
  // Log in case of error
  if (fp == NULL) {
    syslog(LOG_ERR, "Unexpected error occurred: %d (%s)", errno, strerror(errno));
    return 1;
  }

  // Write to file
  fprintf(fp, "%s", str);

  // Log the writing of string
  syslog(LOG_DEBUG, "Writing %s to %s", str, filedest);

  // Make sure to close the file after writing to it
  fclose(fp);

  return 0;
}

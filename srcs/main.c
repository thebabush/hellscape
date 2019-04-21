#include <stdio.h>
#include <string.h>

extern void fuzz(unsigned char *);

int main(int argc, char *argv[]) {
  if (argc <= 1) {
    printf("Usage: %s <filename>\n", argv[0]);
    return 1;
  }

  unsigned char buff[32];
  memset(buff, 0, sizeof(buff));

  FILE *f = fopen(argv[1], "rb");
  if (f == NULL) {
    perror("fopen");
    return 1;
  }

  fread(buff, 1, sizeof(buff), f);
  fclose(f);

  fuzz(buff);

  return 0;
}


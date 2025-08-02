#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    FILE* fp = popen("python3 --version 2>&1", "r");
    if (!fp) {
        fprintf(stderr, "Error: Failed to run command\n");
        return 1;
    }

    char version[128];
    if (fgets(version, sizeof(version), fp) != NULL) {
        if (strstr(version, "Python 3")) {
            printf("Detected Python Version: %s", version);

            FILE* log = fopen("/tmp/python_ver.log", "w");
            if (log) {
                fprintf(log, "Detected Python Version: %s", version);
                fclose(log);
            } else {
                fprintf(stderr, "Error: Could not write log file\n");
            }
        } else {
            printf("Error: Python 3 not found\n");
        }
    } else {
        printf("Error: Python 3 not found\n");
    }

    pclose(fp);
    return 0;
}

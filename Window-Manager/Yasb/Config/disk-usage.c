#include <windows.h>
#include <pdh.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#pragma comment(lib, "pdh.lib")

typedef struct {
    int disk;
    double value;
} DiskUsage;

int main() {

    PDH_HQUERY query;
    PDH_HCOUNTER counter;

    DWORD bufferSize = 0;
    DWORD itemCount = 0;

    PDH_FMT_COUNTERVALUE_ITEM *items;

    DiskUsage disks[32];
    int diskCount = 0;

    if (PdhOpenQuery(NULL, 0, &query) != ERROR_SUCCESS)
        return 1;

    if (PdhAddEnglishCounter(
            query,
            "\\PhysicalDisk(*)\\% Disk Time",
            0,
            &counter) != ERROR_SUCCESS)
        return 1;

    /* first sample */
    PdhCollectQueryData(query);

    /* minimal delay for rate calculation */
    Sleep(50);

    /* second sample */
    PdhCollectQueryData(query);

    PdhGetFormattedCounterArray(
        counter,
        PDH_FMT_DOUBLE,
        &bufferSize,
        &itemCount,
        NULL
    );

    items = (PDH_FMT_COUNTERVALUE_ITEM*)malloc(bufferSize);

    if (PdhGetFormattedCounterArray(
            counter,
            PDH_FMT_DOUBLE,
            &bufferSize,
            &itemCount,
            items) == ERROR_SUCCESS) {

        for (DWORD i = 0; i < itemCount; i++) {

            if (strcmp(items[i].szName, "_Total") == 0)
                continue;

            int diskIndex = atoi(items[i].szName);
            double val = items[i].FmtValue.doubleValue;

            int found = 0;

            for (int j = 0; j < diskCount; j++) {
                if (disks[j].disk == diskIndex) {

                    if (val > disks[j].value)
                        disks[j].value = val;

                    found = 1;
                    break;
                }
            }

            if (!found) {
                disks[diskCount].disk = diskIndex;
                disks[diskCount].value = val;
                diskCount++;
            }
        }

        for (int i = 0; i < diskCount; i++) {
            printf("D%d=%.0f%% ", disks[i].disk, disks[i].value);
        }
        printf("\n");
        fflush(stdout);
    }

    free(items);
    PdhCloseQuery(query);

    return 0;
}

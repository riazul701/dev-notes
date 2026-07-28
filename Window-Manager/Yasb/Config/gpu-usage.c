#include <windows.h>
#include <pdh.h>
#include <stdio.h>

#pragma comment(lib, "pdh.lib")

int main() {
    PDH_HQUERY query;
    PDH_HCOUNTER counter;
    DWORD bufferSize = 0;
    DWORD itemCount = 0;
    PDH_FMT_COUNTERVALUE_ITEM *items;

    PdhOpenQuery(NULL, 0, &query);

    PdhAddEnglishCounter(
        query,
        "\\GPU Engine(*engtype_3D)\\Utilization Percentage",
        0,
        &counter
    );

    PdhCollectQueryData(query);
    Sleep(200);
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
        items
    ) == ERROR_SUCCESS) {

        double total = 0;

        for (DWORD i = 0; i < itemCount; i++) {
            total += items[i].FmtValue.doubleValue;
        }

        printf("%.0f%%\n", total);
    }

    free(items);
    PdhCloseQuery(query);
}

# RAM.md

## Websites

* [MemTest86 Wikipedia](https://en.wikipedia.org/wiki/MemTest86)
* [memtest86.com](https://www.memtest86.com/)
* [memtest86plus/memtest86plus](https://github.com/memtest86plus/memtest86plus) || [memtest.org](https://www.memtest.org/)

## Notes

* If you have multiple RAM DIMMs, I recommend buying and then swapping each in turn before re-running the memory test to isolate the defective RAM. You may not need to pay to replace multiple DIMMs if only one is faulty. <sup>{3}</sup>

* RAM Speed: MHz * 8 = Speed in MegaByte/Second. For example, 3200MHz * 8 = 25600 MegaByte/Second. <sup>{6}</sup>

# Windows Memory Diagnostic Tool

* {4} [Hidden tool in Windows to test RAM for Issues BY Buzz2day Tech](https://www.youtube.com/watch?v=RFJHcGK3wEw)

* {1} [How to run Windows Memory Diagnostic Tool in Windows 10](https://www.microcenter.com/tech_center/article/3067/how-to-run-windows-memory-diagnostic-tool-in-windows-10)
  * Description: This article will show you how to run the Windows Memory Diagnostic Tool in Windows 10. The Memory Diagnostic Tool will check the RAM in your computer for errors..
  * Press the `Windows key` on your keyboard and the letter `R` at the same time to open the `Run` window. Type `mdsched.exe` and press `OK`.
  * `Windows Memory Diagnostic` will open with two options for scanning. The first option is `Restart now and check for problems` if you want to run the scan immediately. The second option is `Check for problems the next time I start my computer` if you want to run the scan later after a restart.
  * When the computer restarts, the Memory Diagnostic will automatically start. When the diagnostic completes the system will restart again.

* {3} [How to Test Your RAM With Windows Memory Diagnostic](https://www.techrepublic.com/article/how-to-detect-bad-ram-with-the-windows-memory-diagnostic-tool/)
  * 4. View the completed results
  * Once the test is complete, Windows will continue to start, and after a few minutes, you may see a pop-up showing the results.
  * Disclaimer: In my experience, I did not see a pop-up. It is possible the pop-up only appears if you have a memory problem.
  * You can also view the results by typing “Event Viewer” into the search box (Figure D).
  * From there, expand `Windows Logs`, click `System` and then select the most recent log with `MemoryDiagnostics-Results` as the source (Figure E).

  * Going further
    * If you have multiple RAM DIMMs, I recommend buying and then swapping each in turn before re-running the memory test to isolate the defective RAM. You may not need to pay to replace multiple DIMMs if only one is faulty.

# MemTest86

* [MemTest86 Hardware Support](https://www.memtest86.com/compare.html) <sup>{5}</sup>

# References

* next-sl: {7}

* Guides
  * {1} [How to run Windows Memory Diagnostic Tool in Windows 10](https://www.microcenter.com/tech_center/article/3067/how-to-run-windows-memory-diagnostic-tool-in-windows-10)
  * {3} [How to Test Your RAM With Windows Memory Diagnostic](https://www.techrepublic.com/article/how-to-detect-bad-ram-with-the-windows-memory-diagnostic-tool/)

* YouTube Tutorials

  * {2} [How to TEST YOUR RAM with memtest86 / Step By Step Tutorial - BSOD and Crashing BY fixitfixitfixit](https://www.youtube.com/watch?v=83LweZzxnf0)
  * {4} [Hidden tool in Windows to test RAM for Issues BY Buzz2day Tech](https://www.youtube.com/watch?v=RFJHcGK3wEw)
  * {5} [Troubleshoot bad RAM with MemTest86 BY PassMark Software](https://www.youtube.com/watch?v=F4iopcL5vxo)

  * Concept
    * {6} [র্যাম কি, কিভাবে কাজ করে, কোনটা কিনবেন? RAM Explained In Bangla I Ram Bus Speed, Timing I TechTalk BY Tech Talk](https://www.youtube.com/watch?v=diUFMBl72so)
    * [Different Size RAM Use Together? | 8GB + 4GB = 12GB RAM!!! | Problem?! BY The Urbans](https://www.youtube.com/watch?v=6phaMMMlTfA)
    * [How Much RAM do you Need in PC for Gaming and Editing? | In Laptop and Desktop BY The Urbans](https://www.youtube.com/watch?v=Ja0y5-lO7-E)

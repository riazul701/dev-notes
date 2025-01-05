# Commands

* Get Processor Temperature <sup>{16} {17}</sup>
  * `sudo apt-get install lm-sensors`
  * `sudo sensors-detect` : Detect all sensors in PC.
  * `sensors` : Get CPU temperature.
  * `watch -n 1 -d sensors` : Real-time monitor sensors data on the command line.
  * `sudo apt install psensor` : Graphical-User-Interface of `lm-sensors` and `hddtemp`.
  * `psensor` : Launch `psensor` GUI application.

# Processor.md

## Websites

* Benchmark
  * [techpowerup.com => CPU Specs Database](https://www.techpowerup.com/cpu-specs/)
  * [cpubenchmark.net => CPU Benchmarks](https://www.cpubenchmark.net/)
  * [Top Laptop CPU Ranking](https://laptopmedia.com/top-laptop-cpu-ranking/)

* Performance/Testing
  * [Intel® Processor Diagnostic Tool](https://www.intel.com/content/www/us/en/download/15951/intel-processor-diagnostic-tool.html)
  * [CPU-Z for Windows® x86/x64](https://www.cpuid.com/softwares/cpu-z.html)
  * [Cinebench](https://www.maxon.net/en/cinebench)
  * [Prime95 CPU Stress Test](https://www.mersenne.org/download/) <sup>{18}</sup>

* Processor List
  * [List of AMD Ryzen processors](https://en.wikipedia.org/wiki/List_of_AMD_Ryzen_processors)
  * [Windows Processor Requirements](https://learn.microsoft.com/en-us/windows-hardware/design/minimum/windows-processor-requirements)
  
## Notes

* Windows 11: You need a processor that must be in the 8th generation. <sup>{2}</sup>
  * [Windows Processor Requirements](https://learn.microsoft.com/en-us/windows-hardware/design/minimum/windows-processor-requirements)
  * Windows 11 requires TPM (Trusted Platform Module) 2.0 in Processor/Motherboard. Check it, before buying.
  
* Integrated Graphics <sup>{20}</sup>
  * AMD processor name ends with letter "G" means, it has integrated graphics and this processor is called APU (Accelarated Processing Unit). All other AMD processors except this naming do not have graphics inbuilt and require external graphics card to get monitor output.
  * Intel processor name ends with letter "F" means, it does not have integrated graphics and require external graphics card to get monitor output. All other Intel processors (has letter "G" in name) except this have integrated graphics.

## Processor List

* Most Popular AMD Processors
  * AMD Ryzen 5 5600g (Best Budget Friendly)
  * AMD Ryzen 5 3400g (Old)
  * AMD Ryzen 5 2200g (Old)

* AMD has been pretty quiet about the entry-level 8600G and 8700G CPUs, but why? With reduced PCIe lanes, Zen4c cores, a pretty beefy built-in GPU. <sup>{21}</sup>

# References

* next-sl: {22}

* Guides

  * General
    * {1} [Is Intel Processor Diagnostic Tool good for teeling if your CPU is bad](https://www.reddit.com/r/techsupport/comments/w5rkiq/is_intel_processor_diagnostic_tool_good_for/)
    * {2} [why intel i3 4th genration prossesor is not supported for windows 11?](https://learn.microsoft.com/en-us/answers/questions/566212/why-intel-i3-4th-genration-prossesor-is-not-suppor)

  * Linux
    * {16} [How can I monitor the CPU temperature under linux?](https://superuser.com/questions/25176/how-can-i-monitor-the-cpu-temperature-under-linux)
    * {17} [How do I get the CPU temperature?](https://askubuntu.com/questions/15832/how-do-i-get-the-cpu-temperature)

  * Performance/Test
    * {18} [Is FurMark CPU Burner a decent stress test?](https://www.reddit.com/r/buildapc/comments/tm2yxn/is_furmark_cpu_burner_a_decent_stress_test/)

  * Comparison
    * {19} [CPU comparison > AMD Ryzen 5 3400G vs AMD Ryzen 5 5600G](https://versus.com/en/amd-ryzen-5-3400g-vs-amd-ryzen-5-5600g)

  * Name Explained
    * [Decoding CPU Names: Understanding AMD & Intel's Nomenclature](https://primetechsupport.com/blogs/gaming-pc-repairs/decoding-cpu-names-understanding-amd-intels-nomenclature)
    * [Understanding AMD Processor Names](https://medium.com/@meCreator/01-understanding-amd-processor-names-3a89261dcd99)

* YouTube Tutorials

  * Cautions
    * [Thoda Ruko!!!!! 🔥 Intel 13th Aur 14th Gen Processor Ki Badi Problem BY Sai Techvision](https://www.youtube.com/watch?v=U4eMQEWNGfU)
    * [Avoid Intel CPUs in 2024: Don't Buy Intel in 2024 BY GEEKY SOUMYA](https://www.youtube.com/watch?v=TuDwshNh9wA)

  * Performance
    * {3} [Processor Health Check | How to Check Processor Performance 2020 Guide | Test your CPU or Processor BY Shadman Hiya](https://www.youtube.com/watch?v=TIB4M4LuCKs)

  * Warranty
    * [Why Does Overclocking Void Your Warranty? BY Techquickie](https://www.youtube.com/watch?v=TsRWeOPw0vk)

  * Product
    * {4} [Ryzen 5 5600G (Vega 7) vs Ryzen 5 3400G (Vega 11) Gaming Test ! 2021 BY PC Support & Gaming Test](https://www.youtube.com/watch?v=OAr52MDKRx8)
    * {5} [AMD Ryzen 5600G vs 3400G vs 3200G Benchmark BY WePC Benchmarks](https://www.youtube.com/watch?v=RNHUMY31-2E)
    * {6} [Ryzen 5 5600G vs Ryzen 5 3400G | Which One To Buy | Hindi BY Tech community](https://www.youtube.com/watch?v=M-TtABtTSp8)
    * {7} [I Bought Most Liked AMD Processor!🤩 Ryzne 5 5600G Worth Buying in 2024? Extreme Gaming Test BY Adi 4 u](https://www.youtube.com/watch?v=ID0TEEZ5LHc)
    * {21} [AMD failed to mention this... - AMD Ryzen 8000G Series BY ShortCircuit](https://www.youtube.com/watch?v=chwFYURKmIY)

  * Concept
    * {8} [রাইজেন কেনার আগে অবশ্যই দেখুন! চায়না, গ্লোবাল কোনটা নিবেন! AMD Ryzen Buying Guide 2023 I TechTalk BY Tech Talk](https://www.youtube.com/watch?v=Kl4Tra8ONbI)
    * {9} [L1, L2, L3 Cache Memory Explained in Bangla I Cache Memory কি & কতটা দরকার ? What is Cache Memory? BY Tech Talk](https://www.youtube.com/watch?v=a0ua6kS_Mj8)
    * {10} [ইন্টেল Core i3, i5, i7, i9 বিস্তারিত জানুন I প্রসেসরের নাম দেখে বুঝে নিন কেমন হবে! TechTalk BY Tech Talk](https://www.youtube.com/watch?v=sxQQxGRjLdg)
    * {11} [Processor explained in bangla I Which One is better for you? প্রসেসরে এর বিস্তারিত জানুন সহজ ভাষায়। BY Tech Talk](https://www.youtube.com/watch?v=I9f-IrShxXw)
    * {12} [x86 vs ARM CPU: কি, কেন ব্যবহার করা হয়? ARM vs x86 CPU Explained I TechTalk BY Tech Talk](https://www.youtube.com/watch?v=S138piIDXWk)
    * {13} [Intel Vs AMD Processors Comparison Bangla | Which One is better for you? কোনটা ভালো ? BY The Urbans](https://www.youtube.com/watch?v=2h0zf7GKQrQ)
    * {14} [How many Cores do You Need in a CPU/Processor?[Content Creation & Gaming] BY The Urbans](https://www.youtube.com/watch?v=9jdnfv40sHE)
    * {15} [How often should you replace CPU thermal paste? 👉 BY The Urbans](https://www.youtube.com/watch?v=c1q97k1NVK8)
    * {20} [Explaining Intel & AMD CPUs BY ExplainingComputers](https://www.youtube.com/watch?v=QcxNdXnahOM)
    * [Processor কেনার সময় কি কি দেখতে হবে BY The SIM Play](https://www.youtube.com/watch?v=7jyIptvd8e0)
    * [How are Microchips Made? 🖥️🛠️ CPU Manufacturing Process Steps BY Branch Education](https://www.youtube.com/watch?v=dX9CGRZwD-w)

  * Name Explained YouTube
    * [⚡AMD RYZEN Processor Naming Scheme Explained | 🔥AMD CPU Letters | AMD Secret Letters You Didn't Know BY GADGET WORLD](https://www.youtube.com/watch?v=J9NzzV_-G_A)
    * [Ryzen's Confusing New Numbering Scheme BY Techquickie](https://www.youtube.com/watch?v=oErJG3fThF0)
    * [Intel Processor Naming Scheme Explained | Intel CPU Letters | Intel Secret Letters You Didn't Know BY GADGET WORLD](https://www.youtube.com/watch?v=uRBmLb5lhrE)
    * [6 Things You Need to Know About Computers! BY The Mysterious Tech](https://www.youtube.com/watch?v=p86QAKTSalE)

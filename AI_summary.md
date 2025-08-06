# [AI summary](https://discord.com/channels/1077146284143673354/1077186195202789406/1400384256420872202)

```plaintext
Quick recap

Lukas presented an introduction to visual profiling techniques in constrained environments, discussing various tools and methods for identifying and fixing inefficiencies in multithreaded applications. He demonstrated how to use Nvidia's profiling framework and shared his experience with different profiling tools like Nvtx and Tracy, highlighting their strengths and limitations. Lukas also presented his own library called CXXet for performance measurement and discussed the challenges of handling data collection and synchronization across forked processes, proposing potential improvements for the library.
Next steps

    Lukas: Upload the presentation to the Meetup Discord.
    Lukas: Update the CXX ET library documentation to make it more user-friendly.
    Lukas: Add thread naming functionality to the CXX ET library.
    Lukas: Consider implementing a wrapper for fork that would automatically handle the profiling redirection.
    Lukas: Investigate how to properly handle coroutines in the CXX ET library.

Summary
Visual Profiling in Constrained Environments

Lukas presented an introduction to visual profiling in constrained environments, sharing his experience with tools like Nvtx and Tracy. He explained how visual profiling helped him identify and fix inefficiencies in a multithreaded application. Lukas planned to discuss established frameworks and libraries, as well as newer approaches like perf combined with flame graphs. He mentioned that while existing tools were sufficient for some use cases, they had limitations for others, leading him to explore alternative solutions.
Application Profiling Techniques Overview

Lukas presented on application profiling techniques, distinguishing between non-intrusive and intrusive methods. He introduced his new library called Cxxet for performance measurement and explained how visual profiling tools like perf and VTX can help identify bottlenecks in applications. While discussing constrained environments, Lukas acknowledged using the term "constraint" might have been misleading as it's commonly associated with embedded systems, which is not his area of expertise.
Nvidia Profiler Demonstration Overview

Lukas demonstrated how to use Nvidia's profiling framework, showing how to insert markers into code, compile with the proper libraries, and run the application under Nsys with specific parameters. He explained the process of opening the resulting trace in the GUI, analyzing the data, and repeating the measurements until satisfactory results are obtained. The demonstration included a simple example of a function call with a loop, showing how the profiler captures performance data and displays it in a visual format.
GPU and CPU Profiling Tools

Lukas discussed two profiling tools: Nvtx and Tracy. He explained that Nvtx is primarily for GPU programming and requires a separate application to collect profiling data, while Tracy can be compiled into the application itself. Lukas highlighted that both tools have their own proprietary formats for storing profiling data. He also mentioned that Tracy offers features like thread synchronization visualization and the ability to compile out tracing code at compile time. Lukas noted that Tracy works with C++14 and up, and he recommended looking into it for profiling needs.
C++ Profiling Library Development

Lukas discussed his experience with profiling a web server application written in C++ that used fork() for request processing. He found Tracy, a profiling tool, challenging to use in this environment due to issues with forking and shared resources. As a result, he developed a simple library called CXXet (C++ Easy Tracing) to provide an easier way to collect profiling data. The library is still under development and lacks documentation, but Lukas hopes to improve it based on feedback from the community.
Tracing System Implementation Overview

Lukas presented a detailed overview of a tracing system, focusing on its implementation and usage. He explained the structure of thread-local buffers and global buffers for collecting tracing data, as well as the various marker types available. Lukas highlighted the system's portability and human-readable JSON format as advantages. He also discussed the memory usage considerations and potential performance impacts of the tracing system. The presentation concluded with an explanation of how to handle forking environments and divert tracing data to different files for different execution paths.
Data Synchronization in Forked Processes

Lukas discussed the challenges and solutions related to handling data collection and synchronization across forked processes, emphasizing the need for a simple and efficient approach. He explained the current limitations of the library in managing forks independently and proposed potential improvements, such as providing a wrapper for the fork function to handle data separation automatically. Lukas also addressed questions about thread naming, performance tracking tools, and the use of coroutines, noting that further exploration and development would be needed to fully integrate coroutines with the library.
```

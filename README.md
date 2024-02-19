# QUIC-not-Quick

In this repository, we release the dataset and tools in [WWW '24](https://www2024.thewebconf.org) paper, *QUIC is not Quick Enough over Fast Internet* ([arXiv](https://arxiv.org/abs/2310.09423)).

## Introduction

In this study, we conduct a systematic examination of QUIC's performance over high-speed networks. We find that over fast Internet, the UDP+QUIC+HTTP/3 stack suffers a data rate reduction compared to the TCP+TLS+HTTP/2 counterpart. Moreover, the performance gap between QUIC and HTTP/2 grows as the underlying bandwidth increases. We observe this issue on lightweight data transfer clients and major web browsers, on different hosts, and over diverse networks. It affects not only file transfers, but also various applications such as video streaming and web browsing. Through in-depth analysis, we identify the root cause and make concrete recommendations for mitigating the observed performance issues.

## Data Description

| Content in Paper | Folder in Repo |  Description |
|:---:|:---:|:---:|
| Figure 1 | [Toy-Size](Toy/1-Toy-Size) | Throughput of lightweight clients during file download. |
| Figure 2 | [Toy-CPU](Toy/2-Toy-CPU) | CPU usage of lightweight clients during file download. |
| Figure 3 | [Toy-BW](Toy/3-Toy-BW) | Performance of lightweight clients during file download under limited bandwidth. |
| Figure 4 | [Chrome-Size](Browser/4-Chrome-Size) | Throughput of the Chrome browser during file download. |
| Figure 5 | [Chrome-CPU](Browser/5-Chrome-CPU) | CPU usage of the Chrome browser during file download. |
| Figure 6 | [Chrome-BW](Browser/6-Chrome-BW) | Performance of the Chrome browser during file download under limited bandwidth. |
| Figure 7 | [Chrome-CPU-Freq](Browser/7-Chrome-CPU-Freq) | Throughput of the Chrome browser at different CPU frequencies. |
| Figure 8 | [Browsers](Browser/8-Browsers) | Throughput of four different browsers during file download. |
| Figure 9 | [Video](Apps/9-Video) | Average video chunk bitrates of HTTP/3 (QUIC) and HTTP/2. |
| Figure 10 | [Web-Stats](Apps/10-Web-Stats) | Statistics of tested websites in web page loading experiments. |
| Figure 11 | [Web-Time](Apps/11-Web-Time) | Performance of two protocol stacks in web page loading. |
| Figure 12 | [Parallel](Parallel/12-Parallel) | Parallel file download experiments. |

Please feel free to reach out to us (xumiao@umich.edu) if there are any questions.

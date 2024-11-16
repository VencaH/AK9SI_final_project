# Research topic
Performance of the Docker, Podman and Spin containers.
## Research question
1. Which of the 3 containers - Docker, Podman and Spin have best performance while running 
2. Which of the 3 containers, Docker, Podman and Spin have best performance while starting new container
## Measurables
### Research question 1
Time to execute * Consumed memory and CPU - Effectivness __E__

### Research question II
Time to deploy new container, from command in cli to first respone of the app. - Speed __S__

## Hypothesis
### Research question I
$$
H_0: E_s < E_d \land E_s < E_p
$$
$$
H_1: E_d < E_s \land E_d < E_p
$$
$$
H_2: E_p <= E_d \land E_p <= E_s
$$
## Research question II
$$
H_0: S_s < S_d \land S_s < S_p 
$$
$$
H_1: S_d < S_s \land S_d < S_p
$$
$$
H_2: S_p <= S_s \land S_p <= S_d
$$



# Literature
1.  
```bibtex
@INPROCEEDINGS{7092949,
  author={Morabito, Roberto and Kjällman, Jimmy and Komu, Miika},
  booktitle={2015 IEEE International Conference on Cloud Engineering}, 
  title={Hypervisors vs. Lightweight Virtualization: A Performance Comparison}, 
  year={2015},
  volume={},
  number={},
  pages={386-393},
  keywords={Containers;Virtual machine monitors;Virtualization;Linux;Benchmark testing;Operating systems;Performance; Benchmarking; Virtualization; Hypervisor; Container},
  doi={10.1109/IC2E.2015.74}}
```
2. 
```bibtex
@INPROCEEDINGS{9751277,
  author={Đorđević, Borislav and Timčenko, Valentina and Lazić, Milovan and Davidović, Nikola},
  booktitle={2022 21st International Symposium INFOTEH-JAHORINA (INFOTEH)}, 
  title={Performance comparison of Docker and Podman container-based virtualization}, 
  year={2022},
  volume={},
  number={},
  pages={1-6},
  keywords={Containers;Benchmark testing;Time measurement;Virtual machining;Hardware;Software;Servers;Virtualization;Docker;Podman;Virtual Machine;Containers;Filebench},
  doi={10.1109/INFOTEH53737.2022.9751277}}
```
3. d
```bibtex
@article{article,
author = {Eka Pratama, I Putu Agus and Raharja, I Made},
year = {2023},
month = {12},
pages = {2240},
title = {Node.js Performance Benchmarking and Analysis at Virtualbox, Docker, and Podman Environment Using Node-Bench Method},
volume = {7},
journal = {JOIV : International Journal on Informatics Visualization},
doi = {10.30630/joiv.7.4.01762}
}
```
4. 
```bibtex
@article{article,
author = {Sobieraj, Maciej and Kotyński, Daniel},
year = {2024},
month = {07},
pages = {1-16},
title = {Docker Performance Evaluation across Operating Systems},
volume = {14},
journal = {Applied Sciences},
doi = {10.3390/app14156672}
}
```
5. 
```bibtex
@article{article,
author = {Ramadhan, Fajar and Garno, Garno and Solehudin, Arip},
year = {2024},
month = {07},
pages = {155-166},
title = {Comparative Study of Web Server Performance Testing with and without Docker Based on Virtual Machines},
volume = {8},
journal = {Journal of Applied Informatics and Computing},
doi = {10.30871/jaic.v8i1.3884}
}
```
6. 
```bibtex
@article{article,
author = {Chae, MinSu and Lee, Hwamin and Lee, Kiyeol},
year = {2019},
month = {01},
pages = {},
title = {A performance comparison of linux containers and virtual machines using Docker and KVM},
volume = {22},
journal = {Cluster Computing},
doi = {10.1007/s10586-017-1511-2}
}
```
7. d
```bibtex
@inproceedings{inproceedings,
author = {Voulgaris, Konstantinos and Kiourtis, Athanasios and Karabetian, Andreas and Karamolegkos, Panagiotis and Poulakis, Yannis and Mavrogiorgou, Argyro and Kyriazis, Dimosthenis},
year = {2022},
month = {08},
pages = {114-118},
title = {A Comparison of Container Systems for Machine Learning Scenarios: Docker and Podman},
doi = {10.1109/CompAuto55930.2022.00029}
}
```
8. d
```bibtex
@INPROCEEDINGS{9751277,
  author={Đorđević, Borislav and Timčenko, Valentina and Lazić, Milovan and Davidović, Nikola},
  booktitle={2022 21st International Symposium INFOTEH-JAHORINA (INFOTEH)}, 
  title={Performance comparison of Docker and Podman container-based virtualization}, 
  year={2022},
  volume={},
  number={},
  pages={1-6},
  keywords={Containers;Benchmark testing;Time measurement;Virtual machining;Hardware;Software;Servers;Virtualization;Docker;Podman;Virtual Machine;Containers;Filebench},
  doi={10.1109/INFOTEH53737.2022.9751277}
}
```
9. d
```bibtex
@Article{computers13040094,
AUTHOR = {Silva, Daniel and Rafael, João and Fonte, Alexandre},
TITLE = {Toward Optimal Virtualization: An Updated Comparative Analysis of Docker and LXD Container Technologies},
JOURNAL = {Computers},
VOLUME = {13},
YEAR = {2024},
NUMBER = {4},
ARTICLE-NUMBER = {94},
URL = {https://www.mdpi.com/2073-431X/13/4/94},
ISSN = {2073-431X},
ABSTRACT = {Traditional hypervisor-assisted virtualization is a leading virtualization technology in data centers, providing cost savings (CapEx and OpEx), high availability, and disaster recovery. However, its inherent overhead may hinder performance and seems not scale or be flexible enough for certain applications, such as microservices, where deploying an application using a virtual machine is a longer and resource-intensive process. Container-based virtualization has received attention, especially with Docker, as an alternative, which also facilitates continuous integration/continuous deployment (CI/CD). Meanwhile, LXD has reactivated the interest in Linux LXC containers, which provides unique operations, including live migration and full OS emulation. A careful analysis of both options is crucial for organizations to decide which best suits their needs. This study revisits key concepts about containers, exposes the advantages and limitations of each container technology, and provides an up-to-date performance comparison between both types of containers (applicational vs. system). Using extensive benchmarks and well-known workload metrics such as CPU scores, disk speed, and network throughput, we assess their performance and quantify their virtualization overhead. Our results show a clear overall trend toward meritorious performance and the maturity of both technologies (Docker and LXD), with low overhead and scalable performance. Notably, LXD shows greater stability with consistent performance variability.},
DOI = {10.3390/computers13040094}
}
```
10. d
```bibtex
@misc{Kjellstedt1475598,
   author = {Kjellstedt, Mattias},
   institution = {Umeå University, Department of Computing Science},
   pages = {24},
   school = {Umeå University, Department of Computing Science},
   title = {PERFORMANCE EVALUATION OF DEPLOYING MICROSERVICE SUSING DOCKER AND PODMAN},
   series = {UMNAD},
   number = {1241},
   abstract = {Containers are the latest generation of virtualization solutions. The most popular container solution has been Docker, but it struggles with security issues. A newer alternative is Podman, which solves the security issues while offering similar functionality. In this study I answer the question ”how does the overhead of Docker and Podman impact performance compared to native performance?”. The amount of overhead these two containers introduces are compared, along with native system performance by benchmarking CPU- memory- and disk performances.These benchmarks implies that the two containers have very similar and near-native performance and the choice of container solution is not a question of performance, but rather of user preferences: Do you want the added security? Podman. Do you already have your whole environment build around Docker and the security is not a problem? Stick with Docker. },
   year = {2020}
}
```
11. d
```bibtex
@article{article,
author = {H. Husain, K. Marzuki, C. M. Lauw, and L. Z. A. Mardedi},
year = {2023},
month = {},
pages = {57-67},
title = {Analysis and Implementation of Comparison Between Podman and Docker in Container Management},
volume = {3},
journal = {Int. J. Electron. Commun. Syst.},
doi = {10.24042/ijecs.v3i2.19860}
}
```
12. wq


# Introduction
- Containerization is important
	- Cloud
	- easier deployment
- Docker is somehow established as standard
	- data?
- Podman as alternative using same OCI - compatible with Docker
- Fermyon Spin
	- claims to have smaller images
	- "Fermyon is a lighter, faster and **truly serverless** cloud"



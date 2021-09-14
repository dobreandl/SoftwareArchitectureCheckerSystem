# SoftwareArchitectureCheckerSystem


### Description

In the last decade, we've seen exponential growth in the number of people who use smartphones. Nowadays, the vast majority of contemporary people use the applications on their smartphones for a large variety of purposes (communication, entertainment, fitness, and wellbeing, etc.). Those applications are one of the most commonly written pieces of software nowadays and one important aspect of those software products is the fact that software architecture plays a major role in their success. In this thesis, we tackle the following topics: a deep examination of the context of software architectures on mobile applications, defining and formalizing the problem of software architecture inference, proposing different approaches for solving the enunciated problem, and assessing our results.

We study novel approaches for automatically inferring and analyzing the software architectures. We propose three approaches for solving the architecture inferring problem, a deterministic one that uses the information from the Software Development Kits, a non- deterministic one that uses Machine Learning algorithms, and a hybrid one that combines the deterministic and non-deterministic methods. Our proposals are platform-agnostic meaning they can be easily extended to other platforms (not only mobile ones). We examine the proposed approaches from multiple points of view: validity (accuracy and exactness), analysis (reliability, trust, and confidence), and portability (extensibility and stability), on 8 different sizes and purpose mobile codebases. After the examination, our results have shown that our methods have an average accuracy of 86% on the analyzed codebases.


The code in this repository is what we've used in our experiments.

The code already contains all the needed files for analyzing the Firefox, Wikipedia and Trust iOS apps.


### Install

1. Download the codebase
2. Open the SourceKitten-master-3 folder
3. Open the SourceKitten.xcworkspace in Xcode

### Run

To run the project just launch the app from Xcode.
The code is commented and there are examples in the main.swift file.

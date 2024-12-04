# Improving software quality in bioinformatics through testing
What is testing? What types of tests are we usually performing and what types are we not? We argue that bioinformaticians, especially tool developers, should integrate unit tests and automated tests into their development practices. In this workshop we show and practice how to write unit tests and make your code testable. Code testing is fundamental to achieve good quality software. Adding automated tests to a software base have several advantages. It increases confidence that the software performs as intended. Test coverage reduces the time required for ongoing development (eg. updating or adapting a tool or a pipeline) by ensuring that the new changes are not affecting the existing functionality in unexpected ways. Writing tests enforces thinking about cases where the code might fail, thus improving the usability of the software. This process also helps improve the modularization of the code, because complex, convoluted code is much harder to test. However, thinking about tests for the first time, especially thinking about good tests for testing scientific software is not easy. Through this workshop we aim to help you get started with unit testing. If time allows, we also spend some time on how to automate tests via GitHub actions.

## Instructors
Katalin Ferenc, Ieva Rauluseviciute, Ladislav Hovan

## Live Troubleshooting Session
In case you need help with any of the installations, you are welcome to join the zoom session below.

```
Ladislav Hovan is inviting you to a scheduled Zoom meeting.
Topic: OBiWoW testing workshop troubleshooting session
Time: Dec 6, 2024 11:00 AM Amsterdam, Berlin, Rome, Stockholm, Vienna
Join Zoom Meeting
https://uio.zoom.us/j/63146705986?pwd=ihaKEHaH7iyzyJCoWJ5b7vMZy2onuc.1
Meeting ID: 631 4670 5986
Passcode: 975258
```

## Software Requirements
Python or R installed on your computer (or virtual machine / container of your choice as long as you can move and edit files comfortably in it). It is recommended to have conda too for creating an environment for this workshop, but if you solve the requirements (`environment.yaml` file specifies them) with any other dependency management way it is all fine by us.

Any type of operating system is welcome. We have experience with Linux, Mac, and Windows, and the choice should not have an effect on this workshop.

It is preferred that you have an IDE such as Rstudio, Visual Studio, PyCharm or similar. You can work with a notepad, vim, or nano if that's what you are most comfortable with. However, we would might try to convince you that a proper IDE is better than notepad.

To clone this repository:
```
git clone git@github.com:OBIWOW/OBiWoW-2024.git

cd OBiWoW-2024
```

To create and enter a conda environment:
```
conda env create --file environment.yaml -n obiwow2024

conda activate obiwow2024
```
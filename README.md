# Eclipse p2 Support for Bazel

Opinionated Rules for building Eclipse p2 repositories with Bazel

## First Things First

**Java 11+ Only** These rules cannot be used with previous Java versions.

**Eclipse p2** is for installing Eclipse Plug-ins and Features from a Software Site into Eclipse.
Thus, our primary goal is to allow building Eclipse Plug-ins and Features deployed as a Software Site.

**Eclipse PDE Encouraged** These rules will not change/replace how you develop Eclipse Plug-in and Features inside Eclipse.
Thus, you will continue to create Plug-in and Feature projects inside Eclipse and commit `.classpath` and `.project` files into SCM.
You will continue to self-host, i.e. run Eclipse application from within Eclipse.
You will continue to use `.target` definition files.


## Getting Started

* [Install Bazel](doc/Installing Bazel.md) if you haven't done yet
* Create `.bazelrc-local` with path to JDK 11


## Contribution Guide

This project uses both: **Maven** *and* **Bazel**.
Maven is used for best IDE experience.
Bazel is used for command line build and delivery.

Few things to keep in mind:
* The Bazel build files are source of truth for producing deliverables, i.e. don't bother adding Maven plug-ins to `pom.xml` files.
* Maven drives Eclipse M2E for development of this tool. Nothing more.
* Don't get too fancy with Bazel, though. It has to map to Maven for IDE classpath computation.
* We'll eventually switch from M2E to the Bazel plug-in once it's more usable.
* Lot's of Bazel stuff in this repo is heavily inspired from [Google's starup-os](https://github.com/google/startup-os) repo.


### Adding Dependencies

* Add them to `<dependencyManagement>` in the root `pom.xml` for version management and to the `pom.xml`where needed
* Use [`tools/deps/add_maven_deps.sh`](tools/deps/add_maven_deps.sh) to add it to `dependencies.yaml`


### Updating Dependencies

* Update `<dependencyManagement>` in the root `pom.xml` with new version
* Update `dependencies.yaml` with new version
* Run [`tools/deps/update_maven_deps.sh`](tools/deps/update_maven_deps.sh)

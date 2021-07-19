+++
title="Mark & run integration unit tests with SBT and Scala"
description="Yes, I mean integration unit tests"
date=2020-11-30

[taxonomies]
categories = ["Technical Stuff"]
tags = ["scala"]
+++


It is a good practice to write integration unit tests for your services and integrate them in your CI workflow. Such integration tests boosts the 
confidence of your application quality especially when it needs to be deployed in an environment where it has to talk to numerous other external services. 
In this regard, I wanted to write such integration tests for one of my scala project which uses SBT as a build tool.

I will just list down the steps that are needed to get this up and running!

First, in your build.sbt define the configuration and settings that can help sbt to differentiate between your integration unit tests and normal unit tests.

```scala
// Command to run integration tests, so here to run the integration tests we use -> sbt integration-test
addCommandAlias("integration-test", "Integration/testOnly -- -n integrationTest")

lazy val IntegrationTest = config("integration").extend(Test)

lazy val root = Project(base = file("."))
  .configs(IntegrationTest)
  .settings(
    IntegrationTest / parallelExecution := false, // We do not want Integration tests to execute parallely!
    Test / testOptions += Tests.Argument(TestFrameworks.ScalaTest, "-l", "integrationTest"), // Exclue the Inegration tests from the normal unit tests
    // Include integration tests, by nullifying the above option
    IntegrationTest / testOptions := Seq.empty,
  )
  .settings(
    // Enable integration tests
    inConfig(IntegrationTest)(Defaults.testTasks)
  )
```

We need to do a few more steps before we can get the whole thing up and running. We need to define an object that extends the Tag 
for your testing framework. So in my case I use scalatest and for me it would look like:

```scala
import org.scalatest.Tag
object IntegrationTest extends Tag("integrationTest")
```

After this, we can now start writing our test classes and tag them as IntegrationTest:

```scala
  test("integration testing with sbt", IntegrationTest) {
    Future {
      println("ALLES OKAY *************************************** ")
      assert(true)
    }
  }
```

Now you can run your integration tests separately for your project as below:

```scala
sbt integration-test
```
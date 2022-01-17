+++
title="Convert your pom xml to build sbt"
description="Move on from XML"
date=2022-01-15

[taxonomies]
categories = ["Technical Stuff"]
tags = ["scala"]
+++

Aren't you at your limits dealing with XML? If so why still bother using a build tool that still uses an outdated format like the XML? 
Why use Maven when you can be friends with sbt? Here is a small script that helps you to convert your pom.xml to a build.sbt.

```
#!/bin/sh
exec /opt/softwares/scala-2.12.2/bin/scala "$0" "$@"
!#

/***
scalaVersion := "2.12.2"

libraryDependencies ++= Seq(
  "org.scala-lang.modules" %% "scala-xml" % "2.0.0"
)
*/

import scala.xml._

val lines = (XML.load("pom.xml") \\ "dependencies") \ "dependency" map { dependency =>
  val groupId = (dependency \ "groupId").text
  val artifactId = (dependency \ "artifactId").text
  val version = (dependency \ "version").text
  val scope = (dependency \ "scope").text
  val classifier = (dependency \ "classifier").text
  val artifactValName: String = artifactId.replaceAll("[-\\.]", "_")

  val scope2 = scope match {
    case "" => ""
    case _ => s""" % "$scope""""
  }

  s"""  "$groupId" %  "$artifactId" % "$version"$scope2"""
}

val buildSbt = io.Source.fromURL("https://gist.githubusercontent.com/joesan/59d36606f0529af148000d54202eb370/raw/f854aa443686051637068667401d1e9a412ad192/build.sbt").mkString
val libText = "libraryDependencies ++= Seq("
val buildSbt2 = buildSbt.replace(libText, libText + lines.mkString("\n", ",\n", ""))
```

Save this file as convert.sh

Calling it is pretty simple!

```shell
./convert.sh > build.sbt
```

One thing that is worth mentioning that XML support for Scala was dropped with Scala versions 2.13 and up, so to be able to
run this script, you need to have Scala 2.12 installed. I have Scala 2.12.2 in my path, and you can see that in this line here:

```shell
exec /opt/softwares/scala-2.12.2/bin/scala "$0" "$@"
```

For now ignore the two parameters, ```"$0" "$@"``` as they are there if you need to pass parameters from outside. So there you
have it. Instant conversion of pom.xml to build.sbt.
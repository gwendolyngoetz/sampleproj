import sbt.internal.io.Source
import play.sbt.PlayImport.PlayKeys.playRunHooks
import com.typesafe.sbt.web.SbtWeb
import com.typesafe.sbt.web.Import.pipelineStages
import com.typesafe.sbt.web.Import._
import com.typesafe.sbt.gzip.Import.gzip
import com.typesafe.sbt.digest.Import.digest

lazy val root = (project in file("."))
  .enablePlugins(PlayJava, PlayEbean, SbtWeb)
  .settings(
    name := """zzz""",
    version := "0.0.1",
    crossScalaVersions := Seq("2.13.16", "3.3.3"),
    scalaVersion := crossScalaVersions.value.head,
    maintainer := "zzz",
    libraryDependencies ++= Seq(
      "io.swagger.core.v3" % "swagger-core" % "2.2.32"
    )
  )

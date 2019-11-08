load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")

scala_library(
    name = "services",
    srcs = glob(["Test.scala"]),
    visibility = ["//visibility:public"],
    plugins = ["@org_scalamacros_paradise_2_12_0//jar"],
    deps = [
        "//3rdparty/jvm/io/circe:circe_core",
        "//3rdparty/jvm/io/circe:circe_generic",
        "//3rdparty/jvm/io/circe:circe_parser",
        "//3rdparty/jvm/com/chuusai:shapeless",
        "//3rdparty/jvm/org/typelevel:cats_core"
    ],
)
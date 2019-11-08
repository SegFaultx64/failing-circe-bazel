load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
scala_import(
    name = "circe_core",
    exports = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        "//3rdparty/jvm/org/typelevel:cats_core",
        ":circe_numbers_2_12"
    ],
    jars = [
        "//external:jar/io/circe/circe_core_2_12"
    ],
    visibility = [
        "//visibility:public"
    ]
)



scala_import(
    name = "circe_generic",
    exports = [
        "//3rdparty/jvm/com/chuusai:shapeless",
        "//3rdparty/jvm/org/scala_lang:scala_library",
        "//3rdparty/jvm/org/typelevel:cats_core",
        ":circe_core"
    ],
    jars = [
        "//external:jar/io/circe/circe_generic_2_12"
    ],
    visibility = [
        "//visibility:public"
    ]
)



scala_import(
    name = "circe_jawn",
    exports = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        "//3rdparty/jvm/org/typelevel:jawn_parser_2_12",
        ":circe_core"
    ],
    jars = [
        "//external:jar/io/circe/circe_jawn_2_12"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



java_library(
    name = "circe_numbers_2_12",
    exports = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        "//external:jar/io/circe/circe_numbers_2_12"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



scala_import(
    name = "circe_parser",
    exports = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        ":circe_core",
        ":circe_jawn"
    ],
    jars = [
        "//external:jar/io/circe/circe_parser_2_12"
    ],
    visibility = [
        "//visibility:public"
    ]
)



load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
scala_import(
    name = "cats_core",
    exports = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        ":cats_kernel_2_11",
        ":cats_macros_2_11"
    ],
    jars = [
        "//external:jar/org/typelevel/cats_core_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "cats_kernel_2_11",
    exports = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        "//external:jar/org/typelevel/cats_kernel_2_11"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



java_library(
    name = "cats_macros_2_11",
    exports = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        "//external:jar/org/typelevel/cats_macros_2_11"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



java_library(
    name = "jawn_parser_2_11",
    exports = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        "//external:jar/org/typelevel/jawn_parser_2_11"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



java_library(
    name = "macro_compat_2_11",
    exports = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        "//external:jar/org/typelevel/macro_compat_2_11"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



# Do not edit. bazel-deps autogenerates this file from dependencies.yaml.
def _jar_artifact_impl(ctx):
    jar_name = "%s.jar" % ctx.name
    ctx.download(
        output=ctx.path("jar/%s" % jar_name),
        url=ctx.attr.urls,
        sha256=ctx.attr.sha256,
        executable=False
    )
    src_name="%s-sources.jar" % ctx.name
    srcjar_attr=""
    has_sources = len(ctx.attr.src_urls) != 0
    if has_sources:
        ctx.download(
            output=ctx.path("jar/%s" % src_name),
            url=ctx.attr.src_urls,
            sha256=ctx.attr.src_sha256,
            executable=False
        )
        srcjar_attr ='\n    srcjar = ":%s",' % src_name

    build_file_contents = """
package(default_visibility = ['//visibility:public'])
java_import(
    name = 'jar',
    tags = ['maven_coordinates={artifact}'],
    jars = ['{jar_name}'],{srcjar_attr}
)
filegroup(
    name = 'file',
    srcs = [
        '{jar_name}',
        '{src_name}'
    ],
    visibility = ['//visibility:public']
)\n""".format(artifact = ctx.attr.artifact, jar_name = jar_name, src_name = src_name, srcjar_attr = srcjar_attr)
    ctx.file(ctx.path("jar/BUILD"), build_file_contents, False)
    return None

jar_artifact = repository_rule(
    attrs = {
        "artifact": attr.string(mandatory = True),
        "sha256": attr.string(mandatory = True),
        "urls": attr.string_list(mandatory = True),
        "src_sha256": attr.string(mandatory = False, default=""),
        "src_urls": attr.string_list(mandatory = False, default=[]),
    },
    implementation = _jar_artifact_impl
)

def jar_artifact_callback(hash):
    src_urls = []
    src_sha256 = ""
    source=hash.get("source", None)
    if source != None:
        src_urls = [source["url"]]
        src_sha256 = source["sha256"]
    jar_artifact(
        artifact = hash["artifact"],
        name = hash["name"],
        urls = [hash["url"]],
        sha256 = hash["sha256"],
        src_urls = src_urls,
        src_sha256 = src_sha256
    )
    native.bind(name = hash["bind"], actual = hash["actual"])


def list_dependencies():
    return [
    {"artifact": "com.chuusai:shapeless_2.11:2.3.3", "lang": "scala", "sha1": "ea34d4b6128b9090386945dcb952816bd9e87ce2", "sha256": "d1ed83b05994d26e5e993efc86127a98a98ca09d45a995cfad4d6f161e2295c4", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/com/chuusai/shapeless_2.11/2.3.3/shapeless_2.11-2.3.3.jar", "source": {"sha1": "bd557edb3735e1bc8b0bc5fc3e7559252837a5e2", "sha256": "b36ee80cc64da6bffd86c29984bcb92b8e51dee9d180cfff683378caff1a2092", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/com/chuusai/shapeless_2.11/2.3.3/shapeless_2.11-2.3.3-sources.jar"} , "name": "com_chuusai_shapeless_2_11", "actual": "@com_chuusai_shapeless_2_11//jar:file", "bind": "jar/com/chuusai/shapeless_2_11"},
    {"artifact": "io.circe:circe-core_2.11:0.11.0", "lang": "scala", "sha1": "7e18bda825f4d80c6dd05a0539584295d288021d", "sha256": "bd4bf5704216534461215d54b92cb981f6583dca5a297216431830c8fcc8895a", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/io/circe/circe-core_2.11/0.11.0/circe-core_2.11-0.11.0.jar", "source": {"sha1": "c287d2ac1fceebd424d075c45cfff6fac4f1b7c7", "sha256": "c7bc6c8a23df93a7ce3534906aef6a246dad76aedba985aaff4e9c6f05eb37ae", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/io/circe/circe-core_2.11/0.11.0/circe-core_2.11-0.11.0-sources.jar"} , "name": "io_circe_circe_core_2_11", "actual": "@io_circe_circe_core_2_11//jar:file", "bind": "jar/io/circe/circe_core_2_11"},
    {"artifact": "io.circe:circe-generic_2.11:0.11.0", "lang": "scala", "sha1": "6ffb76aab409af155076cd52d49f7d562c303576", "sha256": "5a5d76069a5d1f8cb64ea1448d0a659024a7bea401cb07e4ae557249861b3f8b", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/io/circe/circe-generic_2.11/0.11.0/circe-generic_2.11-0.11.0.jar", "source": {"sha1": "5e7a39fb8c66e8b935577e4eef9127b7d76468f5", "sha256": "e0442ab99c620e4f37cd3d3900e7055abb5cfaabfa378b96ceb5e2d028e7995c", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/io/circe/circe-generic_2.11/0.11.0/circe-generic_2.11-0.11.0-sources.jar"} , "name": "io_circe_circe_generic_2_11", "actual": "@io_circe_circe_generic_2_11//jar:file", "bind": "jar/io/circe/circe_generic_2_11"},
    {"artifact": "io.circe:circe-jawn_2.11:0.11.0", "lang": "scala", "sha1": "b10f7a1cdc118c0d0456a55e8b0cb5c76014ecc1", "sha256": "c8f0cccf1fc198e1dc3c578080b2598b5c2ba91b2fce073f1c3440b503e13a1f", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/io/circe/circe-jawn_2.11/0.11.0/circe-jawn_2.11-0.11.0.jar", "source": {"sha1": "ad5eb8418519b2de3238c051c06451eac33a9e86", "sha256": "e1b4ac8dbd3279e8c4262f39539dd42705a8aa40f650851c850f6b3de7cfedc4", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/io/circe/circe-jawn_2.11/0.11.0/circe-jawn_2.11-0.11.0-sources.jar"} , "name": "io_circe_circe_jawn_2_11", "actual": "@io_circe_circe_jawn_2_11//jar:file", "bind": "jar/io/circe/circe_jawn_2_11"},
    {"artifact": "io.circe:circe-numbers_2.11:0.11.0", "lang": "java", "sha1": "db0352200c474fb60c81c9ece3c8b149a90b405a", "sha256": "623d4db2e23c2d15b7d2220344181adeb153c3c967b52ecf66d5b55b291fcc23", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/io/circe/circe-numbers_2.11/0.11.0/circe-numbers_2.11-0.11.0.jar", "source": {"sha1": "70a2f06edd34a6e509fc94733c3dee3d224d0b6d", "sha256": "24df8b49b57051279b8058766dcff5e114ce8da6431887e724c4262eaad51efa", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/io/circe/circe-numbers_2.11/0.11.0/circe-numbers_2.11-0.11.0-sources.jar"} , "name": "io_circe_circe_numbers_2_11", "actual": "@io_circe_circe_numbers_2_11//jar", "bind": "jar/io/circe/circe_numbers_2_11"},
    {"artifact": "io.circe:circe-parser_2.11:0.11.0", "lang": "scala", "sha1": "6ea770251d04903d15577f78f769a156b97ce36a", "sha256": "475dc58e7c9448d367049c5bae204f72eb152f1c9c1b18dd2eb5e1afb3cb8a80", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/io/circe/circe-parser_2.11/0.11.0/circe-parser_2.11-0.11.0.jar", "source": {"sha1": "d53cc150b16952285d046fb4f7ade3d22c85be2d", "sha256": "f31fc642f53313cebaa7ac843bd57a48ce244d2668bed5fdac4e5c22da65ab5f", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/io/circe/circe-parser_2.11/0.11.0/circe-parser_2.11-0.11.0-sources.jar"} , "name": "io_circe_circe_parser_2_11", "actual": "@io_circe_circe_parser_2_11//jar:file", "bind": "jar/io/circe/circe_parser_2_11"},
# duplicates in org.scala-lang:scala-library promoted to 2.11.12
# - com.chuusai:shapeless_2.11:2.3.3 wanted version 2.11.12
# - io.circe:circe-core_2.11:0.11.0 wanted version 2.11.12
# - io.circe:circe-generic_2.11:0.11.0 wanted version 2.11.12
# - io.circe:circe-jawn_2.11:0.11.0 wanted version 2.11.12
# - io.circe:circe-numbers_2.11:0.11.0 wanted version 2.11.12
# - io.circe:circe-parser_2.11:0.11.0 wanted version 2.11.12
# - org.typelevel:cats-core_2.11:2.0.0 wanted version 2.11.12
# - org.typelevel:cats-kernel_2.11:2.0.0 wanted version 2.11.12
# - org.typelevel:cats-macros_2.11:2.0.0 wanted version 2.11.12
# - org.typelevel:jawn-parser_2.11:0.14.0 wanted version 2.11.12
# - org.typelevel:macro-compat_2.11:1.1.1 wanted version 2.11.7
    {"artifact": "org.scala-lang:scala-library:2.11.12", "lang": "java", "sha1": "bf5534e6fec3d665bd6419c952a929a8bdd4b591", "sha256": "0b3d6fd42958ee98715ba2ec5fe221f4ca1e694d7c981b0ae0cd68e97baf6dce", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/scala-lang/scala-library/2.11.12/scala-library-2.11.12.jar", "source": {"sha1": "66a32abd59b3f9bb690bba2efc7d7ef680157bcd", "sha256": "a32ccfac851adeb094a31134af1034d0ba026512931433cba86d5dd12d91f1ff", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/scala-lang/scala-library/2.11.12/scala-library-2.11.12-sources.jar"} , "name": "org_scala_lang_scala_library", "actual": "@org_scala_lang_scala_library//jar", "bind": "jar/org/scala_lang/scala_library"},
    {"artifact": "org.typelevel:cats-core_2.11:2.0.0", "lang": "scala", "sha1": "332131f129cec93da9d7c27b2ac377c7a7b3a823", "sha256": "ce2ecbeee121ef1746fbf2cf23bc34dfac8fbdb0f9e616aa47ec815b9b117b11", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/typelevel/cats-core_2.11/2.0.0/cats-core_2.11-2.0.0.jar", "source": {"sha1": "8a4985d05e30b72ca3aa7f92db56551f29976445", "sha256": "24a288155dad26d223c66219fef86ada15c0e1ea506f9084f3b3505888781426", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/typelevel/cats-core_2.11/2.0.0/cats-core_2.11-2.0.0-sources.jar"} , "name": "org_typelevel_cats_core_2_11", "actual": "@org_typelevel_cats_core_2_11//jar:file", "bind": "jar/org/typelevel/cats_core_2_11"},
    {"artifact": "org.typelevel:cats-kernel_2.11:2.0.0", "lang": "java", "sha1": "97af347bee5d175c485d5f5b743d19d5c3a41e11", "sha256": "578f32499628ea2d80bce00ab2483d17657d0ef0eb6309801c548e7736b430f2", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/typelevel/cats-kernel_2.11/2.0.0/cats-kernel_2.11-2.0.0.jar", "source": {"sha1": "9102f7e966c7178774c3014b6f5f55f0fd47036a", "sha256": "7daf6e85e63ce41de0533f1e2e7e6dedaf71ef795740928c0f05d8c4ed67b975", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/typelevel/cats-kernel_2.11/2.0.0/cats-kernel_2.11-2.0.0-sources.jar"} , "name": "org_typelevel_cats_kernel_2_11", "actual": "@org_typelevel_cats_kernel_2_11//jar", "bind": "jar/org/typelevel/cats_kernel_2_11"},
    {"artifact": "org.typelevel:cats-macros_2.11:2.0.0", "lang": "java", "sha1": "1b7915597e3f728c1e8f541075666a7b51227bd4", "sha256": "4fbe50e24da0565193a65175e74160e8c4b3fe28682c94b92db949273ba7b81d", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/typelevel/cats-macros_2.11/2.0.0/cats-macros_2.11-2.0.0.jar", "source": {"sha1": "5dabdab9f8d57f747d42f936dab13302ecb1c974", "sha256": "4765e994e0b07bdb09cb6de413bc4ab2bcee12e14e4a888c76563c616b1149e1", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/typelevel/cats-macros_2.11/2.0.0/cats-macros_2.11-2.0.0-sources.jar"} , "name": "org_typelevel_cats_macros_2_11", "actual": "@org_typelevel_cats_macros_2_11//jar", "bind": "jar/org/typelevel/cats_macros_2_11"},
    {"artifact": "org.typelevel:jawn-parser_2.11:0.14.0", "lang": "java", "sha1": "749a94c28e7f15a6a82328d06752fbf7b0f0979e", "sha256": "44d84b8e9a83936121efd5e9cc718e7ae4fd4e1502bd4a36fd67abe486219460", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/typelevel/jawn-parser_2.11/0.14.0/jawn-parser_2.11-0.14.0.jar", "source": {"sha1": "67c13b8b2a258519d25e11280eb4ce40f6ab2428", "sha256": "79fcf2209f754ae638a3310baaa26c62a990534a3d25f35220ebb2d98a415736", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/typelevel/jawn-parser_2.11/0.14.0/jawn-parser_2.11-0.14.0-sources.jar"} , "name": "org_typelevel_jawn_parser_2_11", "actual": "@org_typelevel_jawn_parser_2_11//jar", "bind": "jar/org/typelevel/jawn_parser_2_11"},
    {"artifact": "org.typelevel:macro-compat_2.11:1.1.1", "lang": "java", "sha1": "0cb87cb74fd5fb118fede3f98075c2044616b35d", "sha256": "5200a80ad392f0b882021d6de2efb17b874cc179ff8539f9bcedabc100b7890b", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/typelevel/macro-compat_2.11/1.1.1/macro-compat_2.11-1.1.1.jar", "source": {"sha1": "363f86f631e1e95fc7989f73a0cea3ee18107cea", "sha256": "4e3438277b20cd64bce0ba31ffc7b8a74da914551c9dea46297508f879a6f220", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/typelevel/macro-compat_2.11/1.1.1/macro-compat_2.11-1.1.1-sources.jar"} , "name": "org_typelevel_macro_compat_2_11", "actual": "@org_typelevel_macro_compat_2_11//jar", "bind": "jar/org/typelevel/macro_compat_2_11"},
    ]

def maven_dependencies(callback = jar_artifact_callback):
    for hash in list_dependencies():
        callback(hash)

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
    {"artifact": "com.chuusai:shapeless_2.12:2.3.3", "lang": "scala", "sha1": "6041e2c4871650c556a9c6842e43c04ed462b11f", "sha256": "312e301432375132ab49592bd8d22b9cd42a338a6300c6157fb4eafd1e3d5033", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/com/chuusai/shapeless_2.12/2.3.3/shapeless_2.12-2.3.3.jar", "source": {"sha1": "02511271188a92962fcf31a9a217b8122f75453a", "sha256": "2d53fea1b1ab224a4a731d99245747a640deaa6ef3912c253666aa61287f3d63", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/com/chuusai/shapeless_2.12/2.3.3/shapeless_2.12-2.3.3-sources.jar"} , "name": "com_chuusai_shapeless_2_12", "actual": "@com_chuusai_shapeless_2_12//jar:file", "bind": "jar/com/chuusai/shapeless_2_12"},
    {"artifact": "io.circe:circe-core_2.12:0.12.3", "lang": "scala", "sha1": "30adafb5e4b68aac7d326107e00c8c4149e9806e", "sha256": "76d4f0f17612d3c35edf49d61ce00ba92348700985caa525787d21ff819be4e3", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/io/circe/circe-core_2.12/0.12.3/circe-core_2.12-0.12.3.jar", "source": {"sha1": "a6c8de14c40c1ba1f9cc7adc8e629194e2232508", "sha256": "509b3f559dc8cc6c8078ab38cdd76aa8d0bf5169bb0a23d5548636fa63c7929a", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/io/circe/circe-core_2.12/0.12.3/circe-core_2.12-0.12.3-sources.jar"} , "name": "io_circe_circe_core_2_12", "actual": "@io_circe_circe_core_2_12//jar:file", "bind": "jar/io/circe/circe_core_2_12"},
    {"artifact": "io.circe:circe-generic_2.12:0.12.3", "lang": "scala", "sha1": "b2ca9cb33a6dade0058bd817fed7da68f68e4982", "sha256": "fe6a3be8a9c5d90d3a1c53b31b579f30dffa97492a7e6b09c41806fa314b9b36", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/io/circe/circe-generic_2.12/0.12.3/circe-generic_2.12-0.12.3.jar", "source": {"sha1": "756d3f84019a7f8b48e29013c2cf2365d8398943", "sha256": "a0cb1774578bd3a6a519054860eb7456430d9023af33261d5683e7caf118cb48", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/io/circe/circe-generic_2.12/0.12.3/circe-generic_2.12-0.12.3-sources.jar"} , "name": "io_circe_circe_generic_2_12", "actual": "@io_circe_circe_generic_2_12//jar:file", "bind": "jar/io/circe/circe_generic_2_12"},
    {"artifact": "io.circe:circe-jawn_2.12:0.12.3", "lang": "scala", "sha1": "8cfd44053f9aba6f3c35f462fdc33fbc6c883f11", "sha256": "230426508fc55f5dfc63ccf29b05719a545d73d5ae79c96812e54b748877ff77", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/io/circe/circe-jawn_2.12/0.12.3/circe-jawn_2.12-0.12.3.jar", "source": {"sha1": "4b8214409d530124092b3a6d798b0357d3ba341f", "sha256": "df1c689c8e1cc8a2369ae4fc030a4e559603ec871bcc3d854a99a30eb093408e", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/io/circe/circe-jawn_2.12/0.12.3/circe-jawn_2.12-0.12.3-sources.jar"} , "name": "io_circe_circe_jawn_2_12", "actual": "@io_circe_circe_jawn_2_12//jar:file", "bind": "jar/io/circe/circe_jawn_2_12"},
    {"artifact": "io.circe:circe-numbers_2.12:0.12.3", "lang": "java", "sha1": "49983243e497138378dc24642e461013d6a545d6", "sha256": "1623d8235150de91054461d8b5390dd32ab8dc133f3005ed06179599423d6576", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/io/circe/circe-numbers_2.12/0.12.3/circe-numbers_2.12-0.12.3.jar", "source": {"sha1": "b14407190ba24de9bc1f9077a5a6844799d0a4ac", "sha256": "11e59be9c076c02ba3fb1b439abfbdda6cb5871e749fddfe3437b94f72afe0ef", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/io/circe/circe-numbers_2.12/0.12.3/circe-numbers_2.12-0.12.3-sources.jar"} , "name": "io_circe_circe_numbers_2_12", "actual": "@io_circe_circe_numbers_2_12//jar", "bind": "jar/io/circe/circe_numbers_2_12"},
    {"artifact": "io.circe:circe-parser_2.12:0.12.3", "lang": "scala", "sha1": "1ca756f9fcc261e89823a85ea4476b8d414c85ce", "sha256": "c6b25097bb54710df9411835798ca40ce8f52e14a4c2630b930a119045bbc930", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/io/circe/circe-parser_2.12/0.12.3/circe-parser_2.12-0.12.3.jar", "source": {"sha1": "96f8d44bcafe4b45a12baf813bd4d31387ab0b90", "sha256": "ec6065753332e81790806839d3dd8d22a61fdc08ea5edef741011e4ec179a32d", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/io/circe/circe-parser_2.12/0.12.3/circe-parser_2.12-0.12.3-sources.jar"} , "name": "io_circe_circe_parser_2_12", "actual": "@io_circe_circe_parser_2_12//jar:file", "bind": "jar/io/circe/circe_parser_2_12"},
# duplicates in org.scala-lang:scala-library promoted to 2.12.10
# - com.chuusai:shapeless_2.12:2.3.3 wanted version 2.12.4
# - io.circe:circe-core_2.12:0.12.3 wanted version 2.12.10
# - io.circe:circe-generic_2.12:0.12.3 wanted version 2.12.10
# - io.circe:circe-jawn_2.12:0.12.3 wanted version 2.12.10
# - io.circe:circe-numbers_2.12:0.12.3 wanted version 2.12.10
# - io.circe:circe-parser_2.12:0.12.3 wanted version 2.12.10
# - org.typelevel:cats-core_2.12:2.0.0 wanted version 2.12.9
# - org.typelevel:cats-kernel_2.12:2.0.0 wanted version 2.12.9
# - org.typelevel:cats-macros_2.12:2.0.0 wanted version 2.12.9
# - org.typelevel:jawn-parser_2.12:0.14.2 wanted version 2.12.8
# - org.typelevel:macro-compat_2.12:1.1.1 wanted version 2.12.0
    {"artifact": "org.scala-lang:scala-library:2.12.10", "lang": "java", "sha1": "3509860bc2e5b3da001ed45aca94ffbe5694dbda", "sha256": "0a57044d10895f8d3dd66ad4286891f607169d948845ac51e17b4c1cf0ab569d", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/scala-lang/scala-library/2.12.10/scala-library-2.12.10.jar", "source": {"sha1": "686bb459f3026f14165373324d943a4cac6959c2", "sha256": "a6f873aeb9b861848e0d0b4ec368a3f1682e33bdf11a82ce26f0bfe5fb197647", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/scala-lang/scala-library/2.12.10/scala-library-2.12.10-sources.jar"} , "name": "org_scala_lang_scala_library", "actual": "@org_scala_lang_scala_library//jar", "bind": "jar/org/scala_lang/scala_library"},
    {"artifact": "org.typelevel:cats-core_2.12:2.0.0", "lang": "scala", "sha1": "b15de4ed2b0f31b118acab7d12cab4962df2130c", "sha256": "65d828985463e6f14761a6451b419044b9f06507f292ac7ebc04133912b01339", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/typelevel/cats-core_2.12/2.0.0/cats-core_2.12-2.0.0.jar", "source": {"sha1": "b5f015d7c5908c4b68d01927f38a49e1906060e7", "sha256": "e6c7b838d4734acba23df9bf3e633300cbe998bcf724c8fcb2a5f1e866585505", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/typelevel/cats-core_2.12/2.0.0/cats-core_2.12-2.0.0-sources.jar"} , "name": "org_typelevel_cats_core_2_12", "actual": "@org_typelevel_cats_core_2_12//jar:file", "bind": "jar/org/typelevel/cats_core_2_12"},
    {"artifact": "org.typelevel:cats-kernel_2.12:2.0.0", "lang": "java", "sha1": "c570a566ca5ed9def6f73adc2308d9d3260f49d5", "sha256": "e9d8fa3381b3d8e66261437227f9c926a5a4109c4448f6c4bb98f9575e9c38c5", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/typelevel/cats-kernel_2.12/2.0.0/cats-kernel_2.12-2.0.0.jar", "source": {"sha1": "f9c9abdbad4849b79a80c01ac653493e776a1b57", "sha256": "7ba77aea45ba5685cf9ada6437ef56fe726af09ccd8f3f48ecb842479d1c2eee", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/typelevel/cats-kernel_2.12/2.0.0/cats-kernel_2.12-2.0.0-sources.jar"} , "name": "org_typelevel_cats_kernel_2_12", "actual": "@org_typelevel_cats_kernel_2_12//jar", "bind": "jar/org/typelevel/cats_kernel_2_12"},
    {"artifact": "org.typelevel:cats-macros_2.12:2.0.0", "lang": "java", "sha1": "5b86236c7f39ae44a5b26b552283fe678aaff449", "sha256": "f730fcd0d679e7e13a56a2b5777f53204456a934d90ffc3be4d6bb10ce19919a", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/typelevel/cats-macros_2.12/2.0.0/cats-macros_2.12-2.0.0.jar", "source": {"sha1": "aaded5d8dc45e1ae9fd2f41045dacb60df5ff9cc", "sha256": "ef8a1aeb76e02f62f3b546ff74734da3991d304552bbcef1715f34dd02160049", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/typelevel/cats-macros_2.12/2.0.0/cats-macros_2.12-2.0.0-sources.jar"} , "name": "org_typelevel_cats_macros_2_12", "actual": "@org_typelevel_cats_macros_2_12//jar", "bind": "jar/org/typelevel/cats_macros_2_12"},
    {"artifact": "org.typelevel:jawn-parser_2.12:0.14.2", "lang": "java", "sha1": "47c7bbb52a7b5c6b652c9ca8fcd60dc5e3583c2c", "sha256": "0b95b9089ec3bb42384abff52e0e3087a05710a69b50d708e106ab280684a270", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/typelevel/jawn-parser_2.12/0.14.2/jawn-parser_2.12-0.14.2.jar", "source": {"sha1": "5bcc7d5b81693ab5244834d7fa98f28eba383466", "sha256": "fe6e9bdb096fa8a1eddc80b9ea9619b25f17f7fd34d395cc2b675c4e97e18959", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/typelevel/jawn-parser_2.12/0.14.2/jawn-parser_2.12-0.14.2-sources.jar"} , "name": "org_typelevel_jawn_parser_2_12", "actual": "@org_typelevel_jawn_parser_2_12//jar", "bind": "jar/org/typelevel/jawn_parser_2_12"},
    {"artifact": "org.typelevel:macro-compat_2.12:1.1.1", "lang": "java", "sha1": "ed809d26ef4237d7c079ae6cf7ebd0dfa7986adf", "sha256": "8b1514ec99ac9c7eded284367b6c9f8f17a097198a44e6f24488706d66bbd2b8", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/typelevel/macro-compat_2.12/1.1.1/macro-compat_2.12-1.1.1.jar", "source": {"sha1": "ade6d6ec81975cf514b0f9e2061614f2799cfe97", "sha256": "c748cbcda2e8828dd25e788617a4c559abf92960ef0f92f9f5d3ea67774c34c8", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/typelevel/macro-compat_2.12/1.1.1/macro-compat_2.12-1.1.1-sources.jar"} , "name": "org_typelevel_macro_compat_2_12", "actual": "@org_typelevel_macro_compat_2_12//jar", "bind": "jar/org/typelevel/macro_compat_2_12"},
    ]

def maven_dependencies(callback = jar_artifact_callback):
    for hash in list_dependencies():
        callback(hash)

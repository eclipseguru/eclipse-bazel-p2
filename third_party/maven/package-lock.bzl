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
    jars = ['{jar_name}'],{srcjar_attr}
)
filegroup(
    name = 'file',
    srcs = [
        '{jar_name}',
        '{src_name}'
    ],
    visibility = ['//visibility:public']
)\n""".format(jar_name = jar_name, src_name = src_name, srcjar_attr = srcjar_attr)
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
    {"artifact": "info.picocli:picocli:3.8.2", "lang": "java", "sha1": "ad74665a1b8d10b45e7c4bfa6c709dc3b3d9ca78", "sha256": "b16786a3817530151ccc44ac44f1f803b9a1b4069e98c4d1ed2fc0ece12d6de7", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/info/picocli/picocli/3.8.2/picocli-3.8.2.jar", "source": {"sha1": "4b7761f5b0daa928567b58eab20878e81692df6e", "sha256": "a696690aae52e716152384c38483e93cc2a8e1156323d8f5389f87ae4c08c499", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/info/picocli/picocli/3.8.2/picocli-3.8.2-sources.jar"} , "name": "mvninfo_picocli_picocli", "actual": "@mvninfo_picocli_picocli//jar", "bind": "jar/mvninfo/picocli/picocli"},
    {"artifact": "org.apiguardian:apiguardian-api:1.0.0", "lang": "java", "sha1": "3ef5276905e36f4d8055fe3cb0bdcc7503ffc85d", "sha256": "1f58b77470d8d147a0538d515347dd322f49a83b9e884b8970051160464b65b3", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/apiguardian/apiguardian-api/1.0.0/apiguardian-api-1.0.0.jar", "source": {"sha1": "777508fa9f3e03cafb3c1fb2eba3dca317f4b1ee", "sha256": "793b50c98fa62e6eec08cc8fa4364b95d4815c1b17ef17e5e9e59c457e54ce2e", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/apiguardian/apiguardian-api/1.0.0/apiguardian-api-1.0.0-sources.jar"} , "name": "mvnorg_apiguardian_apiguardian_api", "actual": "@mvnorg_apiguardian_apiguardian_api//jar", "bind": "jar/mvnorg/apiguardian/apiguardian_api"},
    {"artifact": "org.junit.jupiter:junit-jupiter-api:5.3.2", "lang": "java", "sha1": "3602b523ffae9dabc04c329d73ab39ab04b3cbe2", "sha256": "9ad35f4c03643de45514a6c38684f060495b4fd54e904759bb4851779a0bf003", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/junit/jupiter/junit-jupiter-api/5.3.2/junit-jupiter-api-5.3.2.jar", "source": {"sha1": "77c667ed802af6253c68910b6cadfd973f3c6d0b", "sha256": "357877f288532cf15a2d555c6e996c05d964a1fb70df4eb21ce2ab2e970839d9", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/junit/jupiter/junit-jupiter-api/5.3.2/junit-jupiter-api-5.3.2-sources.jar"} , "name": "mvnorg_junit_jupiter_junit_jupiter_api", "actual": "@mvnorg_junit_jupiter_junit_jupiter_api//jar", "bind": "jar/mvnorg/junit/jupiter/junit_jupiter_api"},
    {"artifact": "org.junit.jupiter:junit-jupiter-engine:5.3.2", "lang": "java", "sha1": "69350316a14c46d8f6c4c909e469ec9edf58c4f8", "sha256": "458a215e34f4ccc5dcf13ba5529835e4bc6f1650c9ec934a344ecd6ee300d34a", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/junit/jupiter/junit-jupiter-engine/5.3.2/junit-jupiter-engine-5.3.2.jar", "source": {"sha1": "3d1af92523b01820ee1f99fad188ae361172d089", "sha256": "b076dc4069456efbf04e9dc37bb29610745c7e20ca995c7f31eba9e92fb64de9", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/junit/jupiter/junit-jupiter-engine/5.3.2/junit-jupiter-engine-5.3.2-sources.jar"} , "name": "mvnorg_junit_jupiter_junit_jupiter_engine", "actual": "@mvnorg_junit_jupiter_junit_jupiter_engine//jar", "bind": "jar/mvnorg/junit/jupiter/junit_jupiter_engine"},
    {"artifact": "org.junit.platform:junit-platform-commons:1.3.2", "lang": "java", "sha1": "378d1d1b162426ad031522f6d51e3bf28d1631a4", "sha256": "34e2a20df030c377741f8dcdb2e94c82d3af3d554ac3d5e6c8053a320b4ae51a", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/junit/platform/junit-platform-commons/1.3.2/junit-platform-commons-1.3.2.jar", "source": {"sha1": "58f3a24c0f76eda58df496649e27e242f0bc6b41", "sha256": "736ac52545d849319d69ea066e2ca09410230e3ddf94a37dc8ffa870b4c8fbd0", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/junit/platform/junit-platform-commons/1.3.2/junit-platform-commons-1.3.2-sources.jar"} , "name": "mvnorg_junit_platform_junit_platform_commons", "actual": "@mvnorg_junit_platform_junit_platform_commons//jar", "bind": "jar/mvnorg/junit/platform/junit_platform_commons"},
    {"artifact": "org.junit.platform:junit-platform-engine:1.3.2", "lang": "java", "sha1": "0c54bc1d4654bd1ef15fccf512ce664184085969", "sha256": "0d7575d6f7a589c19ddad90d44325f24ee6f2254765f728bc9cbb9428a294e85", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/junit/platform/junit-platform-engine/1.3.2/junit-platform-engine-1.3.2.jar", "source": {"sha1": "ede8c4de1464c7c7c6aa4da5def7d5b614f25737", "sha256": "b8e90692714987b429dfe5a637302394095daca88fec6d76a81c4156e045baa6", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/junit/platform/junit-platform-engine/1.3.2/junit-platform-engine-1.3.2-sources.jar"} , "name": "mvnorg_junit_platform_junit_platform_engine", "actual": "@mvnorg_junit_platform_junit_platform_engine//jar", "bind": "jar/mvnorg/junit/platform/junit_platform_engine"},
    {"artifact": "org.opentest4j:opentest4j:1.1.1", "lang": "java", "sha1": "efd9f971e91074491ea55b19f67b13470cf4fcdd", "sha256": "f106351abd941110226745ed103c85863b3f04e9fa82ddea1084639ae0c5336c", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/opentest4j/opentest4j/1.1.1/opentest4j-1.1.1.jar", "source": {"sha1": "88a3a2cb15c413565462cea99f201b67bc6d2f10", "sha256": "4808ddcb3a88de1210bef0a9c49645a36a61edeac65545f1560a6ad8081e8dd4", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/opentest4j/opentest4j/1.1.1/opentest4j-1.1.1-sources.jar"} , "name": "mvnorg_opentest4j_opentest4j", "actual": "@mvnorg_opentest4j_opentest4j//jar", "bind": "jar/mvnorg/opentest4j/opentest4j"},
    {"artifact": "org.slf4j:slf4j-api:1.7.25", "lang": "java", "sha1": "da76ca59f6a57ee3102f8f9bd9cee742973efa8a", "sha256": "18c4a0095d5c1da6b817592e767bb23d29dd2f560ad74df75ff3961dbde25b79", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/slf4j/slf4j-api/1.7.25/slf4j-api-1.7.25.jar", "source": {"sha1": "962153db4a9ea71b79d047dfd1b2a0d80d8f4739", "sha256": "c4bc93180a4f0aceec3b057a2514abe04a79f06c174bbed910a2afb227b79366", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/slf4j/slf4j-api/1.7.25/slf4j-api-1.7.25-sources.jar"} , "name": "mvnorg_slf4j_slf4j_api", "actual": "@mvnorg_slf4j_slf4j_api//jar", "bind": "jar/mvnorg/slf4j/slf4j_api"},
    {"artifact": "org.slf4j:slf4j-simple:1.7.25", "lang": "java", "sha1": "8dacf9514f0c707cbbcdd6fd699e8940d42fb54e", "sha256": "0966e86fffa5be52d3d9e7b89dd674d98a03eed0a454fbaf7c1bd9493bd9d874", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/slf4j/slf4j-simple/1.7.25/slf4j-simple-1.7.25.jar", "source": {"sha1": "af3cd3ad1ea4b08b27b54f12529b4bf343bc5ca1", "sha256": "2cfa254e77c6f41bdcd8500c61c0f6b9959de66835d2b598102d38c2a807f367", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/slf4j/slf4j-simple/1.7.25/slf4j-simple-1.7.25-sources.jar"} , "name": "mvnorg_slf4j_slf4j_simple", "actual": "@mvnorg_slf4j_slf4j_simple//jar", "bind": "jar/mvnorg/slf4j/slf4j_simple"},
    {"artifact": "org.snakeyaml:snakeyaml-engine:1.0", "lang": "java", "sha1": "1424f44ea0d33fcefed140c7c772320cc4a9c97d", "sha256": "2d35f680445c3305ad63c0eab965e5a9636e8e9b94315779cea5e7a325be9fec", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/snakeyaml/snakeyaml-engine/1.0/snakeyaml-engine-1.0.jar", "source": {"sha1": "e18dbd7dd020e6369beedfef995c23e39ba66ea6", "sha256": "4030d885ac2218943f42c3f0e91aacb62144442b04a73a37a2c3a119235eb8cd", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/snakeyaml/snakeyaml-engine/1.0/snakeyaml-engine-1.0-sources.jar"} , "name": "mvnorg_snakeyaml_snakeyaml_engine", "actual": "@mvnorg_snakeyaml_snakeyaml_engine//jar", "bind": "jar/mvnorg/snakeyaml/snakeyaml_engine"},
    ]

def maven_dependencies(callback = jar_artifact_callback):
    for hash in list_dependencies():
        callback(hash)

package(default_visibility = ["//visibility:__pkg__"])

java_library(
    name = "cli_jar",
    srcs = glob(["src/main/java/**/*.java"]),
    resources = glob(["src/main/resources/**"]),
    deps = [
    	"//third_party/maven/info/picocli:picocli",
    	"//third_party/maven/org/slf4j:slf4j_api",
    	"//third_party/maven/org/snakeyaml:snakeyaml_engine"
    ],
    visibility = ["//visibility:public"],
    runtime_deps = [
    	"//third_party/maven/org/slf4j:slf4j_simple"
    ]
)

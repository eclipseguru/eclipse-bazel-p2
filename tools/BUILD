package(default_visibility = ["//visibility:private"])

java_binary(
    name = "bazel_deps",
    main_class = "com.github.johnynek.bazel_deps.ParseProject",
    tags = ["checkstyle_ignore"],
    visibility = ["//visibility:public"],
    runtime_deps = ["@bazel_deps//jar"],
)
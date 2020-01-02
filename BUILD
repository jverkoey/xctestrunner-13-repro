load("@build_bazel_rules_apple//apple:ios.bzl", "ios_unit_test_suite", "ios_ui_test_suite")
load("@build_bazel_rules_apple//apple/testing/default_runner:ios_test_runner.bzl", "ios_test_runner")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

licenses(["notice"])  # Apache 2.0

exports_files(["LICENSE"])

objc_library(
    name = "Library",
    srcs = glob([
        "src/*.m",
    ]),
    hdrs = glob([
        "src/*.h",
    ]),
    sdk_frameworks = [
        "Foundation",
    ],
    enable_modules = 1,
    module_name = "Library",
    visibility = ["//visibility:public"],
)

swift_library(
    name = "UnitTestsSwiftLib",
    srcs = glob([
        "tests/unit/*.swift",
    ]),
    deps = [":Library"],
)

swift_library(
    name = "UITestsSwiftLib",
    srcs = glob([
        "tests/ui/*.swift",
    ]),
    deps = [":Library"],
)

ios_test_runner(
    name = "IPHONE_7_PLUS_IN_10_3",
    device_type = "iPhone 7 Plus",
    os_version = "10.3",
)

ios_test_runner(
    name = "IPHONE_X_IN_11_4",
    device_type = "iPhone X",
    os_version = "11.4",
)

ios_test_runner(
    name = "IPHONE_XS_MAX_IN_12_2",
    device_type = "iPhone Xs Max",
    os_version = "12.2",
)

ios_unit_test_suite(
    name = "UnitTests",
    deps = [
      ":UnitTestsSwiftLib"
    ],
    minimum_os_version = "10.0",
    timeout = "moderate",
    runners = [
        ":IPHONE_7_PLUS_IN_10_3",
        ":IPHONE_X_IN_11_4",
        ":IPHONE_XS_MAX_IN_12_2",
    ],
)

ios_ui_test_suite(
    name = "UITests",
    deps = [
      ":UITestsSwiftLib"
    ],
    test_host = "@bazel_test_host_apple//test_host",
    minimum_os_version = "10.0",
    timeout = "moderate",
    runners = [
        ":IPHONE_7_PLUS_IN_10_3",
        ":IPHONE_X_IN_11_4",
        ":IPHONE_XS_MAX_IN_12_2",
    ],
)

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")

git_repository(
    name = "build_bazel_rules_apple",
    remote = "https://github.com/bazelbuild/rules_apple.git",
    commit = "96212456d3cd7be9760fe28c077673bb85d46500",  # Dec 18, 2019
    shallow_since = "1576719323 -0800",  # Recommended by bazel.
)

git_repository(
    name = "build_bazel_rules_swift",
    remote = "https://github.com/bazelbuild/rules_swift.git",
    commit = "d7757c5ee9724df9454edefa3b4455a401a2ae22",  # Dec 19, 2019
    shallow_since = "1576775454 -0800",  # Recommended by bazel.
)

git_repository(
    name = "build_bazel_apple_support",
    remote = "https://github.com/bazelbuild/apple_support.git",
    commit = "9605c3da1c5bcdddc20d1704b52415a6f3a5f422",  # Oct 11, 2019
    shallow_since = "1570831694 -0700",  # Recommended by bazel.
)

git_repository(
    name = "bazel_test_host_apple",
    remote = "https://github.com/jverkoey/bazel-test-host-apple.git",
    commit = "e8b4b9a5f07d04ba551aaf6752c1cfdf1335275d",
    shallow_since = "1577652257 -0500",  # Recommended by bazel.
)
        
# This override of the zlib package resolves the following error:
# "no such package '@zlib//': The repository '@zlib' could not be resolved"
# Additional context available at: https://github.com/bazelbuild/bazel/issues/10270
http_archive(
    name = "zlib",
    build_file = "@com_google_protobuf//:third_party/zlib.BUILD",
    sha256 = "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
    strip_prefix = "zlib-1.2.11",
    urls = [
        "https://mirror.bazel.build/zlib.net/zlib-1.2.11.tar.gz",
        "https://zlib.net/zlib-1.2.11.tar.gz",
    ],
)

# This override resolves the following error:
# "error loading package '@com_google_protobuf//': Unable to find package for @rules_python//python:defs.bzl: The repository '@rules_python' could not be resolved"
http_archive(
    name = "rules_python",
    sha256 = "c911dc70f62f507f3a361cbc21d6e0d502b91254382255309bc60b7a0f48de28",
    strip_prefix = "rules_python-38f86fb55b698c51e8510c807489c9f4e047480e",
    urls = ["https://github.com/bazelbuild/rules_python/archive/38f86fb55b698c51e8510c807489c9f4e047480e.tar.gz"],
)

###############################################
# Broken version google/xctestrunner @ 0.2.10

# http_file(
#     name = "xctestrunner",
#     executable = 1,
#     urls = ["https://github.com/google/xctestrunner/releases/download/0.2.10/ios_test_runner.par"],
#     sha256 = "9e46d5782a9dc7d40bc93c99377c091886c180b8c4ffb9f79a19a58e234cdb09",
# )

# Running
#
#     bazel test //...
#
# Results in the following errors:
#
# //:UnitTests_IPHONE_XS_MAX_IN_12_2                                       PASSED in 18.0s
# //:UnitTests_IPHONE_7_PLUS_IN_10_3                                       FAILED in 15.4s
#   /private/var/tmp/_bazel_featherless/3e6b3235ff551ee3a076684846d17d42/execroot/__main__/bazel-out/darwin-fastbuild/testlogs/UnitTests_IPHONE_7_PLUS_IN_10_3/test.log
# //:UnitTests_IPHONE_X_IN_11_4                                            FAILED in 16.5s
#   /private/var/tmp/_bazel_featherless/3e6b3235ff551ee3a076684846d17d42/execroot/__main__/bazel-out/darwin-fastbuild/testlogs/UnitTests_IPHONE_X_IN_11_4/test.log

# Executing tests from //:UnitTests_IPHONE_7_PLUS_IN_10_3
# -----------------------------------------------------------------------------
# 2019-12-30 15:26:44,866 Will consider the test as test type logic_test to run.
# 2019-12-30 15:26:51,569 Failed to import biplist module. Will use tool /usr/libexec/PlistBuddy to handle the binary format plist.
# 2019-12-30 15:26:51,574 Failed to import biplist module. Will use tool /usr/libexec/PlistBuddy to handle the binary format plist.
# 2019-12-30 15:26:51,578 Failed to import biplist module. Will use tool /usr/libexec/PlistBuddy to handle the binary format plist.
# 2019-12-30 15:26:51,582 Failed to import biplist module. Will use tool /usr/libexec/PlistBuddy to handle the binary format plist.
# 2019-12-30 15:26:51,595 Failed to import biplist module. Will use tool /usr/libexec/PlistBuddy to handle the binary format plist.
# 2019-12-30 15:26:51,614 Creating a new simulator:
# Name: New-iPhone 7 Plus-10.3
# OS: iOS 10.3
# Type: iPhone 7 Plus
# 2019-12-30 15:26:55,099 Created new simulator 5E47303C-01D8-4CE5-BB1F-2DB29EDB0594.
# 2019-12-30 10:26:59.773 xctest[27261:3328048] The bundle “UnitTests” couldn’t be loaded because it is damaged or missing necessary resources. Try reinstalling the bundle.
# 2019-12-30 10:26:59.775 xctest[27261:3328048] (dlopen_preflight(/var/folders/nf/gl8gqkdd6fg98rjd9rgzkt70002gv0/T/test_runner_work_dir.hdY99T/UnitTests/UnitTests.xctest/UnitTests): Library not loaded: @rpath/libswiftCoreGraphics.dylib
#   Referenced from: /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/lib/libXCTestSwiftSupport.dylib
#   Reason: no suitable image found.  Did find:
# 	/usr/lib/swift/libswiftCoreGraphics.dylib: mach-o, but not built for iOS simulator
# 	/usr/lib/swift/libswiftCoreGraphics.dylib: mach-o, but not built for iOS simulator)
# 2019-12-30 15:26:59,783 Deleting simulator 5E47303C-01D8-4CE5-BB1F-2DB29EDB0594 asynchronously.
# 2019-12-30 15:26:59,787 Done.

###############################################
# Working version jverkoey/xctestrunner @ 0.2.11

http_file(
    name = "xctestrunner",
    executable = 1,
    urls = ["https://github.com/jverkoey/xctestrunner/releases/download/0.2.11/ios_test_runner.par"],
    sha256 = "a0a8be06b14f787f6017474b1ed33068c616b5b1154cf16e2e7ac3e7f047fd8c",
)

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

apple_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()

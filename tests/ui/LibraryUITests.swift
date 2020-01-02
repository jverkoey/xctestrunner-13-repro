import XCTest
import Library

class LibraryUITests: XCTestCase {

    func testBasicChoices() {

      // SomeFunction([])
      // ^ Uncomment this to "fix" the linker error. The "fix" results from the following load
      // command being added to the UnitTests binary:
      //     Load command 17
      //               cmd LC_LOAD_DYLIB
      //           cmdsize 56
      //              name @rpath/libswiftFoundation.dylib (offset 24)
      //        time stamp 2 Wed Dec 31 19:00:02 1969
      //           current version 0.0.0
      //     compatibility version 1.0.0

      XCTAssertTrue(true)
    }
}

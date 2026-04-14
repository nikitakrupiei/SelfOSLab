import Testing
@testable import SelfOSLab_Dev

struct SelfOSTests {

    @Test func example() async throws {
        let result = 2 + 3
                
        #expect(result == 5)
    }
}

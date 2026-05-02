@testable import SelfOSLab
import Testing

struct SelfOSTests {
    @Test func example() {
        let result = 2 + 3

        #expect(result == 5)
    }

    @Test func successExample() {
        let result = 3 + 3

        #expect(result == 6)
    }

    @Test func failExample() {
        let result = 3 + 3

        #expect(result == 6)
    }
}

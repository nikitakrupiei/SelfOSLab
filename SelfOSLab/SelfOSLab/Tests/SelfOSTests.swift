import Testing
@testable import SelfOSLab

struct SelfOSTests {

    @Test func example() async throws {
        let result = 2 + 3
                
        #expect(result == 5)
    }
    
    @Test func successExample() async throws {
        let result = 3 + 3
                
        #expect(result == 6)
    }
    
    @Test func failExample() async throws {
        let result = 3 + 3
                
        #expect(result == 6)
    }
}

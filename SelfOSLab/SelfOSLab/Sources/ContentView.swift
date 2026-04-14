import SwiftUI
import Platform

public struct ContentView: View {
    public init() {}

    public var body: some View {
        Text(someString)
            .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



public struct Responder:Sendable {
    public init() {}
    public func verboseEcho(_ input:String) {
        print("you said - \"\(input)\"")
    }
    public func luckyNumberMessage(for n:Int) {
        print("Lucky Number of the Day: \(n)")
    }
}


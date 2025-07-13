import MyFancyResponseHandler

@main
struct Hello {
    static let responder = Responder()
    static func main() async throws {
        let arguments = CommandLine.arguments
        print("you just ran \(arguments[0]) with the following arguments: \(arguments.dropFirst())")
        print("anything else you'd like to say?")
        if let toEcho = readLine() {
            responder.verboseEcho(toEcho)
            responder.luckyNumberMessage(for: (add(3, Int.random(in: (0...toEcho.count)))))
        } else {
            print("okay, maybe next time")
        }
        
        print("that's all")
    }
}
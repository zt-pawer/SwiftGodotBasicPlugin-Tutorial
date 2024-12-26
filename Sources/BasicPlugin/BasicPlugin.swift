// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftGodot

@Godot
class BasicPlugin: Node {

    @Signal var signalSimple: SimpleSignal
    @Signal var signalArgument: SignalWithArguments<String>

    @Callable
    func callmeString() -> String {
        "Hello World!"
    }

    @Callable
    func callmeStringParam(input: String) -> String {
        "Hello World \(input)"
    }

    @Callable
    func callmeSignalSimple() {
        signalSimple.emit()
    }

    @Callable
    func callmeSignalArgument() {
        signalArgument.emit("Hello Signal")
    }

    @Callable
    func callmeSignalParamArgument(input: String) {
        signalArgument.emit("Hello Signal \(input)")
    }
}

#initSwiftExtension(cdecl: "basic_plugin", types: [BasicPlugin.self])

import Foundation
import Combine

final class Points: ObservableObject {
    static let shared = Points()

    @Published private(set) var value: Int = 0

    private init() {}

    func add(_ amount: Int) {
        guard amount != 0 else { return }
        value += amount
    }

    func set(_ newValue: Int) {
        value = newValue
    }

    func reset() {
        value = 0
    }
}

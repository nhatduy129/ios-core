import Foundation

class A {
    private let threadSafeCountQueue = DispatchQueue(label: "...", attributes: .concurrent)
    private var _count = 0
    public var count: Int {
        get {
            return threadSafeCountQueue.sync {
                return _count
            }
        } set {
            threadSafeCountQueue.async(flags: .barrier) { [unowned self] in
                self._count = newValue
            }
        }
    }
}

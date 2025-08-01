import Foundation
import xxHashLib

extension Data {
    public func xxh128() -> XXH128 {
        XXH128(self)
    }
}

public struct XXH128: Hashable, Sendable {
    public var low: UInt64
    public var high: UInt64

    init(low: UInt64, high: UInt64) {
        self.low = low
        self.high = high
    }

    public init(_ data: Data) {
        let hash = data.withUnsafeBytes { buffer in
            XXH3_128bits(buffer.baseAddress!, buffer.count)
        }
        low = hash.low64
        high = hash.high64
    }
}

extension XXH128 {
    public var hexString: String {
        String(format: "%016llx%016llx", high, low)
    }
}

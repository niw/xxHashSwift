//
//  xxHashTests.swift
//  xxHash
//
//  Created by Yoshimasa Niwa on 7/31/25.
//

import Foundation
import Testing
@testable import xxHash

@Test
func testXXH128() throws {
    struct TestCase {
        var data: Data
        var low: UInt64
        var high: UInt64
    }

    let testCases: [TestCase] = [
        .init(data: Data(), low: 0x6001c324468d497f, high: 0x99aa06d3014798d8),
        .init(data: Data([0x01]), low: 0xe12ef9d2eb86ceeb, high: 0x51025a4491835505),
        .init(data: Data([0x01, 0x02, 0x03, 0x04, 0x05]), low: 0x244bd8eab1d14be3, high: 0x13d8ee1d6dd32c9c)
    ]

    for testCase in testCases {
        let xxh128 = XXH128(testCase.data)
        #expect(xxh128.low == testCase.low)
        #expect(xxh128.high == testCase.high)
    }
}

@Test
func testXXH128HexString() throws {
    let xxh128 = XXH128(low: 0x0807060504030201, high: 0x100f0e0d0c0b0a09)
    #expect(xxh128.hexString == "100f0e0d0c0b0a090807060504030201")
}

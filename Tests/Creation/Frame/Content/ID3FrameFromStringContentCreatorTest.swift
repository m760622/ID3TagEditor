//
//  ID3FrameFromStringContentCreatorTest.swift
//
//  Created by Fabrizio Duroni on 28/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3FrameFromStringContentCreatorTest: XCTestCase {
    func testCreatorFrameFromStringContent() {
        let id3FrameFromStringContentCreator = ID3FrameFromStringContentCreator(
                frameContentSizeCalculator: MockFrameContentSizeCalculator(),
                frameFlagsCreator: MockFrameFlagsCreator(),
                paddingAdder: MockPaddingAdder()
        )

        let frameBytes = id3FrameFromStringContentCreator.createFrame(
                frameIdentifier: [0x22],
                version: .version3, content: "test"
        )

        XCTAssertEqual(frameBytes, [0x22, 0x11, 0x00, 0x00, 0x74, 0x65, 0x73, 0x74, 0x00])
    }
}

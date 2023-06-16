//
//  PlaygroundsWidgetBundle.swift
//  PlaygroundsWidget
//
//  Created by 李京珂 on 2023/6/16.
//

import WidgetKit
import SwiftUI

@main
struct PlaygroundsWidgetBundle: WidgetBundle {
    var body: some Widget {
        PlaygroundsWidget()
        PlaygroundsWidgetLiveActivity()
    }
}

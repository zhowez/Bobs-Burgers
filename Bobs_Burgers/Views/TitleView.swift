//
//  TitleView.swift
//  Bob's Burgers Random Character Generator
//
//  Created by Zach Howes on 6/18/22.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        Rectangle().foregroundColor(.yellow).overlay(Text("Bob's Burgers Random Character Generator").font(Font.custom("Bob's Burgers", size: 50))).foregroundColor(.red)    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}

//
//  UserStatView.swift
//  InstagramClone
//
//  Created by Jeffrey Sweeney on 12/8/23.
//

import SwiftUI

struct UserStatView: View {
    let statCount: Int
    let statTitle: String
    
    var body: some View {
        VStack {
            Text("\(statCount)")
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text(statTitle)
                .font(.footnote)
        }
        .frame(width: 72)
    }
}

#Preview {
    UserStatView(statCount: 42, statTitle: "Following")
}

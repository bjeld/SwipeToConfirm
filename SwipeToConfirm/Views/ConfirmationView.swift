//
//  ConfirmationView.swift
//  SwipeToConfirm
//
//  Created by Martin Bjeld on 17/05/2020.
//  Copyright © 2020 Martin Bjeld. All rights reserved.
//

import SwiftUI

struct ConfirmationView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.white, lineWidth: 3)
                .frame(width: 150, height: 150)
            
            Image(systemName: "checkmark")
                .foregroundColor(Color.white)
                .font(.largeTitle)
        }
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView()
    }
}

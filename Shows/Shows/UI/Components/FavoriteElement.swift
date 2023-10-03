//
//  FavoriteElement.swift
//  Shows
//
//  Created by Matej Kuprešak on 03.10.2023..
//

import SwiftUI

struct FavoriteElement: View {
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 26, height: 26)
                .foregroundColor(Color.primaryBlack)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 1)
                )
            
            Image(systemName: "heart.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 14, height: 14)
                .foregroundColor(Color.primaryLightGray)
                .onTapGesture {
                    
                }
        }
    }
}

struct FavoriteElement_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteElement()
    }
}

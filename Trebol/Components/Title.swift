//
//  Title.swift
//  Trebol
//
//  Created by Raul de Heer on 20/05/2020.
//  Copyright © 2020 Supertask V.O.F. All rights reserved.
//

import SwiftUI

struct Title: View {
    public var title: String
    
    var body: some View {
        VStack {
            HStack {
                Text(self.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Spacer()
        }
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title(title: "Planten")
    }
}

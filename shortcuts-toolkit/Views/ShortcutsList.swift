//  Shortcuts Toolkit.
//  Copyright (C) 2022  Zhuravskii Maskim <paperlark@yandex.com>
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <https://www.gnu.org/licenses/>.

import SwiftUI

struct ShortcutsList: View {
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                CardView {
                    VStack(alignment: .leading) {
                        Text(GetAnnotationsAsMarkdownIntent.title)
                            .font(.headline)
                            .padding(.bottom)
                        Text(GetAnnotationsAsMarkdownIntent.description.descriptionText)
                    }
                }
            }.padding()
        }
        .navigationTitle("Available actions")
    }
}

struct ShortcutsList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ShortcutsList()
        }
    }
}

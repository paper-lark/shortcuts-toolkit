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

import Foundation

extension String {
    func toMarkdownQuote() -> String {
        let trimmedText = trimmingCharacters(in: .whitespacesAndNewlines)

        let textWithStartEllipsis: String
        if let firstLetter = trimmedText.first, firstLetter.isLetter && firstLetter.isLowercase {
            textWithStartEllipsis = "… \(trimmedText)"
        } else {
            textWithStartEllipsis = trimmedText
        }

        let textWithEllipsis: String
        if let lastLetter = textWithStartEllipsis.last,
            lastLetter.isLetter && lastLetter.isLowercase
        {
            textWithEllipsis = "\(textWithStartEllipsis) …"
        } else {
            textWithEllipsis = textWithStartEllipsis
        }

        return "  > \(textWithEllipsis)"
    }
}

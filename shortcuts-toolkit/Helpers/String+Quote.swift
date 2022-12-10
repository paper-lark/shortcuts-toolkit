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

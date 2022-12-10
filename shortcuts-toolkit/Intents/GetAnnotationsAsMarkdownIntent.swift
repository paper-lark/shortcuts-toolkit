import AppIntents
import Foundation
import PDFKit

// TODO: add get PDF metadata intent
struct GetAnnotationsAsMarkdownIntent: AppIntent {
    static var title: LocalizedStringResource = "Get PDF annotations as Markdown"

    static var description =
        IntentDescription("Gets annotations from PDF file in Markdown format")

    static var parameterSummary: some ParameterSummary {
        Summary("Get annotations from \(\.$file)")
    }
    static var openAppWhenRun: Bool = false

    static var authenticationPolicy: IntentAuthenticationPolicy = .requiresLocalDeviceAuthentication

    static var persistentIdentifier: String = "GetAnnotationsAsMarkdownIntent"

    init() {}

    @Parameter(title: "PDF file")
    var file: IntentFile

    func perform() async throws -> some IntentResult {
        let document = PDFDocument(data: file.data)!
        var entries: [String] = []

        for pageIndex in 0...document.pageCount {
            if let page = document.page(at: pageIndex) {
                for annotation in page.annotations {
                    if annotation.type == "Highlight" {
                        let bounds = annotation.bounds
                        if let points = annotation.value(forAnnotationKey: .quadPoints)
                            as? [CGPoint]
                        {
                            let relativeRects = getRectanglesFromQuadPoints(points: points)
                            let selection = relativeRects.compactMap { rect in
                                // NOTE: Selection with rectangle does not work the same:
                                //   - Words can be partially selected.
                                //   - Selection may contain invalid range and empty string in some cases.
                                if let selection = page.selection(
                                    from: rect.centerLeft, to: rect.centerRight),
                                    selection.string != nil
                                {
                                    return selection
                                }
                                return nil
                            }.reduce(PDFSelection(document: document)) { acc, selection in
                                acc.add(selection)
                                return acc
                            }
                            let selectedText = (selection.string ?? "")
                                .split(whereSeparator: \.isNewline)
                                .joined(separator: " ")

                            let entry = createNoteText(
                                pageNo: pageIndex + 1,
                                highlightedText: selectedText.toMarkdownQuote(),
                                annotation: annotation.contents
                            )
                            entries.append(entry)
                        }
                    }
                }
            }
        }

        return .result(value: entries.joined(separator: "\n\n"))
    }

    private func createNoteText(pageNo: Int, highlightedText: String, annotation: String?) -> String
    {
        let annotationText = annotation ?? ""

        return "Page \(pageNo): \(annotationText)\n\(highlightedText)"
    }

    private func getRectanglesFromQuadPoints(points: [CGPoint]) -> [CGRect] {
        var selections: [CGRect] = []

        for i in stride(from: 0, to: points.count, by: 4) {
            let topLeft = points[i]
            let bottomLeft = points[i + 2]
            let bottomRight = points[i + 3]

            selections.append(
                CGRect(topLeft: topLeft, bottomLeft: bottomLeft, bottomRight: bottomRight))
        }

        return selections
    }
}

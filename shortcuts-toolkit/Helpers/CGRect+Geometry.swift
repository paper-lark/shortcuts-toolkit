import Foundation

extension CGRect {
    var topLeft: CGPoint {
        return CGPoint(x: self.origin.x, y: self.origin.y + self.height)
    }

    var topRight: CGPoint {
        return CGPoint(x: self.origin.x + self.width, y: self.origin.y + self.height)
    }

    var bottomLeft: CGPoint {
        return CGPoint(x: self.origin.x, y: self.origin.y)
    }

    var bottomRight: CGPoint {
        return CGPoint(x: self.origin.x + self.width, y: self.origin.y)
    }

    var centerLeft: CGPoint {
        return CGPoint(x: self.origin.x, y: self.origin.y + self.height / 2)
    }

    var centerRight: CGPoint {
        return CGPoint(x: self.origin.x + self.width, y: self.origin.y + self.height / 2)
    }

    init(topLeft: CGPoint, bottomLeft: CGPoint, bottomRight: CGPoint) {
        self.init(
            x: bottomLeft.x, y: bottomLeft.y, width: bottomRight.x - bottomLeft.x,
            height: topLeft.y - bottomLeft.y)
    }

    func relative(to origin: CGPoint) -> CGRect {
        return CGRect(
            x: self.origin.x - origin.x, y: self.origin.y - origin.y, width: self.width,
            height: self.height)
    }

    func absolute(from origin: CGPoint) -> CGRect {
        return CGRect(
            x: self.origin.x + origin.x, y: self.origin.y + origin.y, width: self.width,
            height: self.height)
    }
}

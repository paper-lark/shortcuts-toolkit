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

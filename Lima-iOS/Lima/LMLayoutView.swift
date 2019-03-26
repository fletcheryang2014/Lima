//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import UIKit

public extension LMLayoutView {
    convenience init(margin: CGFloat?,
        topMargin: CGFloat?,
        leadingMargin: CGFloat?,
        bottomMargin: CGFloat?,
        trailingMargin: CGFloat?) {
        self.init()

        if #available(iOS 11, tvOS 11, *) {
            directionalLayoutMargins = NSDirectionalEdgeInsets(top: margin ?? topMargin ?? 0,
                leading: margin ?? leadingMargin ?? 0,
                bottom: margin ?? bottomMargin ?? 0,
                trailing: margin ?? trailingMargin ?? 0)
        } else {
            var layoutMargins = UIEdgeInsets(top: margin ?? topMargin ?? 0,
                left: 0,
                bottom: margin ?? bottomMargin ?? 0,
                right: 0)

            if (UIView.userInterfaceLayoutDirection(for: semanticContentAttribute) == .leftToRight) {
                layoutMargins.left = margin ?? leadingMargin ?? 0
                layoutMargins.right = margin ?? trailingMargin ?? 0
            } else {
                layoutMargins.right = margin ?? leadingMargin ?? 0
                layoutMargins.left = margin ?? trailingMargin ?? 0
            }

            self.layoutMargins = layoutMargins
        }
    }
}

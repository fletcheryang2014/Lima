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
import Lima

class GreetingViewController: UIViewController {
    override func loadView() {
        let items = ["First", "Second", "Third", "Four", "Five"]
        let columnView = LMColumnView(
            UIImageView(image: UIImage(named: "world.png"), contentMode: .scaleAspectFit),
            UILabel(text: "Hello, World!", textAlignment: .center),
            LMColumnView(
                items.map { item in
                    UILabel(text: "Hello, \(item)!", textAlignment: .center)
                }
            )
        )

        view = LMScrollView(isFitToWidth: true,
            backgroundColor: UIColor.white,
            columnView)

//        view = LMRootView(backgroundColor: UIColor.white,
//                      LMTableView(items, { item in
//                            LMTableViewCell(
//                                LMRowView(
//                                    UILabel(text: "Hello, \(item)!"),
//                                    LMSpacer(),
//                                    UIImageView(image: UIImage(named: "EmailIcon")) {
//                                        if item == "Five" {
//                                            $0.isDisplayable = false
//                                        } else {
//                                            $0.isDisplayable = true
//                                        }
//                                    }
//                                )
//                            )
//                      }, select: { indexPath in
//                            NSLog("select at row:%d", indexPath.row)
//                      })
//                )
    }
}

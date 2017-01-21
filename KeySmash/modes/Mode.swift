import Foundation
import UIKit

protocol Mode {
    func start() -> Void
    func respondTo(_ key:String) -> Void
}

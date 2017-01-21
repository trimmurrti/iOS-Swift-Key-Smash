import Foundation
import UIKit

protocol Modeable {
    func start() -> Void
    func respondTo(_ key:String) -> Void
}

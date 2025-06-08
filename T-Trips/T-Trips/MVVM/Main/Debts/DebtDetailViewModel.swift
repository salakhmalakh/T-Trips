import Foundation
import Combine

final class DebtDetailViewModel {
    @Published private(set) var info: String
    var onConfirm: (() -> Void)?

    init(debt: Debt) {
        let from = MockData.users.first { $0.id == debt.fromUserId }
        info = "\(from?.firstName ?? "") должен \(String(format: "%.2f ₽", debt.amount))"
    }
}

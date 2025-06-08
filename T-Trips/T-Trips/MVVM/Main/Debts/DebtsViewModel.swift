import Foundation
import Combine

final class DebtsViewModel {
    @Published private(set) var debts: [Debt] = []

    init(tripId: Int64) {
        debts = MockData.debts.filter { $0.tripId == tripId }
    }
}

import Foundation
import Combine

final class TripDetailViewModel {
    @Published private(set) var title: String
    @Published private(set) var datesText: String
    @Published private(set) var budgetText: String
    @Published private(set) var participantsText: String
    @Published private(set) var description: String

    init(trip: Trip, participants: [User]) {
        title = trip.title
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        datesText = "\(formatter.string(from: trip.startDate)) - \(formatter.string(from: trip.endDate))"
        budgetText = String(format: "%.2f ₽", trip.budget)
        participantsText = participants.map { "\($0.firstName) \($0.lastName)" }.joined(separator: ", ")
        self.description = trip.description ?? ""
    }
}

import Foundation
import Combine

final class CreateTripViewModel {
    @Published var title: String = ""
    @Published var startDate = Date()
    @Published var endDate = Date()
    @Published var budget: String = ""
    @Published var participants: [User] = []
    @Published var description: String = ""

    @Published private(set) var canCreate = false

    var onCreate: ((Trip) -> Void)?

    private var cancellables = Set<AnyCancellable>()

    init() {
        Publishers.CombineLatest3($title, $budget, $participants)
            .map { !$0.0.isEmpty && Double($0.1) != nil && !$0.2.isEmpty }
            .receive(on: RunLoop.main)
            .assign(to: \ .canCreate, on: self)
            .store(in: &cancellables)
    }

    func create() {
        guard let budget = Double(budget) else { return }
        let trip = Trip(
            id: Int64.random(in: 100...999),
            adminId: 0,
            title: title,
            startDate: startDate,
            endDate: endDate,
            budget: budget,
            description: description,
            status: .planning,
            participantIds: participants.map { $0.id }
        )
        onCreate?(trip)
    }
}

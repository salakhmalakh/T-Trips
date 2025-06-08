import UIKit
import Combine

final class TripDetailViewController: UIViewController {
    private let detailView = TripDetailView()
    private let viewModel: TripDetailViewModel
    private var cancellables = Set<AnyCancellable>()

    init(trip: Trip, participants: [User]) {
        self.viewModel = TripDetailViewModel(trip: trip, participants: participants)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func loadView() { view = detailView }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Детали поездки"
        bind()
    }

    private func bind() {
        viewModel.$title
            .receive(on: RunLoop.main)
            .assign(to: \ .text, on: detailView.titleLabel)
            .store(in: &cancellables)
        viewModel.$datesText
            .receive(on: RunLoop.main)
            .assign(to: \ .text, on: detailView.datesLabel)
            .store(in: &cancellables)
        viewModel.$budgetText
            .receive(on: RunLoop.main)
            .assign(to: \ .text, on: detailView.budgetLabel)
            .store(in: &cancellables)
        viewModel.$participantsText
            .receive(on: RunLoop.main)
            .assign(to: \ .text, on: detailView.participantsLabel)
            .store(in: &cancellables)
        viewModel.$description
            .receive(on: RunLoop.main)
            .assign(to: \ .text, on: detailView.descriptionLabel)
            .store(in: &cancellables)
    }
}

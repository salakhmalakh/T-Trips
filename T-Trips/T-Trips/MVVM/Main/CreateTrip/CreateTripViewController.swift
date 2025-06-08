import UIKit
import Combine

final class CreateTripViewController: UIViewController {
    private let createView = CreateTripView()
    private let viewModel = CreateTripViewModel()
    private var cancellables = Set<AnyCancellable>()
    private let users = MockData.users

    override func loadView() { view = createView }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Создание поездки"
        setupBindings()
        setupPickers()
        setupActions()
    }

    private func setupBindings() {
        viewModel.$canCreate
            .receive(on: RunLoop.main)
            .sink { [weak self] enabled in self?.createView.createButton.isEnabled = enabled }
            .store(in: &cancellables)
    }

    private func setupPickers() {
        createView.startPicker.datePickerMode = .date
        createView.endPicker.datePickerMode = .date
        createView.participantsPicker.dataSource = self
        createView.participantsPicker.delegate = self
    }

    private func setupActions() {
        createView.titleField.addAction(UIAction { [weak self] _ in
            self?.viewModel.title = self?.createView.titleField.text ?? ""
        }, for: .editingChanged)
        createView.budgetField.addAction(UIAction { [weak self] _ in
            self?.viewModel.budget = self?.createView.budgetField.text ?? ""
        }, for: .editingChanged)
        createView.startPicker.addTarget(self, action: #selector(startChanged(_:)), for: .valueChanged)
        createView.endPicker.addTarget(self, action: #selector(endChanged(_:)), for: .valueChanged)
        createView.createButton.addAction(UIAction { [weak self] _ in self?.viewModel.create() }, for: .touchUpInside)

        viewModel.onCreate = { [weak self] trip in
            self?.navigationController?.popViewController(animated: true)
        }
    }

    @objc private func startChanged(_ picker: UIDatePicker) { viewModel.startDate = picker.date }
    @objc private func endChanged(_ picker: UIDatePicker) { viewModel.endDate = picker.date }
}

extension CreateTripViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { users.count }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let u = users[row]; return "\(u.firstName) \(u.lastName)"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let u = users[row]
        viewModel.participants = [u]
        createView.participantsField.text = "\(u.firstName) \(u.lastName)"
    }
}

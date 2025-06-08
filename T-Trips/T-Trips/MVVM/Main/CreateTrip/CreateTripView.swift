import UIKit
import SnapKit

final class CreateTripView: UIView {
    private let textFieldFactory = TextFieldFactory()
    private let buttonFactory = ButtonFactory()

    public private(set) lazy var titleField: CustomTextField = {
        let model = TextFieldModel(placeholder: "Название", state: .name)
        return textFieldFactory.makeTextField(with: model)
    }()

    public private(set) lazy var startDateField: CustomTextField = {
        let model = TextFieldModel(placeholder: "Дата начала", state: .picker)
        let field = textFieldFactory.makeTextField(with: model)
        field.inputView = startPicker
        field.inputAccessoryView = accessoryToolbar
        return field
    }()

    public private(set) lazy var endDateField: CustomTextField = {
        let model = TextFieldModel(placeholder: "Дата конца", state: .picker)
        let field = textFieldFactory.makeTextField(with: model)
        field.inputView = endPicker
        field.inputAccessoryView = accessoryToolbar
        return field
    }()

    public private(set) lazy var budgetField: CustomTextField = {
        let model = TextFieldModel(placeholder: "Бюджет", state: .money)
        let field = textFieldFactory.makeTextField(with: model)
        field.keyboardType = .decimalPad
        field.inputAccessoryView = accessoryToolbar
        return field
    }()

    public private(set) lazy var participantsField: CustomTextField = {
        let model = TextFieldModel(placeholder: "Выберите участников", state: .picker)
        let field = textFieldFactory.makeTextField(with: model)
        field.inputView = participantsPicker
        field.inputAccessoryView = accessoryToolbar
        return field
    }()

    public private(set) var descriptionView: UITextView = {
        let tv = UITextView()
        tv.layer.borderWidth = 0.5
        tv.layer.cornerRadius = 12
        tv.layer.borderColor = UIColor.lightGray.cgColor
        tv.font = .systemFont(ofSize: 16)
        return tv
    }()

    public private(set) lazy var createButton: CustomButton = {
        let button = CustomButton()
        let model = buttonFactory.makeConfiguration(title: "Создать", state: .primary, isEnabled: false, action: nil)
        button.configure(with: model)
        return button
    }()

    let startPicker = UIDatePicker()
    let endPicker = UIDatePicker()
    let participantsPicker = UIPickerView()

    private lazy var accessoryToolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flex = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissInput))
        toolbar.setItems([flex, done], animated: false)
        return toolbar
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        [titleField, startDateField, endDateField, budgetField, participantsField, descriptionView, createButton].forEach(addSubview)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupConstraints() {
        titleField.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(24)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        startDateField.snp.makeConstraints { make in
            make.top.equalTo(titleField.snp.bottom).offset(16)
            make.leading.trailing.height.equalTo(titleField)
        }
        endDateField.snp.makeConstraints { make in
            make.top.equalTo(startDateField.snp.bottom).offset(16)
            make.leading.trailing.height.equalTo(titleField)
        }
        budgetField.snp.makeConstraints { make in
            make.top.equalTo(endDateField.snp.bottom).offset(16)
            make.leading.trailing.height.equalTo(titleField)
        }
        participantsField.snp.makeConstraints { make in
            make.top.equalTo(budgetField.snp.bottom).offset(16)
            make.leading.trailing.height.equalTo(titleField)
        }
        descriptionView.snp.makeConstraints { make in
            make.top.equalTo(participantsField.snp.bottom).offset(16)
            make.leading.trailing.equalTo(titleField)
            make.height.equalTo(100)
        }
        createButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionView.snp.bottom).offset(24)
            make.leading.trailing.equalTo(titleField)
            make.height.equalTo(50)
        }
    }

    @objc private func dismissInput() { endEditing(true) }
}

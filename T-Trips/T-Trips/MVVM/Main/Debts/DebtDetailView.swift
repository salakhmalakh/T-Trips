import UIKit
import SnapKit

final class DebtDetailView: UIView {
    let infoLabel = UILabel()
    let confirmButton: CustomButton = {
        let btn = CustomButton()
        let model = ButtonFactory().makeConfiguration(title: "Подтвердить", state: .primary, isEnabled: true, action: nil)
        btn.configure(with: model)
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        [infoLabel, confirmButton].forEach(addSubview)
        infoLabel.numberOfLines = 0
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(24)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        confirmButton.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(24)
            make.leading.trailing.equalTo(infoLabel)
            make.height.equalTo(50)
        }
    }
    required init?(coder: NSCoder) { super.init(coder: coder) }
}

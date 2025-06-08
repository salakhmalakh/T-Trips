import UIKit
import SnapKit

final class TripDetailView: UIView {
    let titleLabel = UILabel()
    let datesLabel = UILabel()
    let budgetLabel = UILabel()
    let participantsLabel = UILabel()
    let descriptionLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        [titleLabel, datesLabel, budgetLabel, participantsLabel, descriptionLabel].forEach(addSubview)
        setupConstraints()
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.numberOfLines = 0
        datesLabel.numberOfLines = 0
        budgetLabel.numberOfLines = 0
        participantsLabel.numberOfLines = 0
        descriptionLabel.numberOfLines = 0
    }

    required init?(coder: NSCoder) { super.init(coder: coder) }

    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(24)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        datesLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalTo(titleLabel)
        }
        budgetLabel.snp.makeConstraints { make in
            make.top.equalTo(datesLabel.snp.bottom).offset(16)
            make.leading.trailing.equalTo(titleLabel)
        }
        participantsLabel.snp.makeConstraints { make in
            make.top.equalTo(budgetLabel.snp.bottom).offset(16)
            make.leading.trailing.equalTo(titleLabel)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(participantsLabel.snp.bottom).offset(16)
            make.leading.trailing.equalTo(titleLabel)
        }
    }
}

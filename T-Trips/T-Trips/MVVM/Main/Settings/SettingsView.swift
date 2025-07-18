import UIKit
import SnapKit

final class SettingsView: UIView {
    let tableView = UITableView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(tableView)
        tableView.snp.makeConstraints { make in make.edges.equalToSuperview() }
    }
    required init?(coder: NSCoder) { super.init(coder: coder) }
}

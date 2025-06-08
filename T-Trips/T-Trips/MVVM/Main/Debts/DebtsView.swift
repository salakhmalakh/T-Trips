import UIKit
import SnapKit

final class DebtsView: UIView {
    let tableView: UITableView = {
        let tv = UITableView()
        tv.register(CustomTableCell.self, forCellReuseIdentifier: CustomTableCell.reuseId)
        return tv
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) { super.init(coder: coder) }
}

import UIKit
import SnapKit

final class StartView: UIView {
    private let imageView: UIImageView = {
        let image = UIImage(named: "shieldT")
        let view = UIImageView(image: image)
        view.contentMode = .scaleAspectFit
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(200)
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

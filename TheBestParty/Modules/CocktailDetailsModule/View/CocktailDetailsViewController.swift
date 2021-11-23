import UIKit

class CocktailDetailsViewController: UIViewController {
    var presenter: CocktailDetailsViewPresenter?

    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        label.frame = CGRect(x: 150, y: 150, width: 250, height: 250)
        view.addSubview(button)
        button.frame = CGRect(x: 150, y: 550, width: 250, height: 250)
//        button.addTarget(self, action: #selector(presenter.tap), for: .touchUpInside)
        presenter?.setCocktail()
    }
}

extension CocktailDetailsViewController: CocktailDetailsViewProtocol {
    func setupDetails(with cocktail: CocktailModel?) {
        label.text = cocktail?.drinks.first?.cocktailName
    }
}

import UIKit

// MARK: TODO - Add UICollectionView to Ingredients with images
//       Make UITableView height constraints dynamic
//       Add more ingredients and ingredients measures

class RandomCocktailViewController: UIViewController {
    // MARK: - Private properties
    private let networkManager: NetworkProvider = NetworkManager()
    private var cellModel = [CellModel]()
    private var cocktailsModel = [CocktailModel]()
    
    // MARK: - Visual Components
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()

    private let getCocktailButton: UIButton = {
        let button = UIButton()
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 30.0, weight: .bold, scale: .large)
        let image = UIImage(systemName: "arrow.uturn.backward.circle.fill", withConfiguration: imageConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.addTarget(self, action: #selector(getAnotherRandomCocktail), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    lazy var cocktailTableView: UITableView = {
        let tableView = UITableView()
        tableView.registerCell(RandomCocktailImageTableViewCell.self)
        tableView.registerCell(RandomCocktailIngredientsTableViewCell.self)
        tableView.registerCell(RandomCocktailTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        setUpModels()
        getRandomCocktail()
    }
}

// MARK: - Extensions
extension RandomCocktailViewController {
    @objc func getAnotherRandomCocktail() {
        getRandomCocktail()
    }
    
    private func getRandomCocktail() {
        cocktailsModel.removeAll()
        networkManager.getRandomCocktail { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.cocktailsModel.append(data)
                    self.cocktailTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func setUpModels() {
        cellModel.append(.image)
        cellModel.append(.ingredients)
        cellModel.append(.instructions)
        cellModel.append(.category)
        cellModel.append(.cocktailType)
        cellModel.append(.glass)
    }
    
    private func configureView() {
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = true
        configureScrollView()
        configureTableView()
        configureRandomButtonView()
    }
    
    private func configureScrollView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureTableView() {
        scrollView.addSubview(cocktailTableView)
        NSLayoutConstraint.activate([
            cocktailTableView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            cocktailTableView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            cocktailTableView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            // MARK: FIX ME - make tableView height dynamic
            cocktailTableView.heightAnchor.constraint(equalToConstant: CGFloat(450.0 * 3.0)),
            cocktailTableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    private func configureRandomButtonView() {
        view.addSubview(getCocktailButton)
        NSLayoutConstraint.activate([
            getCocktailButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15.0),
            getCocktailButton.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15.0)
        ])
    }
}

// MARK: - UITableViewDataSource
extension RandomCocktailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellModel.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch cellModel[section] {
        case .image:
            return nil
        case .ingredients, .instructions, .category, .glass, .cocktailType:
            return cellModel[section].description
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let tableView = view as? UITableViewHeaderFooterView else { return }
        tableView.frame = CGRect(x: 0, y: 0, width: self.view.width, height: 0)
        tableView.contentView.backgroundColor = .systemBackground
        tableView.textLabel?.font = .systemFont(ofSize: 22.0)
        tableView.textLabel?.textColor = .systemOrange
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if cocktailsModel.isEmpty {
            return UITableViewCell()
        } else {
            let cocktail = cocktailsModel[indexPath.row]
            
            switch cellModel[indexPath.section] {
            case .image:
                let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as RandomCocktailImageTableViewCell
                cell.configureCell(with: cocktail)
                
                return cell
                
            case .ingredients:
                let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as RandomCocktailIngredientsTableViewCell
                cell.configureCell(with: cocktail)
                
                return cell
                
            case .instructions:
                let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as RandomCocktailTableViewCell
                cell.configureInstructionsCell(with: cocktail)
                
                return cell
                
            case .category:
                let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as RandomCocktailTableViewCell
                cell.configureCategoryCell(with: cocktail)
                
                return cell
                
            case .cocktailType:
                let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as RandomCocktailTableViewCell
                cell.configureCocktailTypeCell(with: cocktail)
                
                return cell
                
            case .glass:
                let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as RandomCocktailTableViewCell
                cell.configureGlassCell(with: cocktail)
                
                return cell
            }
        }
    }
}

// MARK: - UITableViewDelegate
extension RandomCocktailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch cellModel[indexPath.section] {
        case .image:
            return view.frame.width
        case .ingredients:
            return 150.0
        case .instructions:
            return 200.0
        case .category:
            return 50.0
        case .cocktailType:
            return 50.0
        case .glass:
            return 50.0
        }
    }
}

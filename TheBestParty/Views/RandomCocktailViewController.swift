import UIKit

class RandomCocktailViewController: UIViewController {
    // MARK: - Private properties
    private let network: NetworkProvider = NetworkManager()
    private var cellModel = [CellModel]()
    private var cocktails = [CocktailModel]()
    
    // MARK: - Visual Components
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()

    private let getCocktailButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "arrow.uturn.backward.circle.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(getRandomCocktail), for: .touchUpInside)
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
        
//        tableView.estimatedRowHeight = 85.0
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        return tableView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        setUpModels()
    }
}

// MARK: - Extensions
extension RandomCocktailViewController {
    @objc func getRandomCocktail() {
        cocktails.removeAll()
        network.getRandomCocktail { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.cocktails.append(data)
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
        cellModel.append(.glass)
    }
    
    private func configureView() {
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
            cocktailTableView.heightAnchor.constraint(equalToConstant: CGFloat(450.0 * 3.0)),
            cocktailTableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    private func configureRandomButtonView() {
        view.addSubview(getCocktailButton)
        NSLayoutConstraint.activate([
            getCocktailButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15.0),
            getCocktailButton.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15.0),
            getCocktailButton.widthAnchor.constraint(equalToConstant: 50.0),
            getCocktailButton.heightAnchor.constraint(equalToConstant: 50.0)
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
        case .ingredients:
            return "Ingredients"
        case .instructions:
            return "Instructions"
        case .category:
            return "Category"
        case .glass:
            return "Glass"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if cocktails.isEmpty {
            return UITableViewCell()
        } else {
            let cocktail = cocktails[indexPath.row]
            
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
//            return UITableView.automaticDimension
        case .instructions:
            return 200.0
//            return UITableView.automaticDimension
        case .category:
            return 50.0
//            return UITableView.automaticDimension
        case .glass:
            return 50.0
//            return UITableView.automaticDimension
        }
    }
}

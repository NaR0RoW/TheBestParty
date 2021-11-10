import UIKit

class RandomCocktailViewController: UIViewController {
    // MARK: - Private properties
    private let network: NetworkProvider = NetworkManager()
    
    // MARK: - Visual Components
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()
    
    private let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        
        return view
    }()
    
    private let getCocktailButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "person.fill")
        button.setImage(image, for: .normal)
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(getRandomCocktail), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private let cocktailImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: "person.fill")
        image?.withRenderingMode(.alwaysTemplate)
        imageView.image = image
        imageView.tintColor = .brown
        imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    private let cocktailNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.backgroundColor = .red
        label.text = "CocktailName"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let cocktailDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.backgroundColor = .green
        label.text = "CocktailDescription"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var cocktailDescriptionTableView: UITableView = {
        let tableView = UITableView()
        tableView.registerCell(RandomCocktailTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
        print("Loaded")
    }
}

// MARK: - Extensions
extension RandomCocktailViewController {
    private func configureView() {
        view.backgroundColor = .systemBackground
        
        configureScrollView()
        configureTopView()
        configureTableView()
    }
    
    private func configureScrollView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    private func configureTopView() {
        scrollView.addSubview(topView)
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            topView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            topView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            topView.heightAnchor.constraint(equalToConstant: view.frame.size.width)
        ])
        
        topView.addSubview(cocktailImageView)
        NSLayoutConstraint.activate([
            cocktailImageView.topAnchor.constraint(equalTo: topView.topAnchor),
            cocktailImageView.leftAnchor.constraint(equalTo: topView.leftAnchor),
            cocktailImageView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            cocktailImageView.heightAnchor.constraint(equalToConstant: view.frame.size.width),
        ])

        topView.addSubview(getCocktailButton)
        NSLayoutConstraint.activate([
            getCocktailButton.topAnchor.constraint(equalTo: topView.topAnchor),
            getCocktailButton.rightAnchor.constraint(equalTo: topView.rightAnchor),
            getCocktailButton.widthAnchor.constraint(equalToConstant: 50.0),
            getCocktailButton.heightAnchor.constraint(equalToConstant: 50.0),
        ])
        
        topView.addSubview(cocktailNameLabel)
        NSLayoutConstraint.activate([
            cocktailNameLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -30.0),
            cocktailNameLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15.0)
        ])

        topView.addSubview(cocktailDescriptionLabel)
        NSLayoutConstraint.activate([
            cocktailDescriptionLabel.topAnchor.constraint(equalTo: cocktailNameLabel.bottomAnchor),
            cocktailDescriptionLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15.0)
        ])
    }
    
    private func configureTableView() {
        scrollView.addSubview(cocktailDescriptionTableView)
        NSLayoutConstraint.activate([
            cocktailDescriptionTableView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            cocktailDescriptionTableView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            cocktailDescriptionTableView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            cocktailDescriptionTableView.heightAnchor.constraint(equalToConstant: CGFloat(450 * 10)),
            cocktailDescriptionTableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }

    @objc func getRandomCocktail() {
        network.getRandomCocktail { result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self.cocktailNameLabel.text = model.drinks.first?.strDrink
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension RandomCocktailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as RandomCocktailTableViewCell

        return cell
    }
}

// MARK: - UITableViewDelegate
extension RandomCocktailViewController: UITableViewDelegate {
    
}

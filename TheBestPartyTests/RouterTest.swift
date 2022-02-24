@testable import TheBestParty
import XCTest

final class MockNavigationController: UINavigationController {
    var presentedVC: UIViewController?
    var isViewControllerDismissed = false
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        self.isViewControllerDismissed = true
        
        return self.viewControllers.first
    }
}

final class RouterTest: XCTestCase {
    var router: RouterProtocol!
    var navigationController = MockNavigationController()
    let assemblyModuleBuilder = AssemblyModuleBuilder()
    
    override func setUpWithError() throws {
        router = Router(navigationController: navigationController, assemblyBuilder: assemblyModuleBuilder)
    }

    override func tearDownWithError() throws {
        router = nil
    }

    func testRouterShowDetails() {
        router.showDetails(cocktail: nil)
        let detailViewController = navigationController.presentedVC
        
        XCTAssertTrue(detailViewController is CocktailDetailsViewController)
    }
    
    func testRouterPopViewController() {
        router.popViewController()
        let isViewControllerDismissed = navigationController.isViewControllerDismissed
        
        XCTAssertEqual(isViewControllerDismissed, true)
    }
}

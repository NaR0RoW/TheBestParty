@testable import TheBestParty
import XCTest

final private class MockNavigationController: UINavigationController {
    var presentedVC: UIViewController?
    var isViewControllerDismissed = false
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        isViewControllerDismissed = true
        
        return viewControllers.first
    }
}

final private class RouterTest: XCTestCase {
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
        
        XCTAssertTrue(detailViewController is DetailsViewController)
    }
    
    func testRouterPopViewController() {
        router.popViewController()
        let isViewControllerDismissed = navigationController.isViewControllerDismissed
        
        XCTAssertTrue(isViewControllerDismissed)
    }
}

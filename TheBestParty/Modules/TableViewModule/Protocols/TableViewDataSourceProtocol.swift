import UIKit

protocol TableViewDataSourceProtocol: UITableViewDelegate, UITableViewDataSource {
    var sections: [TableViewSectionBuilder] { get set }
}

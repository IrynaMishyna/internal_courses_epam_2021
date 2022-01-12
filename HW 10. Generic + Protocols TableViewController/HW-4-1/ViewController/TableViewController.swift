//
//  TableViewController.swift
//  HW-4-1
//
//  Created by Iryna Mishyna on 08.10.2021.
//

import UIKit


final class TableViewController: UIViewController {
    
    struct CountriesSection: Hashable {
        
        let id = UUID()
        var items: [Country] = []
        var title: String = ""
        
    }
    
    // IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // Properties
    
    let refreshControl = UIRefreshControl()
    private var sections: [CountriesSection] = []
    
    var dataSource: UITableViewDiffableDataSource<CountriesSection, Country>?
    
    // Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createSections()
        createDataSource()
        setupTableView()
        
        setupNavBar()
        
        reloadData()
    }
    
    // Setups
    
    private func createSections() {
        sections = [CountriesSection(items: Country.sampleCountries, title: "All"),
                    CountriesSection(items: Country.sampleFavoritesCountries, title: "Favorites")]
    }
    
    private func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = dataSource
        tableView.rowHeight = UITableView.automaticDimension
        
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        tableView.register(CustomSectionFooterView.self, forHeaderFooterViewReuseIdentifier: "CustomSectionFooterView")
    }
    
    private func setupNavBar() {
        
        let rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector (addTapped))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        navigationItem.title = "🌆 Countries"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func createDataSource() {
        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, country -> UITableViewCell? in
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else {
                return UITableViewCell()
            }
            
            cell.expandCallback = { [weak self] cell in
                
                guard let self = self,
                      let indexPath = tableView.indexPath(for: cell),
                      let dataSource = self.dataSource,
                      let country = dataSource.itemIdentifier(for: indexPath) else {
                          return
                      }
                
                country.isExpanded.toggle()
                
                var snapshot = dataSource.snapshot()
                snapshot.reloadItems([country])
                dataSource.apply(snapshot, animatingDifferences: true)
            }
            
            cell.configure(with: country)
            return cell
        })
    }
    
    func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<CountriesSection, Country>()
        snapshot.appendSections(sections)
        
        for section in sections {
            snapshot.appendItems(section.items, toSection: section)
        }
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
    
    // Actions
    
    @objc private func addTapped() {
        guard let dataSource = dataSource else { return}
        
        var snapshot = dataSource.snapshot()
        snapshot.appendItems([Country.generation()], toSection: sections[0])
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    @objc func refresh(refreshControl: UIRefreshControl) {
        
        var number = 1
        
        repeat {
            guard let dataSource = dataSource else { return }
            
            var snapshot = dataSource.snapshot()
            snapshot.appendItems([Country.generation()], toSection: sections[0])
            
            dataSource.apply(snapshot, animatingDifferences: true)
            
            number += 1
        } while number <= 3
        
        refreshControl.endRefreshing()
        
    }
}

// MARK: - Table view delegate

extension TableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomSectionFooterView") as? CustomSectionFooterView
        footerView?.titleLabel.text = sections[section].title
        return footerView
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomSectionFooterView") as? CustomSectionFooterView
        headerView?.titleLabel.text = sections[section].title
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "Delete") { [weak self] (action, view, completion) in
            guard let self = self else { return }
            
            guard let dataSource = self.dataSource else { return }
            
            guard let country = dataSource.itemIdentifier(for: indexPath) else { return }
            
            var snapshot = dataSource.snapshot()
            snapshot.deleteItems([country])
            dataSource.apply(snapshot, animatingDifferences: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
                        
            guard let dataSource = dataSource, let country = dataSource.itemIdentifier(for: indexPath) else { return }
            
            var snapshot = dataSource.snapshot()
            snapshot.deleteItems([country])
            dataSource.apply(snapshot, animatingDifferences: true)
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let controller = CountryDetailsViewController()
        guard let dataSource = dataSource else { return }
        
        let country = dataSource.itemIdentifier(for: indexPath)
        controller.country = country
        
        present(controller, animated: true, completion: nil)
    }
    
}

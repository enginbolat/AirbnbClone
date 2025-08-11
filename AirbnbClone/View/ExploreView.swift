//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Engin on 11.08.2025.
//

//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Engin on 11.08.2025.
//

import UIKit

final class ExploreView: UIView {
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.contentInsetAdjustmentBehavior = .never
        table.sectionHeaderHeight = .leastNormalMagnitude
        table.estimatedSectionHeaderHeight = .leastNormalMagnitude
        table.sectionFooterHeight = .leastNormalMagnitude
        table.estimatedSectionFooterHeight = .leastNormalMagnitude
        return table
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RowItemCell.self, forCellReuseIdentifier: RowItemCell.reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension ExploreView {
    private func layout() {
        self.addSubViews(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension ExploreView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 512
    }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell( withIdentifier: RowItemCell.reuseIdentifier,
                                                    for: indexPath
                                                    ) as! RowItemCell

          let model = RowItemCellModel(
              icon: AppIcon.OutlineUser.rawValue,
              title: "Row Item \(indexPath.row + 1)",
              trailingIcon: AppIcon.OutlineChevronRight.rawValue
          )
          cell.configure(with: model)
          return cell
      }

      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          tableView.deselectRow(at: indexPath, animated: true)
          // tıklama aksiyonu
          print("Row tapped:", indexPath.row)
      }
}

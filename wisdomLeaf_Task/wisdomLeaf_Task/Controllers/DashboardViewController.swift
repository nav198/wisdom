//
//  DashboardViewController.swift
//  wisdomLeaf_Task
//
//  Created by admin on 24/06/24.
//

import UIKit
import Kingfisher
 

class DashboardViewController: UIViewController {
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    var photosArrayList = PhotosApi.photoArray.listOfPhotos
    
    var selectedRows:[Int] = []
    
    let dataTable: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.register(DashboardTableViewCell.self, forCellReuseIdentifier: "DashboardTableViewCell")
        table.estimatedRowHeight = 65
        table.rowHeight = UITableView.automaticDimension
        //        table.separatorStyle = .none
        table.backgroundColor = .clear
        table.showsHorizontalScrollIndicator = false
        table.showsVerticalScrollIndicator = false
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let authorNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .label
        lbl.numberOfLines = 0
        lbl.text = ""
        lbl.font =  UIFont.systemFont(ofSize: 21, weight: .semibold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let authorDescLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .label
        lbl.numberOfLines = 0
        lbl.text = ""
        lbl.font =  UIFont.systemFont(ofSize: 20, weight: .regular)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let refreshControl = UIRefreshControl()
    
    let authorDescView = UIView()
    let backgroundView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Dashboard"
        setupViews()
    
        if self.refreshControl.isRefreshing{
            self.refreshControl.endRefreshing()
        }
        
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        dataTable.refreshControl = refreshControl
    }
    
    @objc func refreshData() {
        DispatchQueue.main.async {
            self.dataTable.reloadData()
            if self.refreshControl.isRefreshing {
                self.refreshControl.endRefreshing()
            }
        }
    }

    
    func setupViews() {
        view.addSubview(dataTable)
        view.backgroundColor = .systemBackground
        self.navigationItem.hidesBackButton = true
        if #available(iOS 15.0, *) {
            dataTable.sectionHeaderTopPadding = 0
        }
        dataTable.dataSource = self
        dataTable.delegate = self
    }
    
    override func viewWillLayoutSubviews() {
        dataTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        dataTable.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        dataTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        dataTable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

// Mark : UITableViewDelegate & DataSource Methods

extension DashboardViewController:UITableViewDelegate,UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosArrayList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return screenSize.width*0.3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dataTable.dequeueReusableCell(withIdentifier: "DashboardTableViewCell", for: indexPath) as! DashboardTableViewCell
        cell.selectionStyle = .none
        cell.titleLabel.text = photosArrayList[indexPath.row].author
      
        if self.selectedRows.contains(indexPath.row){
            cell.checkboxButton.setImage(UIImage(systemName: "checkmark.rectangle.fill"), for: .normal)
        }else{
            cell.checkboxButton.setImage(UIImage(systemName: "rectangle"), for: .normal)
        }

        cell.checkboxButton.tag = indexPath.row
        cell.checkboxButton.addTarget(self, action: #selector(checkMarkAction(_:)), for: .touchUpInside)
        let url = URL(string: "\(photosArrayList[indexPath.row].downloadUrl)")
        
        if indexPath.row % 3 == 0 {
            cell.descLabel.text = "Thriller"
        }else if indexPath.row % 2 == 0 {
            cell.descLabel.text = "Biography"
        }else{
            cell.descLabel.text = "Fiction"
        }
        
          //  without any package loading of images using URL session - Takes more memory
         // cell.mainImage.imageFromURL(urlString: "\(photosArrayList[indexPath.row].downloadUrl)")
        
       // Using Package - Kingfisher - Memory Efficient
        KF.url(url, cacheKey:"\(String(describing: url?.absoluteString))") .downsampling(size: CGSize(width: cell.contentView.frame.height, height: cell.contentView.frame.height))
            .cacheOriginalImage()
            .set(to: cell.mainImage)
       
        return cell
    }
}

extension DashboardViewController{
    @objc func checkMarkAction(_ sender:UIButton){
        
        if !selectedRows.contains(sender.tag){
            self.selectedRows.append(sender.tag)
        }
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            sender.setImage(UIImage(systemName: "checkmark.rectangle.fill"), for: .normal)
            showDescription(sender.tag)
        }else{
            showAlert(sender.tag)
            sender.setImage(UIImage(systemName: "rectangle"), for: .normal)
        }
    }
    
    func showAlert(_ index:Int){
       
        let authorName:String = photosArrayList[index].author
        let alertDesc:String = "Author of eagerly awaited and sparklingly readable novels often centred around the domestic nuances and dilemmas of life in contemporary England, Joanna Trollope is also the author of several historical novels."
        
        let alert = UIAlertController(title: "\(authorName)", message: "\(alertDesc)", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showDescription(_ index:Int){
       
        self.authorDescView.isHidden = false
        dataTable.isUserInteractionEnabled = false
        self.navigationController?.navigationBar.isUserInteractionEnabled = false
        authorDescView.layer.cornerRadius = 10
        authorDescView.layer.borderWidth = 0.1
        authorDescView.translatesAutoresizingMaskIntoConstraints = false
        authorDescView.backgroundColor = .white
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = .systemGray4.withAlphaComponent(0.2)
        
     
        view.addSubview(backgroundView)
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        backgroundView.addSubview(authorDescView)
        
        let closeBtn: UIButton = {
            let btn = UIButton(type: .custom)
            btn.tintColor = .systemRed
            let closeImage = UIImage(systemName: "xmark.circle")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 22))
            btn.setImage(closeImage, for: .normal)
            btn.contentMode = .scaleAspectFill
            btn.isUserInteractionEnabled = true
            btn.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
            btn.translatesAutoresizingMaskIntoConstraints = false
            return btn
        }()
    
        authorDescView.addSubview(closeBtn)
        
        authorNameLabel.text = "\(photosArrayList[index].author)"
        let descString = "Author of eagerly awaited and sparklingly readable novels often centred around the domestic nuances and dilemmas of life in contemporary England, Joanna Trollope is also the author of several historical novels."
        authorDescLabel.text = descString
        
        authorDescView.addSubview(authorNameLabel)
        authorDescView.addSubview(authorDescLabel)
        
        NSLayoutConstraint.activate([
            authorDescView.centerXAnchor.constraint(equalTo: dataTable.centerXAnchor, constant: 0),
            authorDescView.centerYAnchor.constraint(equalTo: dataTable.centerYAnchor, constant: 0),
            authorDescView.heightAnchor.constraint(equalToConstant: 280),
            authorDescView.widthAnchor.constraint(equalToConstant: view.frame.width - 60),
            
            closeBtn.heightAnchor.constraint(equalToConstant: 35),
            closeBtn.widthAnchor.constraint(equalToConstant: 35),
            closeBtn.topAnchor.constraint(equalTo: authorDescView.topAnchor, constant: 10),
            closeBtn.trailingAnchor.constraint(equalTo: authorDescView.trailingAnchor, constant: -10),
            
            authorNameLabel.topAnchor.constraint(equalTo: authorDescView.topAnchor, constant: 10),
            authorNameLabel.centerXAnchor.constraint(equalTo: authorDescView.centerXAnchor, constant: -10),
            
            authorDescLabel.topAnchor.constraint(equalTo: authorNameLabel.bottomAnchor, constant: 15),
            authorDescLabel.leadingAnchor.constraint(equalTo: authorDescView.leadingAnchor, constant: 10),
            authorDescLabel.trailingAnchor.constraint(equalTo: authorDescView.trailingAnchor, constant: -10)
        ])
    }
    
    @objc func closeAction(){
        backgroundView.backgroundColor = .systemBackground
        self.backgroundView.removeFromSuperview()
        self.authorDescView.frame =  CGRect(x: 0, y: 0, width: 0, height: 0)
        self.dataTable.isUserInteractionEnabled = true
        
        self.authorNameLabel.text = ""
        self.authorDescLabel.text = ""
        
        self.navigationController?.navigationBar.isUserInteractionEnabled = true
    }
}

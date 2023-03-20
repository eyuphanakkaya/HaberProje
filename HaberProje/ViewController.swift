//
//  ViewController.swift
//  HaberProje
//
//  Created by Eyüphan Akkaya on 20.03.2023.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var newsTableViewModel : NewsTableViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension /*boyutları düzenliyoruz */
        
        veriAl()

        
        // Do any additional setup after loading the view.
    }
    
    func veriAl() {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/BTK-iOSDataSet/master/dataset.json")
        
        Webservice().haberIndir(url: url!) { (haberler) in
            if let haberler = haberler {
                self.newsTableViewModel = NewsTableViewModel(newList: haberler)
                DispatchQueue.main.async {/*hangi treadtte çalışacağını söylüyoruz*/
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  newsTableViewModel == nil ? 0 :  self.newsTableViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsCell
        let newsViewModel = self.newsTableViewModel.newsAtIndexPath(indexPath.row)/*burada newsviewmodel türünden geri dönüş alacağımız için bunu yapıyoruz.*/
        cell.titleLabel.text =  newsViewModel.title
        cell.storyLabel.text = newsViewModel.story 
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension/*bütün işlemler otomatik olucak */
    }


}


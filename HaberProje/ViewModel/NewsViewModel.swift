//
//  NewsViewModel.swift
//  HaberProje
//
//  Created by Eyüphan Akkaya on 20.03.2023.
//

import Foundation


struct NewsTableViewModel {/*table view i tanımlıyoruz*/
    let newList : [News]
    
    func numberOfRowsInSection() -> Int {/*bana int türünde bir değer döndür*/
        return self.newList.count /*liste sayısı kadar döndür*/
    }
    func newsAtIndexPath(_ index: Int) -> NewsViewModel {
        let news = self.newList[index]/*kaçıncı indexteyse bana onu getir*/
        return NewsViewModel(news: news)/*news i newsview model içerisindeki news e ata*/
    }
}
struct NewsViewModel {
    let news : News
    
    var title : String {
        return self.news.title
    }
    var story : String {
        return self.news.story
    }
}

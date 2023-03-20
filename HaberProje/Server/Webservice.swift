//
//  Webservice.swift
//  HaberProje
//
//  Created by Eyüphan Akkaya on 20.03.2023.
//

import Foundation

class Webservice : Decodable {
    func haberIndir (url : URL , compilation : @escaping ([News]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error /*opsiyonel olarak error geldiği için */ {
                print(error.localizedDescription)
                compilation(nil)/*hata mesajı varsa boş değer döndür*/
            }else if let data = data {/*apsiyonel olduğu için dataya eşitliyoruz böylece opsiyonellikten de çıkmış oluyo*/
               
               let haberlerDizi = try? JSONDecoder().decode([News].self, from: data) /*gelen data news verisi olmalı ama şuan da json formatında bunu news e çevirmemiz lazım  */
                if let haberlerDizi = haberlerDizi {
                    compilation(haberlerDizi)
                }
                
            }
            
        }.resume() /*bütün bu işlemleri başlatmak için kullanıcaz*/
    }
}

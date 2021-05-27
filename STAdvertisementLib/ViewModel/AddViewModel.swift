//
//  AddViewModel.swift
//  STAdvertisementLib
//
//  Created by Sharetrip-iOS on 25/05/2021.
//

import Foundation

class AddViewModel {
    private let service: AddService
    private var addData: AddData?
    typealias CompletionCallBack = (_ success: Bool) -> Void
    
    init(service: AddService){
        self.service = service
    }
    
    func loadData(onCompletion: @escaping CompletionCallBack) {
        service.fetchAddData { (res) in
            switch res {
                case .success(let addData):
                    self.addData = addData
                    onCompletion(true)
                case .failure(let err):
                    print("Failure error", err)
                    onCompletion(false)
            }
        }
    }
    
    func getHTMLString() -> String {
        let script =  addData?.script ?? ""
        let style = "body {margin: 0px; padding: 0px; height: 100%; width:100%;} img {margin: 0px; padding: 0px; height: 100%; width:100%;}"
        let htmlString = Utils.generateHTML(content: script, style: style)
        return htmlString
    }
    
}

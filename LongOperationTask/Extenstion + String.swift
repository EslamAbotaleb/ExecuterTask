//
//  extenstion + String.swift
//  LongOperationTask
//
//  Created by Eslam Abotaleb on 18/06/2022.
//

import UIKit
extension String {
    func printTimestamp() -> String {
        let dateFormatter : DateFormatter = DateFormatter()
        //  dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.dateFormat = "yyyy-MMM-dd HH:mm:ss"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        return dateString
    }

}

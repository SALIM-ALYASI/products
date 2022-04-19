//
//  ProductsData+CoreDataProperties.swift
//  products
//
//  Created by الياسي on 19/04/2022.
//
//

import Foundation
import CoreData


extension ProductsData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductsData> {
        return NSFetchRequest<ProductsData>(entityName: "ProductsData")
    }

    @NSManaged public var noun: String?
    @NSManaged public var product_type: String?
    @NSManaged public var product_name: String?

}

extension ProductsData : Identifiable {

}

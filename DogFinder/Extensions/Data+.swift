//
//  Data+.swift
//  DogFinder
//
//  Created by Grace couch on 07/05/2024.
//

import Foundation

extension Data {
    func decode<DataModel: Decodable>(as type: DataModel.Type) throws -> DataModel {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let jsonData = try decoder.decode(DataModel.self, from: self)
        return jsonData
    }
}

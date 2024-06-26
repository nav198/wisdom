//
//  UrlHelper.swift
//  wisdomLeaf_Task
//
//  Created by admin on 26/06/24.
//

import Foundation
import UIKit


extension URLSession {
  func fetchData<T: Decodable>(for url: URL, completion: @escaping (Result<T, Error>) -> Void) {
    self.dataTask(with: url) { (data, response, error) in
      if let error = error {
          print("Error Main")
        completion(.failure(error))
      }

      if let data = data {
        do {
          let object = try JSONDecoder().decode(T.self, from: data)
          completion(.success(object))
        } catch let decoderError {
            print("decoderError \(decoderError)")
          completion(.failure(decoderError))
        }
      }
    }.resume()
  }
}

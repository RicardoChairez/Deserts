//
//  APIError.swift
//  Deserts
//
//  Created by Chip Chairez on 8/8/24.
//

import Foundation

enum APIError: Error {
    case connection, server, client, data
}

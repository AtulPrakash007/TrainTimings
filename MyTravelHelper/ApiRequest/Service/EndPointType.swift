//
//  EndPointType.swift
//  MyTravelHelper
//
//  Created by Atul Prakash on 16/12/2020.
//  Copyright © 2020 Sample. All rights reserved.
//

import Foundation

protocol EndPointType {
	var baseURL: URL { get }
	var path: String { get }
	var httpMethod: HTTPMethod { get }
	var task: HTTPTask { get }
	var headers: HTTPHeaders? { get }
}

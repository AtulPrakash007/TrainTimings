//
//  HTTPTask.swift
//  MyTravelHelper
//
//  Created by Atul Prakash on 16/12/2020.
//  Copyright © 2020 Sample. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String:String]

public enum HTTPTask {
	case request
	
	case requestParameters(bodyParameters: Parameters?,
		bodyEncoding: ParameterEncoding,
		urlParameters: Parameters?)
	
	case requestParametersAndHeaders(bodyParameters: Parameters?,
		bodyEncoding: ParameterEncoding,
		urlParameters: Parameters?,
		additionHeaders: HTTPHeaders?)
	
	// case download, upload...etc
}

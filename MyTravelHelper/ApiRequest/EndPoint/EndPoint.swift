//
//  EndPoint.swift
//  MyTravelHelper
//
//  Created by Atul Prakash on 16/12/2020.
//  Copyright © 2020 Sample. All rights reserved.
//

import Foundation


enum NetworkEnvironment {
	case qa
	case production
	case staging
}

public enum RailApi {
	case allStations(id: Int = 0)
	case stationData(code: String)
}

extension RailApi: EndPointType {
	
	var environmentBaseURL : String {
		switch NetworkManager.environment {
		case .production: return "http://api.irishrail.ie/realtime/realtime.asmx/"
		case .qa: return ""
		case .staging: return ""
		}
	}
	
	var baseURL: URL {
		guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
		return url
	}
	
	var path: String {
		switch self {
		case .allStations:
			return "getAllStationsXML"
		case .stationData:
			return "getStationDataByCodeXML"
		}
	}
	
	var httpMethod: HTTPMethod {
		return .get
	}
	
	var task: HTTPTask {
		switch self {
		case .stationData(let code):
			return .requestParameters(bodyParameters: nil,
									  bodyEncoding: .urlEncoding,
									  urlParameters: ["StationCode":code])
		default:
			return .request
		}
	}
	
	var headers: HTTPHeaders? {
		return nil
	}
}

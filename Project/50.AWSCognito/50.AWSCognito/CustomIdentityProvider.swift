//
//  CustomIdentityProvider.swift
//  50.AWSCognito
//
//  Created by Duy Nguyen on 2/9/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import AWSCore
import AWSCognitoIdentityProvider

final class CustomIdentityProvider: NSObject, AWSIdentityProviderManager {
    var tokens: [String : String]?
    
    init(tokens: [String : String]?) {
        self.tokens = tokens
    }
    
    /**
     Each entry in logins represents a single login with an identity provider.
     The key is the domain of the login provider (e.g. 'graph.facebook.com')
     and the value is the OAuth/OpenId Connect token that results from an authentication with that login provider.
     */
    func logins() -> AWSTask<NSDictionary> {
        let logins: NSDictionary = NSDictionary(dictionary: tokens ?? [:])
        return AWSTask(result: logins)
    }
}

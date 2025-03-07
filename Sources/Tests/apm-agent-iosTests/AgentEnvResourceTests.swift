// Copyright © 2023 Elasticsearch BV
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.

import Foundation

import XCTest
@testable import iOSAgent

class AgentEnvResourceTests : XCTestCase {
    func testAgentEnvResource() {
        XCTAssertTrue(AgentEnvResource.get().attributes.isEmpty)
        
        XCTAssertEqual(AgentEnvResource.get([AgentEnvResource.otelResourceAttributesEnv:"ENVAR=VALUE"]).attributes.count, 1)
        XCTAssertEqual(AgentEnvResource.get([AgentEnvResource.otelResourceAttributesEnv:"ENVAR=VALUE"]).attributes["ENVAR"]?.description, "VALUE")
        
        let resource = AgentEnvResource.get([AgentEnvResource.otelResourceAttributesEnv:"ENVAR=VALUE,ENVAR1=VALUE1"])
        
        XCTAssertEqual(resource.attributes["ENVAR1"]?.description, "VALUE1")
        XCTAssertEqual(resource.attributes["ENVAR"]?.description, "VALUE")
        
    }
}

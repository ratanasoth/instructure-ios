//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: sections.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import Foundation
import Dispatch
import SwiftGRPC
import SwiftProtobuf

public protocol Soseedy_SeedySectionsCreateSectionCall: ClientCallUnary {}

fileprivate final class Soseedy_SeedySectionsCreateSectionCallBase: ClientCallUnaryBase<Soseedy_CreateSectionRequest, Soseedy_Section>, Soseedy_SeedySectionsCreateSectionCall {
  override class var method: String { return "/soseedy.SeedySections/CreateSection" }
}


/// Instantiate Soseedy_SeedySectionsServiceClient, then call methods of this protocol to make API calls.
public protocol Soseedy_SeedySectionsService: ServiceClient {
  /// Synchronous. Unary.
  func createSection(_ request: Soseedy_CreateSectionRequest) throws -> Soseedy_Section
  /// Asynchronous. Unary.
  func createSection(_ request: Soseedy_CreateSectionRequest, completion: @escaping (Soseedy_Section?, CallResult) -> Void) throws -> Soseedy_SeedySectionsCreateSectionCall

}

public final class Soseedy_SeedySectionsServiceClient: ServiceClientBase, Soseedy_SeedySectionsService {
  /// Synchronous. Unary.
  public func createSection(_ request: Soseedy_CreateSectionRequest) throws -> Soseedy_Section {
    return try Soseedy_SeedySectionsCreateSectionCallBase(channel)
      .run(request: request, metadata: metadata)
  }
  /// Asynchronous. Unary.
  public func createSection(_ request: Soseedy_CreateSectionRequest, completion: @escaping (Soseedy_Section?, CallResult) -> Void) throws -> Soseedy_SeedySectionsCreateSectionCall {
    return try Soseedy_SeedySectionsCreateSectionCallBase(channel)
      .start(request: request, metadata: metadata, completion: completion)
  }

}

/// To build a server, implement a class that conforms to this protocol.
public protocol Soseedy_SeedySectionsProvider {
  func createSection(request: Soseedy_CreateSectionRequest, session: Soseedy_SeedySectionsCreateSectionSession) throws -> Soseedy_Section
}

public protocol Soseedy_SeedySectionsCreateSectionSession: ServerSessionUnary {}

fileprivate final class Soseedy_SeedySectionsCreateSectionSessionBase: ServerSessionUnaryBase<Soseedy_CreateSectionRequest, Soseedy_Section>, Soseedy_SeedySectionsCreateSectionSession {}


/// Main server for generated service
public final class Soseedy_SeedySectionsServer: ServiceServer {
  private let provider: Soseedy_SeedySectionsProvider

  public init(address: String, provider: Soseedy_SeedySectionsProvider) {
    self.provider = provider
    super.init(address: address)
  }

  public init?(address: String, certificateURL: URL, keyURL: URL, provider: Soseedy_SeedySectionsProvider) {
    self.provider = provider
    super.init(address: address, certificateURL: certificateURL, keyURL: keyURL)
  }

  public init?(address: String, certificateString: String, keyString: String, provider: Soseedy_SeedySectionsProvider) {
    self.provider = provider
    super.init(address: address, certificateString: certificateString, keyString: keyString)
  }

  /// Start the server.
  public override func handleMethod(_ method: String, handler: Handler, queue: DispatchQueue) throws -> Bool {
    let provider = self.provider
    switch method {
    case "/soseedy.SeedySections/CreateSection":
      try Soseedy_SeedySectionsCreateSectionSessionBase(
        handler: handler,
        providerBlock: { try provider.createSection(request: $0, session: $1 as! Soseedy_SeedySectionsCreateSectionSessionBase) })
          .run(queue: queue)
      return true
    default:
      return false
    }
  }
}


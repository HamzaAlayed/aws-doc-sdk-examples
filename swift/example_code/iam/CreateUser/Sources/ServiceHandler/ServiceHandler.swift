/*
   A class containing functions that interact with AWS services.
   
   Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
   SPDX-License-Identifier: Apache-2.0
*/

// snippet-start:[iam.swift.createuser.handler]
// snippet-start:[iam.swift.createuser.handler.imports]
import Foundation
import AWSIAM
import ClientRuntime
import AWSClientRuntime
// snippet-end:[iam.swift.createuser.handler.imports]

// snippet-start:[iam.swift.createuser.enum.service-error]

/// Errors returned by `ServiceHandler` functions.
enum ServiceError: Error {
    case noSuchUser             /// No matching user found, or unable to create the user.
}
// snippet-end:[iam.swift.createuser.enum.service-error]

/// A class containing all the code that interacts with the AWS SDK for Swift.
public class ServiceHandler {
    public let client: IamClient

    /// Initialize and return a new ``ServiceHandler`` object, which is used
    /// to drive the AWS calls used for the example. The region string
    /// `AWS_GLOBAL` is used because users are shared across all regions.
    ///
    /// - Returns: A new ``ServiceHandler`` object, ready to be called to
    ///            execute AWS operations.
    // snippet-start:[iam.swift.createuser.handler.init]
    public init() async {
        do {
            client = try IamClient(region: "AWS_GLOBAL")
        } catch {
            print("ERROR: ", dump(error, name: "Initializing Amazon IAM client"))
            exit(1)
        }
    }
    // snippet-end:[iam.swift.createuser.handler.init]

    /// Create a new IAM user.
    ///
    /// - Parameter name: The user's name.
    ///
    /// - Returns: The ID of the newly created user.
    // snippet-start:[iam.swift.createuser.handler.createuser]
    public func createUser(name: String) async throws -> String {
        let input = CreateUserInput(
            userName: name
        )
        do {
            let output = try await client.createUser(input: input)
            guard let user = output.user else {
                throw ServiceError.noSuchUser
            }
            guard let id = user.userId else {
                throw ServiceError.noSuchUser
            }
            return id
        } catch {
            throw error
        }
    }
    // snippet-end:[iam.swift.createuser.handler.createuser]
}
// snippet-end:[iam.swift.createuser.handler]

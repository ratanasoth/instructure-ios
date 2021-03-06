//
// Copyright (C) 2016-present Instructure, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//


import ReactiveSwift
import Marshal


extension UserEnrollment {
    public static func getUsers(enrolledInCourseWithID courseID: String, session: Session) throws -> SignalProducer<[JSONObject], NSError> {
        
        let parameters: [String: Any] = ["include": ["avatar_url"]]
        let request = try session.GET(ContextID.course(withID: courseID).apiPath/"enrollments", parameters: parameters)
        return session.paginatedJSONSignalProducer(request)
    }
}

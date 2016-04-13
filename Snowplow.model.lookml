# Copyright (c) 2013-2015 Snowplow Analytics Ltd. All rights reserved.
#
# This program is licensed to you under the Apache License Version 2.0,
# and you may not use this file except in compliance with the Apache License Version 2.0.
# You may obtain a copy of the Apache License Version 2.0 at http://www.apache.org/licenses/LICENSE-2.0.
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the Apache License Version 2.0 is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the Apache License Version 2.0 for the specific language governing permissions and limitations there under.
#
# Version: 3-0-0
#
# Authors: Yali Sassoon, Christophe Bogaert
# Copyright: Copyright (c) 2013-2015 Snowplow Analytics Ltd
# License: Apache License Version 2.0

- connection: caspian-live

- scoping: true                  # for backward compatibility
- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: events

  joins:
    - join: gigya_users
      type: left_outer
      relationship: many_to_one
      sql_on: ${events.user_id} = ${gigya_users.gigya_id}
    
    - join: snowplow_clicks
      type: inner
      relationship: many_to_many
      sql_on: ${events.event_id} = ${snowplow_clicks.root_id}
      
    - join: article_context
      type: inner
      relationship: one_to_one
      sql_on: ${events.event_id} = ${article_context.root_id}
      
    - join: sessions
      type: inner
      relationship: one_to_many
      sql_on: ${events.session_id} = ${sessions.session_id}
      
      
      
      
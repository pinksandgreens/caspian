# select
#   *,
#   (next_hit_time-hits.time)/1000 as hit_length_seconds,
# from
#   (
#   select
#     fullVisitorId,
#     visitId,
#     visitorId,
#     hits.type,
#     hits.time,
#     hits.hitNumber,
#     hits.page.hostname,
#     hits.page.pagePath,
#     -- create some keys to handle data later
#     concat(fullVisitorId,"_",string(visitId)) as session_key,
#     concat(fullVisitorId,"_",string(visitId),"_",string(hits.hitNumber),"_",string(hits.time)) as hit_key,
#     -- get max and min number of hits for each session
#     MAX(hits.hitNumber) WITHIN RECORD AS hits_hitNumber_max,
#     MIN(hits.hitNumber) WITHIN RECORD AS hits_hitNumber_min,
#     -- get min and max hit times to work out full session length
#     MAX(hits.time) WITHIN RECORD AS hits_time_max,
#     MIN(hits.time) WITHIN RECORD AS hits_time_min,
#     -- get next and previous hit time to be able to work out length of each hit
#     LAG(hits.time, 1) OVER (PARTITION BY fullVisitorId, visitId ORDER BY hits.time ASC) as previous_hit_time,
#     LEAD(hits.time, 1) OVER (PARTITION BY fullVisitorId, visitId ORDER BY hits.time ASC) as next_hit_time,
#   from
#     [uplifted-light-89310:25170071.ga_sessions_20161214]
#   )


- view: odin_es_agg
  derived_table:
    sql: |
      SELECT DISTINCT
        t2.email AS email_address,
        CASE
      WHEN (
        (
          ("max"(t4.date_entered)) :: CHARACTER VARYING
        ) :: TEXT = ((0) :: CHARACTER VARYING) :: TEXT
      ) THEN
        '0' :: CHARACTER VARYING
      ELSE
        CASE
      WHEN (
        (
          (
            ("max"(t4.date_entered)) :: CHARACTER VARYING
          ) :: TEXT > ((0) :: CHARACTER VARYING) :: TEXT
        )
        AND (
          (
            ("max"(t4.date_entered)) :: CHARACTER VARYING
          ) :: TEXT <= ((4) :: CHARACTER VARYING) :: TEXT
        )
      ) THEN
        '1-4' :: CHARACTER VARYING
      ELSE
        CASE
      WHEN (
        (
          (
            ("max"(t4.date_entered)) :: CHARACTER VARYING
          ) :: TEXT > ((4) :: CHARACTER VARYING) :: TEXT
        )
        AND (
          (
            ("max"(t4.date_entered)) :: CHARACTER VARYING
          ) :: TEXT <= ((9) :: CHARACTER VARYING) :: TEXT
        )
      ) THEN
        '5-9' :: CHARACTER VARYING
      ELSE
        CASE
      WHEN (
        (
          (
            ("max"(t4.date_entered)) :: CHARACTER VARYING
          ) :: TEXT > ((9) :: CHARACTER VARYING) :: TEXT
        )
        AND (
          (
            ("max"(t4.date_entered)) :: CHARACTER VARYING
          ) :: TEXT <= ((14) :: CHARACTER VARYING) :: TEXT
        )
      ) THEN
        '10-14' :: CHARACTER VARYING
      ELSE
        CASE
      WHEN (
        (
          (
            ("max"(t4.date_entered)) :: CHARACTER VARYING
          ) :: TEXT > ((14) :: CHARACTER VARYING) :: TEXT
        )
        AND (
          (
            ("max"(t4.date_entered)) :: CHARACTER VARYING
          ) :: TEXT <= ((19) :: CHARACTER VARYING) :: TEXT
        )
      ) THEN
        '15-19' :: CHARACTER VARYING
      ELSE
        CASE
      WHEN (
        (
          (
            ("max"(t4.date_entered)) :: CHARACTER VARYING
          ) :: TEXT > ((19) :: CHARACTER VARYING) :: TEXT
        )
        AND (
          (
            ("max"(t4.date_entered)) :: CHARACTER VARYING
          ) :: TEXT <= ((29) :: CHARACTER VARYING) :: TEXT
        )
      ) THEN
        '20-29' :: CHARACTER VARYING
      ELSE
        CASE
      WHEN (
        (
          (
            ("max"(t4.date_entered)) :: CHARACTER VARYING
          ) :: TEXT > ((29) :: CHARACTER VARYING) :: TEXT
        )
        AND (
          (
            ("max"(t4.date_entered)) :: CHARACTER VARYING
          ) :: TEXT <= ((39) :: CHARACTER VARYING) :: TEXT
        )
      ) THEN
        '30-39' :: CHARACTER VARYING
      ELSE
        '40+' :: CHARACTER VARYING
      END
      END
      END
      END
      END
      END
      END AS competitontotalnumber,
       MIN (t4.date_entered) AS competitonfirstenteredts,
       "max" (t4.date_entered) AS competitonlastenteredts,
       CASE
      WHEN (
        "date_part" (
          ('months' :: CHARACTER VARYING) :: TEXT,
          "max" (t4.date_entered)
        ) <= 3
      ) THEN
        '0-3' :: CHARACTER VARYING
      ELSE
        CASE
      WHEN (
        (
          "date_part" (
            ('months' :: CHARACTER VARYING) :: TEXT,
            "max" (t4.date_entered)
          ) > 3
        )
        AND (
          "date_part" (
            ('months' :: CHARACTER VARYING) :: TEXT,
            "max" (t4.date_entered)
          ) <= 6
        )
      ) THEN
        '3-6' :: CHARACTER VARYING
      ELSE
        CASE
      WHEN (
        (
          "date_part" (
            ('months' :: CHARACTER VARYING) :: TEXT,
            "max" (t4.date_entered)
          ) > 6
        )
        AND (
          "date_part" (
            ('months' :: CHARACTER VARYING) :: TEXT,
            "max" (t4.date_entered)
          ) <= 9
        )
      ) THEN
        '6-9' :: CHARACTER VARYING
      ELSE
        CASE
      WHEN (
        (
          "date_part" (
            ('months' :: CHARACTER VARYING) :: TEXT,
            "max" (t4.date_entered)
          ) > 9
        )
        AND (
          "date_part" (
            ('months' :: CHARACTER VARYING) :: TEXT,
            "max" (t4.date_entered)
          ) <= 12
        )
      ) THEN
        '9-12' :: CHARACTER VARYING
      ELSE
        NULL :: CHARACTER VARYING
      END
      END
      END
      END AS competitonregencybanding,
       CASE
      WHEN (COUNT(t5. ID) > 3) THEN
        'Y' :: CHARACTER VARYING
      ELSE
        'N' :: CHARACTER VARYING
      END AS comper30days,
       CASE
      WHEN (COUNT(t6.ugcoriginlink) > 0) THEN
        'Y' :: CHARACTER VARYING
      ELSE
        'N' :: CHARACTER VARYING
      END AS ugcparticaptor
      FROM
        (
          (
            (
              (
                (
                  publications.identities_keys t1
                  LEFT JOIN publications.identities t2 ON (
                    (
                      (t1.idd_key_id = t2.idd_id)
                      AND (
                        (t1."type") :: TEXT = (t2.created_by) :: TEXT
                      )
                    )
                  )
                )
                JOIN publications.es_users t3 ON (
                  (
                    (t3.user_id) :: TEXT = (t1. VALUE) :: TEXT
                  )
                )
              )
              JOIN publications.es_competition_entries t4 ON (
                (
                  (
                    (t4.user_id) :: TEXT = (t3.user_id) :: TEXT
                  )
                  AND (
                    t4.date_entered > (
                      ('now' :: CHARACTER VARYING) :: TIMESTAMP WITHOUT TIME ZONE - '1 year' :: INTERVAL
                    )
                  )
                )
              )
            )
            JOIN publications.es_competitions t5 ON (
              (
                (t5. ID) :: TEXT = (t4.competition_id) :: TEXT
              )
            )
          )
          LEFT JOIN responsys.odin_ugcoriginlink_in_last_90days t6 ON (
            (
              (t6.user_id) :: TEXT = (t4.user_id) :: TEXT
            )
          )
        )
      GROUP BY
        t2.email
      ORDER BY
        t2.email;

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: email_address
    type: string
    sql: ${TABLE}.email_address

  - dimension: competitontotalnumber
    type: string
    sql: ${TABLE}.competitontotalnumber

  - dimension_group: competitonfirstenteredts
    type: time
    sql: ${TABLE}.competitonfirstenteredts

  - dimension_group: competitonlastenteredts
    type: time
    sql: ${TABLE}.competitonlastenteredts

  - dimension: competitonregencybanding
    type: string
    sql: ${TABLE}.competitonregencybanding

  - dimension: "comper30days"
    type: string
    sql: ${TABLE}.comper30days

  - dimension: ugcparticaptor
    type: string
    sql: ${TABLE}.ugcparticaptor

  sets:
    detail:
      - email_address
      - competitontotalnumber
      - competitonfirstenteredts_time
      - competitonlastenteredts_time
      - competitonregencybanding
      - comper30days
      - ugcparticaptor


view: es_competition_entries_banded_30_days {
  derived_table: {
    sql: SELECT
        email,
        CASE
          WHEN entries = 0 THEN '0'
          WHEN entries > 0 AND entries <= 4 THEN '1-4'
          WHEN entries > 4 AND entries <= 9 THEN '5-9'
          WHEN entries > 4 AND entries <= 9 THEN '10-14'
          WHEN entries > 4 AND entries <= 9 THEN '15-19'
          WHEN entries > 4 AND entries <= 9 THEN '20-29'
          WHEN entries > 4 AND entries <= 9 THEN '30-39'
          ELSE '40+'
        END AS entries_banded
      FROM (
        SELECT
          identities.email,
          COUNT(identities.email) AS entries
        FROM publications.es_users
        INNER JOIN publications.es_competition_entries ON es_competition_entries.user_id = es_users.user_id
        INNER JOIN publications.identities_keys ON identities_keys.value = es_users.user_id
        INNER JOIN publications.identities ON identities.idd_id = identities_keys.idd_key_id
        WHERE DATEDIFF('day', date_entered, CURRENT_DATE) <= 30
        GROUP BY identities.email
      ) entries
       ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
  }

  dimension: email {
    hidden: yes
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: entries_banded {
    hidden: yes
    type: string
    sql: ${TABLE}.entries_banded ;;
  }

  set: detail {
    fields: [email, entries_banded]
  }
}

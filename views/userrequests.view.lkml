view: userrequests {
  sql_table_name: `telecom-intelligent-cx.garageVirtualAgent2_datasets.user-requests`
    ;;

  dimension: created_by {
    type: string
    description: "Created By"
    sql: ${TABLE}.created_by ;;
  }

  dimension_group: creation {
    type: time
    description: "Creation Date"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.creation_date ;;
  }

  dimension: credits_estimated {
    type: string
    description: "Credits Estimated (USD)"
    sql: ${TABLE}.credits_estimated ;;
  }

  dimension: description {
    type: string
    description: "Description"
    sql: ${TABLE}.description ;;
  }

  dimension: email_id {
    type: string
    description: "Email ID"
    sql: ${TABLE}.email_id ;;
  }

  dimension: employee_id {
    type: number
    description: "Employee ID"
    sql: ${TABLE}.employee_id ;;
  }

  dimension: gcp_project_name {
    type: string
    description: "GCP Project Name"
    sql: ${TABLE}.gcp_project_name ;;
  }

  dimension: gcp_services {
    type: string
    description: "GCP Services"
    sql: ${TABLE}.gcp_services ;;
  }

  dimension_group: last_modified {
    type: time
    description: "Last Modified Date"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: last_modified_user {
    type: string
    description: "Last Modified User"
    sql: ${TABLE}.last_modified_user ;;
  }

  dimension: potential_revenue {
    type: string
    description: "Potential Revenue (USD)"
    sql: ${TABLE}.potential_revenue ;;
  }

  dimension: remarks {
    type: string
    description: "Remarks"
    sql: ${TABLE}.remarks ;;
  }

  dimension_group: request {
    type: time
    description: "Request Date"
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.request_date ;;
  }

  dimension: request_id {
    type: string
    description: "Request ID"
    sql: ${TABLE}.request_id ;;
  }

  dimension: status {
    type: string
    description: "Status of the request"
    sql: ${TABLE}.status ;;
  }

  dimension: tag_id {
    type: string
    description: "Tag ID"
    sql: ${TABLE}.tag_id ;;
  }

  dimension: targeted_audiences {
    type: string
    description: "Targeted Audiences"
    sql: ${TABLE}.targeted_audiences ;;
  }

  dimension: usecase_name {
    type: string
    description: "Use Case Name"
    sql: ${TABLE}.usecase_name ;;
  }

  measure: count {
    type: count
    drill_fields: [usecase_name, gcp_project_name]
  }
}

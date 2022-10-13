view: userrequests {
  sql_table_name: `telecom-intelligent-cx.garageVirtualAgent2_datasets.user-requests`
    ;;

  dimension: created_by {
    type: string
    label: "Created By"
    sql: ${TABLE}.created_by ;;
  }

  dimension_group: creation {
    type: time
    label: "Creation Date"
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
    label: "Credits Estimated (USD)"
    sql: ${TABLE}.credits_estimated ;;
  }

  dimension: description {
    type: string
    label: "Description"
    sql: ${TABLE}.description ;;
  }

  dimension: email_id {
    type: string
    label: "Email ID"
    sql: ${TABLE}.email_id ;;
  }

  dimension: employee_id {
    type: number
    label: "Employee ID"
    sql: ${TABLE}.employee_id ;;
  }

  dimension: gcp_project_name {
    type: string
    label: "GCP Project Name"
    sql: ${TABLE}.gcp_project_name ;;
  }

  dimension: gcp_services {
    type: string
    label: "GCP Services"
    sql: ${TABLE}.gcp_services ;;
  }

  dimension_group: last_modified {
    type: time
    label: "Last Modified Date"
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
    label: "Last Modified User"
    sql: ${TABLE}.last_modified_user ;;
  }

  dimension: potential_revenue {
    type: string
    label: "Potential Revenue (USD)"
    sql: ${TABLE}.potential_revenue ;;
  }

  dimension: remarks {
    type: string
    label: "Remarks"
    sql: ${TABLE}.remarks ;;
  }

  dimension_group: request {
    type: time
    label: "Request Date"
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

  dimension: request_date_format {
    type: string
    label: "Request Date"
    sql: format_date('%d-%b-%y',${TABLE}.request_date);;
  }

  dimension: request_id {
    type: string
    label: "Request ID"
    sql: ${TABLE}.request_id ;;
  }

  dimension: status {
    type: string
    label: "Status"
    sql: ${TABLE}.status ;;
    html:
    {% if status._value == 'open' and time_from_creation_dt._value > 48 %}
        <p style="font-weight: bold;color: red; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% else  %}
        <p style="font-weight: bold; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %};;

  }

  dimension: tag_id {
    type: string
    label: "Request Name"
    sql: ${TABLE}.tag_id ;;
  }

  dimension: targeted_audiences {
    type: string
    label: "Targeted Audiences"
    sql: ${TABLE}.targeted_audiences ;;
  }

  dimension: usecase_name {
    type: string
    label: "Use Case Name"
    sql: ${TABLE}.usecase_name ;;
  }

  dimension: time_from_creation_dt {
    type: number
    sql: TIMESTAMP_DIFF( CURRENT_TIMESTAMP() ,  TIMESTAMP(${TABLE}.creation_date), HOUR) ;;
  }

  measure: count {
    type: count
    drill_fields: [usecase_name, gcp_project_name]
  }
}

connection: "the_look"
# testing
#
# # include all the views
# include: "*.view"
#
# # include all the dashboards
# #include: "*.dashboard"
#
# # datagroup: hourly_datagroup {
# # sql_trigger: SELECT DATE_PART('hour', NOW()) ;; # Updates hourly
# # max_cache_age: "1 hour"
# # }
#
# explore: auditdata_and_hesinputdata_pdt {
#   label: "Physical Audit Data"
#   description: "Explore all the physical audit data and create reports."
# }
#
# explore: complete_program_data {
#   label: "Manage Data"
#   description: "Explore all Manage data and create reports."
#   view_name: project
#
#   join: project_log_pdt {
#     type: left_outer
#     sql_on: ${project.id} = ${project_log_pdt.project_id} ;;
#     relationship: one_to_many
#     view_label: "Project"
#   }
#
#   join: participant {
#     type: left_outer
#     sql_on: ${project.participant_id} = ${participant.id} ;;
#     relationship: one_to_one #
#     view_label: "Project"
#   }
#
#   join: premise {
#     type: left_outer
#     sql_on: ${project.premise_id} = ${premise.id} ;;
#     relationship: one_to_one #
#     view_label: "Project"
#   }
#
#   join: county {
#     type: left_outer
#     sql_on: ${premise.county_id} = ${county.id} ;;
#     relationship: one_to_one #
#     view_label: "Project"
#   }
#
#   join: application {
#     type: left_outer
#     sql_on: ${project.application_id} = ${application.id} ;; # Application is joined to Project
#     relationship: many_to_one # one Application can link to multiple Projects
#     view_label: "Application"
#   }
#
#   join: application_initial_contractor {
#     type: left_outer
#     sql_on: ${application.initial_contractor} = ${application_initial_contractor.id} ;;
#     relationship: one_to_one
#     view_label: "Application"
#   }
#
# # join: application_campaign {
# # from: campaign
# # sql_on: ${application.campaign_id} = ${application_campaign.id} ;;
# # relationship: one_to_one
# # view_label: "Application"
# # }
#
#   join: task {
#     sql_on: ${task.project_id} = ${project.id} ;; # Task is joined to Project
#     relationship: many_to_one # one Project can have multiple Tasks
#     view_label: "Task Details"
#   }
#
#   join: partner {
#     sql_on: ${task.partner_id} = ${partner.id} ;; # Partner is joined to Task
#     relationship: many_to_one # one Partner can work on multiple Tasks
#     view_label: "Partner"
#   }
#
#   join: partner_user {
#     sql_on: ${partner.id} = ${partner_user.partner_id} ;; # Partner is joined to Task
#     relationship: one_to_one # one Partner can work on multiple Tasks
#     view_label: "Partner"
#   }
#
#   join: partner_campaign_ids { # Intermediary table used to join the Campaign table to the Partner table
#     from: partner_campaign
#     sql_on: ${partner.id} = ${partner_campaign_ids.partner_id};;
#     relationship: one_to_one
#     fields: [] # This join is hidden from users
#   }
#
# # join: partner_campaign {
# # from: campaign
# # sql_on: ${partner_campaign_ids.campaign_id} = ${partner_campaign.id} ;;
# # relationship: one_to_many
# # view_label: "Partner"
# # }
#
#   join: chunk_data {
#     type: left_outer
#     sql_on: ${project.id} = ${chunk_data.project_id} ;; # Chunk Data is joined to Project
#     relationship: one_to_one # one Project can only have one Chunk Data
#   }
#
#   join: date_and_time_of_audit {
#     type: left_outer
#     sql_on: ${chunk_data.id} = ${date_and_time_of_audit.chunk_id};;
#     relationship: one_to_one
#     view_label: "Audit Date, Time & Partner"
#   }
#
#   join: audit_task_partners {
#     type: left_outer
#     sql_on: ${project.id} = ${audit_task_partners.project_id} ;;
#     relationship: one_to_one
#     view_label: "Audit Date, Time & Partner"
#   }
#
#   join: primary_secondary_audit_task_partners {
#     type: left_outer
#     sql_on: ${project.id} = ${primary_secondary_audit_task_partners.project_id} ;;
#     relationship: one_to_many
#     view_label: "Audit Date, Time & Partner"
#   }
#
#   join: processor_name {
#     type: left_outer
#     sql_on: ${processor_name.project_id} = ${project.id} ;;
#     relationship: one_to_one
#     view_label: "Task Inputs"
#   }
#
#   join: thermostat_assigned_contractor {
#     type: left_outer
#     sql_on: ${thermostat_assigned_contractor.project_id} = ${project.id} ;;
#     relationship: one_to_one
#     view_label: "Task Inputs"
#   }
#
#   join: project_closed_complete_date {
#     type: left_outer
#     sql_on: ${project.id} = ${project_closed_complete_date.project_id} ;;
#     relationship: one_to_one
#     view_label: "Project"
#   }
#
#   join: project_closed_removed_date {
#     type: left_outer
#     sql_on: ${project.id} = ${project_closed_removed_date.project_id} ;;
#     relationship: one_to_one
#     view_label: "Project"
#   }
#
#   join: hes_api_call {
#     type: left_outer
#     sql_on: ${project.id} = ${hes_api_call.project_id} ;;
#     relationship: one_to_one
#     view_label: "HEScore Data"
#   }
#
# # ----- START Project Note Joins -----
#
#   join: project_note {
#     type: left_outer
#     sql_on: ${project.id} = ${project_note.project_id} ;;
#     relationship: one_to_many
#     view_label: "Project"
#   }
#
#   join: project_note_partner { # This join was created so we could create the partner_name dimension in project_note table.
#     from: project_note
#     type: left_outer
#     sql_on: ${project_note_partner.to_partner_id} = ${partner.id} ;;
#     relationship: one_to_many
#     fields: [] # This join is hidden from users.
#   }
#
#   join: project_note_task { # This join was created so we could create the task_name dimension in project_note table.
#     from: project_note
#     type: left_outer
#     sql_on: ${project_note_task.task_id} = ${task.id} ;;
#     relationship: one_to_many
#     fields: [] # This join is hidden from users.
#   }
#
# # ----- END Project Note Joins -----
#
# # ----- START HPwES Measures -----
#
#   join: hpwes_measures {
#     type: left_outer
#     sql_on: ${project.id} = ${hpwes_measures.project_id};;
#     relationship: one_to_one
#     view_label: "Measures - HPwES"
#   }
#
#   join: hpwes_measures_savings {
#     from: measure_savings
#     type: left_outer
#     sql_on: ${hpwes_measures.measure_id} = ${hpwes_measures_savings.measure_id};;
#     relationship: one_to_one
#     view_label: "Measures - HPwES"
#   }
#
# # ----- END HPwES Measures -----
#
# # ----- START Non-HPwES Measures -----
#
#   join: non_hpwes_proposal_measures {
#     type: left_outer
#     sql_on: ${project.id} = ${non_hpwes_proposal_measures.project_id};;
#     relationship: one_to_one
#     view_label: "Measures - Non-HPwES Proposal"
#   }
#
#   join: non_hpwes_proposal_measure_savings {
#     from: measure_savings
#     type: left_outer
#     sql_on: ${non_hpwes_proposal_measures.measure_id} = ${non_hpwes_proposal_measure_savings.measure_id};;
#     relationship: one_to_one
#     view_label: "Measures - Non-HPwES Proposal"
#   }
#
#   join: non_hpwes_verify_obrp_measures {
#     type: left_outer
#     sql_on: ${project.id} = ${non_hpwes_verify_obrp_measures.project_id};;
#     relationship: one_to_one
#     view_label: "Measures - Non-HPwES Verify OBRP"
#   }
#
#   join: non_hpwes_verify_obrp_measure_savings {
#     from: measure_savings
#     type: left_outer
#     sql_on: ${non_hpwes_verify_obrp_measures.measure_id} = ${non_hpwes_verify_obrp_measure_savings.measure_id};;
#     relationship: one_to_one
#     view_label: "Measures - Non-HPwES Verify OBRP"
#   }
#
# # ----- END Non-HPwES Measures -----
#
# # ----- START Thermostat Measures -----
#
#   join: thermostat_measures {
#     type: left_outer
#     sql_on: ${project.id} = ${thermostat_measures.project_id};;
#     relationship: one_to_one
#     view_label: "Measures - Thermostat"
#   }
#
#   join: thermostat_measure_savings {
#     from: measure_savings
#     type: left_outer
#     sql_on: ${thermostat_measures.measure_id} = ${thermostat_measure_savings.measure_id};;
#     relationship: one_to_one
#     view_label: "Measures - Thermostat"
#   }
#
# # ----- END Thermostat Measures -----
#
# # ----- START Additional Systems -----
#
#   join: additional_cooling_systems_pdt {
#     type: left_outer
#     sql_on: ${project.id} = ${additional_cooling_systems_pdt.project_id};;
#     relationship: one_to_one
#     view_label: "Additional Systems"
#   }
#
#   join: additional_heating_systems_pdt {
#     type: left_outer
#     sql_on: ${project.id} = ${additional_heating_systems_pdt.project_id};;
#     relationship: one_to_one
#     view_label: "Additional Systems"
#   }
#
#   join: additional_water_heaters_pdt {
#     type: left_outer
#     sql_on: ${project.id} = ${additional_water_heaters_pdt.project_id};;
#     relationship: one_to_one
#     view_label: "Additional Systems"
#   }
#
# # ----- END Additional Systems -----
# }
#
# explore: partner_schedule {
#   from: partner
#   label: "Partner Schedule"
#   view_label: "Partner"
#   description: "Explore the partner schedules set in Manage."
#
#   join: partner_schedule_exceptions {
#     type: inner
#     sql_on: ${partner_schedule.id} = ${partner_schedule_exceptions.partner_id};;
#     relationship: one_to_many
#     view_label: "Partner Schedule Exceptions"
#   }
#
#   join: partner_schedule_availability {
#     type: inner
#     sql_on: ${partner_schedule.id} = ${partner_schedule_availability.partner_id};;
#     relationship: one_to_many
#     view_label: "Partner Schedule Availability"
#   }
#
# }
#
# explore: complete_customer_data {
#   view_name: cds_customer_meter
#   label: "Customer Data"
#   description: "Explore NJNG customer account, marketplace, and behavioral data."
#
#   join: cds_account {
#     sql_on: ${cds_customer_meter.cds_account_id} = ${cds_account.id};;
#     relationship: many_to_one
#     view_label: "Customer Data"
#   }
#
#   join: cds_person{
#     sql_on: ${cds_account.cds_person_id} = ${cds_person.id};;
#     relationship: many_to_one
#     view_label: "Customer Data"
#   }
#
#   join: cds_premise {
#     sql_on: ${cds_customer_meter.cds_premise_id} = ${cds_premise.id};;
#     relationship: many_to_one
#     view_label: "Customer Data"
#   }
#
#   join: marketplace_pdt {
#     sql_on: ${cds_account.id} = ${marketplace_pdt.account_id};;
#     relationship: one_to_many
#     view_label: "Marketplace Data"
#   }
#
#   join: behavioral_pdt {
#     sql_on: ${cds_account.id} = ${behavioral_pdt.account_id};;
#     relationship: one_to_many
#     view_label: "Behavioral Data"
#   }
#
# # ----- Filters -----
#
#   join: filter_marketplace_behavioral_pdt {
#     sql_on: ${cds_account.id} = ${filter_marketplace_behavioral_pdt.cds_account_id};;
#     relationship: one_to_many
#     view_label: "Filters"
#   }
#
# # ----- END Filters -----
# }
#
#
# explore: complete_customer_and_manage_data {
#   extends: [complete_customer_data, complete_program_data]
#   label: "Customer & Manage Data"
#   description: "Explore all data available for a customer including Manage, customer account, marketplace, and behavioral data."
#
#   join: cds_account_id_and_service_id_concat_pdt {
#     sql_on: ${cds_customer_meter.id} = ${cds_account_id_and_service_id_concat_pdt.id};;
#     relationship: one_to_many
#   }
#
#   join: project {
#     sql_on: ${cds_account_id_and_service_id_concat_pdt.account_id_service_id_concat} = concat(trim(Leading '0' from ${project.primary_account_number}), trim(Leading '0' from ${project.service_account_number}));;
#     relationship: one_to_many
#     view_label: "Manage: Project"
#   }
#
# }

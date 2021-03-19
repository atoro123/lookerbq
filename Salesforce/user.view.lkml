view: user {
  sql_table_name: `stitch-poc-306316.salesforce.User`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: _sdc_batched {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._sdc_batched_at ;;
  }

  dimension_group: _sdc_extracted {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._sdc_extracted_at ;;
  }

  dimension_group: _sdc_received {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._sdc_received_at ;;
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
  }

  dimension: bannerphotourl {
    type: string
    sql: ${TABLE}.bannerphotourl ;;
  }

  dimension: companyname {
    type: string
    sql: ${TABLE}.companyname ;;
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}.createdbyid ;;
  }

  dimension_group: createddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.createddate ;;
  }

  dimension: defaultgroupnotificationfrequency {
    type: string
    sql: ${TABLE}.defaultgroupnotificationfrequency ;;
  }

  dimension: delegatedapproverid {
    type: string
    sql: ${TABLE}.delegatedapproverid ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: digestfrequency {
    type: string
    sql: ${TABLE}.digestfrequency ;;
  }

  dimension: emailpreferencesautobcc {
    type: yesno
    sql: ${TABLE}.emailpreferencesautobcc ;;
  }

  dimension: emailpreferencesautobccstayintouch {
    type: yesno
    sql: ${TABLE}.emailpreferencesautobccstayintouch ;;
  }

  dimension: emailpreferencesstayintouchreminder {
    type: yesno
    sql: ${TABLE}.emailpreferencesstayintouchreminder ;;
  }

  dimension: forecastenabled {
    type: yesno
    sql: ${TABLE}.forecastenabled ;;
  }

  dimension: isactive {
    type: yesno
    sql: ${TABLE}.isactive ;;
  }

  dimension: isextindicatorvisible {
    type: yesno
    sql: ${TABLE}.isextindicatorvisible ;;
  }

  dimension: isportalenabled {
    type: yesno
    sql: ${TABLE}.isportalenabled ;;
  }

  dimension: languagelocalekey {
    type: string
    sql: ${TABLE}.languagelocalekey ;;
  }

  dimension_group: lastlogindate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.lastlogindate ;;
  }

  dimension: lastmodifiedbyid {
    type: string
    sql: ${TABLE}.lastmodifiedbyid ;;
  }

  dimension_group: lastmodifieddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.lastmodifieddate ;;
  }

  dimension_group: lastreferenceddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.lastreferenceddate ;;
  }

  dimension_group: lastvieweddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.lastvieweddate ;;
  }

  dimension: localesidkey {
    type: string
    sql: ${TABLE}.localesidkey ;;
  }

  dimension: managerid {
    type: string
    sql: ${TABLE}.managerid ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: profileid {
    type: string
    sql: ${TABLE}.profileid ;;
  }

  dimension: receivesadmininfoemails {
    type: yesno
    sql: ${TABLE}.receivesadmininfoemails ;;
  }

  dimension: receivesinfoemails {
    type: yesno
    sql: ${TABLE}.receivesinfoemails ;;
  }

  dimension_group: systemmodstamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.systemmodstamp ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: userpermissionscallcenterautologin {
    type: yesno
    sql: ${TABLE}.userpermissionscallcenterautologin ;;
  }

  dimension: userpermissionschatteranswersuser {
    type: yesno
    sql: ${TABLE}.userpermissionschatteranswersuser ;;
  }

  dimension: userpermissionsinteractionuser {
    type: yesno
    sql: ${TABLE}.userpermissionsinteractionuser ;;
  }

  dimension: userpermissionsmarketinguser {
    type: yesno
    sql: ${TABLE}.userpermissionsmarketinguser ;;
  }

  dimension: userpermissionsmobileuser {
    type: yesno
    sql: ${TABLE}.userpermissionsmobileuser ;;
  }

  dimension: userpermissionsofflineuser {
    type: yesno
    sql: ${TABLE}.userpermissionsofflineuser ;;
  }

  dimension: userpermissionssfcontentuser {
    type: yesno
    sql: ${TABLE}.userpermissionssfcontentuser ;;
  }

  dimension: userpermissionssupportuser {
    type: yesno
    sql: ${TABLE}.userpermissionssupportuser ;;
  }

  dimension: userpreferencesactivityreminderspopup {
    type: yesno
    sql: ${TABLE}.userpreferencesactivityreminderspopup ;;
  }

  dimension: userpreferencesapexpagesdevelopermode {
    type: yesno
    sql: ${TABLE}.userpreferencesapexpagesdevelopermode ;;
  }

  dimension: userpreferencescachediagnostics {
    type: yesno
    sql: ${TABLE}.userpreferencescachediagnostics ;;
  }

  dimension: userpreferencescontentemailasandwhen {
    type: yesno
    sql: ${TABLE}.userpreferencescontentemailasandwhen ;;
  }

  dimension: userpreferencescontentnoemail {
    type: yesno
    sql: ${TABLE}.userpreferencescontentnoemail ;;
  }

  dimension: userpreferencescreatelexappswtshown {
    type: yesno
    sql: ${TABLE}.userpreferencescreatelexappswtshown ;;
  }

  dimension: userpreferencesdisableallfeedsemail {
    type: yesno
    sql: ${TABLE}.userpreferencesdisableallfeedsemail ;;
  }

  dimension: userpreferencesdisablebookmarkemail {
    type: yesno
    sql: ${TABLE}.userpreferencesdisablebookmarkemail ;;
  }

  dimension: userpreferencesdisablechangecommentemail {
    type: yesno
    sql: ${TABLE}.userpreferencesdisablechangecommentemail ;;
  }

  dimension: userpreferencesdisableendorsementemail {
    type: yesno
    sql: ${TABLE}.userpreferencesdisableendorsementemail ;;
  }

  dimension: userpreferencesdisablefilesharenotificationsforapi {
    type: yesno
    sql: ${TABLE}.userpreferencesdisablefilesharenotificationsforapi ;;
  }

  dimension: userpreferencesdisablefollowersemail {
    type: yesno
    sql: ${TABLE}.userpreferencesdisablefollowersemail ;;
  }

  dimension: userpreferencesdisablelatercommentemail {
    type: yesno
    sql: ${TABLE}.userpreferencesdisablelatercommentemail ;;
  }

  dimension: userpreferencesdisablelikeemail {
    type: yesno
    sql: ${TABLE}.userpreferencesdisablelikeemail ;;
  }

  dimension: userpreferencesdisablementionspostemail {
    type: yesno
    sql: ${TABLE}.userpreferencesdisablementionspostemail ;;
  }

  dimension: userpreferencesdisablemessageemail {
    type: yesno
    sql: ${TABLE}.userpreferencesdisablemessageemail ;;
  }

  dimension: userpreferencesdisableprofilepostemail {
    type: yesno
    sql: ${TABLE}.userpreferencesdisableprofilepostemail ;;
  }

  dimension: userpreferencesdisablesharepostemail {
    type: yesno
    sql: ${TABLE}.userpreferencesdisablesharepostemail ;;
  }

  dimension: userpreferencesdiscommentafterlikeemail {
    type: yesno
    sql: ${TABLE}.userpreferencesdiscommentafterlikeemail ;;
  }

  dimension: userpreferencesdismentionscommentemail {
    type: yesno
    sql: ${TABLE}.userpreferencesdismentionscommentemail ;;
  }

  dimension: userpreferencesdisprofpostcommentemail {
    type: yesno
    sql: ${TABLE}.userpreferencesdisprofpostcommentemail ;;
  }

  dimension: userpreferencesenableautosubforfeeds {
    type: yesno
    sql: ${TABLE}.userpreferencesenableautosubforfeeds ;;
  }

  dimension: userpreferenceseventreminderscheckboxdefault {
    type: yesno
    sql: ${TABLE}.userpreferenceseventreminderscheckboxdefault ;;
  }

  dimension: userpreferencesexcludemailappattachments {
    type: yesno
    sql: ${TABLE}.userpreferencesexcludemailappattachments ;;
  }

  dimension: userpreferencesfavoritesshowtopfavorites {
    type: yesno
    sql: ${TABLE}.userpreferencesfavoritesshowtopfavorites ;;
  }

  dimension: userpreferencesfavoriteswtshown {
    type: yesno
    sql: ${TABLE}.userpreferencesfavoriteswtshown ;;
  }

  dimension: userpreferencesglobalnavbarwtshown {
    type: yesno
    sql: ${TABLE}.userpreferencesglobalnavbarwtshown ;;
  }

  dimension: userpreferencesglobalnavgridmenuwtshown {
    type: yesno
    sql: ${TABLE}.userpreferencesglobalnavgridmenuwtshown ;;
  }

  dimension: userpreferenceshidebiggerphotocallout {
    type: yesno
    sql: ${TABLE}.userpreferenceshidebiggerphotocallout ;;
  }

  dimension: userpreferenceshidechatteronboardingsplash {
    type: yesno
    sql: ${TABLE}.userpreferenceshidechatteronboardingsplash ;;
  }

  dimension: userpreferenceshidecsndesktoptask {
    type: yesno
    sql: ${TABLE}.userpreferenceshidecsndesktoptask ;;
  }

  dimension: userpreferenceshidecsngetchattermobiletask {
    type: yesno
    sql: ${TABLE}.userpreferenceshidecsngetchattermobiletask ;;
  }

  dimension: userpreferenceshideenduseronboardingassistantmodal {
    type: yesno
    sql: ${TABLE}.userpreferenceshideenduseronboardingassistantmodal ;;
  }

  dimension: userpreferenceshidelightningmigrationmodal {
    type: yesno
    sql: ${TABLE}.userpreferenceshidelightningmigrationmodal ;;
  }

  dimension: userpreferenceshides1browserui {
    type: yesno
    sql: ${TABLE}.userpreferenceshides1browserui ;;
  }

  dimension: userpreferenceshidesecondchatteronboardingsplash {
    type: yesno
    sql: ${TABLE}.userpreferenceshidesecondchatteronboardingsplash ;;
  }

  dimension: userpreferenceshidesfxwelcomemat {
    type: yesno
    sql: ${TABLE}.userpreferenceshidesfxwelcomemat ;;
  }

  dimension: userpreferenceslightningexperiencepreferred {
    type: yesno
    sql: ${TABLE}.userpreferenceslightningexperiencepreferred ;;
  }

  dimension: userpreferencespathassistantcollapsed {
    type: yesno
    sql: ${TABLE}.userpreferencespathassistantcollapsed ;;
  }

  dimension: userpreferencespreviewlightning {
    type: yesno
    sql: ${TABLE}.userpreferencespreviewlightning ;;
  }

  dimension: userpreferencesrecordhomereservedwtshown {
    type: yesno
    sql: ${TABLE}.userpreferencesrecordhomereservedwtshown ;;
  }

  dimension: userpreferencesrecordhomesectioncollapsewtshown {
    type: yesno
    sql: ${TABLE}.userpreferencesrecordhomesectioncollapsewtshown ;;
  }

  dimension: userpreferencesremindersoundoff {
    type: yesno
    sql: ${TABLE}.userpreferencesremindersoundoff ;;
  }

  dimension: userpreferencesshowcitytoexternalusers {
    type: yesno
    sql: ${TABLE}.userpreferencesshowcitytoexternalusers ;;
  }

  dimension: userpreferencesshowcitytoguestusers {
    type: yesno
    sql: ${TABLE}.userpreferencesshowcitytoguestusers ;;
  }

  dimension: userpreferencesshowcountrytoexternalusers {
    type: yesno
    sql: ${TABLE}.userpreferencesshowcountrytoexternalusers ;;
  }

  dimension: userpreferencesshowcountrytoguestusers {
    type: yesno
    sql: ${TABLE}.userpreferencesshowcountrytoguestusers ;;
  }

  dimension: userpreferencesshowemailtoexternalusers {
    type: yesno
    sql: ${TABLE}.userpreferencesshowemailtoexternalusers ;;
  }

  dimension: userpreferencesshowemailtoguestusers {
    type: yesno
    sql: ${TABLE}.userpreferencesshowemailtoguestusers ;;
  }

  dimension: userpreferencesshowfaxtoexternalusers {
    type: yesno
    sql: ${TABLE}.userpreferencesshowfaxtoexternalusers ;;
  }

  dimension: userpreferencesshowfaxtoguestusers {
    type: yesno
    sql: ${TABLE}.userpreferencesshowfaxtoguestusers ;;
  }

  dimension: userpreferencesshowmanagertoexternalusers {
    type: yesno
    sql: ${TABLE}.userpreferencesshowmanagertoexternalusers ;;
  }

  dimension: userpreferencesshowmanagertoguestusers {
    type: yesno
    sql: ${TABLE}.userpreferencesshowmanagertoguestusers ;;
  }

  dimension: userpreferencesshowmobilephonetoexternalusers {
    type: yesno
    sql: ${TABLE}.userpreferencesshowmobilephonetoexternalusers ;;
  }

  dimension: userpreferencesshowmobilephonetoguestusers {
    type: yesno
    sql: ${TABLE}.userpreferencesshowmobilephonetoguestusers ;;
  }

  dimension: userpreferencesshowpostalcodetoexternalusers {
    type: yesno
    sql: ${TABLE}.userpreferencesshowpostalcodetoexternalusers ;;
  }

  dimension: userpreferencesshowpostalcodetoguestusers {
    type: yesno
    sql: ${TABLE}.userpreferencesshowpostalcodetoguestusers ;;
  }

  dimension: userpreferencesshowprofilepictoguestusers {
    type: yesno
    sql: ${TABLE}.userpreferencesshowprofilepictoguestusers ;;
  }

  dimension: userpreferencesshowstatetoexternalusers {
    type: yesno
    sql: ${TABLE}.userpreferencesshowstatetoexternalusers ;;
  }

  dimension: userpreferencesshowstatetoguestusers {
    type: yesno
    sql: ${TABLE}.userpreferencesshowstatetoguestusers ;;
  }

  dimension: userpreferencesshowstreetaddresstoexternalusers {
    type: yesno
    sql: ${TABLE}.userpreferencesshowstreetaddresstoexternalusers ;;
  }

  dimension: userpreferencesshowstreetaddresstoguestusers {
    type: yesno
    sql: ${TABLE}.userpreferencesshowstreetaddresstoguestusers ;;
  }

  dimension: userpreferencesshowtitletoexternalusers {
    type: yesno
    sql: ${TABLE}.userpreferencesshowtitletoexternalusers ;;
  }

  dimension: userpreferencesshowtitletoguestusers {
    type: yesno
    sql: ${TABLE}.userpreferencesshowtitletoguestusers ;;
  }

  dimension: userpreferencesshowworkphonetoexternalusers {
    type: yesno
    sql: ${TABLE}.userpreferencesshowworkphonetoexternalusers ;;
  }

  dimension: userpreferencesshowworkphonetoguestusers {
    type: yesno
    sql: ${TABLE}.userpreferencesshowworkphonetoguestusers ;;
  }

  dimension: userpreferencessortfeedbycomment {
    type: yesno
    sql: ${TABLE}.userpreferencessortfeedbycomment ;;
  }

  dimension: userpreferencestaskreminderscheckboxdefault {
    type: yesno
    sql: ${TABLE}.userpreferencestaskreminderscheckboxdefault ;;
  }

  dimension: userroleid {
    type: string
    sql: ${TABLE}.userroleid ;;
  }

  dimension: usertype {
    type: string
    sql: ${TABLE}.usertype ;;
  }

  measure: count {
    type: count
    drill_fields: [id, companyname, name]
  }
}

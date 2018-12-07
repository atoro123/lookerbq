- dashboard: ordergroove_monthly_program_performance_report
  title: Ordergroove Monthly Program Performance Report
  layout: newspaper
  elements:
  - title: Avg Sub Frequency
    name: Avg Sub Frequency
    model: ordergroove_analytics
    explore: order_order
    type: single_value
    fields:
    - subscription_subscription.count
    - subscription_subscription.frequency_days
    - subscription_subscription.created_month
    pivots:
    - subscription_subscription.frequency_days
    fill_fields:
    - subscription_subscription.created_month
    filters:
      subscription_subscription.created_month: 2 months ago for 2 months
      subscription_subscription.live: 'Yes'
    sorts:
    - subscription_subscription.frequency_days
    - subscription_subscription.created_month desc
    limit: 500
    dynamic_fields:
    - table_calculation: calculation_1
      label: Calculation 1
      expression: "${subscription_subscription.count}*${subscription_subscription.frequency_days}"
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: average_subscription_frequency
      label: Average Subscription Frequency
      expression: sum(pivot_row(${calculation_1}))/sum(pivot_row(${subscription_subscription.count}))
      value_format:
      value_format_name: decimal_2
      _kind_hint: supermeasure
      _type_hint: number
    - table_calculation: change
      label: "% Change"
      expression: "(${average_subscription_frequency}-offset(${average_subscription_frequency},1))/offset(${average_subscription_frequency},1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: supermeasure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - calculation_1
    - subscription_subscription.count
    - subscription_subscription.created_month
    listen:
      Merchant ID: merchant_merchant.id
    note_state: expanded
    note_display: below
    note_text: ''
    row: 18
    col: 8
    width: 8
    height: 3
  - title: Subscriptions Created
    name: Subscriptions Created
    model: ordergroove_analytics
    explore: subscription_subscription
    type: single_value
    fields:
    - subscription_subscription.count
    - subscription_subscription.created_month
    fill_fields:
    - subscription_subscription.created_month
    filters:
      subscription_subscription.created_month: 2 months ago for 2 months
    sorts:
    - subscription_subscription.created_month desc
    limit: 500
    dynamic_fields:
    - table_calculation: calculation_1
      label: Calculation 1
      expression: "(${subscription_subscription.count}-offset(${subscription_subscription.count},1))/offset(${subscription_subscription.count},1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    comparison_label: Prior Month
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - subscription_subscription.created_month
    listen:
      Merchant ID: merchant_merchant.id
    row: 15
    col: 8
    width: 8
    height: 3
  - title: Top IU One Time Products Prior Month
    name: Top IU One Time Products Prior Month
    model: ordergroove_analytics
    explore: order_order
    type: table
    fields:
    - product_product.name
    - product_product.sku
    - order_item.sum_IU_onetime_quantity
    filters:
      order_order.place_month: 1 months ago for 1 months
      order_item.product_id: NOT NULL
      order_item.is_IU: 'Yes'
      order_item.sum_IU_onetime_quantity: ">=1"
      order_order.status: '5'
    sorts:
    - order_item.sum_IU_onetime_quantity desc
    limit: 10
    total: true
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: true
    hide_totals: false
    hide_row_totals: false
    series_labels:
      order_item.sum_IU_onetime_quantity: Total Item Count
      product_product.sku: SKU
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Merchant ID: merchant_merchant.id
    row: 116
    col: 12
    width: 12
    height: 7
  - name: merge-lsSDubUKpdH38HBgYjeC4O-74
    type: text
    title_text: Gross Subscription and Subscriber Adds
    subtitle_text: This item contains data that can no longer be displayed.
    body_text: This item contains results merged from two or more queries. This is
      currently not supported in LookML dashboards.
    row: 45
    col: 12
    width: 12
    height: 9
  - name: merge-jDXvIvJGn4HlWT8V7rBUTm-75
    type: text
    title_text: 'GMV: Activation + Recurring'
    subtitle_text: This item contains data that can no longer be displayed.
    body_text: This item contains results merged from two or more queries. This is
      currently not supported in LookML dashboards.
    row: 24
    col: 0
    width: 24
    height: 15
  - title: Buyer to Subscriber Conversion (%)
    name: Buyer to Subscriber Conversion (%)
    model: analytics
    explore: analytics_conversion
    type: looker_column
    fields:
    - analytics_conversion.date_month
    - analytics_conversion.sum_views
    - analytics_conversion.sum_subscribers
    fill_fields:
    - analytics_conversion.date_month
    filters:
      analytics_conversion.date_month: 13 months ago for 13 months
      analytics_conversion.offer_id: 'NULL'
    sorts:
    - analytics_conversion.date_month
    limit: 500
    dynamic_fields:
    - table_calculation: conversion
      label: Conversion
      expression: "${analytics_conversion.sum_subscribers}/${analytics_conversion.sum_views}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    stacking: ''
    show_value_labels: true
    label_density: 25
    label_color:
    - "#000000"
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_colors:
      conversion: "#2e4457"
      analytics_conversion.sum_views: "#00a7e0"
    series_labels:
      analytics_conversion.sum_views: Views
    series_types:
      conversion: line
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: analytics_conversion.sum_views
        name: Sum Views
        axisId: analytics_conversion.sum_views
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: conversion
        name: Conversion
        axisId: conversion
      showLabels: true
      showValues: true
      maxValue: 1
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_datetime_label: "%b %y"
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_dropoff: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - analytics_conversion.sum_subscribers
    listen:
      Merchant ID: analytics_conversion.merchant_id
    row: 45
    col: 0
    width: 12
    height: 9
  - title: Total Revenue from IU
    name: Total Revenue from IU
    model: ordergroove_analytics
    explore: order_order
    type: single_value
    fields:
    - order_order.place_month
    - order_item.total_gmv
    fill_fields:
    - order_order.place_month
    filters:
      order_order.place_month: 2 months ago for 2 months
      order_item.is_IU: 'Yes'
    sorts:
    - order_order.place_month desc
    limit: 500
    dynamic_fields:
    - table_calculation: change
      label: "% Change"
      expression: "(${order_item.total_gmv}-offset(${order_item.total_gmv},1))/offset(${order_item.total_gmv},1)"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    value_format: "$#,###"
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    comparison_label: Last Month
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - order_order.place_month
    listen:
      Merchant ID: merchant_merchant.id
    row: 105
    col: 0
    width: 8
    height: 3
  - title: Total IU Items Ordered
    name: Total IU Items Ordered
    model: ordergroove_analytics
    explore: order_order
    type: single_value
    fields:
    - order_item.count
    - order_order.place_month
    fill_fields:
    - order_order.place_month
    filters:
      order_order.place_month: 2 months ago for 2 months
      order_item.is_IU: 'Yes'
      order_order.status: '5'
    sorts:
    - order_order.place_month desc
    limit: 500
    dynamic_fields:
    - table_calculation: change
      label: "% Change"
      expression: "(${order_item.count}-offset(${order_item.count},1))/offset(${order_item.count},1)"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    comparison_label: ''
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - order_order.place_month
    listen:
      Merchant ID: merchant_merchant.id
    row: 105
    col: 16
    width: 8
    height: 3
  - name: merge-lUUqCLc0cnCTx6baa3ZnZA-80
    type: text
    title_text: GMV
    subtitle_text: This item contains data that can no longer be displayed.
    body_text: This item contains results merged from two or more queries. This is
      currently not supported in LookML dashboards.
    row: 15
    col: 0
    width: 8
    height: 3
  - title: Successful Orders
    name: Successful Orders
    model: ordergroove_analytics
    explore: order_order
    type: looker_column
    fields:
    - order_order.place_month
    - order_order.count
    fill_fields:
    - order_order.place_month
    filters:
      order_order.status: '5'
      order_order.place_month: 13 months ago for 13 months
    sorts:
    - order_order.place_month
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: true
    label_density: 25
    label_color:
    - '00000'
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_colors:
      order_order.count: "#00a7e0"
    series_labels:
      order_order.average_sub_total: Avg Order Value
    series_types:
      order_order.average_sub_total: line
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: order_order.count
        name: Order Count
        axisId: order_order.count
      showLabels: false
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: order_order.average_sub_total
        name: Order Average Sub Total
        axisId: order_order.average_sub_total
      showLabels: false
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_datetime_label: "%b %y"
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_dropoff: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    listen:
      Merchant ID: merchant_merchant.id
    row: 86
    col: 0
    width: 12
    height: 8
  - title: Top Activated Products Prior Month
    name: Top Activated Products Prior Month
    model: ordergroove_analytics
    explore: subscription_subscription
    type: table
    fields:
    - product_product.name
    - product_product.sku
    - subscription_subscription.count
    filters:
      subscription_subscription.created_month: 1 months ago for 1 months
      product_product.name: "-NULL"
    sorts:
    - subscription_subscription.count desc
    limit: 500
    total: true
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      subscription_subscription.count: Count
    table_theme: gray
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '15'
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Merchant ID: merchant_merchant.id
    row: 62
    col: 12
    width: 12
    height: 9
  - title: Cancel Reasons Prior Month
    name: Cancel Reasons Prior Month
    model: ordergroove_analytics
    explore: subscription_subscription
    type: table
    fields:
    - subscription_subscription.clean_cancel
    - subscription_subscription.count
    filters:
      subscription_subscription.cancelled_month: 1 months ago for 1 months
    sorts:
    - subscription_subscription.count desc
    limit: 500
    total: true
    dynamic_fields:
    - table_calculation: of_cancels
      label: "% of Cancels"
      expression: "${subscription_subscription.count}/sum(${subscription_subscription.count})"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      subscription_subscription.clean_cancel: Cancel Reason
      calculation_1: "% of Cancels"
      subscription_subscription.count: Cancel Count
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Merchant ID: merchant_merchant.id
    row: 129
    col: 12
    width: 12
    height: 8
  - name: merge-so2HEXasLDT0xg3BuqHeGH-88
    type: text
    title_text: Net Subscription Growth
    subtitle_text: This item contains data that can no longer be displayed.
    body_text: This item contains results merged from two or more queries. This is
      currently not supported in LookML dashboards.
    row: 54
    col: 12
    width: 12
    height: 8
  - title: Frequency Breakdown by Active/Inactive
    name: Frequency Breakdown by Active/Inactive
    model: ordergroove_analytics
    explore: subscription_subscription
    type: looker_donut_multiples
    fields:
    - subscription_subscription.live
    - subscription_subscription.count
    - subscription_subscription.bucket_frequency
    pivots:
    - subscription_subscription.bucket_frequency
    fill_fields:
    - subscription_subscription.live
    filters:
      subscription_subscription.bucket_frequency: -"(-inf,0.0)",-Undefined
    sorts:
    - subscription_subscription.live desc
    - subscription_subscription.bucket_frequency 0
    limit: 500
    show_value_labels: true
    font_size: 20
    hide_legend: false
    stacking: percent
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    listen:
      Merchant ID: merchant_merchant.id
    note_state: collapsed
    note_display: below
    note_text: ''
    row: 71
    col: 12
    width: 12
    height: 9
  - title: Subscriptions Per Subscriber
    name: Subscriptions Per Subscriber
    model: ordergroove_analytics
    explore: order_order
    type: looker_column
    fields:
    - subscription_subscription.created_month
    - subscription_subscription.cusotmer_create
    - subscription_subscription.count
    fill_fields:
    - subscription_subscription.created_month
    filters:
      subscription_subscription.created_month: 13 months ago for 13 months
    sorts:
    - subscription_subscription.created_month
    limit: 500
    dynamic_fields:
    - table_calculation: calculation_1
      label: Calculation 1
      expression: "${subscription_subscription.count}/${subscription_subscription.cusotmer_create}"
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: true
    label_density: 25
    label_color:
    - "#00000"
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: circle_outline
    series_labels:
      calculation_1: Subs Per
      subscription_subscription.cusotmer_create: Subscriptions
      subscription_subscription.count: Subscribers
    series_types:
      calculation_1: line
    limit_displayed_rows: false
    y_axes:
    - label:
      orientation: left
      series:
      - id: calculation_1
        name: Subs Per
        axisId: calculation_1
      showLabels: true
      showValues: true
      minValue: 1
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_datetime_label: "%b %y"
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - subscription_subscription.cusotmer_create
    - subscription_subscription.count
    listen:
      Merchant ID: merchant_merchant.id
    row: 62
    col: 0
    width: 12
    height: 9
  - title: Frequency Distribution
    name: Frequency Distribution
    model: ordergroove_analytics
    explore: subscription_subscription
    type: looker_column
    fields:
    - subscription_subscription.bucket_frequency
    - subscription_subscription.created_month
    - subscription_subscription.count
    pivots:
    - subscription_subscription.bucket_frequency
    fill_fields:
    - subscription_subscription.created_month
    filters:
      subscription_subscription.created_month: 13 months ago for 13 months
      subscription_subscription.bucket_frequency: -"(-inf,0.0)"
    sorts:
    - subscription_subscription.bucket_frequency 0
    - subscription_subscription.created_month
    limit: 500
    stacking: percent
    colors:
    - "#dcdcdc"
    - "#0f7293"
    - "#e46849"
    - "#0f7293"
    - "#e3e3e3"
    - "#000000"
    - "#2e4457"
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    point_style: none
    series_colors:
      "[120.0,150.0) - 09 - subscription_subscription.count": "#E4831E"
      "[90.0,120.0) - 08 - subscription_subscription.count": "#37C9FF"
      "[60.0,90.0) - 07 - subscription_subscription.count": "#19A7E1"
      "[45.0,60.0) - 06 - subscription_subscription.count": "#FF9321"
      "[30.0,45.0) - 05 - subscription_subscription.count": "#148CBE"
      "[180.0,270.0) - 11 - subscription_subscription.count": "#FFB04D"
      "[150.0,180.0) - 10 - subscription_subscription.count": "#FF9321"
      "[270.0,365.0) - 12 - subscription_subscription.count": "#9E9E9E"
    series_types: {}
    limit_displayed_rows: false
    hidden_series:
    - "(-inf,0.0) - 00 - subscription_subscription.count"
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: "[14.0,28.0) - 03 - subscription_subscription.count"
        name: "[14,28)"
        axisId: subscription_subscription.count
      - id: "[28.0,30.0) - 04 - subscription_subscription.count"
        name: "[28,30)"
        axisId: subscription_subscription.count
      - id: "[30.0,45.0) - 05 - subscription_subscription.count"
        name: "[30,45)"
        axisId: subscription_subscription.count
      - id: "[45.0,60.0) - 06 - subscription_subscription.count"
        name: "[45,60)"
        axisId: subscription_subscription.count
      - id: "[60.0,90.0) - 07 - subscription_subscription.count"
        name: "[60,90)"
        axisId: subscription_subscription.count
      - id: "[90.0,120.0) - 08 - subscription_subscription.count"
        name: "[90,120)"
        axisId: subscription_subscription.count
      - id: "[120.0,150.0) - 09 - subscription_subscription.count"
        name: "[120,150)"
        axisId: subscription_subscription.count
      - id: "[180.0,270.0) - 11 - subscription_subscription.count"
        name: "[180,270)"
        axisId: subscription_subscription.count
      showLabels: false
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_datetime_label: "%b %y"
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Merchant ID: merchant_merchant.id
    note_state: collapsed
    note_display: below
    note_text: ''
    row: 71
    col: 0
    width: 12
    height: 9
  - title: Successfu
    name: Successful
    model: ordergroove_analytics
    explore: order_order
    type: single_value
    fields:
    - order_order.place_month
    - order_order.count
    fill_fields:
    - order_order.place_month
    filters:
      order_order.status: '5'
      order_order.place_month: 2 months ago for 2 months
    sorts:
    - order_order.place_month desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: calculation_1
      label: Calculation 1
      expression: "(${order_order.count}-offset(${order_order.count},1))/offset(${order_order.count},1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    label_color:
    - '00000'
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_colors:
      order_order.count: "#e46849"
    series_labels:
      order_order.average_sub_total: Avg Order Value
    series_types: {}
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: order_order.count
        name: Order Count
        axisId: order_order.count
      showLabels: false
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: order_order.average_sub_total
        name: Order Average Sub Total
        axisId: order_order.average_sub_total
      showLabels: false
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_dropoff: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - order_order.place_month
    listen:
      Merchant ID: merchant_merchant.id
    row: 15
    col: 16
    width: 8
    height: 3
  - title: Average Order Value
    name: Average Order Value
    model: ordergroove_analytics
    explore: order_order
    type: single_value
    fields:
    - order_order.place_month
    - order_order.average_sub_total
    fill_fields:
    - order_order.place_month
    filters:
      order_order.status: '5'
      order_order.place_month: 2 months ago for 2 months
    sorts:
    - order_order.place_month desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: change
      label: "% Change"
      expression: "(${order_order.average_sub_total}-offset(${order_order.average_sub_total},1))/offset(${order_order.average_sub_total},1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    label_color:
    - '00000'
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_colors:
      order_order.count: "#e46849"
    series_labels:
      order_order.average_sub_total: Avg Order Value
    series_types: {}
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: order_order.count
        name: Order Count
        axisId: order_order.count
      showLabels: false
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: order_order.average_sub_total
        name: Order Average Sub Total
        axisId: order_order.average_sub_total
      showLabels: false
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_dropoff: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - order_order.place_month
    listen:
      Merchant ID: merchant_merchant.id
    row: 18
    col: 0
    width: 8
    height: 3
  - title: 'IU Distribution: Subscription vs One-Time Adds'
    name: 'IU Distribution: Subscription vs One-Time Adds'
    model: ordergroove_analytics
    explore: order_order
    type: looker_column
    fields:
    - order_order.place_month
    - order_item.sum_IU_Recurring_quantity
    - order_item.sum_IU_onetime_quantity
    fill_fields:
    - order_order.place_month
    filters:
      order_order.status: '5'
      order_order.place_month: 13 months ago for 13 months
    sorts:
    - order_order.place_month
    limit: 500
    dynamic_fields:
    - table_calculation: iu_recurring_items
      label: "% IU Recurring Items"
      expression: "${order_item.sum_IU_Recurring_quantity}/(${order_item.sum_IU_onetime_quantity}+${order_item.sum_IU_Recurring_quantity})"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: iu_one_time_items
      label: "% IU One-TIme Items"
      expression: "${order_item.sum_IU_onetime_quantity}/(${order_item.sum_IU_onetime_quantity}+${order_item.sum_IU_Recurring_quantity})"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: true
    label_density: 25
    label_color:
    - "#00000"
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_labels:
      iu_recurring_items: "% IU Subscription Items"
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: iu_recurring_items
        name: "% IU Subscription Items"
        axisId: iu_recurring_items
      - id: iu_one_time_items
        name: "% IU One-TIme Items"
        axisId: iu_one_time_items
      showLabels: true
      showValues: true
      maxValue: 1
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_datetime_label: "%b %y"
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - order_item.sum_IU_onetime_quantity
    - order_item.sum_IU_Recurring_quantity
    listen:
      Merchant ID: merchant_merchant.id
    row: 108
    col: 12
    width: 12
    height: 8
  - title: AOV
    name: AOV
    model: ordergroove_analytics
    explore: order_order
    type: looker_column
    fields:
    - order_order.count
    - order_order.place_month
    - order_order.average_sub_total
    fill_fields:
    - order_order.place_month
    filters:
      order_order.status: '5'
      order_order.place_month: 13 months ago for 13 months
    sorts:
    - order_order.place_month
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: true
    label_density: 25
    label_color:
    - '00000'
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_colors:
      order_order.count: "#e46849"
    series_labels:
      order_order.average_sub_total: Avg Order Value
    series_types:
      order_order.average_sub_total: line
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    y_axes:
    - label:
      orientation: left
      series:
      - id: order_order.average_sub_total
        name: Avg Order Value
        axisId: order_order.average_sub_total
      showLabels: false
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_datetime_label: "%b %y"
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    label_value_format: ''
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_dropoff: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - order_order.count
    listen:
      Merchant ID: merchant_merchant.id
    row: 86
    col: 12
    width: 12
    height: 8
  - title: Rejected Reason Breakdown Prior Month
    name: Rejected Reason Breakdown Prior Month
    model: ordergroove_analytics
    explore: order_order
    type: table
    fields:
    - order_order.clean_rejected
    - order_order.count
    filters:
      order_order.status: '3,14'
      order_order.place_month: 1 months ago for 1 months
    sorts:
    - order_order.count desc
    limit: 500
    total: true
    dynamic_fields:
    - table_calculation: percent
      label: Percent
      expression: "${order_order.count}/${order_order.count:total}"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      order_order.clean_rejected: Rejected Reason
      order_order.count: Cancel Count
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Merchant ID: merchant_merchant.id
    row: 94
    col: 12
    width: 12
    height: 8
  - title: Top IU Subscription Products Prior Month
    name: Top IU Subscription Products Prior Month
    model: ordergroove_analytics
    explore: order_order
    type: table
    fields:
    - product_product.name
    - product_product.sku
    - order_item.sum_IU_Recurring_quantity
    filters:
      order_order.place_month: 1 months ago for 1 months
      order_item.product_id: NOT NULL
      order_item.is_IU: 'Yes'
      order_order.status: '5'
      order_item.sum_IU_Recurring_quantity: ">=1"
    sorts:
    - order_item.sum_IU_Recurring_quantity desc
    limit: 10
    total: true
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: true
    hide_totals: false
    hide_row_totals: false
    series_labels:
      order_item.sum_IU_Recurring_quantity: Total Item Count
      product_product.sku: SKU
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Merchant ID: merchant_merchant.id
    row: 116
    col: 0
    width: 12
    height: 7
  - title: Active Subscriptions (copy)
    name: Active Subscriptions (copy)
    model: analytics
    explore: subscription_monthly_summary
    type: single_value
    fields:
    - subscription_monthly_summary.date_month
    - subscriber_monthly_summary.active_end
    fill_fields:
    - subscription_monthly_summary.date_month
    filters:
      subscription_monthly_summary.date_month: 1 months ago for 1 months
      subscription_monthly_summary.frequency_days: 'NULL'
      subscription_monthly_summary.subscription_type: 'NULL'
    sorts:
    - subscription_monthly_summary.date_month
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    custom_color: "#00a7e0"
    show_single_value_title: true
    single_value_title: Active Subscribers
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: true
    label_density: 25
    label_color:
    - "#00000"
    legend_position: center
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_labels:
      subscription_monthly_summary.active_end: Active Subscriptions
      subscriber_monthly_summary.active_end: Active Subscribers
    series_types: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Merchant ID: subscriber_monthly_summary.merchant_id
    row: 7
    col: 12
    width: 12
    height: 5
  - title: Successful Or
    name: Successful Order
    model: ordergroove_analytics
    explore: order_order
    type: single_value
    fields:
    - order_order.place_month
    - order_order.count
    fill_fields:
    - order_order.place_month
    filters:
      order_order.status: '5'
      order_order.place_month: 2 months ago for 2 months
    sorts:
    - order_order.place_month desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: change
      label: "% Change"
      expression: "(${order_order.count}-offset(${order_order.count},1))/offset(${order_order.count},1)"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    label_color:
    - '00000'
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_colors:
      order_order.count: "#e46849"
    series_labels:
      order_order.average_sub_total: Avg Order Value
    series_types: {}
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: order_order.count
        name: Order Count
        axisId: order_order.count
      showLabels: false
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: order_order.average_sub_total
        name: Order Average Sub Total
        axisId: order_order.average_sub_total
      showLabels: false
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_dropoff: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - order_order.place_month
    listen:
      Merchant ID: merchant_merchant.id
    row: 83
    col: 0
    width: 8
    height: 3
  - title: Aver Order Value
    name: Aver Order Value
    model: ordergroove_analytics
    explore: order_order
    type: single_value
    fields:
    - order_order.place_month
    - order_order.average_sub_total
    fill_fields:
    - order_order.place_month
    filters:
      order_order.status: '5'
      order_order.place_month: 2 months ago for 2 months
    sorts:
    - order_order.place_month desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: change
      label: "% Change"
      expression: "(${order_order.average_sub_total}-offset(${order_order.average_sub_total},1))/offset(${order_order.average_sub_total},1)"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    label_color:
    - '00000'
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_colors:
      order_order.count: "#e46849"
    series_labels:
      order_order.average_sub_total: Avg Order Value
    series_types: {}
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    y_axes:
    - label:
      orientation: left
      series:
      - id: order_order.average_sub_total
        name: Avg Order Value
        axisId: order_order.average_sub_total
      showLabels: false
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_dropoff: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - order_order.place_month
    listen:
      Merchant ID: merchant_merchant.id
    row: 83
    col: 8
    width: 8
    height: 3
  - title: 24-hour Cancels
    name: 24-hour Cancels
    model: ordergroove_analytics
    explore: subscription_subscription
    type: single_value
    fields:
    - subscription_subscription.count
    - subscription_subscription.created_month
    fill_fields:
    - subscription_subscription.created_month
    filters:
      subscription_subscription.24hr_Cancel: 'Yes'
      subscription_subscription.created_month: 2 months ago for 2 months
    sorts:
    - subscription_subscription.created_month desc
    limit: 500
    dynamic_fields:
    - table_calculation: change
      label: "% Change"
      expression: "(${subscription_subscription.count}-offset(${subscription_subscription.count},1))/offset(${subscription_subscription.count},1)"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Merchant ID: merchant_merchant.id
    row: 126
    col: 16
    width: 8
    height: 3
  - name: merge-PH0Y01hUkyKudoUTVyZeQa-125
    type: text
    title_text: "% IU Orders"
    subtitle_text: This item contains data that can no longer be displayed.
    body_text: This item contains results merged from two or more queries. This is
      currently not supported in LookML dashboards.
    row: 105
    col: 8
    width: 8
    height: 3
  - name: merge-ZFoTJX7UyY9BFfDxVCgfrf-126
    type: text
    title_text: 'AOV Comparison:  IU vs Non IU orders'
    subtitle_text: This item contains data that can no longer be displayed.
    body_text: This item contains results merged from two or more queries. This is
      currently not supported in LookML dashboards.
    row: 108
    col: 0
    width: 12
    height: 8
  - title: New Subscriber Adds
    name: New Subscriber Adds
    model: ordergroove_analytics
    explore: order_order
    type: single_value
    fields:
    - customer_customer.count
    - customer_facts.created_month
    fill_fields:
    - customer_facts.created_month
    filters:
      customer_facts.created_month: 2 months ago for 2 months
    sorts:
    - customer_facts.created_month desc
    limit: 500
    dynamic_fields:
    - table_calculation: change
      label: "% Change"
      expression: "(${customer_customer.count}-offset(${customer_customer.count},1))/offset(${customer_customer.count},1)"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    series_types: {}
    hidden_fields:
    - customer_facts.created_month
    listen:
      Merchant ID: merchant_merchant.id
    row: 42
    col: 8
    width: 8
    height: 3
  - title: Buyer to Sub Conversion (%)
    name: Buyer to Sub Conversion (%)
    model: analytics
    explore: analytics_conversion
    type: single_value
    fields:
    - analytics_conversion.date_month
    - analytics_conversion.sum_views
    - analytics_conversion.sum_subscribers
    fill_fields:
    - analytics_conversion.date_month
    filters:
      analytics_conversion.date_month: 2 months ago for 2 months
      analytics_conversion.offer_id: 'NULL'
    sorts:
    - analytics_conversion.date_month desc
    limit: 500
    dynamic_fields:
    - table_calculation: conversion
      label: Conversion
      expression: "${analytics_conversion.sum_subscribers}/${analytics_conversion.sum_views}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    - table_calculation: change
      label: "% Change"
      expression: "(${conversion}-offset(${conversion},1))/offset(${conversion},1)"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    label_color:
    - "#000000"
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_colors:
      conversion: "#2e4457"
      analytics_conversion.sum_views: "#00a7e0"
    series_labels:
      analytics_conversion.sum_views: Views
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: analytics_conversion.sum_views
        name: Sum Views
        axisId: analytics_conversion.sum_views
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: conversion
        name: Conversion
        axisId: conversion
      showLabels: true
      showValues: true
      maxValue: 1
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_dropoff: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - analytics_conversion.sum_subscribers
    - analytics_conversion.sum_views
    - analytics_conversion.date_month
    listen:
      Merchant ID: analytics_conversion.merchant_id
    row: 42
    col: 0
    width: 8
    height: 3
  - name: merge-AUKwtsmLwL8P6lROxE1JGk-133
    type: text
    title_text: Active Subscriptions & Subscribers Snapshot
    subtitle_text: This item contains data that can no longer be displayed.
    body_text: This item contains results merged from two or more queries. This is
      currently not supported in LookML dashboards.
    row: 54
    col: 0
    width: 12
    height: 8
  - title: Subscription Cancels
    name: Subscription Cancels
    model: ordergroove_analytics
    explore: subscription_subscription
    type: single_value
    fields:
    - subscription_subscription.cancelled_month
    - subscription_subscription.count
    fill_fields:
    - subscription_subscription.cancelled_month
    filters:
      subscription_subscription.cancelled_month: 2 months ago for 2 months
    sorts:
    - subscription_subscription.cancelled_month desc
    limit: 500
    dynamic_fields:
    - table_calculation: percent_change
      label: "% Percent Change"
      expression: "(${subscription_subscription.count}-offset(${subscription_subscription.count},1))/offset(${subscription_subscription.count},1)"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Merchant ID: merchant_merchant.id
    row: 126
    col: 8
    width: 8
    height: 3
  - name: merge-6FpgJq28R6n69s1tG0Apvy-143
    type: text
    title_text: Subscription MoM Retention Rate
    subtitle_text: This item contains data that can no longer be displayed.
    body_text: This item contains results merged from two or more queries. This is
      currently not supported in LookML dashboards.
    row: 129
    col: 0
    width: 12
    height: 8
  - title: Order Processing Rate
    name: Order Processing Rate
    model: ordergroove_analytics
    explore: order_order
    type: table
    fields:
    - order_order.attempted_orders
    - order_order.completed_orders
    - order_order.clean_order_place
    filters:
      order_order.place_month: 13 months ago for 13 months
    sorts:
    - order_order.attempted_orders desc
    limit: 500
    dynamic_fields:
    - table_calculation: order_processing
      label: Order Processing
      expression: "${order_order.completed_orders}/${order_order.attempted_orders}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      order_order.count: Attempted Orders
      order_order.completed_orders: Successful Orders
      order_order.clean_order_place: Place Month
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: circle_outline
    series_types: {}
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    hidden_fields:
    listen:
      Merchant ID: merchant_merchant.id
    row: 94
    col: 0
    width: 12
    height: 8
  - title: Order Processing
    name: Order Processing
    model: ordergroove_analytics
    explore: order_order
    type: single_value
    fields:
    - order_order.place_month
    - order_order.completed_orders
    - order_order.attempted_orders
    fill_fields:
    - order_order.place_month
    filters:
      order_order.place_month: 2 months ago for 2 months
    sorts:
    - order_order.place_month desc
    limit: 500
    dynamic_fields:
    - table_calculation: order_processing
      label: Order Processing
      expression: "${order_order.completed_orders}/${order_order.attempted_orders}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    - table_calculation: change
      label: "% Change"
      expression: "(${order_processing}-offset(${order_processing},1))/offset(${order_processing},1)"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      order_order.count: Attempted Orders
      order_order.completed_orders: Successful Orders
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: circle_outline
    series_types: {}
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    hidden_fields:
    - order_order.completed_orders
    - order_order.place_month
    - order_order.attempted_orders
    listen:
      Merchant ID: merchant_merchant.id
    row: 83
    col: 16
    width: 8
    height: 3
  - title: Order Processin
    name: Order Processin
    model: ordergroove_analytics
    explore: order_order
    type: single_value
    fields:
    - order_order.place_month
    - order_order.completed_orders
    - order_order.attempted_orders
    fill_fields:
    - order_order.place_month
    filters:
      order_order.place_month: 2 months ago for 2 months
    sorts:
    - order_order.place_month desc
    limit: 500
    dynamic_fields:
    - table_calculation: order_processing
      label: Order Processing
      expression: "${order_order.completed_orders}/${order_order.attempted_orders}"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: change
      label: "% Change"
      expression: "(${order_processing}-offset(${order_processing},1))/offset(${order_processing},1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      order_order.count: Attempted Orders
      order_order.completed_orders: Successful Orders
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: circle_outline
    series_types: {}
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    hidden_fields:
    - order_order.completed_orders
    - order_order.place_month
    - order_order.attempted_orders
    listen:
      Merchant ID: merchant_merchant.id
    row: 18
    col: 16
    width: 8
    height: 3
  - title: Retention Rate
    name: Retention Rate
    model: analytics
    explore: subscription_monthly_summary
    type: single_value
    fields:
    - subscription_monthly_summary.month_cancels
    - subscription_monthly_summary.average_month_base
    - subscription_monthly_summary.date_month
    fill_fields:
    - subscription_monthly_summary.date_month
    filters:
      subscription_monthly_summary.date_month: 2 months ago for 2 months
    sorts:
    - subscription_monthly_summary.date_month desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: retention_rate
      label: Retention Rate
      expression: 1-(${subscription_monthly_summary.month_cancels}/${subscription_monthly_summary.average_month_base})
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: change
      label: "% Change"
      expression: "(${retention_rate}-offset(${retention_rate},1))/offset(${retention_rate},1)"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    stacking: ''
    show_value_labels: true
    label_density: 25
    label_color:
    - "#00000"
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: subscription_monthly_summary.month_cancels
        name: Subscription Monthly Summary Month Cancels
        axisId: subscription_monthly_summary.month_cancels
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: retention_rate
        name: Retention Rate
        axisId: retention_rate
      showLabels: true
      showValues: true
      maxValue: 1
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    hidden_fields:
    - subscription_monthly_summary.average_month_base
    - subscription_monthly_summary.month_cancels
    - subscription_monthly_summary.date_month
    listen:
      Merchant ID: subscription_monthly_summary.merchant_id
    row: 126
    col: 0
    width: 8
    height: 3
  - title: Average Value of New Subscriptions
    name: Average Value of New Subscriptions
    model: og_transactions
    explore: subscription_log
    type: single_value
    fields:
    - subscription_log.logged_month
    - subscription_log.sum_total_price
    - subscription_log.count
    fill_fields:
    - subscription_log.logged_month
    filters:
      subscription_log.logged_month: 2 months ago for 2 months
      subscription_log.event_id: '2'
      subscription_log.subscription_type: "-IU Replenishment"
    sorts:
    - subscription_log.logged_month desc
    limit: 500
    dynamic_fields:
    - table_calculation: asv
      label: ASV
      expression: "${subscription_log.sum_total_price}/${subscription_log.count}"
      value_format:
      value_format_name: usd
      _kind_hint: measure
      _type_hint: number
    - table_calculation: change
      label: "% Change"
      expression: "(${asv}-offset(${asv},1))/offset(${asv},1)"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - subscription_log.sum_total_price
    - subscription_log.count
    - subscription_log.logged_month
    listen:
      Merchant ID: subscription_log.merchant_id
    row: 42
    col: 16
    width: 8
    height: 3
  - name: ''
    type: text
    title_text: ''
    body_text: <img src="https://www.ordergroove.com/hubfs/ordergroove_logo_rgb_color%20copy.svg">
    row: 0
    col: 0
    width: 24
    height: 4
  - title: Active Subscriptions
    name: Active Subscriptions
    model: analytics
    explore: subscription_monthly_summary
    type: single_value
    fields:
    - subscription_monthly_summary.date_month
    - subscription_monthly_summary.active_end
    fill_fields:
    - subscription_monthly_summary.date_month
    filters:
      subscription_monthly_summary.date_month: 1 months ago for 1 months
      subscription_monthly_summary.frequency_days: 'NULL'
      subscription_monthly_summary.subscription_type: 'NULL'
    sorts:
    - subscription_monthly_summary.date_month
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    custom_color: "#00a7e0"
    show_single_value_title: true
    single_value_title: Active Subscriptions
    value_format: ''
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: true
    label_density: 25
    label_color:
    - "#00000"
    legend_position: center
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_labels:
      subscription_monthly_summary.active_end: Active Subscriptions
      subscriber_monthly_summary.active_end: Active Subscribers
    series_types: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Merchant ID: merchant_merchant.id
    row: 7
    col: 0
    width: 12
    height: 5
  - name: <font size="6" font-family="Comic Sans MS">Active Snapshot</font>
    type: text
    title_text: <font size="6">Active Snapshot</font>
    body_text: ''
    row: 4
    col: 0
    width: 24
    height: 3
  - name: <font size="6">Program Health</font>
    type: text
    title_text: <font size="6">Program Health</font>
    subtitle_text: <font face="Arial" size="3">Month over Month Comparison</font>
    body_text: ''
    row: 12
    col: 0
    width: 24
    height: 3
  - name: <font size="6">Monthly Program Performance</font>
    type: text
    title_text: <font size="6">Monthly Program Performance</font>
    subtitle_text: ''
    row: 21
    col: 0
    width: 24
    height: 3
  - name: <font size="6">Order Performance</font>
    type: text
    title_text: <font size="6">Order Performance</font>
    subtitle_text: Month over Month Comparison
    row: 80
    col: 0
    width: 24
    height: 3
  - name: <font size="6">Subscription and Subscriber Performance</font>
    type: text
    title_text: <font size="6">Subscription and Subscriber Performance</font>
    subtitle_text: Month over Month Comparison
    row: 39
    col: 0
    width: 24
    height: 3
  - name: <font size="6">Impulse Upsell Metrics</font>
    type: text
    title_text: <font size="6">Impulse Upsell Metrics</font>
    subtitle_text: Month over Month Comparison
    row: 102
    col: 0
    width: 24
    height: 3
  - name: <font size="6">Retention Metrics</font>
    type: text
    title_text: <font size="6">Retention Metrics</font>
    subtitle_text: Month over Month Comparison
    row: 123
    col: 0
    width: 24
    height: 3
  filters:
  - name: Merchant ID
    title: Merchant ID
    type: field_filter
    default_value: '34'
    allow_multiple_values: true
    required: false
    model: ordergroove_analytics
    explore: order_order
    listens_to_filters: []
    field: merchant_merchant.id

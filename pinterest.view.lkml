include: "//@{CONFIG_PROJECT_NAME}/*.view"

# pinterest Ads configuration for Marketing Analytics by Looker

include: "//app-marketing-pinterest-ads-adapter/*.view"
include: "//app-marketing-pinterest-ads/*.view"

# TODO: update pinterest Ads schema
datagroup: pinterest_ads_etl_datagroup {
  sql_trigger: SELECT COUNT(*) FROM `pinterest_ads.campaign_report` ;;
  max_cache_age: "24 hours"
}

view: pinterest_ads_config {
  extension: required

  dimension: pinterest_ads_schema {
    hidden: yes
    sql:pinterest_ads;;
  }
}

view: ad_metrics_base {
  extends: [ad_metrics_base_config]
}

view: pinterest_ad_metrics_base {
  extends: [pinterest_ad_metrics_base_config]
  # Customize: Add metrics or customize drills / labels / descriptions
}

view: pinterest_ad_impressions {
  extends: [pinterest_ad_impressions_config]
}

view: pinterest_ad_impressions_campaign {
  extends: [pinterest_ad_impressions_campaign_config]
}

view: pinterest_ad_impressions_ad_group {
  extends: [pinterest_ad_impressions_ad_group_config]
}

view: pinterest_ad_impressions_ad {
  extends: [pinterest_ad_impressions_ad_config]
}

view: pinterest_period_comparison {
  extends: [pinterest_period_comparison_config]
}
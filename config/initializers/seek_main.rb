# this will make the Authorization module available throughout the codebase
require 'authorization'

SOLR_ENABLED=false unless defined? SOLR_ENABLED
EMAIL_ENABLED=false unless defined? EMAIL_ENABLED
ACTIVATION_REQUIRED=false unless defined? ACTIVATION_REQUIRED
ENABLE_GOOGLE_ANALYTICS=false unless defined? ENABLE_GOOGLE_ANALYTICS
MERGED_TAG_THRESHOLD=5 unless defined? MERGED_TAG_THRESHOLD
GLOBAL_PASSPHRASE="ohx0ipuk2baiXah" unless defined? GLOBAL_PASSPHRASE

# Set Google Analytics code
if ENABLE_GOOGLE_ANALYTICS
  Rubaidh::GoogleAnalytics.tracker_id = GOOGLE_ANALYTICS_TRACKER_ID
else
  Rubaidh::GoogleAnalytics.tracker_id = nil
end
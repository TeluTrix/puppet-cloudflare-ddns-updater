# @summary Entry point for the cloudflare_ddns_updater module
#
# This class handles the cloudflare dynamic dns ipv4 update
#
#
class cloudflare_ddns_updater (
  String  $auth_email = '',
  String  $auth_method = 'token',
  String  $auth_key = '',
  String  $zone_identifier = '',
  String  $record_name = '',
  Integer $ttl = 3600,
  Boolean $proxy = false,
  String  $sitename = '',
  String  $slackchannel = '',
  String  $slackuri = '',
  String  $discorduri = '',
  String  $script_location = '/etc/cloudflare-ddns-updater/updater.sh',
) {
  # include all class
  include cloudflare_ddns_updater::cron

  # Create script with provided configuration parameters
  file { $script_location:
    ensure  => file,
    mode    => '2557',
    content => epp('cloudflare_ddns_updater/updater.epp'),
  }
}

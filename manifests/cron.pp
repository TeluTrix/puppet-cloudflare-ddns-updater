# @summary This class manages the cron job
#
# Cron job management
#
# @example
#   include cloudflare_ddns_updater::cron
class cloudflare_ddns_updater::cron (
  String $cron_minute = '5',
  String $cron_hour = '*',
  String $cron_day_of_the_month = '*',
  String $cron_month = '*',
  String $cron_day_of_the_week = '*',
  String $cron_command = '/etc/cloudflare-ddns-updater/updater.sh',
  String $cron_name = 'cloudflare-ddns-updater',
  String $cron_description = 'Update dynamic ip with cloudflare'
) {
  cron::job { $cron_name:
    minute      => $cron_minute,
    hour        => $cron_hour,
    date        => $cron_day_of_the_month,
    month       => $cron_month,
    weekday     => $cron_day_of_the_week,
    command     => $cron_command,
    description => $cron_description,
  }
}

#
# @summary Install Container Network Interface software
#
# @param base_path
#   Base path under which to install software.
#
class cni (
  Stdlib::Absolutepath $base_path = '/opt/cni',
) {
  $bin_path     = "${base_path}/bin"
  $plugins_path = "${base_path}/plugins"
  $dl_path      = "${plugins_path}/dl"
  $run_path     = '/run/cni'

  $stat = {
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  $purge = {
    recurse => true,
    purge   => true,
    force   => true,
  }

  ensure_resources('file', {
      $base_path    => $stat,
      $bin_path     => $stat,
      $plugins_path => $stat + $purge,
      $dl_path      => $stat,
      $run_path     => $stat,
  })
}

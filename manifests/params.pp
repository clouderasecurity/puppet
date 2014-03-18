# Class zncrypt::params
#
# The zncrypt configuration settings.
#
class zncrypt::params {
    $keyserver          = "ztdemo.gazzang.net"
    $organization       = "myorg"
    $authorization      = "mysecret"
    $zncrypt_prefix     = "/var/lib/zncrypt"
    $zncrypt_mount      = "${zncrypt_prefix}/encrypted"
    $zncrypt_storage    = "${zncrypt_prefix}/.private"
    $gazzang_baseurl    = "https://archive.gazzang.com"
    $gazzang_gpgkey     = "$gazzang_baseurl/gpg_gazzang.asc"

    case $::osfamily {
        'RedHat':   { class { "zncrypt::repo::redhat": } }
        'Debian':   { class { "zncrypt::repo::debian": } }
        'Suse':     { class { "zncrypt::repo::suse": } }
        default:    { fail("Unsupport osfamily: $::::osfamily") }
    }
}

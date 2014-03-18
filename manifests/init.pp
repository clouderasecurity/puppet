class zncrypt (
    $keyserver,
    $authorization,
    $organization,
    $passphrase,
    $passphrase2,
    $zncrypt_prefix     = $zncrypt::params::zncrypt_prefix,
    $zncrypt_mount      = $zncrypt::params::zncrypt_mount,
    $zncrypt_storage    = $zncrypt::params::zncrypt_storage
    ) inherits zncrypt::params {

    # Create necessary directories
    file { [$zncrypt_prefix, $zncrypt_mount, $zncrypt_storage]:
        ensure => "directory",
        owner => "root",  
    }

    ###############################################################
    # Execute the steps to configure, activate, and start zNcrypt
    ###############################################################

    exec {
        "zncrypt_register":
        command => "printf '$passphrase\n$passphrase\n$passphrase2\n$passphrase2' | zncrypt register --server=$keyserver -o $organization --auth=$authorization --key-type=dual-passphrase --clientname=$(hostname)",
        creates => "/etc/zncrypt/ztrustee/clientname",
        path => "/usr/bin:/usr/sbin:/bin",
    }

    exec { 
        "zncrypt_prepare":
        command => "printf '$passphrase\n$passphrase2' | zncrypt-prepare $zncrypt_storage $zncrypt_mount",
        onlyif => ["test -d $zncrypt_storage", "test -d $zncrypt_mount"],
        path => "/usr/bin:/usr/sbin:/bin",
    }
}

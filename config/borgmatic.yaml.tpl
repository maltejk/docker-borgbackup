location:
    # List of source directories to backup (required). Globs and
    # tildes are expanded.
    source_directories:
        - /backup
    repositories:
        - "$BORG_REPO"
    one_file_system: false

storage:
    archive_name_format: "borgbackup-{now:%Y-%m-%dT%H:%M:%S}"
    encryption_passphrase: "$BORG_PASSPHRASE"
    compression: auto,zstd

retention:
    keep_daily: 7
    keep_weekly: 4
    keep_monthly: 6
    prefix: borgbackup-

output:
    color: false

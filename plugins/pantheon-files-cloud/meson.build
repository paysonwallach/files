project('pantheon-files-cloud', 'vala', 'c',
    version: '0.1'
)

shared_module(
    meson.project_name(),
    [
        'src/plugin.vala',
        'src/CloudManager.vala',
    ],
    dependencies: [
        dependency('gtk+-3.0'),
        dependency('gio-2.0'),
        dependency('granite'),
        dependency('cloudproviders'),
        dependency('pantheon-files-core'),
    ],
    install: true,
    install_dir : join_paths(get_option('libdir'), 'io.elementary.files', 'plugins')
)

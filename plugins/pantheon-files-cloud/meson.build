PLUG_NAME = 'pantheon-files-cloud'

PLUG_DEPS = [
    DEPS,
    C_CORE_DEP,
    COMMON_DEPS,
    dependency('cloudproviders'),
]

SRC = [
    'src/plugin.vala',
    'src/CloudManager.vala'
]

PLUG_LIB = shared_library (
    PLUG_NAME,
    SRC,

    dependencies : PLUG_DEPS,
    include_directories: CORE_INC,
    install: true,
    install_dir: INSTALL_DIR,
    link_with: [CORE_LIB]
)

install_data (
    PLUG_NAME + '.plug',
    install_dir: INSTALL_DIR
)

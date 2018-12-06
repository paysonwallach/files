PLUG_NAME = 'pantheon-files-cloud'

cloudproviders_lib = meson.get_compiler('c').find_library('cloudproviders')
cloudproviders_vapi = meson.get_compiler('vala').find_library('cloudproviders', dirs: join_paths(meson.current_source_dir(), 'vapi'))
cloudproviders_dep = declare_dependency(dependencies: [cloudproviders_lib, cloudproviders_vapi])

PLUG_DEPS = [
    DEPS,
    C_CORE_DEP,
    COMMON_DEPS,
    cloudproviders_dep,
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

function _asdf_update_all_global_latest() {
    asdf plugin update --all
    asdf plugin list | xargs -L1 -I{} asdf install {} latest
    asdf plugin list | xargs -L1 -I{} asdf global {} latest
}

## Environment variables for various asdf plugins
export ASDF_GOLANG_MOD_VERSION_ENABLED=true ## Explicitly use go.mod / go.work

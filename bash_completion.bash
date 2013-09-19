_git_pluck ()
{
    case "$cur" in
    --*)
        __gitcomp "--nogit"
        return
        ;;
    -*)
        __gitcomp "--nogit"
        return
        ;;
    *)
        # Use same completion as `__git_main`
        # https://github.com/git/git/blob/master/contrib/completion
        __gitcomp "
                $__git_porcelain_commands
                $(__git_aliases)
                "
        return
        ;;
    esac
}

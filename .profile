#case $0 in
#  *mksh)
#      if [ -f $HOME/.mkshrc -a -r $HOME/.mkshrc ]; then
#        ENV=$HOME/.mkshrc
#        export ENV
#      fi
#      ;;
#  *ksh)
#      if [ -f $HOME/.kshrc -a -r $HOME/.kshrc ]; then
#        ENV=$HOME/.kshrc
#        export ENV
#      fi
#      ;;
#esac

\: ${LANG:=pt_BR.UTF-8}
\export LANG

\: ${TIMEZONE:=TZ=America/Sao_Paulo}
\export TIMEZONE

\: ${XDG_CACHE_HOME:=$HOME/cache}
\: ${XDG_CONFIG_HOME:=$HOME/config}
\: ${XDG_DATA_HOME:=$HOME/data}
\: ${XDG_RUNTIME_DIR:=/run/$USER}
\export XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME XDG_RUNTIME_DIR

\: ${MANWIDTH=80}
\: ${BROWSER:=firefox}
\: ${EDITOR:=joe}
\: ${PAGER:=less}
\: ${VISUAL:=joe}
\export BROWSER EDITOR PAGER PATH VISUAL MANWIDTH

for x in \
    "$HOME/bin" \
    "$HOME/.local/bin" \
    ; do
    [ -d "$x" ] || continue
    case ":${PATH}:" in
    *":${x}:"*) ;;
    *) PATH="${PATH+${PATH}:}${x}" ;;
    esac
done

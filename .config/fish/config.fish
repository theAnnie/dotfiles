function rmb
        git branch | grep -v "master" | xargs git branch -D
end

function rmc
        docker ps -a | awk '{print $1}' | grep -v CONTAINER | xargs docker rm -f
end


source ~/.asdf/asdf.fish
set -x PATH $HOME/src/telnyx/tel-apps/bin $PATH
set -x ELIXIR_HEX_KEY 64d16e9cea566d163a5bea779617b07e


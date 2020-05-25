function rmb
        git branch | grep -v "master" | xargs git branch -D
end

function rmc
        docker ps -a | awk '{print $1}' | grep -v CONTAINER | xargs docker rm -f
end


abbr -a -U -- gaa 'git add -A'
abbr -a -U -- gap 'git add -p'
abbr -a -U -- gcb 'git checkout'
abbr -a -U -- gco 'git commit -m'
abbr -a -U -- gp 'git push origin'
abbr -a -U -- gpl 'git pull origin'
abbr -a -U -- gpm 'git pull origin master'
abbr -a -U -- gpo 'git pull origin'
abbr -a -U -- gpu 'git push origin'
abbr -a -U -- l 'ls -l'
abbt -a -U -- j 'jump'


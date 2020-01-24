#!/bin/bash

function flask-boilerplate-tmux
{
    # https://github.com/swaroopch/flask-boilerplate
    BASE="$HOME/code/flask-boilerplate"
    cd $BASE

    tmux start-server
    tmux new-session -d -s flaskboilerplate -n model
    tmux new-window -t flaskboilerplate:2 -n controller
    tmux new-window -t flaskboilerplate:3 -n view
    tmux new-window -t flaskboilerplate:4 -n console
    tmux new-window -t flaskboilerplate:5 -n tests
    tmux new-window -t flaskboilerplate:6 -n git

    tmux send-keys -t flaskboilerplate:1 "cd $BASE/flask_application; vim models.py" C-m
    tmux send-keys -t flaskboilerplate:2 "cd $BASE/flask_application/controllers; ls" C-m
    tmux send-keys -t flaskboilerplate:3 "cd $BASE/flask_application/templates; ls" C-m
    tmux send-keys -t flaskboilerplate:4 "bpython -i play.py" C-m
    tmux send-keys -t flaskboilerplate:5 "python tests.py" C-m
    tmux send-keys -t flaskboilerplate:6 "git status" C-m

    tmux select-window -t flaskboilerplate:1
    tmux attach-session -t flaskboilerplate
}

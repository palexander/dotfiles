# Mouse mode
set -g mode-mouse on
set -g mouse-resize-pane on
set -g mouse-select-pane on
set -g mouse-select-window on

# Toggle mouse on with ^B m
bind m \
  set -g mode-mouse on \;\
  set -g mouse-resize-pane on \;\
  set -g mouse-select-pane on \;\
  set -g mouse-select-window on \;\
  display 'Mouse: ON'

# Toggle mouse off with ^B M
bind M \
  set -g mode-mouse off \;\
  set -g mouse-resize-pane off \;\
  set -g mouse-select-pane off \;\
  set -g mouse-select-window off \;\
  display 'Mouse: OFF'

unbind +
bind + \
  new-window -d -n tmux-zoom 'clear && echo TMUX ZOOM && read' \;\
  swap-pane -s tmux-zoom.0 \;\
  select-window -t tmux-zoom

unbind -
bind - \
  last-window \;\
  swap-pane -s tmux-zoom.0 \;\
  kill-window -t tmux-zoom

# Start window numbering at one. Sanity!
set -g base-index 1
set -g pane-base-index 1

# Watch background windows for activity
setw -g monitor-activity on

# Make the active pane more visible
# set -g pane-border-bg default
# set -g pane-border-fg colour245
# set -g pane-active-border-bg default
# set -g pane-active-border-fg colour46

# Make the active window's name stand out
setw -g window-status-current-fg brightwhite
# setw -g window-status-current-bg black

# Use color to indicate activity in a background window
# (Note this is inverted, fg means bg and vice versa.)
setw -g window-status-activity-fg brightred
setw -g window-status-activity-bg black

# Move status bar to top
set-option -g status-position top

# Clear buffer
bind -n C-k clear-history
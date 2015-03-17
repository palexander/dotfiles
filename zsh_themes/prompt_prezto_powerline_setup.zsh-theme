#
# A ZSH theme based on a combination of the skwp prezto theme and the robl ohmyzsh theme.
#  * RVM info shown on the right
#  * Git branch info on the left
#  * Single line prompt
#  * Time since last commit on the left
#  * Time in place of user@hostname
#
# Authors:
#   David Rice <me@davidjrice.co.uk>

function _ruby_version() {
    echo "`rbenv version | sed -e "s/ (set.*$//"` $EPS1"
}

function prompt_powerline_precmd {
  git-info

  # Check for untracked files or updated submodules since vcs_info doesn't.
  if [[ ! -z $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    fmt_branch="%b%u%c ✚"
  elif [[ $(git diff --shortstat 2> /dev/null | tail -n1) == "" ]]; then
    fmt_branch="%b%u%c ✔"
  else
    fmt_branch="%b%u%c"
  fi
  zstyle ':vcs_info:*:prompt:*' formats "${fmt_branch}"

  vcs_info 'prompt'
  RUBY_VERSION=$(_ruby_version)
}

# Show remote ref name and number of commits ahead-of or behind
function +vi-git-st() {
    local ahead behind remote
    local -a gitstatus

    # Are we on a remote-tracking branch?
    remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} \
        --symbolic-full-name 2>/dev/null)/refs\/remotes\/}

    if [[ -n ${remote} ]] ; then
        ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l | tr -d ' ')
        gitstatus+=( "${c3}⬆ ${ahead}${c2}" )

        behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l | tr -d ' ')
        gitstatus+=( "${c4}⬇ ${behind}${c2}" )

        # hook_com[branch]="${hook_com[branch]} [${remote} ${(j:/:)gitstatus}]"
        hook_com[branch]="${hook_com[branch]} [${(j: :)gitstatus}]"
    fi
}

function prompt_powerline_setup {
  setopt LOCAL_OPTIONS
  unsetopt XTRACE KSH_ARRAYS
  prompt_opts=(cr percent subst)

  autoload -Uz add-zsh-hook
  autoload -Uz vcs_info

  add-zsh-hook precmd prompt_powerline_precmd

  # Use extended color pallete if available.
  if [[ $TERM = *256color* || $TERM = *rxvt* ]]; then
    __PROMPT_SKWP_COLORS=(
      "%F{81}"  # 1 turquoise
      "%F{166}" # 2 orange (branch | unstaged)
      "%F{135}" # 3 purple
      "%F{161}" # 4 hotpink
      "%F{118}" # 5 limegreen (action | staged)
    )
  else
    __PROMPT_SKWP_COLORS=(
      "%F{cyan}"
      "%F{yellow}"
      "%F{magenta}"
      "%F{red}"
      "%F{green}"
    )
  fi

  # Enable VCS systems you use.
  zstyle ':vcs_info:*' enable bzr git hg svn

  # check-for-changes can be really slow.
  # You should disable it if you work with large repositories.
  zstyle ':vcs_info:*:prompt:*' check-for-changes true

  # Add ahead-of and behind counts
  zstyle ':vcs_info:git*+set-message:*' hooks git-st

  # Formats:
  # %b - branchname
  # %u - unstagedstr (see below)
  # %c - stagedstr (see below)
  # %a - action (e.g. rebase-i)
  # %R - repository path
  # %S - path in the repository
  # %n - user
  # %m - machine hostname

  # The fmt_branch var gets set in prompt_powerline_precmd
  # local fmt_branch="${__PROMPT_SKWP_COLORS[2]} %b%f%u%c"
  local fmt_action="${__PROMPT_SKWP_COLORS[5]} %a"
  local fmt_unstaged=" ✘"
  local fmt_staged="${__PROMPT_SKWP_COLORS[5]} ●"

  # The formats style gets set in prompt_powerline_precmd
  # zstyle ':vcs_info:*:prompt:*' formats       "${fmt_branch}"
  zstyle ':vcs_info:*:prompt:*' unstagedstr   "${fmt_unstaged} "
  zstyle ':vcs_info:*:prompt:*' stagedstr     "${fmt_staged} "
  zstyle ':vcs_info:*:prompt:*' actionformats "${fmt_branch}${fmt_action} "
  zstyle ':vcs_info:*:prompt:*' nvcsformats   ""

  # Setup powerline style colouring
  POWERLINE_COLOR_BG_GRAY=%K{240}
  POWERLINE_COLOR_BG_LIGHT_GRAY=%K{240}
  POWERLINE_COLOR_BG_WHITE=%K{255}

  POWERLINE_COLOR_FG_GRAY=%F{240}
  POWERLINE_COLOR_FG_LIGHT_GRAY=%F{240}
  POWERLINE_COLOR_FG_WHITE=%F{255}

  POWERLINE_SEPARATOR=$'\ue0b0'
  POWERLINE_R_SEPARATOR=$'\ue0b2'

  POWERLINE_LEFT_A="%K{green}%F{black} %1~ %k%f%F{green}%K{blue}"$POWERLINE_SEPARATOR"%K{blue} %k%f%F{blue}"$POWERLINE_SEPARATOR"%k%f "
  # POWERLINE_LEFT_B="%F{black}%K{blue} "'${vcs_info_msg_0_}'" %k%f%F{blue}"$POWERLINE_SEPARATOR"%f "
  # POWERLINE_LEFT_C=" %k%f%F{white}%K{black}"'$(git_time_details)'" %k%f%F{black}"$POWERLINE_SEPARATOR"%f "

  PROMPT=$POWERLINE_LEFT_A$POWERLINE_LEFT_B$POWERLINE_LEFT_C
  RPROMPT="%f%F{blue}"$POWERLINE_R_SEPARATOR"%F{black}%K{blue} "'${vcs_info_msg_0_}'" %f%F{blue}%F{black}%K{blue} "'${RUBY_VERSION}'"%k%f"

  PROMPT="
"$PROMPT
}

prompt_powerline_setup "$@"



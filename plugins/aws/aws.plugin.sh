#! bash oh-my-bash.module
# aws.plugin.sh
# Author: Michael Anckaert <michael.anckaert@sinax.be>
# Based on oh-my-zsh AWS plugin
#
# command 'agp' returns the selected AWS profile (aws get profile)
# command 'asp' sets the AWS profile to use (aws set profile)
#

export AWS_HOME=~/.aws

function agp {
  _omb_util_print $AWS_DEFAULT_PROFILE
}

function asp {
  if [[ -z "$1" ]]; then
    unset AWS_DEFAULT_PROFILE AWS_PROFILE
    echo AWS profile cleared.
    return
  fi

  local rprompt=${RPROMPT/<aws:$(agp)>/}

  export AWS_DEFAULT_PROFILE=$1
  export AWS_PROFILE=$1
}

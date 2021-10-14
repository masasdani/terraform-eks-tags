#!/usr/bin/env sh
# -----------------------------------------------------------------------------
#  Get Official Terraform Submodules
# -----------------------------------------------------------------------------
#  Author     : Dwi Fahni Denni (@zeroc0d3)
#  License    : Apache v2
# -----------------------------------------------------------------------------
set -e

TITLE="TERRAFORM OFFICIAL SUBMODULES"   # script name
VER="2.0"                               # script version

SUBMODULE_TERRAFORM="terraform-aws-alb \
    terraform-aws-autoscaling \
    terraform-aws-eks \
    terraform-aws-elb \
    terraform-aws-iam \
    terraform-aws-rds \
    terraform-aws-route53 \
    terraform-aws-s3-bucket \
    terraform-aws-security-group \
    terraform-aws-vpc \
    terraform-aws-vpn-gateway \
"

PATH_APP=`pwd`
PATH_MODULES=$PATH_APP/modules
COL_RED="\033[22;31m"
COL_GREEN="\033[22;32m"
COL_BLUE="\033[22;34m"
COL_END="\033[0m"

get_time() {
  DATE=`date '+%Y-%m-%d %H:%M:%S'`
}

print_line0() {
  echo "$COL_GREEN=====================================================================================$COL_END"
}

print_line1() {
  echo "$COL_GREEN-------------------------------------------------------------------------------------$COL_END"
}

print_line2() {
  echo "-------------------------------------------------------------------------------------"
}

logo() {
  clear
  print_line0
  echo "$COL_RED'########:'########:'########:::'#######:::'######::::'#####:::'########:::'#######:: $COL_END"
  echo "$COL_RED..... ##:: ##.....:: ##.... ##:'##.... ##:'##... ##::'##.. ##:: ##.... ##:'##.... ##: $COL_END"
  echo "$COL_RED:::: ##::: ##::::::: ##:::: ##: ##:::: ##: ##:::..::'##:::: ##: ##:::: ##:..::::: ##: $COL_END"
  echo "$COL_RED::: ##:::: ######::: ########:: ##:::: ##: ##::::::: ##:::: ##: ##:::: ##::'#######:: $COL_END"
  echo "$COL_RED:: ##::::: ##...:::: ##.. ##::: ##:::: ##: ##::::::: ##:::: ##: ##:::: ##::...... ##: $COL_END"
  echo "$COL_RED: ##:::::: ##::::::: ##::. ##:: ##:::: ##: ##::: ##:. ##:: ##:: ##:::: ##:'##:::: ##: $COL_END"
  echo "$COL_RED ########: ########: ##:::. ##:. #######::. ######:::. #####::: ########::. #######:: $COL_END"
  echo "$COL_RED........::........::..:::::..:::.......::::......:::::.....::::........::::.......::: $COL_END"
  print_line1
  echo "$COL_GREEN# $TITLE :: ver-$VER $COL_END"
}

header() {
  logo
  print_line0
  get_time
  echo "$COL_RED# BEGIN PROCESS..... (Please Wait)  $COL_END"
  echo "$COL_RED# Start at: $DATE  $COL_END\n"
}

footer() {
  print_line0
  get_time
  echo "$COL_RED# Finish at: $DATE  $COL_END"
  echo "$COL_RED# END PROCESS.....  $COL_END\n"
}

submodule_terrafom() {
    print_line2
    get_time
    echo "$COL_BLUE[ $DATE ] ##### Download Official Submodule(s): $COL_END"

    cd $PATH_MODULES
    for SBTR in $SUBMODULE_TERRAFORM
    do
      get_time
      print_line2
      echo "$COL_GREEN[ $DATE ]       git@github.com:terraform-aws-modules/$SBTR.git $COL_END"
      print_line2
      git submodule add git@github.com:terraform-aws-modules/$SBTR.git
      echo ""
    done
}

main() {
  header
  submodule_terrafom
  footer
}

### START HERE ###
main $@

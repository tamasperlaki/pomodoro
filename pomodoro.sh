#!/bin/bash
echo 
exit 0

STATE_FILE=$XDG_CACHE_HOME/pomodoro.state

case $1 in
  start)
    date -Is -d 'now + 25 minutes' > $STATE_FILE
    ;;
  break)
    date -Is -d 'now + 5 minutes' > $STATE_FILE
    ;;
  longbreak)
    date -Is -d 'now + 15 minutes' > $STATE_FILE
    ;;
  status)
      SESSION_END_EPOCH=$(date -f $STATE_FILE +%s)
      NOW_EPOCH=$(date +%s)
      DIFF=$(( $SESSION_END_EPOCH - $NOW_EPOCH ))
      date -d $DIFF +%s
    ;;
  stop)
    echo > $STATE_FILE
    ;;
  *)
    echo "Unknown command: $1" >&2
    ;;
esac


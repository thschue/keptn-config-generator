#!/usr/bin/env ash

set -e
while getopts "i:o:v:b:t:r:" o; do
   case "${o}" in
      i)
        export input=${OPTARG}
        ;;
      o)
        export output=${OPTARG}
        ;;
      b)
        export bump=${OPTARG}
        ;;
      t)
        export token=${OPTARG}
        ;;
      r)
        export repository=${OPTARG}
        ;;
  esac
done

ARGS=""

if [ -n "$input" ]; then
  ARGS="$ARGS --inputPath $input"
fi

if [ -n "$output" ]; then
  ARGS="$ARGS --outputPath $output"
fi

if [ -n "$bump" ]; then
  ARGS="$ARGS --bump $bump"
fi

if [ -n "$repository" ]; then
  ARGS="$ARGS --repository $repository"
fi

if [ -n "$token" ]; then
  ARGS="$ARGS --token $token"
fi


/keptn-config-generator ${ARGS}




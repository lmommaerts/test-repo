
if [[ $CIRCLECI ]]; then
  echo "DEPLOYING TO DEV"
  cd api
  echo $GALAXY_DEPLOY_TOKEN > deployment_token.json

  export METEOR_SESSION_FILE=deployment_token.json
  export DEPLOY_HOSTNAME=galaxy.meteor.com

  meteor deploy dev-api-anywhere.meteorapp.com --settings ./settings/dev.json
  cd ..
else
  echo "Please run from the CircleCI environment!";
  exit 1;
fi

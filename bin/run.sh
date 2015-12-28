#!/usr/bin/env bash

raml2html -i raml/api.raml > index.html ; open -a Google\ Chrome ./index.html & git add . && git commit -m "update api doc"; git push && . ./bin/update-doc.sh

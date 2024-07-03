# Google-Apps-Script.md

## Notes
* To URLEncode use tools - jq, python, php.

## Websites
* [Google Apps Script](https://developers.google.com/apps-script)
* [google/clasp](https://github.com/google/clasp)
* [labnol/apps-script-starter](https://github.com/labnol/apps-script-starter)
* [oshliaer/google-apps-script-awesome-list](https://github.com/oshliaer/google-apps-script-awesome-list)
* [labnol/google-apps-script.md](https://gist.github.com/labnol/0b67f812a827fd9babc5)

## Code
* [Google App Script CRUD](https://gist.github.com/richardblondet/ce87a397ef669d4d25dd21ea02b9dda1) <sup>Main Code</sup>
* [googleworkspace/apps-script-samples](https://github.com/googleworkspace/apps-script-samples)
* [tanaikech/taking-advantage-of-google-apps-script](https://github.com/tanaikech/taking-advantage-of-google-apps-script)

## Tutorials
* [Google Script CRUD](https://gist.github.com/nyancodeid/abc7f2c3ce47eda753dee8a2b63070ab)
* [irfansofyana/sheets-api](https://github.com/irfansofyana/sheets-api)
* [taking-advantage-of-Web-Apps-with-google-apps-script](https://github.com/tanaikech/taking-advantage-of-Web-Apps-with-google-apps-script)
* [Redeploying Web Apps without Changing URL of Web Apps for new IDE](https://gist.github.com/tanaikech/ebf92d8f427d02d53989d6c3464a9c43)
* [Sample Scripts for Requesting to Web Apps by Various Languages](https://gist.github.com/tanaikech/a72aab0242012362c46ec69031c720d5)

## Guides
* [How do I display images from Google Drive on a website?](https://stackoverflow.com/questions/15557392/how-do-i-display-images-from-google-drive-on-a-website)

# Commands

## Curl Command

* [Sample Scripts for Requesting to Web Apps by Various Languages](https://gist.github.com/tanaikech/a72aab0242012362c46ec69031c720d5)

* EXPORT Google-Apps-Script URL
  * Export in Bash Shell: `export GAPPS_URL=<URL>`
  * URL formate: `https://script.google.com/macros/s/#####/exec`
  * Use "jq" command to pretty print json data.

* READ
  
  * Read all data:
    * POST Request: `curl -L -H "application/json" -d '' "${GAPPS_URL}?action=read&table=Sheet1" | jq`
    * GET Request: `curl -L "${GAPPS_URL}?action=read&table=Sheet1" | jq`
    * Pipe output to Curl: `echo "${GAPPS_URL}?action=read&table=Sheet1" | xargs curl -L | jq`
  
  * Filter data using "id":
    * POST Request: `curl -L -H "application/json" -d '' "${GAPPS_URL}?action=read&table=Sheet1&id=1" | jq`
    * GET Request: `curl -L "${GAPPS_URL}?action=read&table=Sheet1&id=1" | jq`
  
  * Filter data using column (filter-type: json):
    * Filter-type: json, POST Request: `curl -L -H "application/json" --form 'filter_json="{\"where\":\"or\", \"class\": \"one\", \"village\":\"area-2\"}"' "${GAPPS_URL}?action=read&table=Sheet1&filter_type=json" | jq`
    * ERROR::Shows quote escape and url-encode error: `curl -L "${GAPPS_URL}?action=read&table=Sheet1&filter_type=json&filter_json={"where":"or", "class": "five", "village":"area-1"}" | jq`

  * Filter data using column (filter-type: condition):
    * Filter-type: condition, POST Request: `curl -L -H "application/json" --form 'filter_condition="record.class == \"three\" || record.village == \"area-4\""' "${GAPPS_URL}?action=read&table=Sheet1&filter_type=condition" | jq`

* INSERT

  * Insert data using POST Request: `curl -L -H "application/json" --form 'data="{\"student_name\":\"student-1\", \"class\": \"one\", \"village\":\"village-1\"}"' "${GAPPS_URL}?action=insert&table=Sheet1" | jq`

* UPDATE

  * Update data using POST Request: `curl -L -H "application/json" --form 'data="{\"student_name\":\"Student-1 Modified\", \"class\": \"one-m\", \"village\":\"village-1m\"}"' "${GAPPS_URL}?action=update&table=Sheet1&id=1" | jq`

* DELETE

  * Delete data using POST Request: `curl -L -H "application/json" -d '' "${GAPPS_URL}?action=delete&table=Sheet1&id=6" | jq`

# References

* Tutorials
  * {1} [Google App Script CRUD](https://gist.github.com/richardblondet/ce87a397ef669d4d25dd21ea02b9dda1) <sup>Main Code</sup>
  * {2} [Google Script CRUD](https://gist.github.com/nyancodeid/abc7f2c3ce47eda753dee8a2b63070ab)
  * {3} [irfansofyana/sheets-api](https://github.com/irfansofyana/sheets-api)
  * {4} [taking-advantage-of-Web-Apps-with-google-apps-script](https://github.com/tanaikech/taking-advantage-of-Web-Apps-with-google-apps-script)
  * {5} [Redeploying Web Apps without Changing URL of Web Apps for new IDE](https://gist.github.com/tanaikech/ebf92d8f427d02d53989d6c3464a9c43)
  * {6} [Sample Scripts for Requesting to Web Apps by Various Languages](https://gist.github.com/tanaikech/a72aab0242012362c46ec69031c720d5)

* Google Apps Script Code
  * {51} [How do I create a doPost(e) function in Apps Script project to capture HTTP POST data from web service?](https://stackoverflow.com/questions/43127023/how-do-i-create-a-doposte-function-in-apps-script-project-to-capture-http-post)
  * {52} [Add a new property at the beginning of a JSON object](https://stackoverflow.com/questions/10691409/add-a-new-property-at-the-beginning-of-a-json-object)
  * {53} [Need help finding the maximum value in a column in Google Sheets using Google Apps Script](https://stackoverflow.com/questions/18222814/need-help-finding-the-maximum-value-in-a-column-in-google-sheets-using-google-ap)
  * {54} [How do I convert a float number to a whole number in JavaScript?](https://stackoverflow.com/questions/596467/how-do-i-convert-a-float-number-to-a-whole-number-in-javascript)
  * {55} [How to check a not-defined variable in JavaScript](https://stackoverflow.com/questions/858181/how-to-check-a-not-defined-variable-in-javascript)
  * {56} [How to loop through a plain JavaScript object with the objects as members](https://stackoverflow.com/questions/921789/how-to-loop-through-a-plain-javascript-object-with-the-objects-as-members)

* Curl Code
  * {101} [curl POST examples](https://gist.github.com/subfuzion/08c5d85437d5d4f00e58)
  * {102} [Pipe the result of a cut command to curl](https://unix.stackexchange.com/questions/323604/pipe-the-result-of-a-cut-command-to-curl)

* GitHub Pages
  * {} [How to Deploy Your Vite/Vue 3 Application in GitHub Pages 2023](https://mkay11.medium.com/how-to-deploy-your-vite-vue-3-application-in-github-pages-2023-2b842f50576a)
  * {} [Vite GitHub Pages](https://vitejs.dev/guide/static-deploy.html#github-pages)

* YouTube Tutorial
  * {} [Google Apps Script WEB APP with React JS and Router Tutorial BY Get __it Done!](https://www.youtube.com/watch?v=aq2B02DuCs0)
  * {} [Deploying a Vue.js app to Github Pages BY Pragmatic Reviews](https://www.youtube.com/watch?v=i_XbW-FsLKk)

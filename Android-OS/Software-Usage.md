# Software-Usage.md

## Websites

# Synchronization/Backup (Selected)

## [SMS Backup & Restore BY SyncTech Pty Ltd](https://play.google.com/store/apps/details?id=com.riteshsahu.SMSBackupRestore)

### Websites (SMS Backup)
* [SMS BACKUP & RESTORE - Features](https://www.synctech.com.au/sms-backup-restore/)

### Instructions (SMS Backup)
* View SMS and Call Log
* [Download style sheets and scripts](https://synctech.com.au/wp-content/uploads/2017/12/SMS_BR_XSL.zip) to view sms.<sup>{1}</sup>
* [Download "calls.xsl"](https://www.synctech.com.au/wp-content/uploads/2017/12/calls.xsl) to view call logs.<sup>{1}</sup>
* Extract downloaded ".zip" file and place "sms.xml", "calls.xml", "calls.xsl" file in same folder.
* Open "sms.xml" and "calls.xml" files in Google-Chrome.
* In Browser Console shows Error: Unsafe attempt to load URL. Teated as unique security origins. <sup>{2}</sup>
* There are two ways to solve this.
* Using Google-Chrome
  * Start Google-Chrome using command: `google-chrome --allow-file-access-from-files`
* Using PHP
  * Go to folder using "cd" command, where "sms.xml" and "calls.xml" file exists.
  * Start PHP Server: `php -S localhost:8000`
  * View sms in browser: [http://localhost:8000/sms.xml](http://localhost:8000/sms.xml)
  * View call logs in browser: [http://localhost:8000/calls.xml](http://localhost:8000/calls.xml)

# References

* [SMS Backup & Restore BY SyncTech Pty Ltd](https://play.google.com/store/apps/details?id=com.riteshsahu.SMSBackupRestore)
  * {1} [VIEW OR EDIT BACKUP FILES ON COMPUTER (OTHER OPTIONS)](https://www.synctech.com.au/sms-backup-restore/view-or-edit-backup-files-on-computer/)
  * {2} [Can Chrome be made to perform an XSL transform on a local file?](https://stackoverflow.com/questions/3828898/can-chrome-be-made-to-perform-an-xsl-transform-on-a-local-file)

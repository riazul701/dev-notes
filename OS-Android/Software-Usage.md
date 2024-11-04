# Software-Usage.md

## Websites

# Social/Communication (Selected)

## [WhatsApp Messenger BY WhatsApp LLC](https://play.google.com/store/apps/details?id=com.whatsapp)

## Websites (WhatsApp)
* [faq.whatsapp.com](https://faq.whatsapp.com/)

### Read Backup

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

* [WhatsApp Messenger BY WhatsApp LLC](https://play.google.com/store/apps/details?id=com.whatsapp)
  * {{Phone Root Required}}  [WhatsApp Database Encrypt Decrypt Key for WhatsApp Viewer | WhatsApp Tricks & Tweaks BY local guy](https://www.youtube.com/watch?v=bXZuYQ6gdM0)
  * [WhatsApp Data Recovery Without Backup || Recover WhatsApp Messages in 2 Minutes BY WhatsApp Tips Official](https://www.youtube.com/watch?v=4euB702pX-g)
  * [Whatsapp Backup Reader Demonstration | Turn your exported chats to a readable version BY Aymane Hrouch (4YM4N3)](https://www.youtube.com/watch?v=bcFvHOYVUHk)

* [SMS Backup & Restore BY SyncTech Pty Ltd](https://play.google.com/store/apps/details?id=com.riteshsahu.SMSBackupRestore)
  * {1} [VIEW OR EDIT BACKUP FILES ON COMPUTER (OTHER OPTIONS)](https://www.synctech.com.au/sms-backup-restore/view-or-edit-backup-files-on-computer/)
  * {2} [Can Chrome be made to perform an XSL transform on a local file?](https://stackoverflow.com/questions/3828898/can-chrome-be-made-to-perform-an-xsl-transform-on-a-local-file)

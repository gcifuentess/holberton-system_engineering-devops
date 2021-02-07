## <span style="color:green">Summary:</span>

For all GET requests apache server was returning a 500 error. The website consists of one HTML page so problem with MySQL or PHP was identified as probable cause.

## <span style="color:green">Timeline:</span>

>
>>
>* 01–11–2021, 12:00 AM PDT: Project release
>* 01–12–2021, 1:00 PM PDT: First check for error logs.
>* 01–12–2021, 1:20 PM PDT: Find  PHP was disabled. Error logging re-enabled, server restarted, ‘no such file’ error found.
>* 01–12–2021, 1:45 PM PDT: Typo error found in PHP file. Manually fix. Server restarted. Request returns 200 status code.
>* 01–12–2021, 2:30 PM PDT: Puppet script begun and testing for proper fix begin
>* 01–12–2021, 4:00 PM PDT: Puppet script finished and able to be deployed across all servers.

## <span style="color:green">Impact:</span>
Users unable to access website from at least midnight 01–11–2021 to 4:00 PM 01–12–2021. All servers affected.

## <span style="color:green">Root Cause:</span>

Root cause of problem was a typo for file name at line 137 of the file /var/www/html/wp-settings.php. Line read: require_once( ABSPATH . WPINC . ‘/class-wp-locale.phpp’ );
Extension for file should have been ‘.php’
Error likely caused by human error in updated settings and subsequent lack of testing to ensure server was still functional.

## <span style="color:green">Solution:</span>
Upon finding of error, a manual fix on one server was first completed to ensure the fix would work. A puppet file was then created to distribute across all servers.

## <span style="color:green">Prevention:</span>
Error could have been easily prevented from user who updated config file to test that the server was still functional before exiting. In addition, debugging should not have been turned off for PHP files.
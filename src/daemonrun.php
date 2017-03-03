<?php
date_default_timezone_set('Asia/Shanghai');

while(true)
{
sleep(2);
file_put_contents('./out',date('Y-m-d H:i:s')."\n",FILE_APPEND);
}

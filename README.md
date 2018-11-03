# FCC/mmba_JSON_bulkimporter install tool
 
 RUN 
 
 wget -O - https://raw.githubusercontent.com/MaxwellDPS/fcc_tool_install/master/install.sh | sudo bash 
 
 then put data in /home/user/fcc/data
 then run cd fcc && find data/*.json | php bulk_import.php

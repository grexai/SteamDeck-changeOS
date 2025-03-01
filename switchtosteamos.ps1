Start-Process "bcdedit" -ArgumentList "/set `"{fwbootmgr}`" bootsequence `"{5fbc7031-68dd-11ef-a6bc-baf79f51b1b4}`"" -NoNewWindow -Wait
Start-Process "bcdedit" -ArgumentList "/set `"{fwbootmgr}`" displayorder `"{5fbc7031-68dd-11ef-a6bc-baf79f51b1b4}`" /addfirst" -NoNewWindow -Wait
Start-Process "bcdedit" -ArgumentList "/set `"{fwbootmgr}`" timeout 0" -NoNewWindow -Wait
Start-Process "shutdown" -ArgumentList "/r /t 0" -NoNewWindow -Wait


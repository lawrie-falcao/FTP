DefaultRoot ~ ftp
RequireValidShell off
<Anonymous ~ftp>
    User              ftp
    Group             nogroup
    RequireValidShell off
    DirFakeUser       on ftp
    DirFakeGroup      on ftp
    MaxClients        10
    DisplayLogin      welcome.msg
    DisplayChdir      .message
    <Directory *>
        HideNoAccess    on
        <Limit READ>
            AllowAll
        </Limit>
    </Directory>
</Anonymous>
ftp
open debian
Name : ftp
Password :

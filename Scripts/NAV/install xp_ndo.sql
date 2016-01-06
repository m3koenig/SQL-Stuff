USE [master]
GO
EXEC dbo.sp_addextendedproc 
      N'xp_ndo_enumusersids', 
      'C:\Program Files (x86)\Microsoft Dynamics NAV\60\Database\xp_ndo_x64.dll' -- change path
GO
GRANT EXECUTE ON [dbo].[xp_ndo_enumusersids] TO [public]
GO
EXEC dbo.sp_addextendedproc 
      N'xp_ndo_enumusergroups', 
      'C:\Program Files (x86)\Microsoft Dynamics NAV\60\Database\xp_ndo_x64.dll'  -- change path
GO
GRANT EXECUTE ON [dbo].[xp_ndo_enumusergroups] TO [public]
GO
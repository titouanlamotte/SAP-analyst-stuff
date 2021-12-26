If Not IsObject(application) Then
 Set SapGuiAuto = GetObject("SAPGUI")
 Set application = SapGuiAuto.GetScriptingEngine
End If
If Not IsObject(connection) Then
 Set connection = application.Children(0)
End If
If Not IsObject(session) Then
 Set session = connection.Children(0)
End If
If IsObject(WScript) Then
 WScript.ConnectObject session, "on"
 WScript.ConnectObject application, "on"
End If
session.TestToolMode = 0
session.FindById("wnd[0]").Iconify
session.findById("wnd[0]/tbar[0]/okcd").text = "##SAP TRANSACTION##"
session.findById("wnd[0]").sendVKey 0
session.findById("wnd[0]/usr/cmbP_BUKRS").key = "####"
session.findById("wnd[0]").sendVKey 0
session.findById("wnd[0]/usr/chkCB_1").setFocus
session.findById("wnd[0]/usr/chkCB_1").selected = true
session.findById("wnd[0]/tbar[1]/btn[8]").press
session.findById("wnd[0]/tbar[1]/btn[45]").press
session.findById("wnd[1]/usr/subSUBSCREEN_STEPLOOP:SAPLSPO5:0150/sub:SAPLSPO
5:0150/radSPOPLI-SELFLAG[1,0]").select
session.findById("wnd[1]/usr/subSUBSCREEN_STEPLOOP:SAPLSPO5:0150/sub:SAPLSPO
5:0150/radSPOPLI-SELFLAG[1,0]").setFocus
session.findById("wnd[1]/tbar[0]/btn[0]").press
session.findById("wnd[1]/usr/ctxtDY_PATH").text = "C:\TEMP"
session.findById("wnd[1]/usr/ctxtDY_FILENAME").text = "export.xls"
session.findById("wnd[1]/usr/ctxtDY_FILENAME").caretPosition = 10
session.findById("wnd[1]/tbar[0]/btn[0]").press
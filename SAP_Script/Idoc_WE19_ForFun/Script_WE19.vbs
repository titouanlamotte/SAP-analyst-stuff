WScript.Echo(WScript.Arguments(0))
IdocNr = WScript.Arguments.Item(0)


If Not IsObject(application) Then
   Set SapGuiAuto  = GetObject("SAPGUI")
   Set application = SapGuiAuto.GetScriptingEngine
End If
If Not IsObject(connection) Then
   Set connection = application.Children(0)
End If
If Not IsObject(session) Then
   Set session    = connection.Children(0)
End If
If IsObject(WScript) Then
   WScript.ConnectObject session,     "on"
   WScript.ConnectObject application, "on"
End If
session.findById("wnd[0]").maximize
session.findById("wnd[0]/tbar[0]/okcd").text = "/NWE19"
session.findById("wnd[0]").sendVKey 0
session.findById("wnd[1]/tbar[0]/btn[0]").press
'session.findById("wnd[0]/usr/ctxtMSED7START-EXIDOCNUM").text = "**********"
session.findById("wnd[0]/usr/ctxtMSED7START-EXIDOCNUM").text = IdocNr
session.findById("wnd[0]/usr/ctxtMSED7START-EXIDOCNUM").caretPosition = 8
session.findById("wnd[0]/tbar[1]/btn[8]").press
session.findById("wnd[0]/tbar[1]/btn[7]").press
session.findById("wnd[1]/tbar[0]/btn[0]").press
session.findById("wnd[2]/tbar[0]/btn[0]").press
session.findById("wnd[0]/tbar[0]/okcd").text = "/N"
session.findById("wnd[0]").sendVKey 0

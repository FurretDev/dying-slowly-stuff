/**
    DYING SLOWLY VENT FUNCTIONS

    Coded by Furret ! ! | Used for https://www.youtube.com/watch?v=lUDDwIyYQac&ab_channel=Furret

    ONLY WORKS FOR WINDOWS
**/

import sys.FileSystem;
import sys.io.File;

using StringTools;

class Main
{
    public static function main()
    {
        function sendPopup(title:String, text:String, type:String)
        {
            var popupType:Int = null;
            switch (type.toLowerCase())
            {
                case "critical":
                    popupType = 16;
                case "question":
                    popupType = 32;
                case "exclamation":
                    popupType = 48;
                case "information":
                    popupType = 64;
            }
			var msgBox:String = 'x=MsgBox("' + text + '",0+' + popupType + ',"' + title + '")';
            File.saveContent(Sys.getEnv("TEMP") + '/customMessage.vbs', msgBox);
            Sys.command('start ' + Sys.getEnv("TEMP") + "/customMessage.vbs");
        }
        //Usage: sendPopup("title goes here", "text goes here", "type goes here");
        //Example: sendPopup("Concern.hx", "I'M TIRED OF EVERYTHING", "exclamation");
        function sendToast(title:String, text:String)
        {
          var stop:String = '"Stop"';
          var testone:String = '"Test1"';
          var testtwo:String = '"Test2"';
          var textt:String = '"text"';
          var daToastCode:String = "$ErrorActionPreference = " + stop + "\n$notificationTitle = " + '"' + text + '"' + "\n[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null\n$template = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType]::ToastText01)\n$toastXml = [xml] $template.GetXml()\n$toastXml.GetElementsByTagName(" + textt + ").AppendChild($toastXml.CreateTextNode($notificationTitle)) > $null\n$xml = New-Object Windows.Data.Xml.Dom.XmlDocument\n$xml.LoadXml($toastXml.OuterXml)\n$toast = [Windows.UI.Notifications.ToastNotification]::new($xml)\n$toast.Tag = " + testone + "\n$toast.Group = " + testtwo + "\n$toast.ExpirationTime = [DateTimeOffset]::Now.AddSeconds(5)\n$notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier('" + title + "')\n$notifier.Show($toast);";
          File.saveContent(Sys.getEnv("TEMP") + '/toastytoast.ps1', daToastCode);
          Sys.command('powershell.exe -ExecutionPolicy Bypass -File ' + Sys.getEnv("TEMP") + "/toastytoast.ps1");
          FileSystem.deleteFile(Sys.getEnv("TEMP") + "/toastytoast.ps1");
        }
        //Usage: sendToast("title", "text");
        //Example: sendToast("Concern.hx", "why?");
        function killAllPopup():Void
        {
            Sys.command("taskkill /f /im wscript.exe");
        }
        //Usage: killAllPopup();
    }
}
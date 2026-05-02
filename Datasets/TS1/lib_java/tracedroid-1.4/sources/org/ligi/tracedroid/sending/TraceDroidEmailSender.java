package org.ligi.tracedroid.sending;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import org.ligi.tracedroid.TraceDroid;
import org.ligi.tracedroid.collecting.TraceDroidMetaInfo;

/* loaded from: tracedroid-1.4.jar:org/ligi/tracedroid/sending/TraceDroidEmailSender.class */
public class TraceDroidEmailSender {
    public static boolean sendStackTraces(final String email, final Context context) {
        if (TraceDroid.getStackTraceFiles().length > 0) {
            new AlertDialog.Builder(context).setTitle("Problem Report").setMessage("A Problem with this App was detected - would you send an Crash-Report to help fixing this Problem?").setPositiveButton("Send", new DialogInterface.OnClickListener() { // from class: org.ligi.tracedroid.sending.TraceDroidEmailSender.3
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int whichButton) {
                    Intent emailIntent = new Intent("android.intent.action.SEND");
                    emailIntent.setType("plain/text");
                    emailIntent.putExtra("android.intent.extra.EMAIL", new String[]{email});
                    emailIntent.putExtra("android.intent.extra.SUBJECT", "[TraceDroid Report] " + TraceDroidMetaInfo.getAppPackageName());
                    emailIntent.putExtra("android.intent.extra.TEXT", TraceDroid.getStackTraceText(10));
                    context.startActivity(Intent.createChooser(emailIntent, "Send mail..."));
                    TraceDroid.deleteStacktraceFiles();
                }
            }).setNegativeButton("No", new DialogInterface.OnClickListener() { // from class: org.ligi.tracedroid.sending.TraceDroidEmailSender.2
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int whichButton) {
                    TraceDroid.deleteStacktraceFiles();
                }
            }).setNeutralButton("Later", new DialogInterface.OnClickListener() { // from class: org.ligi.tracedroid.sending.TraceDroidEmailSender.1
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int whichButton) {
                }
            }).show();
            return true;
        }
        return false;
    }
}

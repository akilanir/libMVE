package org.ligi.axt.listeners;

import android.content.DialogInterface;

/* loaded from: org.ligi.AXT.0.33.jar:org/ligi/axt/listeners/DialogDiscardingOnClickListener.class */
public class DialogDiscardingOnClickListener implements DialogInterface.OnClickListener {
    @Override // android.content.DialogInterface.OnClickListener
    public void onClick(DialogInterface dialog, int which) {
        dialog.dismiss();
    }
}

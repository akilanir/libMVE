package com.google.tts;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;

/* loaded from: TTS_library_stub.jar:com/google/tts/TTSVersionAlert.class */
public class TTSVersionAlert extends AlertDialog.Builder {
    private static final String NO_TTS = "This application can talk using the text-to-speech (TTS) library. Please install the TTS.";
    private static final String MARKET_URI = "market://search?q=pname:com.google.tts";
    private static final String INSTALL_TTS = "Install the TTS";
    private static final String QUIT = "Do not install the TTS";
    private Activity parent;

    public TTSVersionAlert(Context context, String noTTSMessage, String installButtonMessage, String quitButtonMessage) {
        super(context);
        this.parent = (Activity) context;
        if (noTTSMessage != null) {
            setMessage(noTTSMessage);
        } else {
            setMessage(NO_TTS);
        }
        DialogInterface.OnClickListener installListener = new DialogInterface.OnClickListener() { // from class: com.google.tts.TTSVersionAlert.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                Uri marketUri = Uri.parse(TTSVersionAlert.MARKET_URI);
                Intent marketIntent = new Intent("android.intent.action.VIEW", marketUri);
                TTSVersionAlert.this.parent.startActivity(marketIntent);
            }
        };
        DialogInterface.OnClickListener quitListener = new DialogInterface.OnClickListener() { // from class: com.google.tts.TTSVersionAlert.2
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
            }
        };
        if (installButtonMessage != null) {
            setPositiveButton(installButtonMessage, installListener);
        } else {
            setPositiveButton(INSTALL_TTS, installListener);
        }
        if (quitButtonMessage != null) {
            setNegativeButton(quitButtonMessage, quitListener);
        } else {
            setNegativeButton(QUIT, quitListener);
        }
    }
}

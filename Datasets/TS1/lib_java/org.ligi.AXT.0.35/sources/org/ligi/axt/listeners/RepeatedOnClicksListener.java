package org.ligi.axt.listeners;

import android.view.View;

/* loaded from: org.ligi.AXT.0.35.jar:org/ligi/axt/listeners/RepeatedOnClicksListener.class */
public class RepeatedOnClicksListener implements View.OnClickListener {
    private final View.OnClickListener listener;
    private final int configuredClicksBeforeFiring;
    private int actClicksBeforeFiring;
    private boolean repeatsAreAllowed = true;
    private int callCount = 0;

    public RepeatedOnClicksListener(int clickCountBeforeFire, View.OnClickListener listener) {
        this.listener = listener;
        this.configuredClicksBeforeFiring = clickCountBeforeFire;
        this.actClicksBeforeFiring = this.configuredClicksBeforeFiring;
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        if (this.callCount == 0 || this.repeatsAreAllowed) {
            int i = this.actClicksBeforeFiring;
            this.actClicksBeforeFiring = i - 1;
            if (i <= 0) {
                this.listener.onClick(view);
                this.actClicksBeforeFiring = this.configuredClicksBeforeFiring;
                this.callCount++;
            }
        }
    }

    public RepeatedOnClicksListener doNotRepeatCalls() {
        this.repeatsAreAllowed = false;
        return this;
    }

    public int getCallCount() {
        return this.callCount;
    }
}

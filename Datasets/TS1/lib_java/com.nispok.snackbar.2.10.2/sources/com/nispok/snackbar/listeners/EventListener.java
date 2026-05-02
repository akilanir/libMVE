package com.nispok.snackbar.listeners;

import com.nispok.snackbar.Snackbar;

/* loaded from: com.nispok.snackbar.2.10.2.jar:com/nispok/snackbar/listeners/EventListener.class */
public interface EventListener {
    void onShow(Snackbar snackbar);

    void onShowByReplace(Snackbar snackbar);

    void onShown(Snackbar snackbar);

    void onDismiss(Snackbar snackbar);

    void onDismissByReplace(Snackbar snackbar);

    void onDismissed(Snackbar snackbar);
}

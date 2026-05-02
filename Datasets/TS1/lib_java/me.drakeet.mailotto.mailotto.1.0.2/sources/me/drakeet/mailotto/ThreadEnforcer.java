package me.drakeet.mailotto;

import android.os.Looper;

/* loaded from: me.drakeet.mailotto.mailotto.1.0.2.jar:me/drakeet/mailotto/ThreadEnforcer.class */
public interface ThreadEnforcer {
    public static final ThreadEnforcer ANY = new ThreadEnforcer() { // from class: me.drakeet.mailotto.ThreadEnforcer.1
        @Override // me.drakeet.mailotto.ThreadEnforcer
        public void enforce(Mailbox mailbox) {
        }
    };
    public static final ThreadEnforcer MAIN = new ThreadEnforcer() { // from class: me.drakeet.mailotto.ThreadEnforcer.2
        @Override // me.drakeet.mailotto.ThreadEnforcer
        public void enforce(Mailbox mailbox) {
            if (Looper.myLooper() != Looper.getMainLooper()) {
                throw new IllegalStateException("Mailbox " + mailbox + " accessed from non-main thread " + Looper.myLooper());
            }
        }
    };

    void enforce(Mailbox mailbox);
}

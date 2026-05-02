package com.octo.android.robospice.persistence.exception;

/* loaded from: robospice-cache-1.4.14.jar:com/octo/android/robospice/persistence/exception/KeySanitationExcepion.class */
public class KeySanitationExcepion extends SpiceException {
    private static final long serialVersionUID = 1140114915715955254L;

    public KeySanitationExcepion() {
        super("A problem occured during sanitation/desanitation of a key.");
    }

    public KeySanitationExcepion(String arg0, Throwable arg1) {
        super(arg0, arg1);
    }

    public KeySanitationExcepion(String arg0) {
        super(arg0);
    }

    public KeySanitationExcepion(Throwable arg0) {
        super(arg0);
    }
}

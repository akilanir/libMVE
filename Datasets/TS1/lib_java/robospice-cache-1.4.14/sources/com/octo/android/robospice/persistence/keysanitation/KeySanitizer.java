package com.octo.android.robospice.persistence.keysanitation;

import com.octo.android.robospice.persistence.exception.KeySanitationExcepion;

/* loaded from: robospice-cache-1.4.14.jar:com/octo/android/robospice/persistence/keysanitation/KeySanitizer.class */
public interface KeySanitizer {
    Object sanitizeKey(Object obj) throws KeySanitationExcepion;

    Object desanitizeKey(Object obj) throws KeySanitationExcepion;
}

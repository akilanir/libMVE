package com.octo.android.robospice.persistence.keysanitation;

import android.annotation.TargetApi;
import android.util.Base64;
import com.octo.android.robospice.persistence.exception.KeySanitationExcepion;
import java.io.UnsupportedEncodingException;

@TargetApi(8)
/* loaded from: robospice-cache-1.4.14.jar:com/octo/android/robospice/persistence/keysanitation/DefaultKeySanitizer.class */
public class DefaultKeySanitizer implements KeySanitizer {
    private static final int BASE64_FLAGS = 11;
    private static final String UTF8_CHARSET_NAME = "UTF-8";

    @Override // com.octo.android.robospice.persistence.keysanitation.KeySanitizer
    public Object sanitizeKey(Object cacheKey) throws KeySanitationExcepion {
        if (!(cacheKey instanceof String)) {
            throw new KeySanitationExcepion(DefaultKeySanitizer.class.getSimpleName() + " can only be used with Strings cache keys.");
        }
        try {
            return Base64.encodeToString(((String) cacheKey).getBytes(UTF8_CHARSET_NAME), BASE64_FLAGS);
        } catch (UnsupportedEncodingException e) {
            throw new KeySanitationExcepion(e);
        }
    }

    @Override // com.octo.android.robospice.persistence.keysanitation.KeySanitizer
    public Object desanitizeKey(Object sanitzedCacheKey) throws KeySanitationExcepion {
        if (!(sanitzedCacheKey instanceof String)) {
            throw new KeySanitationExcepion(DefaultKeySanitizer.class.getSimpleName() + " can only be used with Strings cache keys.");
        }
        try {
            return new String(Base64.decode((String) sanitzedCacheKey, BASE64_FLAGS), UTF8_CHARSET_NAME);
        } catch (UnsupportedEncodingException e) {
            throw new KeySanitationExcepion(e);
        }
    }
}

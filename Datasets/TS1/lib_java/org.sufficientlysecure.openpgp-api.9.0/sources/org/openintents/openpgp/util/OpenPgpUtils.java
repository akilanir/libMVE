package org.openintents.openpgp.util;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.text.TextUtils;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: org.sufficientlysecure.openpgp-api.9.0.jar:org/openintents/openpgp/util/OpenPgpUtils.class */
public class OpenPgpUtils {
    public static final int PARSE_RESULT_NO_PGP = -1;
    public static final int PARSE_RESULT_MESSAGE = 0;
    public static final int PARSE_RESULT_SIGNED_MESSAGE = 1;
    public static final Pattern PGP_MESSAGE = Pattern.compile(".*?(-----BEGIN PGP MESSAGE-----.*?-----END PGP MESSAGE-----).*", 32);
    public static final Pattern PGP_SIGNED_MESSAGE = Pattern.compile(".*?(-----BEGIN PGP SIGNED MESSAGE-----.*?-----BEGIN PGP SIGNATURE-----.*?-----END PGP SIGNATURE-----).*", 32);
    private static final Pattern USER_ID_PATTERN = Pattern.compile("^(.*?)(?: \\((.*)\\))?(?: <(.*)>)?$");

    public static int parseMessage(String message) {
        Matcher matcherSigned = PGP_SIGNED_MESSAGE.matcher(message);
        Matcher matcherMessage = PGP_MESSAGE.matcher(message);
        if (matcherMessage.matches()) {
            return 0;
        }
        if (matcherSigned.matches()) {
            return 1;
        }
        return -1;
    }

    public static boolean isAvailable(Context context) {
        Intent intent = new Intent(OpenPgpApi.SERVICE_INTENT_2);
        List<ResolveInfo> resInfo = context.getPackageManager().queryIntentServices(intent, 0);
        return !resInfo.isEmpty();
    }

    public static String convertKeyIdToHex(long keyId) {
        return "0x" + convertKeyIdToHex32bit(keyId >> 32) + convertKeyIdToHex32bit(keyId);
    }

    private static String convertKeyIdToHex32bit(long keyId) {
        String lowerCase = Long.toHexString(keyId & 4294967295L).toLowerCase(Locale.ENGLISH);
        while (true) {
            String hexString = lowerCase;
            if (hexString.length() < 8) {
                lowerCase = "0" + hexString;
            } else {
                return hexString;
            }
        }
    }

    public static UserId splitUserId(String userId) {
        if (!TextUtils.isEmpty(userId)) {
            Matcher matcher = USER_ID_PATTERN.matcher(userId);
            if (matcher.matches()) {
                return new UserId(matcher.group(1), matcher.group(3), matcher.group(2));
            }
        }
        return new UserId(null, null, null);
    }

    public static String createUserId(UserId userId) {
        String userIdString = userId.name;
        if (userIdString != null && !TextUtils.isEmpty(userId.comment)) {
            userIdString = userIdString + " (" + userId.comment + ")";
        }
        if (userIdString != null && !TextUtils.isEmpty(userId.email)) {
            userIdString = userIdString + " <" + userId.email + ">";
        }
        return userIdString;
    }

    /* loaded from: org.sufficientlysecure.openpgp-api.9.0.jar:org/openintents/openpgp/util/OpenPgpUtils$UserId.class */
    public static class UserId {
        public final String name;
        public final String email;
        public final String comment;

        public UserId(String name, String email, String comment) {
            this.name = name;
            this.email = email;
            this.comment = comment;
        }
    }
}

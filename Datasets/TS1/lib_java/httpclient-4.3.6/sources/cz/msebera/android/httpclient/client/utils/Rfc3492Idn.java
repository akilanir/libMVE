package cz.msebera.android.httpclient.client.utils;

import cz.msebera.android.httpclient.annotation.Immutable;
import java.util.StringTokenizer;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/utils/Rfc3492Idn.class */
public class Rfc3492Idn implements Idn {
    private static final int base = 36;
    private static final int tmin = 1;
    private static final int tmax = 26;
    private static final int skew = 38;
    private static final int damp = 700;
    private static final int initial_bias = 72;
    private static final int initial_n = 128;
    private static final char delimiter = '-';
    private static final String ACE_PREFIX = "xn--";

    private int adapt(int delta, int numpoints, boolean firsttime) {
        int d;
        if (firsttime) {
            d = delta / damp;
        } else {
            d = delta / 2;
        }
        int d2 = d + (d / numpoints);
        int i = 0;
        while (true) {
            int k = i;
            if (d2 > 455) {
                d2 /= 35;
                i = k + base;
            } else {
                return k + ((base * d2) / (d2 + skew));
            }
        }
    }

    private int digit(char c) {
        if (c >= 'A' && c <= 'Z') {
            return c - 'A';
        }
        if (c >= 'a' && c <= 'z') {
            return c - 'a';
        }
        if (c >= '0' && c <= '9') {
            return (c - '0') + tmax;
        }
        throw new IllegalArgumentException("illegal digit: " + c);
    }

    @Override // cz.msebera.android.httpclient.client.utils.Idn
    public String toUnicode(String punycode) {
        StringBuilder unicode = new StringBuilder(punycode.length());
        StringTokenizer tok = new StringTokenizer(punycode, ".");
        while (tok.hasMoreTokens()) {
            String t = tok.nextToken();
            if (unicode.length() > 0) {
                unicode.append('.');
            }
            if (t.startsWith(ACE_PREFIX)) {
                t = decode(t.substring(4));
            }
            unicode.append(t);
        }
        return unicode.toString();
    }

    protected String decode(String s) {
        int t;
        String input = s;
        int n = initial_n;
        int i = 0;
        int bias = initial_bias;
        StringBuilder output = new StringBuilder(input.length());
        int lastdelim = input.lastIndexOf(delimiter);
        if (lastdelim != -1) {
            output.append(input.subSequence(0, lastdelim));
            input = input.substring(lastdelim + 1);
        }
        while (input.length() > 0) {
            int oldi = i;
            int w = 1;
            int k = base;
            while (input.length() != 0) {
                char c = input.charAt(0);
                input = input.substring(1);
                int digit = digit(c);
                i += digit * w;
                if (k <= bias + 1) {
                    t = 1;
                } else if (k >= bias + tmax) {
                    t = tmax;
                } else {
                    t = k - bias;
                }
                if (digit < t) {
                    break;
                }
                w *= base - t;
                k += base;
            }
            bias = adapt(i - oldi, output.length() + 1, oldi == 0);
            n += i / (output.length() + 1);
            int i2 = i % (output.length() + 1);
            output.insert(i2, (char) n);
            i = i2 + 1;
        }
        return output.toString();
    }
}

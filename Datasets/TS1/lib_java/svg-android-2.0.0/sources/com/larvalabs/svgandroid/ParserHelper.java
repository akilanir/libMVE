package com.larvalabs.svgandroid;

import java.lang.reflect.Field;

/* loaded from: svg-android-2.0.0.jar:com/larvalabs/svgandroid/ParserHelper.class */
public class ParserHelper {
    private static final Field STRING_CHARS;
    private final char[] s;
    private final int n;
    private char current;
    public int pos;
    private static final double[] pow10;

    static {
        try {
            STRING_CHARS = String.class.getDeclaredField("value");
            STRING_CHARS.setAccessible(true);
            pow10 = new double[128];
            for (int i = 0; i < pow10.length; i++) {
                pow10[i] = Math.pow(10.0d, i);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public ParserHelper(String str, int pos) {
        try {
            this.s = (char[]) STRING_CHARS.get(str);
            this.pos = pos;
            this.n = this.s.length;
            this.current = this.s[pos];
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private char read() {
        if (this.pos < this.n) {
            this.pos++;
        }
        if (this.pos == this.n) {
            return (char) 0;
        }
        return this.s[this.pos];
    }

    public void skipWhitespace() {
        while (this.pos < this.n && Character.isWhitespace(this.s[this.pos])) {
            advance();
        }
    }

    public void skipNumberSeparator() {
        while (this.pos < this.n) {
            char c = this.s[this.pos];
            switch (c) {
                case '\t':
                case '\n':
                case ' ':
                case ',':
                    advance();
                default:
                    return;
            }
        }
    }

    public void advance() {
        this.current = read();
    }

    /*  JADX ERROR: JadxRuntimeException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Failed to find switch 'out' block (already processed)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.calcSwitchOut(SwitchRegionMaker.java:200)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.process(SwitchRegionMaker.java:61)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:112)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.makeEndlessLoop(LoopRegionMaker.java:281)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.process(LoopRegionMaker.java:64)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:89)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.processFallThroughCases(SwitchRegionMaker.java:105)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.process(SwitchRegionMaker.java:64)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:112)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeMthRegion(RegionMaker.java:48)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:25)
        */
    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0183  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x02dc  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0384  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x038e A[PHI: r12
      0x038e: PHI (r12v2 'expPos' boolean) = (r12v0 'expPos' boolean), (r12v3 'expPos' boolean) binds: [B:56:0x02e8, B:61:0x034d] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:80:0x047b  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x048b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public float parseFloat() {
        /*
            Method dump skipped, instructions count: 1173
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.larvalabs.svgandroid.ParserHelper.parseFloat():float");
    }

    private void reportUnexpectedCharacterError(char c) {
        throw new RuntimeException("Unexpected char '" + c + "'.");
    }

    public static float buildFloat(int mant, int exp) {
        if (exp < -125 || mant == 0) {
            return 0.0f;
        }
        if (exp >= 128) {
            return mant > 0 ? Float.POSITIVE_INFINITY : Float.NEGATIVE_INFINITY;
        }
        if (exp == 0) {
            return mant;
        }
        if (mant >= 67108864) {
            mant++;
        }
        return (float) (exp > 0 ? mant * pow10[exp] : mant / pow10[-exp]);
    }

    public float nextFloat() {
        skipWhitespace();
        float f = parseFloat();
        skipNumberSeparator();
        return f;
    }

    public int nextFlag() {
        skipWhitespace();
        int flag = this.current - '0';
        this.current = read();
        skipNumberSeparator();
        return flag;
    }
}

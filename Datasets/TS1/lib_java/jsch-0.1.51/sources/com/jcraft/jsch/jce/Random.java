package com.jcraft.jsch.jce;

import java.security.SecureRandom;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/jce/Random.class */
public class Random implements com.jcraft.jsch.Random {
    private byte[] tmp = new byte[16];
    private SecureRandom random;

    public Random() {
        this.random = null;
        this.random = new SecureRandom();
    }

    @Override // com.jcraft.jsch.Random
    public void fill(byte[] foo, int start, int len) {
        if (len > this.tmp.length) {
            this.tmp = new byte[len];
        }
        this.random.nextBytes(this.tmp);
        System.arraycopy(this.tmp, 0, foo, start, len);
    }
}

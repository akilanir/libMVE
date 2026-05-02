package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/KeyPairGenRSA.class */
public interface KeyPairGenRSA {
    void init(int i) throws Exception;

    byte[] getD();

    byte[] getE();

    byte[] getN();

    byte[] getC();

    byte[] getEP();

    byte[] getEQ();

    byte[] getP();

    byte[] getQ();
}

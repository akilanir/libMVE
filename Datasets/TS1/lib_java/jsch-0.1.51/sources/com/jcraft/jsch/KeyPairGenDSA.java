package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/KeyPairGenDSA.class */
public interface KeyPairGenDSA {
    void init(int i) throws Exception;

    byte[] getX();

    byte[] getY();

    byte[] getP();

    byte[] getQ();

    byte[] getG();
}

package org.spongycastle.util.test;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/util/test/TestResult.class */
public interface TestResult {
    boolean isSuccessful();

    Throwable getException();

    String toString();
}

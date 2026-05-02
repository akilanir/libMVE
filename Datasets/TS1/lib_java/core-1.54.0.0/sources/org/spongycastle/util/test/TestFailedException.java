package org.spongycastle.util.test;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/util/test/TestFailedException.class */
public class TestFailedException extends RuntimeException {
    private TestResult _result;

    public TestFailedException(TestResult result) {
        this._result = result;
    }

    public TestResult getResult() {
        return this._result;
    }
}

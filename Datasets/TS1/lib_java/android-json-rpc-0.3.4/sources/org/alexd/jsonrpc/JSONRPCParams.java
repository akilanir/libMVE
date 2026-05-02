package org.alexd.jsonrpc;

/* loaded from: android-json-rpc-0.3.4.jar:org/alexd/jsonrpc/JSONRPCParams.class */
public class JSONRPCParams {

    /* loaded from: android-json-rpc-0.3.4.jar:org/alexd/jsonrpc/JSONRPCParams$Versions.class */
    public enum Versions {
        VERSION_1,
        VERSION_2;

        /* renamed from: values, reason: to resolve conflict with enum method */
        public static Versions[] valuesCustom() {
            Versions[] valuesCustom = values();
            int length = valuesCustom.length;
            Versions[] versionsArr = new Versions[length];
            System.arraycopy(valuesCustom, 0, versionsArr, 0, length);
            return versionsArr;
        }
    }
}

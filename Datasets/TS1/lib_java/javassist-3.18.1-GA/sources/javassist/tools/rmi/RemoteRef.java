package javassist.tools.rmi;

import java.io.Serializable;

/* loaded from: javassist-3.18.1-GA.jar:javassist/tools/rmi/RemoteRef.class */
public class RemoteRef implements Serializable {
    public int oid;
    public String classname;

    public RemoteRef(int i) {
        this.oid = i;
        this.classname = null;
    }

    public RemoteRef(int i, String name) {
        this.oid = i;
        this.classname = name;
    }
}

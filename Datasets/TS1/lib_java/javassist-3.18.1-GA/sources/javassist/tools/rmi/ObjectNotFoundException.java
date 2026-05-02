package javassist.tools.rmi;

/* loaded from: javassist-3.18.1-GA.jar:javassist/tools/rmi/ObjectNotFoundException.class */
public class ObjectNotFoundException extends Exception {
    public ObjectNotFoundException(String name) {
        super(name + " is not exported");
    }

    public ObjectNotFoundException(String name, Exception e) {
        super(name + " because of " + e.toString());
    }
}

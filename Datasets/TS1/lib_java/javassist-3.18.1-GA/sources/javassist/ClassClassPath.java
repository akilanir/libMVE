package javassist;

import java.io.InputStream;
import java.net.URL;

/* loaded from: javassist-3.18.1-GA.jar:javassist/ClassClassPath.class */
public class ClassClassPath implements ClassPath {
    private Class thisClass;

    public ClassClassPath(Class c) {
        this.thisClass = c;
    }

    ClassClassPath() {
        this(Object.class);
    }

    @Override // javassist.ClassPath
    public InputStream openClassfile(String classname) {
        String jarname = "/" + classname.replace('.', '/') + ".class";
        return this.thisClass.getResourceAsStream(jarname);
    }

    @Override // javassist.ClassPath
    public URL find(String classname) {
        String jarname = "/" + classname.replace('.', '/') + ".class";
        return this.thisClass.getResource(jarname);
    }

    @Override // javassist.ClassPath
    public void close() {
    }

    public String toString() {
        return this.thisClass.getName() + ".class";
    }
}

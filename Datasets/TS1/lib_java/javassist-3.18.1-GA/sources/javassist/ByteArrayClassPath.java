package javassist;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;

/* loaded from: javassist-3.18.1-GA.jar:javassist/ByteArrayClassPath.class */
public class ByteArrayClassPath implements ClassPath {
    protected String classname;
    protected byte[] classfile;

    public ByteArrayClassPath(String name, byte[] classfile) {
        this.classname = name;
        this.classfile = classfile;
    }

    @Override // javassist.ClassPath
    public void close() {
    }

    public String toString() {
        return "byte[]:" + this.classname;
    }

    @Override // javassist.ClassPath
    public InputStream openClassfile(String classname) {
        if (this.classname.equals(classname)) {
            return new ByteArrayInputStream(this.classfile);
        }
        return null;
    }

    @Override // javassist.ClassPath
    public URL find(String classname) {
        if (this.classname.equals(classname)) {
            String cname = classname.replace('.', '/') + ".class";
            try {
                return new URL("file:/ByteArrayClassPath/" + cname);
            } catch (MalformedURLException e) {
                return null;
            }
        }
        return null;
    }
}

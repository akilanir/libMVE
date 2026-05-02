package javassist.bytecode;

import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javassist.bytecode.AnnotationsAttribute;
import javassist.bytecode.annotation.Annotation;
import javassist.bytecode.annotation.AnnotationsWriter;

/* loaded from: javassist-3.18.1-GA.jar:javassist/bytecode/ParameterAnnotationsAttribute.class */
public class ParameterAnnotationsAttribute extends AttributeInfo {
    public static final String visibleTag = "RuntimeVisibleParameterAnnotations";
    public static final String invisibleTag = "RuntimeInvisibleParameterAnnotations";

    public ParameterAnnotationsAttribute(ConstPool cp, String attrname, byte[] info) {
        super(cp, attrname, info);
    }

    public ParameterAnnotationsAttribute(ConstPool cp, String attrname) {
        this(cp, attrname, new byte[]{0});
    }

    ParameterAnnotationsAttribute(ConstPool cp, int n, DataInputStream in) throws IOException {
        super(cp, n, in);
    }

    public int numParameters() {
        return this.info[0] & 255;
    }

    @Override // javassist.bytecode.AttributeInfo
    public AttributeInfo copy(ConstPool newCp, Map classnames) {
        AnnotationsAttribute.Copier copier = new AnnotationsAttribute.Copier(this.info, this.constPool, newCp, classnames);
        try {
            copier.parameters();
            return new ParameterAnnotationsAttribute(newCp, getName(), copier.close());
        } catch (Exception e) {
            throw new RuntimeException(e.toString());
        }
    }

    public Annotation[][] getAnnotations() {
        try {
            return new AnnotationsAttribute.Parser(this.info, this.constPool).parseParameters();
        } catch (Exception e) {
            throw new RuntimeException(e.toString());
        }
    }

    public void setAnnotations(Annotation[][] params) {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        AnnotationsWriter writer = new AnnotationsWriter(output, this.constPool);
        try {
            int n = params.length;
            writer.numParameters(n);
            for (Annotation[] anno : params) {
                writer.numAnnotations(anno.length);
                for (Annotation annotation : anno) {
                    annotation.write(writer);
                }
            }
            writer.close();
            set(output.toByteArray());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override // javassist.bytecode.AttributeInfo
    void renameClass(String oldname, String newname) {
        HashMap map = new HashMap();
        map.put(oldname, newname);
        renameClass(map);
    }

    @Override // javassist.bytecode.AttributeInfo
    void renameClass(Map classnames) {
        AnnotationsAttribute.Renamer renamer = new AnnotationsAttribute.Renamer(this.info, getConstPool(), classnames);
        try {
            renamer.parameters();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override // javassist.bytecode.AttributeInfo
    void getRefClasses(Map classnames) {
        renameClass(classnames);
    }

    public String toString() {
        Annotation[][] aa = getAnnotations();
        StringBuilder sbuf = new StringBuilder();
        int k = 0;
        while (k < aa.length) {
            int i = k;
            k++;
            Annotation[] a = aa[i];
            int i2 = 0;
            while (i2 < a.length) {
                int i3 = i2;
                i2++;
                sbuf.append(a[i3].toString());
                if (i2 != a.length) {
                    sbuf.append(" ");
                }
            }
            if (k != aa.length) {
                sbuf.append(", ");
            }
        }
        return sbuf.toString();
    }
}

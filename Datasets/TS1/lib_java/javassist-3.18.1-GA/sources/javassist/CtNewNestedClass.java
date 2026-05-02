package javassist;

import javassist.bytecode.ClassFile;
import javassist.bytecode.InnerClassesAttribute;

/* loaded from: javassist-3.18.1-GA.jar:javassist/CtNewNestedClass.class */
class CtNewNestedClass extends CtNewClass {
    CtNewNestedClass(String realName, ClassPool cp, boolean isInterface, CtClass superclass) {
        super(realName, cp, isInterface, superclass);
    }

    @Override // javassist.CtClassType, javassist.CtClass
    public void setModifiers(int mod) {
        int mod2 = mod & (-9);
        super.setModifiers(mod2);
        updateInnerEntry(mod2, getName(), this, true);
    }

    private static void updateInnerEntry(int mod, String name, CtClass clazz, boolean outer) {
        ClassFile cf = clazz.getClassFile2();
        InnerClassesAttribute ica = (InnerClassesAttribute) cf.getAttribute(InnerClassesAttribute.tag);
        if (ica == null) {
            return;
        }
        int n = ica.tableLength();
        for (int i = 0; i < n; i++) {
            if (name.equals(ica.innerClass(i))) {
                int acc = ica.accessFlags(i) & 8;
                ica.setAccessFlags(i, mod | acc);
                String outName = ica.outerClass(i);
                if (outName != null && outer) {
                    try {
                        CtClass parent = clazz.getClassPool().get(outName);
                        updateInnerEntry(mod, name, parent, false);
                        return;
                    } catch (NotFoundException e) {
                        throw new RuntimeException("cannot find the declaring class: " + outName);
                    }
                }
                return;
            }
        }
    }
}

package javassist;

/* loaded from: javassist-3.18.1-GA.jar:javassist/Translator.class */
public interface Translator {
    void start(ClassPool classPool) throws NotFoundException, CannotCompileException;

    void onLoad(ClassPool classPool, String str) throws NotFoundException, CannotCompileException;
}

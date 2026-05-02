package javassist.scopedpool;

import javassist.ClassPool;

/* loaded from: javassist-3.18.1-GA.jar:javassist/scopedpool/ScopedClassPoolFactory.class */
public interface ScopedClassPoolFactory {
    ScopedClassPool create(ClassLoader classLoader, ClassPool classPool, ScopedClassPoolRepository scopedClassPoolRepository);

    ScopedClassPool create(ClassPool classPool, ScopedClassPoolRepository scopedClassPoolRepository);
}

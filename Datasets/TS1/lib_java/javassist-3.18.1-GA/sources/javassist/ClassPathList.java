package javassist;

/* compiled from: ClassPoolTail.java */
/* loaded from: javassist-3.18.1-GA.jar:javassist/ClassPathList.class */
final class ClassPathList {
    ClassPathList next;
    ClassPath path;

    ClassPathList(ClassPath p, ClassPathList n) {
        this.next = n;
        this.path = p;
    }
}

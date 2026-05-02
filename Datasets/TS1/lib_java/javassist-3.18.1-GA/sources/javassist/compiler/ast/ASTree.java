package javassist.compiler.ast;

import java.io.Serializable;
import javassist.compiler.CompileError;

/* loaded from: javassist-3.18.1-GA.jar:javassist/compiler/ast/ASTree.class */
public abstract class ASTree implements Serializable {
    public abstract void accept(Visitor visitor) throws CompileError;

    public ASTree getLeft() {
        return null;
    }

    public ASTree getRight() {
        return null;
    }

    public void setLeft(ASTree _left) {
    }

    public void setRight(ASTree _right) {
    }

    public String toString() {
        StringBuffer sbuf = new StringBuffer();
        sbuf.append('<');
        sbuf.append(getTag());
        sbuf.append('>');
        return sbuf.toString();
    }

    protected String getTag() {
        String name = getClass().getName();
        return name.substring(name.lastIndexOf(46) + 1);
    }
}

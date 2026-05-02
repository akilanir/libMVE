package javassist.compiler.ast;

import javassist.compiler.CompileError;

/* loaded from: javassist-3.18.1-GA.jar:javassist/compiler/ast/StringL.class */
public class StringL extends ASTree {
    protected String text;

    public StringL(String t) {
        this.text = t;
    }

    public String get() {
        return this.text;
    }

    @Override // javassist.compiler.ast.ASTree
    public String toString() {
        return "\"" + this.text + "\"";
    }

    @Override // javassist.compiler.ast.ASTree
    public void accept(Visitor v) throws CompileError {
        v.atStringL(this);
    }
}

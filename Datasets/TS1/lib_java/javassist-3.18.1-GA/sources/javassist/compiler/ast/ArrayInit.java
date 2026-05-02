package javassist.compiler.ast;

import javassist.compiler.CompileError;

/* loaded from: javassist-3.18.1-GA.jar:javassist/compiler/ast/ArrayInit.class */
public class ArrayInit extends ASTList {
    public ArrayInit(ASTree firstElement) {
        super(firstElement);
    }

    @Override // javassist.compiler.ast.ASTList, javassist.compiler.ast.ASTree
    public void accept(Visitor v) throws CompileError {
        v.atArrayInit(this);
    }

    @Override // javassist.compiler.ast.ASTree
    public String getTag() {
        return "array";
    }
}

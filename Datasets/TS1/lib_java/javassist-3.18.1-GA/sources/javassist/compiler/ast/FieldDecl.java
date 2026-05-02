package javassist.compiler.ast;

import javassist.compiler.CompileError;

/* loaded from: javassist-3.18.1-GA.jar:javassist/compiler/ast/FieldDecl.class */
public class FieldDecl extends ASTList {
    public FieldDecl(ASTree _head, ASTList _tail) {
        super(_head, _tail);
    }

    public ASTList getModifiers() {
        return (ASTList) getLeft();
    }

    public Declarator getDeclarator() {
        return (Declarator) tail().head();
    }

    public ASTree getInit() {
        return sublist(2).head();
    }

    @Override // javassist.compiler.ast.ASTList, javassist.compiler.ast.ASTree
    public void accept(Visitor v) throws CompileError {
        v.atFieldDecl(this);
    }
}

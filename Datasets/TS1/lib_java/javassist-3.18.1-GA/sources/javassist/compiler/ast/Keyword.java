package javassist.compiler.ast;

import javassist.compiler.CompileError;

/* loaded from: javassist-3.18.1-GA.jar:javassist/compiler/ast/Keyword.class */
public class Keyword extends ASTree {
    protected int tokenId;

    public Keyword(int token) {
        this.tokenId = token;
    }

    public int get() {
        return this.tokenId;
    }

    @Override // javassist.compiler.ast.ASTree
    public String toString() {
        return "id:" + this.tokenId;
    }

    @Override // javassist.compiler.ast.ASTree
    public void accept(Visitor v) throws CompileError {
        v.atKeyword(this);
    }
}

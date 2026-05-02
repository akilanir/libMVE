package javassist.compiler.ast;

import javassist.compiler.CompileError;

/* loaded from: javassist-3.18.1-GA.jar:javassist/compiler/ast/InstanceOfExpr.class */
public class InstanceOfExpr extends CastExpr {
    public InstanceOfExpr(ASTList className, int dim, ASTree expr) {
        super(className, dim, expr);
    }

    public InstanceOfExpr(int type, int dim, ASTree expr) {
        super(type, dim, expr);
    }

    @Override // javassist.compiler.ast.CastExpr, javassist.compiler.ast.ASTree
    public String getTag() {
        return "instanceof:" + this.castType + ":" + this.arrayDim;
    }

    @Override // javassist.compiler.ast.CastExpr, javassist.compiler.ast.ASTList, javassist.compiler.ast.ASTree
    public void accept(Visitor v) throws CompileError {
        v.atInstanceOfExpr(this);
    }
}

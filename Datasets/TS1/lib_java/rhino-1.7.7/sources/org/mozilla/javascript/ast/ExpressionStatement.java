package org.mozilla.javascript.ast;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/ast/ExpressionStatement.class */
public class ExpressionStatement extends AstNode {
    private AstNode expr;

    public void setHasResult() {
        this.type = 134;
    }

    public ExpressionStatement() {
        this.type = 133;
    }

    public ExpressionStatement(AstNode expr, boolean hasResult) {
        this(expr);
        if (hasResult) {
            setHasResult();
        }
    }

    public ExpressionStatement(AstNode expr) {
        this(expr.getPosition(), expr.getLength(), expr);
    }

    public ExpressionStatement(int pos, int len) {
        super(pos, len);
        this.type = 133;
    }

    public ExpressionStatement(int pos, int len, AstNode expr) {
        super(pos, len);
        this.type = 133;
        setExpression(expr);
    }

    public AstNode getExpression() {
        return this.expr;
    }

    public void setExpression(AstNode expression) {
        assertNotNull(expression);
        this.expr = expression;
        expression.setParent(this);
        setLineno(expression.getLineno());
    }

    @Override // org.mozilla.javascript.ast.AstNode, org.mozilla.javascript.Node
    public boolean hasSideEffects() {
        return this.type == 134 || this.expr.hasSideEffects();
    }

    @Override // org.mozilla.javascript.ast.AstNode
    public String toSource(int depth) {
        return this.expr.toSource(depth) + ";\n";
    }

    @Override // org.mozilla.javascript.ast.AstNode
    public void visit(NodeVisitor v) {
        if (v.visit(this)) {
            this.expr.visit(v);
        }
    }
}

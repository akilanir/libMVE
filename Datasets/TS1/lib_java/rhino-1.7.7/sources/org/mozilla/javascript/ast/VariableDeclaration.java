package org.mozilla.javascript.ast;

import java.util.ArrayList;
import java.util.List;
import org.mozilla.javascript.Node;
import org.mozilla.javascript.Token;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/ast/VariableDeclaration.class */
public class VariableDeclaration extends AstNode {
    private List<VariableInitializer> variables;
    private boolean isStatement;

    public VariableDeclaration() {
        this.variables = new ArrayList();
        this.type = 122;
    }

    public VariableDeclaration(int pos) {
        super(pos);
        this.variables = new ArrayList();
        this.type = 122;
    }

    public VariableDeclaration(int pos, int len) {
        super(pos, len);
        this.variables = new ArrayList();
        this.type = 122;
    }

    public List<VariableInitializer> getVariables() {
        return this.variables;
    }

    public void setVariables(List<VariableInitializer> variables) {
        assertNotNull(variables);
        this.variables.clear();
        for (VariableInitializer vi : variables) {
            addVariable(vi);
        }
    }

    public void addVariable(VariableInitializer v) {
        assertNotNull(v);
        this.variables.add(v);
        v.setParent(this);
    }

    @Override // org.mozilla.javascript.Node
    public Node setType(int type) {
        if (type != 122 && type != 154 && type != 153) {
            throw new IllegalArgumentException("invalid decl type: " + type);
        }
        return super.setType(type);
    }

    public boolean isVar() {
        return this.type == 122;
    }

    public boolean isConst() {
        return this.type == 154;
    }

    public boolean isLet() {
        return this.type == 153;
    }

    public boolean isStatement() {
        return this.isStatement;
    }

    public void setIsStatement(boolean isStatement) {
        this.isStatement = isStatement;
    }

    private String declTypeName() {
        return Token.typeToName(this.type).toLowerCase();
    }

    @Override // org.mozilla.javascript.ast.AstNode
    public String toSource(int depth) {
        StringBuilder sb = new StringBuilder();
        sb.append(makeIndent(depth));
        sb.append(declTypeName());
        sb.append(" ");
        printList(this.variables, sb);
        if (isStatement()) {
            sb.append(";\n");
        }
        return sb.toString();
    }

    @Override // org.mozilla.javascript.ast.AstNode
    public void visit(NodeVisitor v) {
        if (v.visit(this)) {
            for (VariableInitializer var : this.variables) {
                var.visit(v);
            }
        }
    }
}

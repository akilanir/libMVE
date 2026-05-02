package org.mozilla.javascript.ast;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/ast/ObjectProperty.class */
public class ObjectProperty extends InfixExpression {
    public void setNodeType(int nodeType) {
        if (nodeType != 103 && nodeType != 151 && nodeType != 152 && nodeType != 163) {
            throw new IllegalArgumentException("invalid node type: " + nodeType);
        }
        setType(nodeType);
    }

    public ObjectProperty() {
        this.type = 103;
    }

    public ObjectProperty(int pos) {
        super(pos);
        this.type = 103;
    }

    public ObjectProperty(int pos, int len) {
        super(pos, len);
        this.type = 103;
    }

    public void setIsGetterMethod() {
        this.type = 151;
    }

    public boolean isGetterMethod() {
        return this.type == 151;
    }

    public void setIsSetterMethod() {
        this.type = 152;
    }

    public boolean isSetterMethod() {
        return this.type == 152;
    }

    public void setIsNormalMethod() {
        this.type = 163;
    }

    public boolean isNormalMethod() {
        return this.type == 163;
    }

    public boolean isMethod() {
        return isGetterMethod() || isSetterMethod() || isNormalMethod();
    }

    @Override // org.mozilla.javascript.ast.InfixExpression, org.mozilla.javascript.ast.AstNode
    public String toSource(int depth) {
        StringBuilder sb = new StringBuilder();
        sb.append("\n");
        sb.append(makeIndent(depth + 1));
        if (isGetterMethod()) {
            sb.append("get ");
        } else if (isSetterMethod()) {
            sb.append("set ");
        }
        sb.append(this.left.toSource(getType() == 103 ? 0 : depth));
        if (this.type == 103) {
            sb.append(": ");
        }
        sb.append(this.right.toSource(getType() == 103 ? 0 : depth + 1));
        return sb.toString();
    }
}

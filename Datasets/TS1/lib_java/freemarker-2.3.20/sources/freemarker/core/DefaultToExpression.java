package freemarker.core;

import freemarker.core.Expression;
import freemarker.template.SimpleCollection;
import freemarker.template.TemplateCollectionModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateHashModelEx;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateScalarModel;
import freemarker.template.TemplateSequenceModel;
import java.util.ArrayList;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/DefaultToExpression.class */
class DefaultToExpression extends Expression {
    private static final TemplateCollectionModel EMPTY_COLLECTION = new SimpleCollection(new ArrayList(0));
    static final TemplateModel EMPTY_STRING_AND_SEQUENCE = new EmptyStringAndSequence(null);
    private final Expression lho;
    private final Expression rho;

    /* renamed from: freemarker.core.DefaultToExpression$1, reason: invalid class name */
    /* loaded from: freemarker-2.3.20.jar:freemarker/core/DefaultToExpression$1.class */
    static class AnonymousClass1 {
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/DefaultToExpression$EmptyStringAndSequence.class */
    private static class EmptyStringAndSequence implements TemplateScalarModel, TemplateSequenceModel, TemplateHashModelEx {
        private EmptyStringAndSequence() {
        }

        EmptyStringAndSequence(AnonymousClass1 x0) {
            this();
        }

        @Override // freemarker.template.TemplateScalarModel
        public String getAsString() {
            return "";
        }

        @Override // freemarker.template.TemplateSequenceModel
        public TemplateModel get(int i) {
            return null;
        }

        @Override // freemarker.template.TemplateHashModel
        public TemplateModel get(String s) {
            return null;
        }

        @Override // freemarker.template.TemplateSequenceModel
        public int size() {
            return 0;
        }

        @Override // freemarker.template.TemplateHashModel
        public boolean isEmpty() {
            return true;
        }

        @Override // freemarker.template.TemplateHashModelEx
        public TemplateCollectionModel keys() {
            return DefaultToExpression.EMPTY_COLLECTION;
        }

        @Override // freemarker.template.TemplateHashModelEx
        public TemplateCollectionModel values() {
            return DefaultToExpression.EMPTY_COLLECTION;
        }
    }

    DefaultToExpression(Expression lho, Expression rho) {
        this.lho = lho;
        this.rho = rho;
    }

    @Override // freemarker.core.Expression
    TemplateModel _eval(Environment env) throws TemplateException {
        TemplateModel left;
        if (this.lho instanceof ParentheticalExpression) {
            boolean lastFIRE = env.setFastInvalidReferenceExceptions(true);
            try {
                left = this.lho.eval(env);
                env.setFastInvalidReferenceExceptions(lastFIRE);
            } catch (InvalidReferenceException e) {
                left = null;
                env.setFastInvalidReferenceExceptions(lastFIRE);
            } catch (Throwable th) {
                env.setFastInvalidReferenceExceptions(lastFIRE);
                throw th;
            }
        } else {
            left = this.lho.eval(env);
        }
        return left != null ? left : this.rho == null ? EMPTY_STRING_AND_SEQUENCE : this.rho.eval(env);
    }

    @Override // freemarker.core.Expression
    boolean isLiteral() {
        return false;
    }

    @Override // freemarker.core.Expression
    protected Expression deepCloneWithIdentifierReplaced_inner(String replacedIdentifier, Expression replacement, Expression.ReplacemenetState replacementState) {
        return new DefaultToExpression(this.lho.deepCloneWithIdentifierReplaced(replacedIdentifier, replacement, replacementState), this.rho != null ? this.rho.deepCloneWithIdentifierReplaced(replacedIdentifier, replacement, replacementState) : null);
    }

    @Override // freemarker.core.TemplateObject
    public String getCanonicalForm() {
        if (this.rho == null) {
            return new StringBuffer().append(this.lho.getCanonicalForm()).append('!').toString();
        }
        return new StringBuffer().append(this.lho.getCanonicalForm()).append('!').append(this.rho.getCanonicalForm()).toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "...!...";
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 2;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        switch (idx) {
            case 0:
                return this.lho;
            case 1:
                return this.rho;
            default:
                throw new IndexOutOfBoundsException();
        }
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        return ParameterRole.forBinaryOperatorOperand(idx);
    }
}

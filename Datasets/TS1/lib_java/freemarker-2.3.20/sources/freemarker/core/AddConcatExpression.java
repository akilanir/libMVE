package freemarker.core;

import freemarker.core.Expression;
import freemarker.template.SimpleNumber;
import freemarker.template.SimpleScalar;
import freemarker.template.SimpleSequence;
import freemarker.template.TemplateCollectionModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateHashModel;
import freemarker.template.TemplateHashModelEx;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateModelIterator;
import freemarker.template.TemplateNumberModel;
import freemarker.template.TemplateScalarModel;
import freemarker.template.TemplateSequenceModel;
import java.util.HashSet;
import java.util.Set;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/AddConcatExpression.class */
final class AddConcatExpression extends Expression {
    private final Expression left;
    private final Expression right;

    AddConcatExpression(Expression left, Expression right) {
        this.left = left;
        this.right = right;
    }

    @Override // freemarker.core.Expression
    TemplateModel _eval(Environment env) throws TemplateException {
        TemplateModel leftModel = this.left.eval(env);
        TemplateModel rightModel = this.right.eval(env);
        if ((leftModel instanceof TemplateNumberModel) && (rightModel instanceof TemplateNumberModel)) {
            Number first = EvalUtil.modelToNumber((TemplateNumberModel) leftModel, this.left);
            Number second = EvalUtil.modelToNumber((TemplateNumberModel) rightModel, this.right);
            ArithmeticEngine ae = env != null ? env.getArithmeticEngine() : getTemplate().getArithmeticEngine();
            return new SimpleNumber(ae.add(first, second));
        }
        if ((leftModel instanceof TemplateSequenceModel) && (rightModel instanceof TemplateSequenceModel)) {
            return new ConcatenatedSequence((TemplateSequenceModel) leftModel, (TemplateSequenceModel) rightModel);
        }
        try {
            String s1 = Expression.coerceModelToString(leftModel, this.left, env);
            if (s1 == null) {
                s1 = "null";
            }
            String s2 = Expression.coerceModelToString(rightModel, this.right, env);
            if (s2 == null) {
                s2 = "null";
            }
            return new SimpleScalar(s1.concat(s2));
        } catch (NonStringException e) {
            if ((leftModel instanceof TemplateHashModel) && (rightModel instanceof TemplateHashModel)) {
                if ((leftModel instanceof TemplateHashModelEx) && (rightModel instanceof TemplateHashModelEx)) {
                    TemplateHashModelEx leftModelEx = (TemplateHashModelEx) leftModel;
                    TemplateHashModelEx rightModelEx = (TemplateHashModelEx) rightModel;
                    if (leftModelEx.size() == 0) {
                        return rightModelEx;
                    }
                    if (rightModelEx.size() == 0) {
                        return leftModelEx;
                    }
                    return new ConcatenatedHashEx(leftModelEx, rightModelEx);
                }
                return new ConcatenatedHash((TemplateHashModel) leftModel, (TemplateHashModel) rightModel);
            }
            throw e;
        }
    }

    @Override // freemarker.core.Expression
    boolean isLiteral() {
        return this.constantValue != null || (this.left.isLiteral() && this.right.isLiteral());
    }

    @Override // freemarker.core.Expression
    protected Expression deepCloneWithIdentifierReplaced_inner(String replacedIdentifier, Expression replacement, Expression.ReplacemenetState replacementState) {
        return new AddConcatExpression(this.left.deepCloneWithIdentifierReplaced(replacedIdentifier, replacement, replacementState), this.right.deepCloneWithIdentifierReplaced(replacedIdentifier, replacement, replacementState));
    }

    @Override // freemarker.core.TemplateObject
    public String getCanonicalForm() {
        return new StringBuffer().append(this.left.getCanonicalForm()).append(" + ").append(this.right.getCanonicalForm()).toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "+";
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 2;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        return idx == 0 ? this.left : this.right;
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        return ParameterRole.forBinaryOperatorOperand(idx);
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/AddConcatExpression$ConcatenatedSequence.class */
    private static final class ConcatenatedSequence implements TemplateSequenceModel {
        private final TemplateSequenceModel left;
        private final TemplateSequenceModel right;

        ConcatenatedSequence(TemplateSequenceModel left, TemplateSequenceModel right) {
            this.left = left;
            this.right = right;
        }

        @Override // freemarker.template.TemplateSequenceModel
        public int size() throws TemplateModelException {
            return this.left.size() + this.right.size();
        }

        @Override // freemarker.template.TemplateSequenceModel
        public TemplateModel get(int i) throws TemplateModelException {
            int ls = this.left.size();
            return i < ls ? this.left.get(i) : this.right.get(i - ls);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/AddConcatExpression$ConcatenatedHash.class */
    private static class ConcatenatedHash implements TemplateHashModel {
        protected final TemplateHashModel left;
        protected final TemplateHashModel right;

        ConcatenatedHash(TemplateHashModel left, TemplateHashModel right) {
            this.left = left;
            this.right = right;
        }

        @Override // freemarker.template.TemplateHashModel
        public TemplateModel get(String key) throws TemplateModelException {
            TemplateModel model = this.right.get(key);
            return model != null ? model : this.left.get(key);
        }

        @Override // freemarker.template.TemplateHashModel
        public boolean isEmpty() throws TemplateModelException {
            return this.left.isEmpty() && this.right.isEmpty();
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/AddConcatExpression$ConcatenatedHashEx.class */
    private static final class ConcatenatedHashEx extends ConcatenatedHash implements TemplateHashModelEx {
        private CollectionAndSequence keys;
        private CollectionAndSequence values;
        private int size;

        ConcatenatedHashEx(TemplateHashModelEx left, TemplateHashModelEx right) {
            super(left, right);
        }

        @Override // freemarker.template.TemplateHashModelEx
        public int size() throws TemplateModelException {
            initKeys();
            return this.size;
        }

        @Override // freemarker.template.TemplateHashModelEx
        public TemplateCollectionModel keys() throws TemplateModelException {
            initKeys();
            return this.keys;
        }

        @Override // freemarker.template.TemplateHashModelEx
        public TemplateCollectionModel values() throws TemplateModelException {
            initValues();
            return this.values;
        }

        private void initKeys() throws TemplateModelException {
            if (this.keys == null) {
                HashSet keySet = new HashSet();
                SimpleSequence keySeq = new SimpleSequence(32);
                addKeys(keySet, keySeq, (TemplateHashModelEx) this.left);
                addKeys(keySet, keySeq, (TemplateHashModelEx) this.right);
                this.size = keySet.size();
                this.keys = new CollectionAndSequence(keySeq);
            }
        }

        private static void addKeys(Set set, SimpleSequence keySeq, TemplateHashModelEx hash) throws TemplateModelException {
            TemplateModelIterator it = hash.keys().iterator();
            while (it.hasNext()) {
                TemplateScalarModel tsm = (TemplateScalarModel) it.next();
                if (set.add(tsm.getAsString())) {
                    keySeq.add(tsm);
                }
            }
        }

        private void initValues() throws TemplateModelException {
            if (this.values == null) {
                SimpleSequence seq = new SimpleSequence(size());
                int ln = this.keys.size();
                for (int i = 0; i < ln; i++) {
                    seq.add(get(((TemplateScalarModel) this.keys.get(i)).getAsString()));
                }
                this.values = new CollectionAndSequence(seq);
            }
        }
    }
}

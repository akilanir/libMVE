package freemarker.core;

import freemarker.core.Expression;
import freemarker.template.SimpleSequence;
import freemarker.template.TemplateCollectionModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateHashModelEx;
import freemarker.template.TemplateModel;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.ListIterator;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/HashLiteral.class */
final class HashLiteral extends Expression {
    private final ArrayList keys;
    private final ArrayList values;
    private final int size;

    HashLiteral(ArrayList keys, ArrayList values) {
        this.keys = keys;
        this.values = values;
        this.size = keys.size();
        keys.trimToSize();
        values.trimToSize();
    }

    @Override // freemarker.core.Expression
    TemplateModel _eval(Environment env) throws TemplateException {
        return new SequenceHash(this, env);
    }

    @Override // freemarker.core.TemplateObject
    public String getCanonicalForm() {
        StringBuffer buf = new StringBuffer("{");
        for (int i = 0; i < this.size; i++) {
            Expression key = (Expression) this.keys.get(i);
            Expression value = (Expression) this.values.get(i);
            buf.append(key.getCanonicalForm());
            buf.append(" : ");
            buf.append(value.getCanonicalForm());
            if (i != this.size - 1) {
                buf.append(",");
            }
        }
        buf.append("}");
        return buf.toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "{...}";
    }

    @Override // freemarker.core.Expression
    boolean isLiteral() {
        if (this.constantValue != null) {
            return true;
        }
        for (int i = 0; i < this.size; i++) {
            Expression key = (Expression) this.keys.get(i);
            Expression value = (Expression) this.values.get(i);
            if (!key.isLiteral() || !value.isLiteral()) {
                return false;
            }
        }
        return true;
    }

    @Override // freemarker.core.Expression
    protected Expression deepCloneWithIdentifierReplaced_inner(String replacedIdentifier, Expression replacement, Expression.ReplacemenetState replacementState) {
        ArrayList clonedKeys = (ArrayList) this.keys.clone();
        ListIterator iter = clonedKeys.listIterator();
        while (iter.hasNext()) {
            iter.set(((Expression) iter.next()).deepCloneWithIdentifierReplaced(replacedIdentifier, replacement, replacementState));
        }
        ArrayList clonedValues = (ArrayList) this.values.clone();
        ListIterator iter2 = clonedValues.listIterator();
        while (iter2.hasNext()) {
            iter2.set(((Expression) iter2.next()).deepCloneWithIdentifierReplaced(replacedIdentifier, replacement, replacementState));
        }
        return new HashLiteral(clonedKeys, clonedValues);
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/HashLiteral$SequenceHash.class */
    private class SequenceHash implements TemplateHashModelEx {
        private HashMap keyMap = new HashMap();
        private TemplateCollectionModel keyCollection;
        private TemplateCollectionModel valueCollection;
        private final HashLiteral this$0;

        SequenceHash(HashLiteral hashLiteral, Environment env) throws TemplateException {
            this.this$0 = hashLiteral;
            ArrayList keyList = new ArrayList(hashLiteral.size);
            ArrayList valueList = new ArrayList(hashLiteral.size);
            for (int i = 0; i < hashLiteral.size; i++) {
                Expression keyExp = (Expression) hashLiteral.keys.get(i);
                Expression valExp = (Expression) hashLiteral.values.get(i);
                String key = keyExp.evalAndCoerceToString(env);
                TemplateModel value = valExp.eval(env);
                if (env == null || !env.isClassicCompatible()) {
                    valExp.assertNonNull(value, env);
                }
                this.keyMap.put(key, value);
                keyList.add(key);
                valueList.add(value);
            }
            this.keyCollection = new CollectionAndSequence(new SimpleSequence(keyList));
            this.valueCollection = new CollectionAndSequence(new SimpleSequence(valueList));
        }

        @Override // freemarker.template.TemplateHashModelEx
        public int size() {
            return this.this$0.size;
        }

        @Override // freemarker.template.TemplateHashModelEx
        public TemplateCollectionModel keys() {
            return this.keyCollection;
        }

        @Override // freemarker.template.TemplateHashModelEx
        public TemplateCollectionModel values() {
            return this.valueCollection;
        }

        @Override // freemarker.template.TemplateHashModel
        public TemplateModel get(String key) {
            return (TemplateModel) this.keyMap.get(key);
        }

        @Override // freemarker.template.TemplateHashModel
        public boolean isEmpty() {
            return this.this$0.size == 0;
        }
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return this.size * 2;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        checkIndex(idx);
        return idx % 2 == 0 ? this.keys.get(idx / 2) : this.values.get(idx / 2);
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        checkIndex(idx);
        return idx % 2 == 0 ? ParameterRole.ITEM_KEY : ParameterRole.ITEM_VALUE;
    }

    private void checkIndex(int idx) {
        if (idx >= this.size * 2) {
            throw new IndexOutOfBoundsException();
        }
    }
}

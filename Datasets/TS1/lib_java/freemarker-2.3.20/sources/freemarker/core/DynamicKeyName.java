package freemarker.core;

import freemarker.core.Expression;
import freemarker.template.SimpleScalar;
import freemarker.template.SimpleSequence;
import freemarker.template.TemplateException;
import freemarker.template.TemplateHashModel;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateNumberModel;
import freemarker.template.TemplateScalarModel;
import freemarker.template.TemplateSequenceModel;
import java.util.ArrayList;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/DynamicKeyName.class */
final class DynamicKeyName extends Expression {
    private final Expression nameExpression;
    private final Expression target;

    DynamicKeyName(Expression target, Expression nameExpression) {
        this.target = target;
        this.nameExpression = nameExpression;
    }

    @Override // freemarker.core.Expression
    TemplateModel _eval(Environment env) throws TemplateException {
        TemplateModel targetModel = this.target.eval(env);
        if (targetModel == null) {
            if (env.isClassicCompatible()) {
                return null;
            }
            throw InvalidReferenceException.getInstance(this.target, env);
        }
        if (this.nameExpression instanceof Range) {
            return dealWithRangeKey(targetModel, (Range) this.nameExpression, env);
        }
        TemplateModel keyModel = this.nameExpression.eval(env);
        if (keyModel == null) {
            if (env.isClassicCompatible()) {
                keyModel = TemplateScalarModel.EMPTY_STRING;
            } else {
                this.nameExpression.assertNonNull(keyModel, env);
            }
        }
        if (keyModel instanceof TemplateNumberModel) {
            int index = this.nameExpression.modelToNumber(keyModel, env).intValue();
            return dealWithNumericalKey(targetModel, index, env);
        }
        if (keyModel instanceof TemplateScalarModel) {
            String key = EvalUtil.modelToString((TemplateScalarModel) keyModel, this.nameExpression, env);
            return dealWithStringKey(targetModel, key, env);
        }
        throw new UnexpectedTypeException(this.nameExpression, keyModel, "number, range, or string", env);
    }

    private TemplateModel dealWithNumericalKey(TemplateModel targetModel, int index, Environment env) throws TemplateException {
        int size;
        if (targetModel instanceof TemplateSequenceModel) {
            TemplateSequenceModel tsm = (TemplateSequenceModel) targetModel;
            try {
                size = tsm.size();
            } catch (Exception e) {
                size = Integer.MAX_VALUE;
            }
            if (index < size) {
                return tsm.get(index);
            }
            return null;
        }
        try {
            String s = this.target.evalAndCoerceToString(env);
            try {
                return new SimpleScalar(s.substring(index, index + 1));
            } catch (RuntimeException re) {
                throw new _MiscTemplateException(re, env);
            }
        } catch (NonStringException e2) {
            throw new UnexpectedTypeException(this.target, targetModel, "sequence or string (or something that's implicitly convertible to string)", env);
        }
    }

    private TemplateModel dealWithStringKey(TemplateModel targetModel, String key, Environment env) throws TemplateException {
        if (targetModel instanceof TemplateHashModel) {
            return ((TemplateHashModel) targetModel).get(key);
        }
        throw new UnexpectedTypeException(this.target, targetModel, "hash", env);
    }

    private TemplateModel dealWithRangeKey(TemplateModel targetModel, Range range, Environment env) throws TemplateException {
        int start = range.lho.evalToNumber(env).intValue();
        int end = 0;
        boolean hasRhs = range.hasRho();
        if (hasRhs) {
            end = range.rho.evalToNumber(env).intValue();
        }
        if (targetModel instanceof TemplateSequenceModel) {
            TemplateSequenceModel sequence = (TemplateSequenceModel) targetModel;
            if (!hasRhs) {
                end = sequence.size() - 1;
            }
            if (start < 0) {
                throw new _MiscTemplateException(range.lho, new Object[]{"Negative starting index ", new Integer(start), " for slicing range."});
            }
            if (end < 0) {
                throw new _MiscTemplateException(range.rho, new Object[]{"Negative ending index ", new Integer(end), " for slicing range."});
            }
            if (start >= sequence.size()) {
                throw new _MiscTemplateException(range.lho, new Object[]{"Left side index of range out of bounds, is ", new Integer(start), ", but the sequence has only ", new Integer(sequence.size()), " element(s). ", "(Note that indices are 0 based, and ranges are inclusive)."});
            }
            if (end >= sequence.size()) {
                throw new _MiscTemplateException(range.rho, new Object[]{"Right side index of range out of bounds, is ", new Integer(end), ", but the sequence has only ", new Integer(sequence.size()), " element(s). ", "(Note that indices are 0 based, and ranges are inclusive)."});
            }
            ArrayList list = new ArrayList(1 + Math.abs(start - end));
            if (start > end) {
                for (int i = start; i >= end; i--) {
                    list.add(sequence.get(i));
                }
            } else {
                for (int i2 = start; i2 <= end; i2++) {
                    list.add(sequence.get(i2));
                }
            }
            return new SimpleSequence(list);
        }
        try {
            String targetStr = this.target.evalAndCoerceToString(env);
            if (!hasRhs) {
                end = targetStr.length() - 1;
            }
            if (start < 0) {
                throw new _MiscTemplateException(range.lho, new Object[]{"Negative starting index ", new Integer(start), " for slicing range."});
            }
            if (end < 0) {
                throw new _MiscTemplateException(range.rho, new Object[]{"Negative ending index ", new Integer(end), " for slicing range."});
            }
            if (start > targetStr.length()) {
                throw new _MiscTemplateException(range.lho, new Object[]{"Left side of range out of bounds, is: ", new Integer(start), "\nbut the string has ", new Integer(targetStr.length()), " elements."});
            }
            if (end >= targetStr.length()) {
                throw new _MiscTemplateException(range.rho, new Object[]{"Right side of range out of bounds, is: ", new Integer(end), "\nbut the string is only ", new Integer(targetStr.length()), " characters long."});
            }
            try {
                return new SimpleScalar(targetStr.substring(start, end + 1));
            } catch (RuntimeException re) {
                throw new _MiscTemplateException(re, new Object[]{"Unexpected exception: ", re});
            }
        } catch (NonStringException e) {
            throw new UnexpectedTypeException(this.target, this.target.eval(env), "string or something automatically convertible to string (number, date or boolean) or sequence", env);
        }
    }

    @Override // freemarker.core.TemplateObject
    public String getCanonicalForm() {
        return new StringBuffer().append(this.target.getCanonicalForm()).append("[").append(this.nameExpression.getCanonicalForm()).append("]").toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "...[...]";
    }

    @Override // freemarker.core.Expression
    boolean isLiteral() {
        return this.constantValue != null || (this.target.isLiteral() && this.nameExpression.isLiteral());
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 2;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        return idx == 0 ? this.target : this.nameExpression;
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        return idx == 0 ? ParameterRole.LEFT_HAND_OPERAND : ParameterRole.ENCLOSED_OPERAND;
    }

    @Override // freemarker.core.Expression
    protected Expression deepCloneWithIdentifierReplaced_inner(String replacedIdentifier, Expression replacement, Expression.ReplacemenetState replacementState) {
        return new DynamicKeyName(this.target.deepCloneWithIdentifierReplaced(replacedIdentifier, replacement, replacementState), this.nameExpression.deepCloneWithIdentifierReplaced(replacedIdentifier, replacement, replacementState));
    }
}

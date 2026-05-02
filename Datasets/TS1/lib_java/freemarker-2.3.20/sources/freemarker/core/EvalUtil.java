package freemarker.core;

import freemarker.ext.beans.BeanModel;
import freemarker.ext.beans._BeansAPI;
import freemarker.template.TemplateBooleanModel;
import freemarker.template.TemplateCollectionModel;
import freemarker.template.TemplateDateModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateNumberModel;
import freemarker.template.TemplateScalarModel;
import freemarker.template.TemplateSequenceModel;
import java.util.Date;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/EvalUtil.class */
class EvalUtil {
    static final int CMP_OP_EQUALS = 1;
    static final int CMP_OP_NOT_EQUALS = 2;
    static final int CMP_OP_LESS_THAN = 3;
    static final int CMP_OP_GREATER_THAN = 4;
    static final int CMP_OP_LESS_THAN_EQUALS = 5;
    static final int CMP_OP_GREATER_THAN_EQUALS = 6;
    private static final String DATE_OF_THE_COMPARISON_IS_OF_TYPE_UNKNOWN = "date of the comparison is of UNKNOWN type (it's not known if it's date-only, time-only, or date-time), and thus can't be used in a comparison.";
    static Class class$java$lang$String;
    static Class class$java$lang$Number;
    static Class class$java$util$Date;

    private EvalUtil() {
    }

    static String modelToString(TemplateScalarModel model, Expression expr, Environment env) throws TemplateModelException {
        Class cls;
        String value = model.getAsString();
        if (value == null) {
            if (env == null) {
                env = Environment.getCurrentEnvironment();
            }
            if (env != null && env.isClassicCompatible()) {
                return "";
            }
            if (class$java$lang$String == null) {
                cls = class$("java.lang.String");
                class$java$lang$String = cls;
            } else {
                cls = class$java$lang$String;
            }
            throw newModelHasStoredNullException(cls, model, expr);
        }
        return value;
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    static Number modelToNumber(TemplateNumberModel model, Expression expr) throws TemplateModelException {
        Class cls;
        Number value = model.getAsNumber();
        if (value != null) {
            return value;
        }
        if (class$java$lang$Number == null) {
            cls = class$("java.lang.Number");
            class$java$lang$Number = cls;
        } else {
            cls = class$java$lang$Number;
        }
        throw newModelHasStoredNullException(cls, model, expr);
    }

    static Date modelToDate(TemplateDateModel model, Expression expr) throws TemplateModelException, TemplateException {
        Class cls;
        Date value = model.getAsDate();
        if (value != null) {
            return value;
        }
        if (class$java$util$Date == null) {
            cls = class$("java.util.Date");
            class$java$util$Date = cls;
        } else {
            cls = class$java$util$Date;
        }
        throw newModelHasStoredNullException(cls, model, expr);
    }

    private static TemplateModelException newModelHasStoredNullException(Class expected, TemplateModel model, Expression expr) {
        return new _TemplateModelException(expr, _TemplateModelException.modelHasStoredNullDescription(expected, model));
    }

    static boolean compare(Expression leftExp, int operator, String operatorString, Expression rightExp, Expression defaultBlamed, Environment env) throws TemplateException {
        TemplateModel ltm = leftExp.eval(env);
        TemplateModel rtm = rightExp.eval(env);
        return compare(ltm, leftExp, operator, operatorString, rtm, rightExp, defaultBlamed, false, false, false, env);
    }

    static boolean compare(TemplateModel leftValue, int operator, TemplateModel rightValue, Environment env) throws TemplateException {
        return compare(leftValue, null, operator, null, rightValue, null, null, false, false, false, env);
    }

    static boolean compareLenient(TemplateModel leftValue, int operator, TemplateModel rightValue, Environment env) throws TemplateException {
        return compare(leftValue, null, operator, null, rightValue, null, null, true, false, false, env);
    }

    static boolean compare(TemplateModel leftValue, Expression leftExp, int operator, String operatorString, TemplateModel rightValue, Expression rightExp, Expression defaultBlamed, boolean typeMismatchMeansNotEqual, boolean leftNullReturnsFalse, boolean rightNullReturnsFalse, Environment env) throws TemplateException {
        int cmpResult;
        String sideName;
        Expression sideExp;
        if (leftValue == null) {
            if (env != null && env.isClassicCompatible()) {
                leftValue = TemplateScalarModel.EMPTY_STRING;
            } else {
                if (leftNullReturnsFalse) {
                    return false;
                }
                if (leftExp != null) {
                    throw InvalidReferenceException.getInstance(leftExp, env);
                }
                throw new _MiscTemplateException(defaultBlamed, env, "The left operand of the comparison was undefined or null.");
            }
        }
        if (rightValue == null) {
            if (env != null && env.isClassicCompatible()) {
                rightValue = TemplateScalarModel.EMPTY_STRING;
            } else {
                if (rightNullReturnsFalse) {
                    return false;
                }
                if (rightExp != null) {
                    throw InvalidReferenceException.getInstance(rightExp, env);
                }
                throw new _MiscTemplateException(defaultBlamed, env, "The right operand of the comparison was undefined or null.");
            }
        }
        if ((leftValue instanceof TemplateNumberModel) && (rightValue instanceof TemplateNumberModel)) {
            Number leftNum = modelToNumber((TemplateNumberModel) leftValue, leftExp);
            Number rightNum = modelToNumber((TemplateNumberModel) rightValue, rightExp);
            ArithmeticEngine ae = env != null ? env.getArithmeticEngine() : leftExp != null ? leftExp.getTemplate().getArithmeticEngine() : ArithmeticEngine.BIGDECIMAL_ENGINE;
            try {
                cmpResult = ae.compareNumbers(leftNum, rightNum);
            } catch (RuntimeException e) {
                throw new _MiscTemplateException(defaultBlamed, e, env, new Object[]{"Unexpected error while comparing two numbers: ", e});
            }
        } else if ((leftValue instanceof TemplateDateModel) && (rightValue instanceof TemplateDateModel)) {
            TemplateDateModel leftDateModel = (TemplateDateModel) leftValue;
            TemplateDateModel rightDateModel = (TemplateDateModel) rightValue;
            int leftDateType = leftDateModel.getDateType();
            int rightDateType = rightDateModel.getDateType();
            if (leftDateType == 0 || rightDateType == 0) {
                if (leftDateType == 0) {
                    sideName = "left";
                    sideExp = leftExp;
                } else {
                    sideName = "right";
                    sideExp = rightExp;
                }
                throw new _MiscTemplateException(sideExp != null ? sideExp : defaultBlamed, env, new Object[]{"The ", sideName, " ", DATE_OF_THE_COMPARISON_IS_OF_TYPE_UNKNOWN});
            }
            if (leftDateType != rightDateType) {
                throw new _MiscTemplateException(defaultBlamed, env, new Object[]{"Can't compare dates of different types. Left date type is ", TemplateDateModel.TYPE_NAMES.get(leftDateType), ", right date type is ", TemplateDateModel.TYPE_NAMES.get(rightDateType), "."});
            }
            Date leftDate = modelToDate(leftDateModel, leftExp);
            Date rightDate = modelToDate(rightDateModel, rightExp);
            cmpResult = leftDate.compareTo(rightDate);
        } else if ((leftValue instanceof TemplateScalarModel) && (rightValue instanceof TemplateScalarModel)) {
            if (operator != 1 && operator != 2) {
                throw new _MiscTemplateException(defaultBlamed, env, new Object[]{"Can't use operator \"", cmpOpToString(operator, operatorString), "\" on string values."});
            }
            String leftString = modelToString((TemplateScalarModel) leftValue, leftExp, env);
            String rightString = modelToString((TemplateScalarModel) rightValue, rightExp, env);
            cmpResult = env.getCollator().compare(leftString, rightString);
        } else if ((leftValue instanceof TemplateBooleanModel) && (rightValue instanceof TemplateBooleanModel)) {
            if (operator != 1 && operator != 2) {
                throw new _MiscTemplateException(defaultBlamed, env, new Object[]{"Can't use operator \"", cmpOpToString(operator, operatorString), "\" on boolean values."});
            }
            boolean leftBool = ((TemplateBooleanModel) leftValue).getAsBoolean();
            boolean rightBool = ((TemplateBooleanModel) rightValue).getAsBoolean();
            cmpResult = (leftBool ? 1 : 0) - (rightBool ? 1 : 0);
        } else if (env.isClassicCompatible()) {
            String leftSting = leftExp.evalAndCoerceToString(env);
            String rightString2 = rightExp.evalAndCoerceToString(env);
            cmpResult = env.getCollator().compare(leftSting, rightString2);
        } else {
            if (typeMismatchMeansNotEqual) {
                if (operator == 1) {
                    return false;
                }
                if (operator == 2) {
                    return true;
                }
            }
            throw new _MiscTemplateException(defaultBlamed, env, new Object[]{"Can't compare values of these types. ", "Allowed comparisons are between two numbers, two strings, two dates, or two booleans.\n", "Left hand operand is ", new _DelayedAOrAn(new _DelayedFTLTypeDescription(leftValue)), ".\n", "Right hand operand is ", new _DelayedAOrAn(new _DelayedFTLTypeDescription(rightValue)), "."});
        }
        switch (operator) {
            case 1:
                return cmpResult == 0;
            case 2:
                return cmpResult != 0;
            case 3:
                return cmpResult < 0;
            case 4:
                return cmpResult > 0;
            case 5:
                return cmpResult <= 0;
            case 6:
                return cmpResult >= 0;
            default:
                throw new RuntimeException(new StringBuffer().append("Unsupported comparator operator code: ").append(operator).toString());
        }
    }

    private static String cmpOpToString(int operator, String operatorString) {
        if (operatorString != null) {
            return operatorString;
        }
        switch (operator) {
            case 1:
                return "equals";
            case 2:
                return "not-equals";
            case 3:
                return "less-than";
            case 4:
                return "greater-than";
            case 5:
                return "less-than-equals";
            case 6:
                return "greater-than-equals";
            default:
                return "???";
        }
    }

    static String coerceModelToString(TemplateModel tm, Expression exp, String seqHint, Environment env) throws TemplateException {
        if (tm instanceof TemplateNumberModel) {
            return env.formatNumber(modelToNumber((TemplateNumberModel) tm, exp));
        }
        if (tm instanceof TemplateDateModel) {
            TemplateDateModel dm = (TemplateDateModel) tm;
            return env.formatDate(modelToDate(dm, exp), dm.getDateType());
        }
        if (tm instanceof TemplateScalarModel) {
            return modelToString((TemplateScalarModel) tm, exp, env);
        }
        if (tm == null) {
            if (env.isClassicCompatible()) {
                return "";
            }
            if (exp != null) {
                throw InvalidReferenceException.getInstance(exp, env);
            }
            throw new InvalidReferenceException("Null/missing value (no more informatoin avilable)", env);
        }
        if (tm instanceof TemplateBooleanModel) {
            boolean booleanValue = ((TemplateBooleanModel) tm).getAsBoolean();
            int compatMode = env.getClassicCompatibleAsInt();
            if (compatMode == 0) {
                return env.formatBoolean(booleanValue, false);
            }
            if (compatMode == 1) {
                return booleanValue ? "true" : "";
            }
            if (compatMode == 2) {
                if (tm instanceof BeanModel) {
                    return _BeansAPI.getAsClassicCompatibleString((BeanModel) tm);
                }
                return booleanValue ? "true" : "";
            }
            throw new RuntimeException(new StringBuffer().append("Unsupported classic_compatible variation: ").append(compatMode).toString());
        }
        if (env.isClassicCompatible() && (tm instanceof BeanModel)) {
            return _BeansAPI.getAsClassicCompatibleString((BeanModel) tm);
        }
        if (seqHint != null && ((tm instanceof TemplateSequenceModel) || (tm instanceof TemplateCollectionModel))) {
            throw new NonStringException(exp, tm, seqHint, env);
        }
        throw new NonStringException(exp, tm, env);
    }
}

package freemarker.core;

import freemarker.template.SimpleDate;
import freemarker.template.SimpleNumber;
import freemarker.template.TemplateBooleanModel;
import freemarker.template.TemplateDateModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateNumberModel;
import freemarker.template.utility.NumberUtil;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/NumericalBuiltins.class */
class NumericalBuiltins {
    private static final BigDecimal BIG_DECIMAL_ONE = new BigDecimal("1");
    private static final BigDecimal BIG_DECIMAL_LONG_MIN = BigDecimal.valueOf(Long.MIN_VALUE);
    private static final BigDecimal BIG_DECIMAL_LONG_MAX = BigDecimal.valueOf(Long.MAX_VALUE);
    private static final BigInteger BIG_INTEGER_LONG_MIN = BigInteger.valueOf(Long.MIN_VALUE);
    private static final BigInteger BIG_INTEGER_LONG_MAX = BigInteger.valueOf(Long.MAX_VALUE);

    /* renamed from: freemarker.core.NumericalBuiltins$1, reason: invalid class name */
    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NumericalBuiltins$1.class */
    static class AnonymousClass1 {
    }

    private NumericalBuiltins() {
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NumericalBuiltins$NumberBuiltIn.class */
    private static abstract class NumberBuiltIn extends BuiltIn {
        abstract TemplateModel calculateResult(Number number, TemplateModel templateModel) throws TemplateModelException;

        private NumberBuiltIn() {
        }

        NumberBuiltIn(AnonymousClass1 x0) {
            this();
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel model = this.target.eval(env);
            return calculateResult(this.target.modelToNumber(model, env), model);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NumericalBuiltins$byteBI.class */
    static class byteBI extends NumberBuiltIn {
        byteBI() {
            super(null);
        }

        @Override // freemarker.core.NumericalBuiltins.NumberBuiltIn
        TemplateModel calculateResult(Number num, TemplateModel model) {
            if (num instanceof Byte) {
                return model;
            }
            return new SimpleNumber(new Byte(num.byteValue()));
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NumericalBuiltins$shortBI.class */
    static class shortBI extends NumberBuiltIn {
        shortBI() {
            super(null);
        }

        @Override // freemarker.core.NumericalBuiltins.NumberBuiltIn
        TemplateModel calculateResult(Number num, TemplateModel model) {
            if (num instanceof Short) {
                return model;
            }
            return new SimpleNumber(new Short(num.shortValue()));
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NumericalBuiltins$intBI.class */
    static class intBI extends NumberBuiltIn {
        intBI() {
            super(null);
        }

        @Override // freemarker.core.NumericalBuiltins.NumberBuiltIn
        TemplateModel calculateResult(Number num, TemplateModel model) {
            if (num instanceof Integer) {
                return model;
            }
            return new SimpleNumber(num.intValue());
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NumericalBuiltins$longBI.class */
    static class longBI extends BuiltIn {
        longBI() {
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel model = this.target.eval(env);
            if (!(model instanceof TemplateNumberModel) && (model instanceof TemplateDateModel)) {
                Date date = EvalUtil.modelToDate((TemplateDateModel) model, this.target);
                return new SimpleNumber(date.getTime());
            }
            Number num = this.target.modelToNumber(model, env);
            if (num instanceof Long) {
                return model;
            }
            return new SimpleNumber(num.longValue());
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NumericalBuiltins$floatBI.class */
    static class floatBI extends NumberBuiltIn {
        floatBI() {
            super(null);
        }

        @Override // freemarker.core.NumericalBuiltins.NumberBuiltIn
        TemplateModel calculateResult(Number num, TemplateModel model) {
            if (num instanceof Float) {
                return model;
            }
            return new SimpleNumber(num.floatValue());
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NumericalBuiltins$doubleBI.class */
    static class doubleBI extends NumberBuiltIn {
        doubleBI() {
            super(null);
        }

        @Override // freemarker.core.NumericalBuiltins.NumberBuiltIn
        TemplateModel calculateResult(Number num, TemplateModel model) {
            if (num instanceof Double) {
                return model;
            }
            return new SimpleNumber(num.doubleValue());
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NumericalBuiltins$floorBI.class */
    static class floorBI extends NumberBuiltIn {
        floorBI() {
            super(null);
        }

        @Override // freemarker.core.NumericalBuiltins.NumberBuiltIn
        TemplateModel calculateResult(Number num, TemplateModel model) {
            return new SimpleNumber(new BigDecimal(num.doubleValue()).divide(NumericalBuiltins.BIG_DECIMAL_ONE, 0, 3));
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NumericalBuiltins$ceilingBI.class */
    static class ceilingBI extends NumberBuiltIn {
        ceilingBI() {
            super(null);
        }

        @Override // freemarker.core.NumericalBuiltins.NumberBuiltIn
        TemplateModel calculateResult(Number num, TemplateModel model) {
            return new SimpleNumber(new BigDecimal(num.doubleValue()).divide(NumericalBuiltins.BIG_DECIMAL_ONE, 0, 2));
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NumericalBuiltins$roundBI.class */
    static class roundBI extends NumberBuiltIn {
        private static final BigDecimal half = new BigDecimal("0.5");

        roundBI() {
            super(null);
        }

        @Override // freemarker.core.NumericalBuiltins.NumberBuiltIn
        TemplateModel calculateResult(Number num, TemplateModel model) {
            return new SimpleNumber(new BigDecimal(num.doubleValue()).add(half).divide(NumericalBuiltins.BIG_DECIMAL_ONE, 0, 3));
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NumericalBuiltins$absBI.class */
    static class absBI extends NumberBuiltIn {
        absBI() {
            super(null);
        }

        @Override // freemarker.core.NumericalBuiltins.NumberBuiltIn
        TemplateModel calculateResult(Number num, TemplateModel model) throws TemplateModelException {
            if (num instanceof Integer) {
                int n = ((Integer) num).intValue();
                if (n < 0) {
                    return new SimpleNumber(-n);
                }
                return model;
            }
            if (num instanceof BigDecimal) {
                BigDecimal n2 = (BigDecimal) num;
                if (n2.signum() < 0) {
                    return new SimpleNumber(n2.negate());
                }
                return model;
            }
            if (num instanceof Double) {
                double n3 = ((Double) num).doubleValue();
                if (n3 < 0.0d) {
                    return new SimpleNumber(-n3);
                }
                return model;
            }
            if (num instanceof Float) {
                float n4 = ((Float) num).floatValue();
                if (n4 < 0.0f) {
                    return new SimpleNumber(-n4);
                }
                return model;
            }
            if (num instanceof Long) {
                long n5 = ((Long) num).longValue();
                if (n5 < 0) {
                    return new SimpleNumber(-n5);
                }
                return model;
            }
            if (num instanceof Short) {
                short n6 = ((Short) num).shortValue();
                if (n6 < 0) {
                    return new SimpleNumber(-n6);
                }
                return model;
            }
            if (num instanceof Byte) {
                byte n7 = ((Byte) num).byteValue();
                if (n7 < 0) {
                    return new SimpleNumber(-n7);
                }
                return model;
            }
            if (num instanceof BigInteger) {
                BigInteger n8 = (BigInteger) num;
                if (n8.signum() < 0) {
                    return new SimpleNumber(n8.negate());
                }
                return model;
            }
            throw new _TemplateModelException(new Object[]{"Unsupported number class: ", num.getClass()});
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NumericalBuiltins$is_nanBI.class */
    static class is_nanBI extends NumberBuiltIn {
        is_nanBI() {
            super(null);
        }

        @Override // freemarker.core.NumericalBuiltins.NumberBuiltIn
        TemplateModel calculateResult(Number num, TemplateModel model) throws TemplateModelException {
            return NumberUtil.isNaN(num) ? TemplateBooleanModel.TRUE : TemplateBooleanModel.FALSE;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NumericalBuiltins$is_infiniteBI.class */
    static class is_infiniteBI extends NumberBuiltIn {
        is_infiniteBI() {
            super(null);
        }

        @Override // freemarker.core.NumericalBuiltins.NumberBuiltIn
        TemplateModel calculateResult(Number num, TemplateModel model) throws TemplateModelException {
            return NumberUtil.isInfinite(num) ? TemplateBooleanModel.TRUE : TemplateBooleanModel.FALSE;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final long safeToLong(Number num) throws TemplateModelException {
        if (num instanceof Double) {
            double d = Math.round(((Double) num).doubleValue());
            if (d > 9.223372036854776E18d || d < -9.223372036854776E18d) {
                throw new _TemplateModelException(new Object[]{"Number doesn't fit into a 64 bit signed integer (long): ", new Double(d)});
            }
            return (long) d;
        }
        if (num instanceof Float) {
            float f = Math.round(((Float) num).floatValue());
            if (f > 9.223372E18f || f < -9.223372E18f) {
                throw new _TemplateModelException(new Object[]{"Number doesn't fit into a 64 bit signed integer (long): ", new Float(f)});
            }
            return (long) f;
        }
        if (num instanceof BigDecimal) {
            BigDecimal bd = ((BigDecimal) num).setScale(0, 4);
            if (bd.compareTo(BIG_DECIMAL_LONG_MAX) > 0 || bd.compareTo(BIG_DECIMAL_LONG_MIN) < 0) {
                throw new _TemplateModelException(new Object[]{"Number doesn't fit into a 64 bit signed integer (long): ", bd});
            }
            return bd.longValue();
        }
        if (num instanceof BigInteger) {
            BigInteger bi = (BigInteger) num;
            if (bi.compareTo(BIG_INTEGER_LONG_MAX) > 0 || bi.compareTo(BIG_INTEGER_LONG_MIN) < 0) {
                throw new _TemplateModelException(new Object[]{"Number doesn't fit into a 64 bit signed integer (long): ", bi});
            }
            return bi.longValue();
        }
        if ((num instanceof Long) || (num instanceof Integer) || (num instanceof Byte) || (num instanceof Short)) {
            return num.longValue();
        }
        throw new _TemplateModelException(new Object[]{"Unsupported number type: ", num.getClass()});
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NumericalBuiltins$number_to_dateBI.class */
    static class number_to_dateBI extends NumberBuiltIn {
        private final int dateType;

        number_to_dateBI(int dateType) {
            super(null);
            this.dateType = dateType;
        }

        @Override // freemarker.core.NumericalBuiltins.NumberBuiltIn
        TemplateModel calculateResult(Number num, TemplateModel model) throws TemplateModelException {
            return new SimpleDate(new Date(NumericalBuiltins.safeToLong(num)), this.dateType);
        }
    }
}

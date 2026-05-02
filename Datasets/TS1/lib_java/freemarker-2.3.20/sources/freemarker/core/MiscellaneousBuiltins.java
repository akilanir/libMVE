package freemarker.core;

import freemarker.ext.beans.BeanModel;
import freemarker.ext.beans._BeansAPI;
import freemarker.template.SimpleDate;
import freemarker.template.SimpleNumber;
import freemarker.template.SimpleScalar;
import freemarker.template.TemplateBooleanModel;
import freemarker.template.TemplateCollectionModel;
import freemarker.template.TemplateDateModel;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateHashModel;
import freemarker.template.TemplateHashModelEx;
import freemarker.template.TemplateMethodModel;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateNodeModel;
import freemarker.template.TemplateNumberModel;
import freemarker.template.TemplateScalarModel;
import freemarker.template.TemplateSequenceModel;
import freemarker.template.TemplateTransformModel;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/MiscellaneousBuiltins.class */
class MiscellaneousBuiltins {
    private MiscellaneousBuiltins() {
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/MiscellaneousBuiltins$sizeBI.class */
    static class sizeBI extends BuiltIn {
        sizeBI() {
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel model = this.target.eval(env);
            if (model instanceof TemplateSequenceModel) {
                int size = ((TemplateSequenceModel) model).size();
                return new SimpleNumber(size);
            }
            if (model instanceof TemplateHashModelEx) {
                int size2 = ((TemplateHashModelEx) model).size();
                return new SimpleNumber(size2);
            }
            throw new UnexpectedTypeException(this.target, model, "extended-hash or sequence", env);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/MiscellaneousBuiltins$dateBI.class */
    static class dateBI extends BuiltIn {
        private final int dateType;

        dateBI(int dateType) {
            this.dateType = dateType;
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel model = this.target.eval(env);
            if (model instanceof TemplateDateModel) {
                TemplateDateModel dmodel = (TemplateDateModel) model;
                int dtype = dmodel.getDateType();
                if (this.dateType == dtype) {
                    return model;
                }
                if (dtype == 0 || dtype == 3) {
                    return new SimpleDate(dmodel.getAsDate(), this.dateType);
                }
                throw new _MiscTemplateException(this, new Object[]{"Cannot convert ", TemplateDateModel.TYPE_NAMES.get(dtype), " into ", TemplateDateModel.TYPE_NAMES.get(this.dateType)});
            }
            String s = this.target.evalAndCoerceToString(env);
            return new DateParser(this, s, env);
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/MiscellaneousBuiltins$dateBI$DateParser.class */
        private class DateParser implements TemplateDateModel, TemplateMethodModel, TemplateHashModel {
            private final String text;
            private final Environment env;
            private final DateFormat defaultFormat;
            private Date cachedValue;
            private final dateBI this$0;

            DateParser(dateBI datebi, String text, Environment env) throws TemplateModelException {
                this.this$0 = datebi;
                this.text = text;
                this.env = env;
                this.defaultFormat = env.getDateFormatObject(datebi.dateType);
            }

            @Override // freemarker.template.TemplateDateModel
            public Date getAsDate() throws TemplateModelException {
                if (this.cachedValue == null) {
                    this.cachedValue = parse(this.defaultFormat);
                }
                return this.cachedValue;
            }

            @Override // freemarker.template.TemplateDateModel
            public int getDateType() {
                return this.this$0.dateType;
            }

            @Override // freemarker.template.TemplateHashModel
            public TemplateModel get(String pattern) throws TemplateModelException {
                return new SimpleDate(parse(this.env.getDateFormatObject(this.this$0.dateType, pattern)), this.this$0.dateType);
            }

            @Override // freemarker.template.TemplateMethodModel
            public Object exec(List args) throws TemplateModelException {
                this.this$0.checkMethodArgCount(args, 1);
                return get((String) args.get(0));
            }

            @Override // freemarker.template.TemplateHashModel
            public boolean isEmpty() {
                return false;
            }

            private Date parse(DateFormat df) throws TemplateModelException {
                try {
                    return df.parse(this.text);
                } catch (java.text.ParseException e) {
                    String pattern = null;
                    if (df instanceof SimpleDateFormat) {
                        pattern = ((SimpleDateFormat) df).toPattern();
                    }
                    Object[] objArr = new Object[6];
                    objArr[0] = "The string doesn't match the expected date/time format. The string to parse was: ";
                    objArr[1] = new _DelayedJQuote(this.text);
                    objArr[2] = ". ";
                    objArr[3] = pattern != null ? "The expected format was: " : "";
                    objArr[4] = pattern != null ? new _DelayedJQuote(pattern) : "";
                    objArr[5] = pattern != null ? ". " : "";
                    throw new _TemplateModelException(objArr);
                }
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/MiscellaneousBuiltins$stringBI.class */
    static class stringBI extends BuiltIn {
        stringBI() {
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel model = this.target.eval(env);
            if (model instanceof TemplateNumberModel) {
                return new NumberFormatter(this, EvalUtil.modelToNumber((TemplateNumberModel) model, this.target), env);
            }
            if (model instanceof TemplateDateModel) {
                TemplateDateModel dm = (TemplateDateModel) model;
                int dateType = dm.getDateType();
                return new DateFormatter(this, EvalUtil.modelToDate(dm, this.target), dateType, env);
            }
            if (model instanceof SimpleScalar) {
                return model;
            }
            if (model instanceof TemplateBooleanModel) {
                return new BooleanFormatter(this, (TemplateBooleanModel) model, env);
            }
            if (model instanceof TemplateScalarModel) {
                return new SimpleScalar(((TemplateScalarModel) model).getAsString());
            }
            if (env.isClassicCompatible() && (model instanceof BeanModel)) {
                return new SimpleScalar(_BeansAPI.getAsClassicCompatibleString((BeanModel) model));
            }
            throw new UnexpectedTypeException(this.target, model, "number, date, or string", env);
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/MiscellaneousBuiltins$stringBI$NumberFormatter.class */
        private class NumberFormatter implements TemplateScalarModel, TemplateHashModel, TemplateMethodModel {
            private final Number number;
            private final Environment env;
            private final NumberFormat defaultFormat;
            private String cachedValue;
            private final stringBI this$0;

            NumberFormatter(stringBI stringbi, Number number, Environment env) {
                this.this$0 = stringbi;
                this.number = number;
                this.env = env;
                this.defaultFormat = env.getNumberFormatObject(env.getNumberFormat());
            }

            @Override // freemarker.template.TemplateScalarModel
            public String getAsString() {
                if (this.cachedValue == null) {
                    this.cachedValue = this.defaultFormat.format(this.number);
                }
                return this.cachedValue;
            }

            @Override // freemarker.template.TemplateHashModel
            public TemplateModel get(String key) {
                return new SimpleScalar(this.env.getNumberFormatObject(key).format(this.number));
            }

            @Override // freemarker.template.TemplateMethodModel
            public Object exec(List args) throws TemplateModelException {
                this.this$0.checkMethodArgCount(args, 1);
                return get((String) args.get(0));
            }

            @Override // freemarker.template.TemplateHashModel
            public boolean isEmpty() {
                return false;
            }
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/MiscellaneousBuiltins$stringBI$DateFormatter.class */
        private class DateFormatter implements TemplateScalarModel, TemplateHashModel, TemplateMethodModel {
            private final Date date;
            private final int dateType;
            private final Environment env;
            private final DateFormat defaultFormat;
            private String cachedValue;
            private final stringBI this$0;

            DateFormatter(stringBI stringbi, Date date, int dateType, Environment env) throws TemplateModelException {
                this.this$0 = stringbi;
                this.date = date;
                this.dateType = dateType;
                this.env = env;
                this.defaultFormat = env.getDateFormatObject(dateType);
            }

            @Override // freemarker.template.TemplateScalarModel
            public String getAsString() throws TemplateModelException {
                if (this.dateType == 0) {
                    throw new _TemplateModelException(new _ErrorDescriptionBuilder("Can't convert the date to string, because it isn't known if it's a date-only, time-only, or date-time value.").tip(MessageUtil.UNKNOWN_DATE_TO_STRING_TIPS));
                }
                if (this.cachedValue == null) {
                    this.cachedValue = this.defaultFormat.format(this.date);
                }
                return this.cachedValue;
            }

            @Override // freemarker.template.TemplateHashModel
            public TemplateModel get(String key) throws TemplateModelException {
                return new SimpleScalar(this.env.getDateFormatObject(this.dateType, key).format(this.date));
            }

            @Override // freemarker.template.TemplateMethodModel
            public Object exec(List args) throws TemplateModelException {
                this.this$0.checkMethodArgCount(args, 1);
                return get((String) args.get(0));
            }

            @Override // freemarker.template.TemplateHashModel
            public boolean isEmpty() {
                return false;
            }
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/MiscellaneousBuiltins$stringBI$BooleanFormatter.class */
        private class BooleanFormatter implements TemplateScalarModel, TemplateMethodModel {
            private final TemplateBooleanModel bool;
            private final Environment env;
            private final stringBI this$0;

            BooleanFormatter(stringBI stringbi, TemplateBooleanModel bool, Environment env) {
                this.this$0 = stringbi;
                this.bool = bool;
                this.env = env;
            }

            @Override // freemarker.template.TemplateScalarModel
            public String getAsString() throws TemplateModelException {
                if (this.bool instanceof TemplateScalarModel) {
                    return ((TemplateScalarModel) this.bool).getAsString();
                }
                try {
                    return this.env.formatBoolean(this.bool.getAsBoolean(), true);
                } catch (TemplateException e) {
                    throw new TemplateModelException((Exception) e);
                }
            }

            @Override // freemarker.template.TemplateMethodModel
            public Object exec(List args) throws TemplateModelException {
                this.this$0.checkMethodArgCount(args, 2);
                return new SimpleScalar((String) args.get(this.bool.getAsBoolean() ? 0 : 1));
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/MiscellaneousBuiltins$is_stringBI.class */
    static class is_stringBI extends BuiltIn {
        is_stringBI() {
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel tm = this.target.eval(env);
            this.target.assertNonNull(tm, env);
            return tm instanceof TemplateScalarModel ? TemplateBooleanModel.TRUE : TemplateBooleanModel.FALSE;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/MiscellaneousBuiltins$is_numberBI.class */
    static class is_numberBI extends BuiltIn {
        is_numberBI() {
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel tm = this.target.eval(env);
            this.target.assertNonNull(tm, env);
            return tm instanceof TemplateNumberModel ? TemplateBooleanModel.TRUE : TemplateBooleanModel.FALSE;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/MiscellaneousBuiltins$is_nodeBI.class */
    static class is_nodeBI extends BuiltIn {
        is_nodeBI() {
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel tm = this.target.eval(env);
            this.target.assertNonNull(tm, env);
            return tm instanceof TemplateNodeModel ? TemplateBooleanModel.TRUE : TemplateBooleanModel.FALSE;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/MiscellaneousBuiltins$is_booleanBI.class */
    static class is_booleanBI extends BuiltIn {
        is_booleanBI() {
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel tm = this.target.eval(env);
            this.target.assertNonNull(tm, env);
            return tm instanceof TemplateBooleanModel ? TemplateBooleanModel.TRUE : TemplateBooleanModel.FALSE;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/MiscellaneousBuiltins$is_dateBI.class */
    static class is_dateBI extends BuiltIn {
        is_dateBI() {
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel tm = this.target.eval(env);
            this.target.assertNonNull(tm, env);
            return tm instanceof TemplateDateModel ? TemplateBooleanModel.TRUE : TemplateBooleanModel.FALSE;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/MiscellaneousBuiltins$is_methodBI.class */
    static class is_methodBI extends BuiltIn {
        is_methodBI() {
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel tm = this.target.eval(env);
            this.target.assertNonNull(tm, env);
            return tm instanceof TemplateMethodModel ? TemplateBooleanModel.TRUE : TemplateBooleanModel.FALSE;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/MiscellaneousBuiltins$is_macroBI.class */
    static class is_macroBI extends BuiltIn {
        is_macroBI() {
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel tm = this.target.eval(env);
            this.target.assertNonNull(tm, env);
            return tm instanceof Macro ? TemplateBooleanModel.TRUE : TemplateBooleanModel.FALSE;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/MiscellaneousBuiltins$is_transformBI.class */
    static class is_transformBI extends BuiltIn {
        is_transformBI() {
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel tm = this.target.eval(env);
            this.target.assertNonNull(tm, env);
            return tm instanceof TemplateTransformModel ? TemplateBooleanModel.TRUE : TemplateBooleanModel.FALSE;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/MiscellaneousBuiltins$is_hashBI.class */
    static class is_hashBI extends BuiltIn {
        is_hashBI() {
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel tm = this.target.eval(env);
            this.target.assertNonNull(tm, env);
            return tm instanceof TemplateHashModel ? TemplateBooleanModel.TRUE : TemplateBooleanModel.FALSE;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/MiscellaneousBuiltins$is_hash_exBI.class */
    static class is_hash_exBI extends BuiltIn {
        is_hash_exBI() {
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel tm = this.target.eval(env);
            this.target.assertNonNull(tm, env);
            return tm instanceof TemplateHashModelEx ? TemplateBooleanModel.TRUE : TemplateBooleanModel.FALSE;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/MiscellaneousBuiltins$is_sequenceBI.class */
    static class is_sequenceBI extends BuiltIn {
        is_sequenceBI() {
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel tm = this.target.eval(env);
            this.target.assertNonNull(tm, env);
            return tm instanceof TemplateSequenceModel ? TemplateBooleanModel.TRUE : TemplateBooleanModel.FALSE;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/MiscellaneousBuiltins$is_collectionBI.class */
    static class is_collectionBI extends BuiltIn {
        is_collectionBI() {
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel tm = this.target.eval(env);
            this.target.assertNonNull(tm, env);
            return tm instanceof TemplateCollectionModel ? TemplateBooleanModel.TRUE : TemplateBooleanModel.FALSE;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/MiscellaneousBuiltins$is_indexableBI.class */
    static class is_indexableBI extends BuiltIn {
        is_indexableBI() {
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel tm = this.target.eval(env);
            this.target.assertNonNull(tm, env);
            return tm instanceof TemplateSequenceModel ? TemplateBooleanModel.TRUE : TemplateBooleanModel.FALSE;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/MiscellaneousBuiltins$is_enumerableBI.class */
    static class is_enumerableBI extends BuiltIn {
        is_enumerableBI() {
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel tm = this.target.eval(env);
            this.target.assertNonNull(tm, env);
            return ((tm instanceof TemplateSequenceModel) || (tm instanceof TemplateCollectionModel)) ? TemplateBooleanModel.TRUE : TemplateBooleanModel.FALSE;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/MiscellaneousBuiltins$is_directiveBI.class */
    static class is_directiveBI extends BuiltIn {
        is_directiveBI() {
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel tm = this.target.eval(env);
            this.target.assertNonNull(tm, env);
            return ((tm instanceof TemplateTransformModel) || (tm instanceof Macro) || (tm instanceof TemplateDirectiveModel)) ? TemplateBooleanModel.TRUE : TemplateBooleanModel.FALSE;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/MiscellaneousBuiltins$namespaceBI.class */
    static class namespaceBI extends BuiltIn {
        namespaceBI() {
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel tm = this.target.eval(env);
            if (!(tm instanceof Macro)) {
                throw new UnexpectedTypeException(this.target, tm, "macro or function", env);
            }
            return env.getMacroNamespace((Macro) tm);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/MiscellaneousBuiltins$cBI.class */
    static class cBI extends BuiltIn {
        cBI() {
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel model = this.target.eval(env);
            if (model instanceof TemplateNumberModel) {
                Number num = EvalUtil.modelToNumber((TemplateNumberModel) model, this.target);
                if ((num instanceof Integer) || (num instanceof Long)) {
                    return new SimpleScalar(num.toString());
                }
                return new SimpleScalar(env.getCNumberFormat().format(num));
            }
            if (model instanceof TemplateBooleanModel) {
                return new SimpleScalar(((TemplateBooleanModel) model).getAsBoolean() ? "true" : "false");
            }
            throw new UnexpectedTypeException(this.target, model, "number or boolean", env);
        }
    }
}

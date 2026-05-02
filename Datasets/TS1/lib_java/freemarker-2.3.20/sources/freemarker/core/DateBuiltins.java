package freemarker.core;

import freemarker.template.SimpleScalar;
import freemarker.template.TemplateDateModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModel;
import freemarker.template.utility.DateUtil;
import java.util.Date;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/DateBuiltins.class */
class DateBuiltins {
    static Class class$java$util$TimeZone;

    /* renamed from: freemarker.core.DateBuiltins$1, reason: invalid class name */
    /* loaded from: freemarker-2.3.20.jar:freemarker/core/DateBuiltins$1.class */
    static class AnonymousClass1 {
    }

    private DateBuiltins() {
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/DateBuiltins$DateBuiltin.class */
    private static abstract class DateBuiltin extends BuiltIn {
        protected abstract TemplateModel calculateResult(Date date, int i, Environment environment) throws TemplateException;

        private DateBuiltin() {
        }

        DateBuiltin(AnonymousClass1 x0) {
            this();
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel model = this.target.eval(env);
            if (model instanceof TemplateDateModel) {
                TemplateDateModel tdm = (TemplateDateModel) model;
                return calculateResult(EvalUtil.modelToDate(tdm, this.target), tdm.getDateType(), env);
            }
            if (model == null) {
                throw InvalidReferenceException.getInstance(this.target, env);
            }
            throw new NonDateException(this.target, model, "date", env);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/DateBuiltins$AbstractISOBI.class */
    static abstract class AbstractISOBI extends DateBuiltin {
        protected final boolean showOffset;
        protected final int accuracy;

        protected AbstractISOBI(boolean showOffset, int accuracy) {
            super(null);
            this.showOffset = showOffset;
            this.accuracy = accuracy;
        }

        protected void checkDateTypeNotUnknown(int dateType) throws TemplateException {
            if (dateType == 0) {
                throw new _MiscTemplateException(new _ErrorDescriptionBuilder(new Object[]{"The value of the following has unknown date type, but ?", this.key, " needs a date value where it's known if it's a date-only, time-only, or date+time value:"}).blame(this.target).tips(MessageUtil.UNKNOWN_DATE_TYPE_ERROR_TIPS));
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/DateBuiltins$iso_tz_BI.class */
    static class iso_tz_BI extends AbstractISOBI {
        private final boolean useUTC;

        iso_tz_BI(boolean showOffset, int accuracy, boolean useUTC) {
            super(showOffset, accuracy);
            this.useUTC = useUTC;
        }

        @Override // freemarker.core.DateBuiltins.DateBuiltin
        protected TemplateModel calculateResult(Date date, int dateType, Environment env) throws TemplateException {
            checkDateTypeNotUnknown(dateType);
            return new SimpleScalar(DateUtil.dateToISO8601String(date, dateType != 1, dateType != 2, this.showOffset && dateType != 2, this.accuracy, this.useUTC ? DateUtil.UTC : env.getTimeZone(), env.getISOBuiltInCalendar()));
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/DateBuiltins$iso_BI.class */
    static class iso_BI extends AbstractISOBI {
        iso_BI(boolean showOffset, int accuracy) {
            super(showOffset, accuracy);
        }

        @Override // freemarker.core.DateBuiltins.DateBuiltin
        protected TemplateModel calculateResult(Date date, int dateType, Environment env) throws TemplateException {
            checkDateTypeNotUnknown(dateType);
            return new Result(this, date, dateType, env);
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/DateBuiltins$iso_BI$Result.class */
        class Result implements TemplateMethodModelEx {
            private final Date date;
            private final int dateType;
            private final Environment env;
            private final iso_BI this$0;

            Result(iso_BI iso_bi, Date date, int dateType, Environment env) {
                this.this$0 = iso_bi;
                this.date = date;
                this.dateType = dateType;
                this.env = env;
            }

            /* JADX WARN: Removed duplicated region for block: B:11:0x004b  */
            @Override // freemarker.template.TemplateMethodModelEx, freemarker.template.TemplateMethodModel
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public java.lang.Object exec(java.util.List r11) throws freemarker.template.TemplateModelException {
                /*
                    Method dump skipped, instructions count: 263
                    To view this dump add '--comments-level debug' option
                */
                throw new UnsupportedOperationException("Method not decompiled: freemarker.core.DateBuiltins.iso_BI.Result.exec(java.util.List):java.lang.Object");
            }
        }
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }
}

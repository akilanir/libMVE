package ch.qos.logback.core.rolling.helper;

import ch.qos.logback.core.pattern.DynamicConverter;
import ch.qos.logback.core.util.CachingDateFormatter;
import ch.qos.logback.core.util.DatePatternToRegexUtil;
import java.util.Date;
import java.util.List;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/rolling/helper/DateTokenConverter.class */
public class DateTokenConverter<E> extends DynamicConverter<E> implements MonoTypedConverter {
    public static final String CONVERTER_KEY = "d";
    public static final String AUXILIARY_TOKEN = "AUX";
    public static final String DEFAULT_DATE_PATTERN = "yyyy-MM-dd";
    private String datePattern;
    private CachingDateFormatter cdf;
    private boolean primary = true;

    @Override // ch.qos.logback.core.pattern.DynamicConverter, ch.qos.logback.core.spi.LifeCycle
    public void start() {
        this.datePattern = getFirstOption();
        if (this.datePattern == null) {
            this.datePattern = "yyyy-MM-dd";
        }
        List<String> optionList = getOptionList();
        if (optionList != null && optionList.size() > 1 && AUXILIARY_TOKEN.equalsIgnoreCase(optionList.get(1))) {
            this.primary = false;
        }
        this.cdf = new CachingDateFormatter(this.datePattern);
    }

    public String convert(Date date) {
        return this.cdf.format(date.getTime());
    }

    @Override // ch.qos.logback.core.pattern.Converter
    public String convert(Object obj) {
        if (obj == null) {
            throw new IllegalArgumentException("Null argument forbidden");
        }
        if (obj instanceof Date) {
            return convert((Date) obj);
        }
        throw new IllegalArgumentException("Cannot convert " + obj + " of type" + obj.getClass().getName());
    }

    public String getDatePattern() {
        return this.datePattern;
    }

    @Override // ch.qos.logback.core.rolling.helper.MonoTypedConverter
    public boolean isApplicable(Object obj) {
        return obj instanceof Date;
    }

    public String toRegex() {
        return new DatePatternToRegexUtil(this.datePattern).toRegex();
    }

    public boolean isPrimary() {
        return this.primary;
    }
}

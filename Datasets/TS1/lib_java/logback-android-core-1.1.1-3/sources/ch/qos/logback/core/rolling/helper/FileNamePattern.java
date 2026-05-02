package ch.qos.logback.core.rolling.helper;

import ch.qos.logback.core.Context;
import ch.qos.logback.core.pattern.Converter;
import ch.qos.logback.core.pattern.ConverterUtil;
import ch.qos.logback.core.pattern.LiteralConverter;
import ch.qos.logback.core.pattern.parser.Parser;
import ch.qos.logback.core.pattern.util.AlmostAsIsEscapeUtil;
import ch.qos.logback.core.spi.ContextAwareBase;
import ch.qos.logback.core.spi.ScanException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/rolling/helper/FileNamePattern.class */
public class FileNamePattern extends ContextAwareBase {
    static final Map<String, String> CONVERTER_MAP = new HashMap();
    String pattern;
    Converter<Object> headTokenConverter;

    public FileNamePattern(String str, Context context) {
        setPattern(FileFilterUtil.slashify(str));
        setContext(context);
        parse();
        ConverterUtil.startConverters(this.headTokenConverter);
    }

    void parse() {
        try {
            Parser parser = new Parser(escapeRightParantesis(this.pattern), new AlmostAsIsEscapeUtil());
            parser.setContext(this.context);
            this.headTokenConverter = parser.compile(parser.parse(), CONVERTER_MAP);
        } catch (ScanException e) {
            addError("Failed to parse pattern \"" + this.pattern + "\".", e);
        }
    }

    String escapeRightParantesis(String str) {
        return this.pattern.replace(")", "\\)");
    }

    public String toString() {
        return this.pattern;
    }

    public DateTokenConverter getPrimaryDateTokenConverter() {
        Converter<Object> converter = this.headTokenConverter;
        while (true) {
            Converter<Object> converter2 = converter;
            if (converter2 == null) {
                return null;
            }
            if (converter2 instanceof DateTokenConverter) {
                DateTokenConverter dateTokenConverter = (DateTokenConverter) converter2;
                if (dateTokenConverter.isPrimary()) {
                    return dateTokenConverter;
                }
            }
            converter = converter2.getNext();
        }
    }

    public IntegerTokenConverter getIntegerTokenConverter() {
        Converter<Object> converter = this.headTokenConverter;
        while (true) {
            Converter<Object> converter2 = converter;
            if (converter2 == null) {
                return null;
            }
            if (converter2 instanceof IntegerTokenConverter) {
                return (IntegerTokenConverter) converter2;
            }
            converter = converter2.getNext();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public String convertMultipleArguments(Object... objArr) {
        StringBuilder sb = new StringBuilder();
        Converter<Object> converter = this.headTokenConverter;
        while (true) {
            Converter converter2 = converter;
            if (converter2 == 0) {
                return sb.toString();
            }
            if (converter2 instanceof MonoTypedConverter) {
                MonoTypedConverter monoTypedConverter = (MonoTypedConverter) converter2;
                for (Object obj : objArr) {
                    if (monoTypedConverter.isApplicable(obj)) {
                        sb.append(converter2.convert(obj));
                    }
                }
            } else {
                sb.append(converter2.convert(objArr));
            }
            converter = converter2.getNext();
        }
    }

    public String convert(Object obj) {
        StringBuilder sb = new StringBuilder();
        Converter<Object> converter = this.headTokenConverter;
        while (true) {
            Converter<Object> converter2 = converter;
            if (converter2 == null) {
                return sb.toString();
            }
            sb.append(converter2.convert(obj));
            converter = converter2.getNext();
        }
    }

    public String convertInt(int i) {
        return convert(Integer.valueOf(i));
    }

    public void setPattern(String str) {
        if (str != null) {
            this.pattern = str.trim();
        }
    }

    public String getPattern() {
        return this.pattern;
    }

    public String toRegexForFixedDate(Date date) {
        StringBuilder sb = new StringBuilder();
        Converter<Object> converter = this.headTokenConverter;
        while (true) {
            Converter<Object> converter2 = converter;
            if (converter2 == null) {
                return sb.toString();
            }
            if (converter2 instanceof LiteralConverter) {
                sb.append(converter2.convert(null));
            } else if (converter2 instanceof IntegerTokenConverter) {
                sb.append("(\\d{1,3})");
            } else if (converter2 instanceof DateTokenConverter) {
                sb.append(converter2.convert(date));
            }
            converter = converter2.getNext();
        }
    }

    public String toRegex() {
        StringBuilder sb = new StringBuilder();
        Converter<Object> converter = this.headTokenConverter;
        while (true) {
            Converter<Object> converter2 = converter;
            if (converter2 == null) {
                return sb.toString();
            }
            if (converter2 instanceof LiteralConverter) {
                sb.append(converter2.convert(null));
            } else if (converter2 instanceof IntegerTokenConverter) {
                sb.append("\\d{1,2}");
            } else if (converter2 instanceof DateTokenConverter) {
                sb.append(((DateTokenConverter) converter2).toRegex());
            }
            converter = converter2.getNext();
        }
    }

    static {
        CONVERTER_MAP.put(IntegerTokenConverter.CONVERTER_KEY, IntegerTokenConverter.class.getName());
        CONVERTER_MAP.put(DateTokenConverter.CONVERTER_KEY, DateTokenConverter.class.getName());
    }
}

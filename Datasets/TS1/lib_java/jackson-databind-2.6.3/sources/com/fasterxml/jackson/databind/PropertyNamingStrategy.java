package com.fasterxml.jackson.databind;

import com.fasterxml.jackson.databind.cfg.MapperConfig;
import com.fasterxml.jackson.databind.introspect.AnnotatedField;
import com.fasterxml.jackson.databind.introspect.AnnotatedMethod;
import com.fasterxml.jackson.databind.introspect.AnnotatedParameter;
import java.io.Serializable;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/PropertyNamingStrategy.class */
public abstract class PropertyNamingStrategy implements Serializable {
    public static final PropertyNamingStrategy CAMEL_CASE_TO_LOWER_CASE_WITH_UNDERSCORES = new LowerCaseWithUnderscoresStrategy();
    public static final PropertyNamingStrategy PASCAL_CASE_TO_CAMEL_CASE = new PascalCaseStrategy();
    public static final PropertyNamingStrategy LOWER_CASE = new LowerCaseStrategy();

    public String nameForField(MapperConfig<?> config, AnnotatedField field, String defaultName) {
        return defaultName;
    }

    public String nameForGetterMethod(MapperConfig<?> config, AnnotatedMethod method, String defaultName) {
        return defaultName;
    }

    public String nameForSetterMethod(MapperConfig<?> config, AnnotatedMethod method, String defaultName) {
        return defaultName;
    }

    public String nameForConstructorParameter(MapperConfig<?> config, AnnotatedParameter ctorParam, String defaultName) {
        return defaultName;
    }

    /* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/PropertyNamingStrategy$PropertyNamingStrategyBase.class */
    public static abstract class PropertyNamingStrategyBase extends PropertyNamingStrategy {
        public abstract String translate(String str);

        @Override // com.fasterxml.jackson.databind.PropertyNamingStrategy
        public String nameForField(MapperConfig<?> config, AnnotatedField field, String defaultName) {
            return translate(defaultName);
        }

        @Override // com.fasterxml.jackson.databind.PropertyNamingStrategy
        public String nameForGetterMethod(MapperConfig<?> config, AnnotatedMethod method, String defaultName) {
            return translate(defaultName);
        }

        @Override // com.fasterxml.jackson.databind.PropertyNamingStrategy
        public String nameForSetterMethod(MapperConfig<?> config, AnnotatedMethod method, String defaultName) {
            return translate(defaultName);
        }

        @Override // com.fasterxml.jackson.databind.PropertyNamingStrategy
        public String nameForConstructorParameter(MapperConfig<?> config, AnnotatedParameter ctorParam, String defaultName) {
            return translate(defaultName);
        }
    }

    /* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/PropertyNamingStrategy$LowerCaseWithUnderscoresStrategy.class */
    public static class LowerCaseWithUnderscoresStrategy extends PropertyNamingStrategyBase {
        @Override // com.fasterxml.jackson.databind.PropertyNamingStrategy.PropertyNamingStrategyBase
        public String translate(String input) {
            if (input == null) {
                return input;
            }
            int length = input.length();
            StringBuilder result = new StringBuilder(length * 2);
            int resultLength = 0;
            boolean wasPrevTranslated = false;
            for (int i = 0; i < length; i++) {
                char c = input.charAt(i);
                if (i > 0 || c != '_') {
                    if (Character.isUpperCase(c)) {
                        if (!wasPrevTranslated && resultLength > 0 && result.charAt(resultLength - 1) != '_') {
                            result.append('_');
                            resultLength++;
                        }
                        c = Character.toLowerCase(c);
                        wasPrevTranslated = true;
                    } else {
                        wasPrevTranslated = false;
                    }
                    result.append(c);
                    resultLength++;
                }
            }
            return resultLength > 0 ? result.toString() : input;
        }
    }

    /* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/PropertyNamingStrategy$PascalCaseStrategy.class */
    public static class PascalCaseStrategy extends PropertyNamingStrategyBase {
        @Override // com.fasterxml.jackson.databind.PropertyNamingStrategy.PropertyNamingStrategyBase
        public String translate(String input) {
            if (input == null || input.length() == 0) {
                return input;
            }
            char c = input.charAt(0);
            char uc = Character.toUpperCase(c);
            if (c == uc) {
                return input;
            }
            StringBuilder sb = new StringBuilder(input);
            sb.setCharAt(0, uc);
            return sb.toString();
        }
    }

    /* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/PropertyNamingStrategy$LowerCaseStrategy.class */
    public static class LowerCaseStrategy extends PropertyNamingStrategyBase {
        @Override // com.fasterxml.jackson.databind.PropertyNamingStrategy.PropertyNamingStrategyBase
        public String translate(String input) {
            return input.toLowerCase();
        }
    }
}

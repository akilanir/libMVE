package ch.qos.logback.core.pattern.parser;

import ch.qos.logback.core.pattern.CompositeConverter;
import ch.qos.logback.core.pattern.Converter;
import ch.qos.logback.core.pattern.DynamicConverter;
import ch.qos.logback.core.pattern.LiteralConverter;
import ch.qos.logback.core.spi.ContextAwareBase;
import ch.qos.logback.core.status.ErrorStatus;
import ch.qos.logback.core.util.OptionHelper;
import java.util.Map;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/parser/Compiler.class */
class Compiler<E> extends ContextAwareBase {
    Converter<E> head;
    Converter<E> tail;
    final Node top;
    final Map converterMap;

    Compiler(Node node, Map map) {
        this.top = node;
        this.converterMap = map;
    }

    Converter<E> compile() {
        this.tail = null;
        this.head = null;
        Node node = this.top;
        while (true) {
            Node node2 = node;
            if (node2 == null) {
                return this.head;
            }
            switch (node2.type) {
                case 0:
                    addToList(new LiteralConverter((String) node2.getValue()));
                    break;
                case 1:
                    SimpleKeywordNode simpleKeywordNode = (SimpleKeywordNode) node2;
                    DynamicConverter<E> createConverter = createConverter(simpleKeywordNode);
                    if (createConverter == null) {
                        LiteralConverter literalConverter = new LiteralConverter("%PARSER_ERROR[" + simpleKeywordNode.getValue() + "]");
                        addStatus(new ErrorStatus("[" + simpleKeywordNode.getValue() + "] is not a valid conversion word", this));
                        addToList(literalConverter);
                        break;
                    } else {
                        createConverter.setFormattingInfo(simpleKeywordNode.getFormatInfo());
                        createConverter.setOptionList(simpleKeywordNode.getOptions());
                        addToList(createConverter);
                        break;
                    }
                case 2:
                    CompositeNode compositeNode = (CompositeNode) node2;
                    CompositeConverter<E> createCompositeConverter = createCompositeConverter(compositeNode);
                    if (createCompositeConverter != null) {
                        createCompositeConverter.setFormattingInfo(compositeNode.getFormatInfo());
                        createCompositeConverter.setOptionList(compositeNode.getOptions());
                        Compiler compiler = new Compiler(compositeNode.getChildNode(), this.converterMap);
                        compiler.setContext(this.context);
                        createCompositeConverter.setChildConverter(compiler.compile());
                        addToList(createCompositeConverter);
                        break;
                    } else {
                        addError("Failed to create converter for [%" + compositeNode.getValue() + "] keyword");
                        addToList(new LiteralConverter("%PARSER_ERROR[" + compositeNode.getValue() + "]"));
                        break;
                    }
            }
            node = node2.next;
        }
    }

    private void addToList(Converter<E> converter) {
        if (this.head == null) {
            this.tail = converter;
            this.head = converter;
        } else {
            this.tail.setNext(converter);
            this.tail = converter;
        }
    }

    DynamicConverter<E> createConverter(SimpleKeywordNode simpleKeywordNode) {
        String str = (String) simpleKeywordNode.getValue();
        String str2 = (String) this.converterMap.get(str);
        if (str2 == null) {
            addError("There is no conversion class registered for conversion word [" + str + "]");
            return null;
        }
        try {
            return (DynamicConverter) OptionHelper.instantiateByClassName(str2, (Class<?>) DynamicConverter.class, this.context);
        } catch (Exception e) {
            addError("Failed to instantiate converter class [" + str2 + "] for keyword [" + str + "]", e);
            return null;
        }
    }

    CompositeConverter<E> createCompositeConverter(CompositeNode compositeNode) {
        String str = (String) compositeNode.getValue();
        String str2 = (String) this.converterMap.get(str);
        if (str2 == null) {
            addError("There is no conversion class registered for composite conversion word [" + str + "]");
            return null;
        }
        try {
            return (CompositeConverter) OptionHelper.instantiateByClassName(str2, (Class<?>) CompositeConverter.class, this.context);
        } catch (Exception e) {
            addError("Failed to instantiate converter class [" + str2 + "] as a composite converter for keyword [" + str + "]", e);
            return null;
        }
    }
}

package com.alibaba.fastjson.parser;

@Deprecated
/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/parser/DefaultExtJSONParser.class */
public class DefaultExtJSONParser extends DefaultJSONParser {
    public DefaultExtJSONParser(String input) {
        this(input, ParserConfig.getGlobalInstance());
    }

    public DefaultExtJSONParser(String input, ParserConfig mapping) {
        super(input, mapping);
    }

    public DefaultExtJSONParser(String input, ParserConfig mapping, int features) {
        super(input, mapping, features);
    }

    public DefaultExtJSONParser(char[] input, int length, ParserConfig mapping, int features) {
        super(input, length, mapping, features);
    }
}

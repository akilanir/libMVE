package com.alibaba.fastjson.serializer;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/PascalNameFilter.class */
public class PascalNameFilter implements NameFilter {
    @Override // com.alibaba.fastjson.serializer.NameFilter
    public String process(Object source, String name, Object value) {
        if (name == null || name.length() == 0) {
            return name;
        }
        char[] chars = name.toCharArray();
        chars[0] = Character.toUpperCase(chars[0]);
        String pascalName = new String(chars);
        return pascalName;
    }
}

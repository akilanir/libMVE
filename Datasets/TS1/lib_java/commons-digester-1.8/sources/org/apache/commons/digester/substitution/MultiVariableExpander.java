package org.apache.commons.digester.substitution;

import java.util.ArrayList;
import java.util.Map;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/substitution/MultiVariableExpander.class */
public class MultiVariableExpander implements VariableExpander {
    private int nEntries = 0;
    private ArrayList markers = new ArrayList(2);
    private ArrayList sources = new ArrayList(2);

    public void addSource(String marker, Map source) {
        this.nEntries++;
        this.markers.add(marker);
        this.sources.add(source);
    }

    @Override // org.apache.commons.digester.substitution.VariableExpander
    public String expand(String param) {
        for (int i = 0; i < this.nEntries; i++) {
            param = expand(param, (String) this.markers.get(i), (Map) this.sources.get(i));
        }
        return param;
    }

    public String expand(String str, String marker, Map source) {
        String startMark = new StringBuffer().append(marker).append("{").toString();
        int markLen = startMark.length();
        int index = 0;
        while (true) {
            int index2 = str.indexOf(startMark, index);
            if (index2 == -1) {
                return str;
            }
            int startIndex = index2 + markLen;
            if (startIndex > str.length()) {
                throw new IllegalArgumentException("var expression starts at end of string");
            }
            int endIndex = str.indexOf("}", index2 + markLen);
            if (endIndex == -1) {
                throw new IllegalArgumentException("var expression starts but does not end");
            }
            String key = str.substring(index2 + markLen, endIndex);
            Object value = source.get(key);
            if (value == null) {
                throw new IllegalArgumentException(new StringBuffer().append("parameter [").append(key).append("] is not defined.").toString());
            }
            String varValue = value.toString();
            str = new StringBuffer().append(str.substring(0, index2)).append(varValue).append(str.substring(endIndex + 1)).toString();
            index = index2 + varValue.length();
        }
    }
}

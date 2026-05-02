package freemarker.core;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/MiscUtil.class */
class MiscUtil {
    static final String C_FALSE = "false";
    static final String C_TRUE = "true";

    private MiscUtil() {
    }

    static List sortMapOfExpressions(Map map) {
        ArrayList res = new ArrayList(map.entrySet());
        Collections.sort(res, new Comparator() { // from class: freemarker.core.MiscUtil.1
            @Override // java.util.Comparator
            public int compare(Object o1, Object o2) {
                Map.Entry ent1 = (Map.Entry) o1;
                Expression exp1 = (Expression) ent1.getValue();
                Map.Entry ent2 = (Map.Entry) o2;
                Expression exp2 = (Expression) ent2.getValue();
                int res2 = exp1.beginLine - exp2.beginLine;
                if (res2 != 0) {
                    return res2;
                }
                int res3 = exp1.beginColumn - exp2.beginColumn;
                if (res3 != 0) {
                    return res3;
                }
                if (ent1 == ent2) {
                    return 0;
                }
                return ((String) ent1.getKey()).compareTo((String) ent1.getKey());
            }
        });
        return res;
    }
}

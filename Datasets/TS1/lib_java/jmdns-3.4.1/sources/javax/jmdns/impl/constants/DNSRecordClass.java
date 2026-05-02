package javax.jmdns.impl.constants;

import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/constants/DNSRecordClass.class */
public enum DNSRecordClass {
    CLASS_UNKNOWN("?", 0),
    CLASS_IN("in", 1),
    CLASS_CS("cs", 2),
    CLASS_CH("ch", 3),
    CLASS_HS("hs", 4),
    CLASS_NONE("none", 254),
    CLASS_ANY("any", 255);

    private static Logger logger = Logger.getLogger(DNSRecordClass.class.getName());
    public static final int CLASS_MASK = 32767;
    public static final int CLASS_UNIQUE = 32768;
    public static final boolean UNIQUE = true;
    public static final boolean NOT_UNIQUE = false;
    private final String _externalName;
    private final int _index;

    DNSRecordClass(String name, int index) {
        this._externalName = name;
        this._index = index;
    }

    public String externalName() {
        return this._externalName;
    }

    public int indexValue() {
        return this._index;
    }

    public boolean isUnique(int index) {
        return (this == CLASS_UNKNOWN || (index & 32768) == 0) ? false : true;
    }

    public static DNSRecordClass classForName(String name) {
        if (name != null) {
            String aName = name.toLowerCase();
            DNSRecordClass[] arr$ = values();
            for (DNSRecordClass aClass : arr$) {
                if (aClass._externalName.equals(aName)) {
                    return aClass;
                }
            }
        }
        logger.log(Level.WARNING, "Could not find record class for name: " + name);
        return CLASS_UNKNOWN;
    }

    public static DNSRecordClass classForIndex(int index) {
        int maskedIndex = index & CLASS_MASK;
        DNSRecordClass[] arr$ = values();
        for (DNSRecordClass aClass : arr$) {
            if (aClass._index == maskedIndex) {
                return aClass;
            }
        }
        logger.log(Level.WARNING, "Could not find record class for index: " + index);
        return CLASS_UNKNOWN;
    }

    @Override // java.lang.Enum
    public String toString() {
        return name() + " index " + indexValue();
    }
}

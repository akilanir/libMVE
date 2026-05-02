package ezvcard;

import ezvcard.util.CaseClasses;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.EnumSet;
import java.util.Set;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/VCardDataType.class */
public class VCardDataType {
    private static final CaseClasses<VCardDataType, String> enums = new CaseClasses<VCardDataType, String>(VCardDataType.class) { // from class: ezvcard.VCardDataType.1
        /* JADX INFO: Access modifiers changed from: protected */
        @Override // ezvcard.util.CaseClasses
        public VCardDataType create(String value) {
            return new VCardDataType(value, new VCardVersion[0]);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // ezvcard.util.CaseClasses
        public boolean matches(VCardDataType dataType, String value) {
            return dataType.name.equalsIgnoreCase(value);
        }
    };
    public static final VCardDataType URL = new VCardDataType("url", VCardVersion.V2_1);
    public static final VCardDataType CONTENT_ID = new VCardDataType("content-id", VCardVersion.V2_1);
    public static final VCardDataType BINARY = new VCardDataType("binary", VCardVersion.V3_0);
    public static final VCardDataType URI = new VCardDataType("uri", VCardVersion.V3_0, VCardVersion.V4_0);
    public static final VCardDataType TEXT = new VCardDataType("text", new VCardVersion[0]);
    public static final VCardDataType DATE = new VCardDataType("date", VCardVersion.V3_0, VCardVersion.V4_0);
    public static final VCardDataType TIME = new VCardDataType("time", VCardVersion.V3_0, VCardVersion.V4_0);
    public static final VCardDataType DATE_TIME = new VCardDataType("date-time", VCardVersion.V3_0, VCardVersion.V4_0);
    public static final VCardDataType DATE_AND_OR_TIME = new VCardDataType("date-and-or-time", VCardVersion.V4_0);
    public static final VCardDataType TIMESTAMP = new VCardDataType("timestamp", VCardVersion.V4_0);
    public static final VCardDataType BOOLEAN = new VCardDataType("boolean", VCardVersion.V4_0);
    public static final VCardDataType INTEGER = new VCardDataType("integer", VCardVersion.V4_0);
    public static final VCardDataType FLOAT = new VCardDataType("float", VCardVersion.V4_0);
    public static final VCardDataType UTC_OFFSET = new VCardDataType("utc-offset", VCardVersion.V4_0);
    public static final VCardDataType LANGUAGE_TAG = new VCardDataType("language-tag", VCardVersion.V4_0);
    private final String name;
    private final Set<VCardVersion> supportedVersions;

    private VCardDataType(String name, VCardVersion... supportedVersions) {
        this.name = name;
        Set<VCardVersion> set = EnumSet.copyOf((Collection) Arrays.asList(supportedVersions.length == 0 ? VCardVersion.values() : supportedVersions));
        this.supportedVersions = Collections.unmodifiableSet(set);
    }

    public String getName() {
        return this.name;
    }

    public boolean isSupported(VCardVersion version) {
        return this.supportedVersions.contains(version);
    }

    public String toString() {
        return this.name;
    }

    public static VCardDataType find(String dataType) {
        return enums.find(dataType);
    }

    public static VCardDataType get(String dataType) {
        return enums.get(dataType);
    }

    public static Collection<VCardDataType> all() {
        return enums.all();
    }
}

package ezvcard.parameter;

import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.Warning;
import ezvcard.util.GeoUri;
import ezvcard.util.ListMultimap;
import java.nio.charset.Charset;
import java.nio.charset.IllegalCharsetNameException;
import java.nio.charset.UnsupportedCharsetException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/parameter/VCardParameters.class */
public class VCardParameters extends ListMultimap<String, String> {
    public static final String ALTID = "ALTID";
    public static final String CALSCALE = "CALSCALE";
    public static final String CHARSET = "CHARSET";
    public static final String ENCODING = "ENCODING";
    public static final String GEO = "GEO";
    public static final String INDEX = "INDEX";
    public static final String LABEL = "LABEL";
    public static final String LANGUAGE = "LANGUAGE";
    public static final String LEVEL = "LEVEL";
    public static final String MEDIATYPE = "MEDIATYPE";
    public static final String PID = "PID";
    public static final String PREF = "PREF";
    public static final String SORT_AS = "SORT-AS";
    public static final String TYPE = "TYPE";
    public static final String TZ = "TZ";
    public static final String VALUE = "VALUE";
    private static final Map<String, Set<VCardVersion>> supportedVersions;

    static {
        Map<String, Set<VCardVersion>> m = new HashMap<>();
        m.put(ALTID, EnumSet.of(VCardVersion.V4_0));
        m.put(CALSCALE, EnumSet.of(VCardVersion.V4_0));
        m.put(CHARSET, EnumSet.of(VCardVersion.V2_1));
        m.put(GEO, EnumSet.of(VCardVersion.V4_0));
        m.put(INDEX, EnumSet.of(VCardVersion.V4_0));
        m.put(LEVEL, EnumSet.of(VCardVersion.V4_0));
        m.put(MEDIATYPE, EnumSet.of(VCardVersion.V4_0));
        m.put(PID, EnumSet.of(VCardVersion.V4_0));
        m.put(SORT_AS, EnumSet.of(VCardVersion.V4_0));
        m.put(TZ, EnumSet.of(VCardVersion.V4_0));
        supportedVersions = Collections.unmodifiableMap(m);
    }

    public VCardParameters() {
    }

    public VCardParameters(VCardParameters orig) {
        super(orig);
    }

    public Encoding getEncoding() {
        String value = first(ENCODING);
        if (value == null) {
            return null;
        }
        return Encoding.get(value);
    }

    public void setEncoding(Encoding encoding) {
        replace((VCardParameters) ENCODING, encoding == null ? null : encoding.getValue());
    }

    public VCardDataType getValue() {
        String value = first(VALUE);
        if (value == null) {
            return null;
        }
        return VCardDataType.get(value);
    }

    public void setValue(VCardDataType value) {
        replace((VCardParameters) VALUE, value == null ? null : value.getName());
    }

    public void removeValue() {
        removeAll(VALUE);
    }

    public String getCharset() {
        return first(CHARSET);
    }

    public void setCharset(String charset) {
        replace((VCardParameters) CHARSET, charset);
    }

    public String getLanguage() {
        return first(LANGUAGE);
    }

    public void setLanguage(String language) {
        replace((VCardParameters) LANGUAGE, language);
    }

    public String getLabel() {
        return first(LABEL);
    }

    public void setLabel(String label) {
        replace((VCardParameters) LABEL, label);
    }

    public String getTimezone() {
        return first(TZ);
    }

    public void setTimezone(String tz) {
        replace((VCardParameters) TZ, tz);
    }

    public Set<String> getTypes() {
        return new HashSet(get(TYPE));
    }

    public void addType(String type) {
        put(TYPE, type);
    }

    public String getType() {
        Set<String> types = getTypes();
        if (types.isEmpty()) {
            return null;
        }
        return types.iterator().next();
    }

    public void setType(String type) {
        replace((VCardParameters) TYPE, type);
    }

    public void removeType(String type) {
        remove(TYPE, type);
    }

    public void removeTypes() {
        removeAll(TYPE);
    }

    public Integer getPref() {
        String pref = first(PREF);
        if (pref == null) {
            return null;
        }
        try {
            return Integer.valueOf(pref);
        } catch (NumberFormatException e) {
            throw new IllegalStateException("PREF parameter value is malformed and could not be parsed. Retrieve its raw text value instead.", e);
        }
    }

    public void setPref(Integer pref) {
        if (pref != null && (pref.intValue() < 1 || pref.intValue() > 100)) {
            throw new IllegalArgumentException("Preference value must be between 1 and 100 inclusive.");
        }
        String value = pref == null ? null : pref.toString();
        replace((VCardParameters) PREF, value);
    }

    public String getAltId() {
        return first(ALTID);
    }

    public void setAltId(String altId) {
        replace((VCardParameters) ALTID, altId);
    }

    public double[] getGeo() {
        String value = first(GEO);
        if (value == null) {
            return null;
        }
        try {
            GeoUri geoUri = GeoUri.parse(value);
            return new double[]{geoUri.getCoordA().doubleValue(), geoUri.getCoordB().doubleValue()};
        } catch (IllegalArgumentException e) {
            throw new IllegalStateException("GEO parameter value is malformed and could not be parsed. Retrieve its raw text value instead.", e);
        }
    }

    public void setGeo(double latitude, double longitude) {
        GeoUri geoUri = new GeoUri.Builder(Double.valueOf(latitude), Double.valueOf(longitude)).build();
        replace((VCardParameters) GEO, geoUri.toString());
    }

    public List<String> getSortAs() {
        return get(SORT_AS);
    }

    public void setSortAs(String... names) {
        removeAll(SORT_AS);
        if (names != null && names.length > 0) {
            for (String name : names) {
                put(SORT_AS, name);
            }
        }
    }

    public Calscale getCalscale() {
        String value = first(CALSCALE);
        if (value == null) {
            return null;
        }
        return Calscale.get(value);
    }

    public void setCalscale(Calscale value) {
        replace((VCardParameters) CALSCALE, value == null ? null : value.getValue());
    }

    public List<Integer[]> getPids() {
        List<String> values = get(PID);
        List<Integer[]> pids = new ArrayList<>(values.size());
        for (String value : values) {
            String[] split = value.split("\\.");
            try {
                Integer localId = Integer.valueOf(split[0]);
                Integer clientPidMapRef = split.length > 1 ? Integer.valueOf(split[1]) : null;
                pids.add(new Integer[]{localId, clientPidMapRef});
            } catch (NumberFormatException e) {
                throw new IllegalStateException("PID parameter value is malformed and could not be parsed. Retrieve its raw text value instead.", e);
            }
        }
        return pids;
    }

    public void addPid(int localId) {
        put(PID, localId + "");
    }

    public void addPid(int localId, int clientPidMapRef) {
        put(PID, localId + "." + clientPidMapRef);
    }

    public void removePids() {
        removeAll(PID);
    }

    public String getMediaType() {
        return first(MEDIATYPE);
    }

    public void setMediaType(String mediaType) {
        replace((VCardParameters) MEDIATYPE, mediaType);
    }

    public String getLevel() {
        return first(LEVEL);
    }

    public void setLevel(String level) {
        replace((VCardParameters) LEVEL, level);
    }

    public Integer getIndex() {
        String index = first(INDEX);
        if (index == null) {
            return null;
        }
        try {
            return Integer.valueOf(index);
        } catch (NumberFormatException e) {
            throw new IllegalStateException("INDEX parameter value is malformed and could not be parsed. Retrieve its raw text value instead.", e);
        }
    }

    public void setIndex(Integer index) {
        if (index != null && index.intValue() <= 0) {
            throw new IllegalArgumentException("Index value must be greater than 0.");
        }
        String value = index == null ? null : index.toString();
        replace((VCardParameters) INDEX, value);
    }

    public List<Warning> validate(VCardVersion version) {
        List<Warning> warnings = new ArrayList<>(0);
        String value = first(CALSCALE);
        if (value != null && Calscale.find(value) == null) {
            warnings.add(new Warning(3, CALSCALE, value, Calscale.all()));
        }
        String value2 = first(ENCODING);
        if (value2 != null) {
            Encoding encoding = Encoding.find(value2);
            if (encoding == null) {
                warnings.add(new Warning(3, ENCODING, value2, Encoding.all()));
            } else if (!encoding.isSupported(version)) {
                warnings.add(new Warning(4, ENCODING, value2));
            }
        }
        String value3 = first(VALUE);
        if (value3 != null) {
            VCardDataType dataType = VCardDataType.find(value3);
            if (dataType == null) {
                warnings.add(new Warning(3, VALUE, value3, VCardDataType.all()));
            } else if (!dataType.isSupported(version)) {
                warnings.add(new Warning(4, VALUE, value3));
            }
        }
        try {
            getGeo();
        } catch (IllegalStateException e) {
            warnings.add(new Warning(5, GEO, first(GEO)));
        }
        try {
            getIndex();
        } catch (IllegalStateException e2) {
            warnings.add(new Warning(5, INDEX, first(INDEX)));
        }
        try {
            getPids();
        } catch (IllegalStateException e3) {
            warnings.add(new Warning(5, PID, first(PID)));
        }
        try {
            getPref();
        } catch (IllegalStateException e4) {
            warnings.add(new Warning(5, PREF, first(PREF)));
        }
        for (Map.Entry<String, Set<VCardVersion>> entry : supportedVersions.entrySet()) {
            String name = entry.getKey();
            if (first(name) != null) {
                Set<VCardVersion> versions = entry.getValue();
                if (!versions.contains(version)) {
                    warnings.add(new Warning(6, name));
                }
            }
        }
        String charsetStr = getCharset();
        if (charsetStr != null) {
            try {
                Charset.forName(charsetStr);
            } catch (IllegalCharsetNameException e5) {
                warnings.add(new Warning(22, charsetStr));
            } catch (UnsupportedCharsetException e6) {
                warnings.add(new Warning(22, charsetStr));
            }
        }
        return warnings;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.util.ListMultimap
    public String sanitizeKey(String key) {
        if (key == null) {
            return null;
        }
        return key.toUpperCase();
    }
}

package com.drew.metadata;

import com.drew.lang.Rational;
import com.drew.lang.StringUtil;
import com.drew.lang.annotations.NotNull;
import com.drew.lang.annotations.Nullable;
import com.drew.metadata.Directory;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/* loaded from: metadata-extractor-2.9.1.jar:com/drew/metadata/TagDescriptor.class */
public class TagDescriptor<T extends Directory> {

    @NotNull
    protected final T _directory;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !TagDescriptor.class.desiredAssertionStatus();
    }

    public TagDescriptor(@NotNull T directory) {
        this._directory = directory;
    }

    @Nullable
    public String getDescription(int tagType) {
        int length;
        Object object = this._directory.getObject(tagType);
        if (object == null) {
            return null;
        }
        if (object.getClass().isArray() && (length = Array.getLength(object)) > 16) {
            Object[] objArr = new Object[2];
            objArr[0] = Integer.valueOf(length);
            objArr[1] = length == 1 ? "value" : "values";
            return String.format("[%d %s]", objArr);
        }
        if (object instanceof Date) {
            return new SimpleDateFormat("EEE MMM dd HH:mm:ss Z yyyy").format((Date) object).replaceAll("([0-9]{2} [^ ]+)$", ":$1");
        }
        return this._directory.getString(tagType);
    }

    @Nullable
    public static String convertBytesToVersionString(@Nullable int[] components, int majorDigits) {
        if (components == null) {
            return null;
        }
        StringBuilder version = new StringBuilder();
        for (int i = 0; i < 4 && i < components.length; i++) {
            if (i == majorDigits) {
                version.append('.');
            }
            char c = (char) components[i];
            if (c < '0') {
                c = (char) (c + '0');
            }
            if (i != 0 || c != '0') {
                version.append(c);
            }
        }
        return version.toString();
    }

    @Nullable
    protected String getVersionBytesDescription(int tagType, int majorDigits) {
        int[] values = this._directory.getIntArray(tagType);
        if (values == null) {
            return null;
        }
        return convertBytesToVersionString(values, majorDigits);
    }

    @Nullable
    protected String getIndexedDescription(int tagType, @NotNull String... descriptions) {
        return getIndexedDescription(tagType, 0, descriptions);
    }

    @Nullable
    protected String getIndexedDescription(int tagType, int baseIndex, @NotNull String... descriptions) {
        String description;
        Integer index = this._directory.getInteger(tagType);
        if (index == null) {
            return null;
        }
        int arrayIndex = index.intValue() - baseIndex;
        if (arrayIndex >= 0 && arrayIndex < descriptions.length && (description = descriptions[arrayIndex]) != null) {
            return description;
        }
        return "Unknown (" + index + ")";
    }

    @Nullable
    protected String getByteLengthDescription(int tagType) {
        byte[] bytes = this._directory.getByteArray(tagType);
        if (bytes == null) {
            return null;
        }
        Object[] objArr = new Object[2];
        objArr[0] = Integer.valueOf(bytes.length);
        objArr[1] = bytes.length == 1 ? "" : "s";
        return String.format("(%d byte%s)", objArr);
    }

    @Nullable
    protected String getSimpleRational(int tagType) {
        Rational value = this._directory.getRational(tagType);
        if (value == null) {
            return null;
        }
        return value.toSimpleString(true);
    }

    @Nullable
    protected String getDecimalRational(int tagType, int decimalPlaces) {
        Rational value = this._directory.getRational(tagType);
        if (value == null) {
            return null;
        }
        return String.format("%." + decimalPlaces + "f", Double.valueOf(value.doubleValue()));
    }

    @Nullable
    protected String getFormattedInt(int tagType, @NotNull String format) {
        Integer value = this._directory.getInteger(tagType);
        if (value == null) {
            return null;
        }
        return String.format(format, value);
    }

    @Nullable
    protected String getFormattedFloat(int tagType, @NotNull String format) {
        Float value = this._directory.getFloatObject(tagType);
        if (value == null) {
            return null;
        }
        return String.format(format, value);
    }

    @Nullable
    protected String getFormattedString(int tagType, @NotNull String format) {
        String value = this._directory.getString(tagType);
        if (value == null) {
            return null;
        }
        return String.format(format, value);
    }

    @Nullable
    protected String getEpochTimeDescription(int tagType) {
        Long value = this._directory.getLongObject(tagType);
        if (value == null) {
            return null;
        }
        return new Date(value.longValue()).toString();
    }

    @Nullable
    protected String getBitFlagDescription(int tagType, @NotNull Object... labels) {
        Integer value = this._directory.getInteger(tagType);
        if (value == null) {
            return null;
        }
        List<String> parts = new ArrayList<>();
        for (int bitIndex = 0; labels.length > bitIndex; bitIndex++) {
            Object labelObj = labels[bitIndex];
            if (labelObj != null) {
                boolean isBitSet = (value.intValue() & 1) == 1;
                if (labelObj instanceof String[]) {
                    String[] labelPair = (String[]) labelObj;
                    if (!$assertionsDisabled && labelPair.length != 2) {
                        throw new AssertionError();
                    }
                    parts.add(labelPair[isBitSet ? (char) 1 : (char) 0]);
                } else if (isBitSet && (labelObj instanceof String)) {
                    parts.add((String) labelObj);
                }
            }
            value = Integer.valueOf(value.intValue() >> 1);
        }
        return StringUtil.join(parts, ", ");
    }

    @Nullable
    protected String get7BitStringFromBytes(int tagType) {
        byte[] bytes = this._directory.getByteArray(tagType);
        if (bytes == null) {
            return null;
        }
        int length = bytes.length;
        for (int index = 0; index < bytes.length; index++) {
            int i = bytes[index] & 255;
            if (i == 0 || i > 127) {
                length = index;
                break;
            }
        }
        return new String(bytes, 0, length);
    }

    @Nullable
    protected String getAsciiStringFromBytes(int tag) {
        byte[] values = this._directory.getByteArray(tag);
        if (values == null) {
            return null;
        }
        try {
            return new String(values, "ASCII").trim();
        } catch (UnsupportedEncodingException e) {
            return null;
        }
    }

    @Nullable
    protected String getRationalOrDoubleString(int tagType) {
        Rational rational = this._directory.getRational(tagType);
        if (rational != null) {
            return rational.toSimpleString(true);
        }
        Double d = this._directory.getDoubleObject(tagType);
        if (d != null) {
            DecimalFormat format = new DecimalFormat("0.###");
            return format.format(d);
        }
        return null;
    }

    @Nullable
    protected static String getFStopDescription(double fStop) {
        DecimalFormat format = new DecimalFormat("0.0");
        format.setRoundingMode(RoundingMode.HALF_UP);
        return "f/" + format.format(fStop);
    }

    @Nullable
    protected static String getFocalLengthDescription(double mm) {
        DecimalFormat format = new DecimalFormat("0.#");
        format.setRoundingMode(RoundingMode.HALF_UP);
        return format.format(mm) + " mm";
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Nullable
    protected String getLensSpecificationDescription(int tag) {
        Rational[] rationalArray = this._directory.getRationalArray(tag);
        if (rationalArray == 0 || rationalArray.length != 4) {
            return null;
        }
        if (rationalArray[0].doubleValue() == 0.0d && rationalArray[2].doubleValue() == 0.0d) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        if (rationalArray[0].equals(rationalArray[1])) {
            sb.append(rationalArray[0].toSimpleString(true)).append("mm");
        } else {
            sb.append(rationalArray[0].toSimpleString(true)).append('-').append(rationalArray[1].toSimpleString(true)).append("mm");
        }
        if (rationalArray[2].doubleValue() != 0.0d) {
            sb.append(' ');
            DecimalFormat format = new DecimalFormat("0.0");
            format.setRoundingMode(RoundingMode.HALF_UP);
            if (rationalArray[2].equals(rationalArray[3])) {
                sb.append(getFStopDescription(rationalArray[2].doubleValue()));
            } else {
                sb.append("f/").append(format.format(rationalArray[2].doubleValue())).append('-').append(format.format(rationalArray[3].doubleValue()));
            }
        }
        return sb.toString();
    }
}

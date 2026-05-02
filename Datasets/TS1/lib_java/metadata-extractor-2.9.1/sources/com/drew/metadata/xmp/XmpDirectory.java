package com.drew.metadata.xmp;

import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPIterator;
import com.adobe.xmp.XMPMeta;
import com.adobe.xmp.impl.XMPDateTimeImpl;
import com.adobe.xmp.impl.XMPMetaImpl;
import com.adobe.xmp.options.PropertyOptions;
import com.adobe.xmp.properties.XMPPropertyInfo;
import com.drew.lang.annotations.NotNull;
import com.drew.lang.annotations.Nullable;
import com.drew.metadata.Directory;
import com.drew.metadata.Schema;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.TimeZone;

/* loaded from: metadata-extractor-2.9.1.jar:com/drew/metadata/xmp/XmpDirectory.class */
public class XmpDirectory extends Directory {
    public static final int TAG_XMP_VALUE_COUNT = 65535;
    public static final int TAG_MAKE = 1;
    public static final int TAG_MODEL = 2;
    public static final int TAG_EXPOSURE_TIME = 3;
    public static final int TAG_SHUTTER_SPEED = 4;
    public static final int TAG_F_NUMBER = 5;
    public static final int TAG_LENS_INFO = 6;
    public static final int TAG_LENS = 7;
    public static final int TAG_CAMERA_SERIAL_NUMBER = 8;
    public static final int TAG_FIRMWARE = 9;
    public static final int TAG_FOCAL_LENGTH = 10;
    public static final int TAG_APERTURE_VALUE = 11;
    public static final int TAG_EXPOSURE_PROGRAM = 12;
    public static final int TAG_DATETIME_ORIGINAL = 13;
    public static final int TAG_DATETIME_DIGITIZED = 14;
    public static final int TAG_BASE_URL = 513;
    public static final int TAG_CREATE_DATE = 514;
    public static final int TAG_CREATOR_TOOL = 515;
    public static final int TAG_IDENTIFIER = 516;
    public static final int TAG_METADATA_DATE = 517;
    public static final int TAG_MODIFY_DATE = 518;
    public static final int TAG_NICKNAME = 519;
    public static final int TAG_RATING = 4097;
    public static final int TAG_LABEL = 8192;
    public static int TAG_SUBJECT = 8193;

    @NotNull
    protected static final HashMap<Integer, String> _tagNameMap = new HashMap<>();

    @NotNull
    protected static final HashMap<Integer, String> _tagSchemaMap = new HashMap<>();

    @NotNull
    protected static final HashMap<Integer, String> _tagPropNameMap = new HashMap<>();

    @NotNull
    private final Map<String, String> _propertyValueByPath = new HashMap();

    @Nullable
    private XMPMeta _xmpMeta;

    static {
        _tagNameMap.put(65535, "XMP Value Count");
        _tagNameMap.put(1, "Make");
        _tagNameMap.put(2, "Model");
        _tagNameMap.put(3, "Exposure Time");
        _tagNameMap.put(4, "Shutter Speed Value");
        _tagNameMap.put(5, "F-Number");
        _tagNameMap.put(6, "Lens Information");
        _tagNameMap.put(7, "Lens");
        _tagNameMap.put(8, "Serial Number");
        _tagNameMap.put(9, "Firmware");
        _tagNameMap.put(10, "Focal Length");
        _tagNameMap.put(11, "Aperture Value");
        _tagNameMap.put(12, "Exposure Program");
        _tagNameMap.put(13, "Date/Time Original");
        _tagNameMap.put(14, "Date/Time Digitized");
        _tagNameMap.put(513, "Base URL");
        _tagNameMap.put(514, "Create Date");
        _tagNameMap.put(515, "Creator Tool");
        _tagNameMap.put(516, "Identifier");
        _tagNameMap.put(517, "Metadata Date");
        _tagNameMap.put(518, "Modify Date");
        _tagNameMap.put(519, "Nickname");
        _tagNameMap.put(4097, "Rating");
        _tagNameMap.put(8192, "Label");
        _tagNameMap.put(Integer.valueOf(TAG_SUBJECT), "Subject");
        _tagPropNameMap.put(1, "tiff:Make");
        _tagPropNameMap.put(2, "tiff:Model");
        _tagPropNameMap.put(3, "exif:ExposureTime");
        _tagPropNameMap.put(4, "exif:ShutterSpeedValue");
        _tagPropNameMap.put(5, "exif:FNumber");
        _tagPropNameMap.put(6, "aux:LensInfo");
        _tagPropNameMap.put(7, "aux:Lens");
        _tagPropNameMap.put(8, "aux:SerialNumber");
        _tagPropNameMap.put(9, "aux:Firmware");
        _tagPropNameMap.put(10, "exif:FocalLength");
        _tagPropNameMap.put(11, "exif:ApertureValue");
        _tagPropNameMap.put(12, "exif:ExposureProgram");
        _tagPropNameMap.put(13, "exif:DateTimeOriginal");
        _tagPropNameMap.put(14, "exif:DateTimeDigitized");
        _tagPropNameMap.put(513, "xmp:BaseURL");
        _tagPropNameMap.put(514, "xmp:CreateDate");
        _tagPropNameMap.put(515, "xmp:CreatorTool");
        _tagPropNameMap.put(516, "xmp:Identifier");
        _tagPropNameMap.put(517, "xmp:MetadataDate");
        _tagPropNameMap.put(518, "xmp:ModifyDate");
        _tagPropNameMap.put(519, "xmp:Nickname");
        _tagPropNameMap.put(4097, "xmp:Rating");
        _tagPropNameMap.put(8192, "xmp:Label");
        _tagPropNameMap.put(Integer.valueOf(TAG_SUBJECT), "dc:subject");
        _tagSchemaMap.put(1, Schema.EXIF_TIFF_PROPERTIES);
        _tagSchemaMap.put(2, Schema.EXIF_TIFF_PROPERTIES);
        _tagSchemaMap.put(3, Schema.EXIF_SPECIFIC_PROPERTIES);
        _tagSchemaMap.put(4, Schema.EXIF_SPECIFIC_PROPERTIES);
        _tagSchemaMap.put(5, Schema.EXIF_SPECIFIC_PROPERTIES);
        _tagSchemaMap.put(6, Schema.EXIF_ADDITIONAL_PROPERTIES);
        _tagSchemaMap.put(7, Schema.EXIF_ADDITIONAL_PROPERTIES);
        _tagSchemaMap.put(8, Schema.EXIF_ADDITIONAL_PROPERTIES);
        _tagSchemaMap.put(9, Schema.EXIF_ADDITIONAL_PROPERTIES);
        _tagSchemaMap.put(10, Schema.EXIF_SPECIFIC_PROPERTIES);
        _tagSchemaMap.put(11, Schema.EXIF_SPECIFIC_PROPERTIES);
        _tagSchemaMap.put(12, Schema.EXIF_SPECIFIC_PROPERTIES);
        _tagSchemaMap.put(13, Schema.EXIF_SPECIFIC_PROPERTIES);
        _tagSchemaMap.put(14, Schema.EXIF_SPECIFIC_PROPERTIES);
        _tagSchemaMap.put(513, Schema.XMP_PROPERTIES);
        _tagSchemaMap.put(514, Schema.XMP_PROPERTIES);
        _tagSchemaMap.put(515, Schema.XMP_PROPERTIES);
        _tagSchemaMap.put(516, Schema.XMP_PROPERTIES);
        _tagSchemaMap.put(517, Schema.XMP_PROPERTIES);
        _tagSchemaMap.put(518, Schema.XMP_PROPERTIES);
        _tagSchemaMap.put(519, Schema.XMP_PROPERTIES);
        _tagSchemaMap.put(4097, Schema.XMP_PROPERTIES);
        _tagSchemaMap.put(8192, Schema.XMP_PROPERTIES);
        _tagSchemaMap.put(Integer.valueOf(TAG_SUBJECT), Schema.DUBLIN_CORE_SPECIFIC_PROPERTIES);
    }

    public XmpDirectory() {
        setDescriptor(new XmpDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    @NotNull
    public String getName() {
        return "XMP";
    }

    @Override // com.drew.metadata.Directory
    @NotNull
    protected HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }

    void addProperty(@NotNull String path, @NotNull String value) {
        this._propertyValueByPath.put(path, value);
    }

    @NotNull
    public Map<String, String> getXmpProperties() {
        return Collections.unmodifiableMap(this._propertyValueByPath);
    }

    public void setXMPMeta(@NotNull XMPMeta xmpMeta) {
        this._xmpMeta = xmpMeta;
        try {
            int valueCount = 0;
            XMPIterator it = this._xmpMeta.iterator();
            while (it.hasNext()) {
                XMPPropertyInfo prop = (XMPPropertyInfo) it.next();
                if (prop.getPath() != null) {
                    valueCount++;
                }
            }
            setInt(65535, valueCount);
        } catch (XMPException e) {
        }
    }

    @Nullable
    public XMPMeta getXMPMeta() {
        if (this._xmpMeta == null) {
            this._xmpMeta = new XMPMetaImpl();
        }
        return this._xmpMeta;
    }

    public void updateInt(int tagType, int value) {
        super.setInt(tagType, value);
        try {
            getXMPMeta().setPropertyInteger(_tagSchemaMap.get(Integer.valueOf(tagType)), _tagPropNameMap.get(Integer.valueOf(tagType)), value);
        } catch (XMPException e) {
            e.printStackTrace();
        }
    }

    public void updateIntArray(int tagType, int[] ints) {
        super.setIntArray(tagType, ints);
        try {
            String schemaNS = _tagSchemaMap.get(Integer.valueOf(tagType));
            String propName = _tagPropNameMap.get(Integer.valueOf(tagType));
            getXMPMeta().deleteProperty(schemaNS, propName);
            PropertyOptions po = new PropertyOptions().setArray(true);
            for (int item : ints) {
                getXMPMeta().appendArrayItem(schemaNS, propName, po, String.valueOf(item), (PropertyOptions) null);
            }
        } catch (XMPException e) {
            e.printStackTrace();
        }
    }

    public void updateFloat(int tagType, float value) {
        super.setFloat(tagType, value);
        try {
            getXMPMeta().setPropertyDouble(_tagSchemaMap.get(Integer.valueOf(tagType)), _tagPropNameMap.get(Integer.valueOf(tagType)), value);
        } catch (XMPException e) {
            e.printStackTrace();
        }
    }

    public void updateFloatArray(int tagType, float[] floats) {
        super.setFloatArray(tagType, floats);
        try {
            String schemaNS = _tagSchemaMap.get(Integer.valueOf(tagType));
            String propName = _tagPropNameMap.get(Integer.valueOf(tagType));
            getXMPMeta().deleteProperty(schemaNS, propName);
            PropertyOptions po = new PropertyOptions().setArray(true);
            for (float item : floats) {
                getXMPMeta().appendArrayItem(schemaNS, propName, po, String.valueOf(item), (PropertyOptions) null);
            }
        } catch (XMPException e) {
            e.printStackTrace();
        }
    }

    public void updateDouble(int tagType, double value) {
        super.setDouble(tagType, value);
        try {
            getXMPMeta().setPropertyDouble(_tagSchemaMap.get(Integer.valueOf(tagType)), _tagPropNameMap.get(Integer.valueOf(tagType)), value);
        } catch (XMPException e) {
            e.printStackTrace();
        }
    }

    public void updateDoubleArray(int tagType, double[] doubles) {
        super.setDoubleArray(tagType, doubles);
        try {
            String schemaNS = _tagSchemaMap.get(Integer.valueOf(tagType));
            String propName = _tagPropNameMap.get(Integer.valueOf(tagType));
            getXMPMeta().deleteProperty(schemaNS, propName);
            PropertyOptions po = new PropertyOptions().setArray(true);
            for (double item : doubles) {
                getXMPMeta().appendArrayItem(schemaNS, propName, po, String.valueOf(item), (PropertyOptions) null);
            }
        } catch (XMPException e) {
            e.printStackTrace();
        }
    }

    public void updateString(int tagType, String value) {
        super.setString(tagType, value);
        try {
            getXMPMeta().setProperty(_tagSchemaMap.get(Integer.valueOf(tagType)), _tagPropNameMap.get(Integer.valueOf(tagType)), value);
        } catch (XMPException e) {
            e.printStackTrace();
        }
    }

    public void deleteProperty(int tagType) {
        getXMPMeta().deleteProperty(_tagSchemaMap.get(Integer.valueOf(tagType)), _tagPropNameMap.get(Integer.valueOf(tagType)));
    }

    public void updateStringArray(int tagType, String[] strings) {
        super.setStringArray(tagType, strings);
        try {
            String schemaNS = _tagSchemaMap.get(Integer.valueOf(tagType));
            String propName = _tagPropNameMap.get(Integer.valueOf(tagType));
            getXMPMeta().deleteProperty(schemaNS, propName);
            PropertyOptions po = new PropertyOptions().setArray(true);
            for (String item : strings) {
                getXMPMeta().appendArrayItem(schemaNS, propName, po, item, (PropertyOptions) null);
            }
        } catch (XMPException e) {
            e.printStackTrace();
        }
    }

    public void updateBoolean(int tagType, boolean value) {
        super.setBoolean(tagType, value);
        try {
            getXMPMeta().setPropertyBoolean(_tagSchemaMap.get(Integer.valueOf(tagType)), _tagPropNameMap.get(Integer.valueOf(tagType)), value);
        } catch (XMPException e) {
            e.printStackTrace();
        }
    }

    public void updateLong(int tagType, long value) {
        super.setLong(tagType, value);
        try {
            getXMPMeta().setPropertyLong(_tagSchemaMap.get(Integer.valueOf(tagType)), _tagPropNameMap.get(Integer.valueOf(tagType)), value);
        } catch (XMPException e) {
            e.printStackTrace();
        }
    }

    public void updateDate(int tagType, Date value) {
        updateDate(tagType, value, TimeZone.getDefault());
    }

    public void updateDate(int tagType, Date value, TimeZone timeZone) {
        super.setDate(tagType, value);
        try {
            getXMPMeta().setPropertyDate(_tagSchemaMap.get(Integer.valueOf(tagType)), _tagPropNameMap.get(Integer.valueOf(tagType)), new XMPDateTimeImpl(value, timeZone));
        } catch (XMPException e) {
            e.printStackTrace();
        }
    }
}

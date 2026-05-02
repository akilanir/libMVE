package com.drew.metadata.exif.makernotes;

import com.drew.lang.SequentialByteArrayReader;
import com.drew.lang.annotations.NotNull;
import com.drew.metadata.Directory;
import java.io.IOException;
import java.util.HashMap;

/* loaded from: metadata-extractor-2.9.1.jar:com/drew/metadata/exif/makernotes/OlympusMakernoteDirectory.class */
public class OlympusMakernoteDirectory extends Directory {
    public static final int TAG_MAKERNOTE_VERSION = 0;
    public static final int TAG_CAMERA_SETTINGS_1 = 1;
    public static final int TAG_CAMERA_SETTINGS_2 = 3;
    public static final int TAG_COMPRESSED_IMAGE_SIZE = 64;
    public static final int TAG_MINOLTA_THUMBNAIL_OFFSET_1 = 129;
    public static final int TAG_MINOLTA_THUMBNAIL_OFFSET_2 = 136;
    public static final int TAG_MINOLTA_THUMBNAIL_LENGTH = 137;
    public static final int TAG_THUMBNAIL_IMAGE = 256;
    public static final int TAG_COLOUR_MODE = 257;
    public static final int TAG_IMAGE_QUALITY_1 = 258;
    public static final int TAG_IMAGE_QUALITY_2 = 259;
    public static final int TAG_BODY_FIRMWARE_VERSION = 260;
    public static final int TAG_SPECIAL_MODE = 512;
    public static final int TAG_JPEG_QUALITY = 513;
    public static final int TAG_MACRO_MODE = 514;
    public static final int TAG_BW_MODE = 515;
    public static final int TAG_DIGI_ZOOM_RATIO = 516;
    public static final int TAG_FOCAL_PLANE_DIAGONAL = 517;
    public static final int TAG_LENS_DISTORTION_PARAMETERS = 518;
    public static final int TAG_FIRMWARE_VERSION = 519;
    public static final int TAG_PICT_INFO = 520;
    public static final int TAG_CAMERA_ID = 521;
    public static final int TAG_IMAGE_WIDTH = 523;
    public static final int TAG_IMAGE_HEIGHT = 524;
    public static final int TAG_ORIGINAL_MANUFACTURER_MODEL = 525;
    public static final int TAG_PREVIEW_IMAGE = 640;
    public static final int TAG_PRE_CAPTURE_FRAMES = 768;
    public static final int TAG_WHITE_BOARD = 769;
    public static final int TAG_ONE_TOUCH_WB = 770;
    public static final int TAG_WHITE_BALANCE_BRACKET = 771;
    public static final int TAG_WHITE_BALANCE_BIAS = 772;
    public static final int TAG_SCENE_MODE = 1027;
    public static final int TAG_FIRMWARE = 1028;
    public static final int TAG_PRINT_IMAGE_MATCHING_INFO = 3584;
    public static final int TAG_DATA_DUMP_1 = 3840;
    public static final int TAG_DATA_DUMP_2 = 3841;
    public static final int TAG_SHUTTER_SPEED_VALUE = 4096;
    public static final int TAG_ISO_VALUE = 4097;
    public static final int TAG_APERTURE_VALUE = 4098;
    public static final int TAG_BRIGHTNESS_VALUE = 4099;
    public static final int TAG_FLASH_MODE = 4100;
    public static final int TAG_FLASH_DEVICE = 4101;
    public static final int TAG_BRACKET = 4102;
    public static final int TAG_SENSOR_TEMPERATURE = 4103;
    public static final int TAG_LENS_TEMPERATURE = 4104;
    public static final int TAG_LIGHT_CONDITION = 4105;
    public static final int TAG_FOCUS_RANGE = 4106;
    public static final int TAG_FOCUS_MODE = 4107;
    public static final int TAG_FOCUS_DISTANCE = 4108;
    public static final int TAG_ZOOM = 4109;
    public static final int TAG_MACRO_FOCUS = 4110;
    public static final int TAG_SHARPNESS = 4111;
    public static final int TAG_FLASH_CHARGE_LEVEL = 4112;
    public static final int TAG_COLOUR_MATRIX = 4113;
    public static final int TAG_BLACK_LEVEL = 4114;
    public static final int TAG_WHITE_BALANCE = 4117;
    public static final int TAG_RED_BIAS = 4119;
    public static final int TAG_BLUE_BIAS = 4120;
    public static final int TAG_COLOR_MATRIX_NUMBER = 4121;
    public static final int TAG_SERIAL_NUMBER = 4122;
    public static final int TAG_FLASH_BIAS = 4131;
    public static final int TAG_EXTERNAL_FLASH_BOUNCE = 4134;
    public static final int TAG_EXTERNAL_FLASH_ZOOM = 4135;
    public static final int TAG_EXTERNAL_FLASH_MODE = 4136;
    public static final int TAG_CONTRAST = 4137;
    public static final int TAG_SHARPNESS_FACTOR = 4138;
    public static final int TAG_COLOUR_CONTROL = 4139;
    public static final int TAG_VALID_BITS = 4140;
    public static final int TAG_CORING_FILTER = 4141;
    public static final int TAG_FINAL_WIDTH = 4142;
    public static final int TAG_FINAL_HEIGHT = 4143;
    public static final int TAG_COMPRESSION_RATIO = 4148;
    public static final int TAG_THUMBNAIL = 4149;
    public static final int TAG_THUMBNAIL_OFFSET = 4150;
    public static final int TAG_THUMBNAIL_LENGTH = 4151;
    public static final int TAG_CCD_SCAN_MODE = 4153;
    public static final int TAG_NOISE_REDUCTION = 4154;
    public static final int TAG_INFINITY_LENS_STEP = 4155;
    public static final int TAG_NEAR_LENS_STEP = 4156;
    public static final int TAG_EQUIPMENT = 8208;
    public static final int TAG_CAMERA_SETTINGS = 8224;
    public static final int TAG_RAW_DEVELOPMENT = 8240;
    public static final int TAG_RAW_DEVELOPMENT_2 = 8241;
    public static final int TAG_IMAGE_PROCESSING = 8256;
    public static final int TAG_FOCUS_INFO = 8272;
    public static final int TAG_RAW_INFO = 12288;

    @NotNull
    protected static final HashMap<Integer, String> _tagNameMap = new HashMap<>();

    /* loaded from: metadata-extractor-2.9.1.jar:com/drew/metadata/exif/makernotes/OlympusMakernoteDirectory$CameraSettings.class */
    public static final class CameraSettings {
        private static final int OFFSET = 61440;
        public static final int TAG_EXPOSURE_MODE = 61442;
        public static final int TAG_FLASH_MODE = 61443;
        public static final int TAG_WHITE_BALANCE = 61444;
        public static final int TAG_IMAGE_SIZE = 61445;
        public static final int TAG_IMAGE_QUALITY = 61446;
        public static final int TAG_SHOOTING_MODE = 61447;
        public static final int TAG_METERING_MODE = 61448;
        public static final int TAG_APEX_FILM_SPEED_VALUE = 61449;
        public static final int TAG_APEX_SHUTTER_SPEED_TIME_VALUE = 61450;
        public static final int TAG_APEX_APERTURE_VALUE = 61451;
        public static final int TAG_MACRO_MODE = 61452;
        public static final int TAG_DIGITAL_ZOOM = 61453;
        public static final int TAG_EXPOSURE_COMPENSATION = 61454;
        public static final int TAG_BRACKET_STEP = 61455;
        public static final int TAG_INTERVAL_LENGTH = 61457;
        public static final int TAG_INTERVAL_NUMBER = 61458;
        public static final int TAG_FOCAL_LENGTH = 61459;
        public static final int TAG_FOCUS_DISTANCE = 61460;
        public static final int TAG_FLASH_FIRED = 61461;
        public static final int TAG_DATE = 61462;
        public static final int TAG_TIME = 61463;
        public static final int TAG_MAX_APERTURE_AT_FOCAL_LENGTH = 61464;
        public static final int TAG_FILE_NUMBER_MEMORY = 61467;
        public static final int TAG_LAST_FILE_NUMBER = 61468;
        public static final int TAG_WHITE_BALANCE_RED = 61469;
        public static final int TAG_WHITE_BALANCE_GREEN = 61470;
        public static final int TAG_WHITE_BALANCE_BLUE = 61471;
        public static final int TAG_SATURATION = 61472;
        public static final int TAG_CONTRAST = 61473;
        public static final int TAG_SHARPNESS = 61474;
        public static final int TAG_SUBJECT_PROGRAM = 61475;
        public static final int TAG_FLASH_COMPENSATION = 61476;
        public static final int TAG_ISO_SETTING = 61477;
        public static final int TAG_CAMERA_MODEL = 61478;
        public static final int TAG_INTERVAL_MODE = 61479;
        public static final int TAG_FOLDER_NAME = 61480;
        public static final int TAG_COLOR_MODE = 61481;
        public static final int TAG_COLOR_FILTER = 61482;
        public static final int TAG_BLACK_AND_WHITE_FILTER = 61483;
        public static final int TAG_INTERNAL_FLASH = 61484;
        public static final int TAG_APEX_BRIGHTNESS_VALUE = 61485;
        public static final int TAG_SPOT_FOCUS_POINT_X_COORDINATE = 61486;
        public static final int TAG_SPOT_FOCUS_POINT_Y_COORDINATE = 61487;
        public static final int TAG_WIDE_FOCUS_ZONE = 61488;
        public static final int TAG_FOCUS_MODE = 61489;
        public static final int TAG_FOCUS_AREA = 61490;
        public static final int TAG_DEC_SWITCH_POSITION = 61491;
    }

    static {
        _tagNameMap.put(0, "Makernote Version");
        _tagNameMap.put(1, "Camera Settings");
        _tagNameMap.put(3, "Camera Settings");
        _tagNameMap.put(64, "Compressed Image Size");
        _tagNameMap.put(129, "Thumbnail Offset");
        _tagNameMap.put(136, "Thumbnail Offset");
        _tagNameMap.put(137, "Thumbnail Length");
        _tagNameMap.put(256, "Thumbnail Image");
        _tagNameMap.put(257, "Colour Mode");
        _tagNameMap.put(258, "Image Quality");
        _tagNameMap.put(259, "Image Quality");
        _tagNameMap.put(260, "Body Firmware Version");
        _tagNameMap.put(512, "Special Mode");
        _tagNameMap.put(513, "JPEG Quality");
        _tagNameMap.put(514, "Macro");
        _tagNameMap.put(515, "BW Mode");
        _tagNameMap.put(516, "DigiZoom Ratio");
        _tagNameMap.put(517, "Focal Plane Diagonal");
        _tagNameMap.put(518, "Lens Distortion Parameters");
        _tagNameMap.put(519, "Firmware Version");
        _tagNameMap.put(520, "Pict Info");
        _tagNameMap.put(521, "Camera Id");
        _tagNameMap.put(523, "Image Width");
        _tagNameMap.put(524, "Image Height");
        _tagNameMap.put(Integer.valueOf(TAG_ORIGINAL_MANUFACTURER_MODEL), "Original Manufacturer Model");
        _tagNameMap.put(Integer.valueOf(TAG_PREVIEW_IMAGE), "Preview Image");
        _tagNameMap.put(768, "Pre Capture Frames");
        _tagNameMap.put(769, "White Board");
        _tagNameMap.put(770, "One Touch WB");
        _tagNameMap.put(771, "White Balance Bracket");
        _tagNameMap.put(772, "White Balance Bias");
        _tagNameMap.put(1027, "Scene Mode");
        _tagNameMap.put(1028, "Firmware");
        _tagNameMap.put(3584, "Print Image Matching (PIM) Info");
        _tagNameMap.put(3840, "Data Dump");
        _tagNameMap.put(Integer.valueOf(TAG_DATA_DUMP_2), "Data Dump 2");
        _tagNameMap.put(4096, "Shutter Speed Value");
        _tagNameMap.put(4097, "ISO Value");
        _tagNameMap.put(4098, "Aperture Value");
        _tagNameMap.put(4099, "Brightness Value");
        _tagNameMap.put(4100, "Flash Mode");
        _tagNameMap.put(4101, "Flash Device");
        _tagNameMap.put(4102, "Bracket");
        _tagNameMap.put(Integer.valueOf(TAG_SENSOR_TEMPERATURE), "Sensor Temperature");
        _tagNameMap.put(Integer.valueOf(TAG_LENS_TEMPERATURE), "Lens Temperature");
        _tagNameMap.put(Integer.valueOf(TAG_LIGHT_CONDITION), "Light Condition");
        _tagNameMap.put(4106, "Focus Range");
        _tagNameMap.put(4107, "Focus Mode");
        _tagNameMap.put(Integer.valueOf(TAG_FOCUS_DISTANCE), "Focus Distance");
        _tagNameMap.put(Integer.valueOf(TAG_ZOOM), "Zoom");
        _tagNameMap.put(4110, "Macro Focus");
        _tagNameMap.put(Integer.valueOf(TAG_SHARPNESS), "Sharpness");
        _tagNameMap.put(4112, "Flash Charge Level");
        _tagNameMap.put(4113, "Colour Matrix");
        _tagNameMap.put(Integer.valueOf(TAG_BLACK_LEVEL), "Black Level");
        _tagNameMap.put(Integer.valueOf(TAG_WHITE_BALANCE), "White Balance");
        _tagNameMap.put(Integer.valueOf(TAG_RED_BIAS), "Red Bias");
        _tagNameMap.put(Integer.valueOf(TAG_BLUE_BIAS), "Blue Bias");
        _tagNameMap.put(Integer.valueOf(TAG_COLOR_MATRIX_NUMBER), "Color Matrix Number");
        _tagNameMap.put(Integer.valueOf(TAG_SERIAL_NUMBER), "Serial Number");
        _tagNameMap.put(4131, "Flash Bias");
        _tagNameMap.put(Integer.valueOf(TAG_EXTERNAL_FLASH_BOUNCE), "External Flash Bounce");
        _tagNameMap.put(Integer.valueOf(TAG_EXTERNAL_FLASH_ZOOM), "External Flash Zoom");
        _tagNameMap.put(Integer.valueOf(TAG_EXTERNAL_FLASH_MODE), "External Flash Mode");
        _tagNameMap.put(Integer.valueOf(TAG_CONTRAST), "Contrast");
        _tagNameMap.put(Integer.valueOf(TAG_SHARPNESS_FACTOR), "Sharpness Factor");
        _tagNameMap.put(Integer.valueOf(TAG_COLOUR_CONTROL), "Colour Control");
        _tagNameMap.put(Integer.valueOf(TAG_VALID_BITS), "Valid Bits");
        _tagNameMap.put(Integer.valueOf(TAG_CORING_FILTER), "Coring Filter");
        _tagNameMap.put(Integer.valueOf(TAG_FINAL_WIDTH), "Final Width");
        _tagNameMap.put(Integer.valueOf(TAG_FINAL_HEIGHT), "Final Height");
        _tagNameMap.put(4148, "Compression Ratio");
        _tagNameMap.put(Integer.valueOf(TAG_THUMBNAIL), "Thumbnail");
        _tagNameMap.put(Integer.valueOf(TAG_THUMBNAIL_OFFSET), "Thumbnail Offset");
        _tagNameMap.put(Integer.valueOf(TAG_THUMBNAIL_LENGTH), "Thumbnail Length");
        _tagNameMap.put(Integer.valueOf(TAG_CCD_SCAN_MODE), "CCD Scan Mode");
        _tagNameMap.put(Integer.valueOf(TAG_NOISE_REDUCTION), "Noise Reduction");
        _tagNameMap.put(Integer.valueOf(TAG_INFINITY_LENS_STEP), "Infinity Lens Step");
        _tagNameMap.put(Integer.valueOf(TAG_NEAR_LENS_STEP), "Near Lens Step");
        _tagNameMap.put(Integer.valueOf(TAG_EQUIPMENT), "Equipment");
        _tagNameMap.put(Integer.valueOf(TAG_CAMERA_SETTINGS), "Camera Settings");
        _tagNameMap.put(Integer.valueOf(TAG_RAW_DEVELOPMENT), "Raw Development");
        _tagNameMap.put(Integer.valueOf(TAG_RAW_DEVELOPMENT_2), "Raw Development 2");
        _tagNameMap.put(Integer.valueOf(TAG_IMAGE_PROCESSING), "Image Processing");
        _tagNameMap.put(Integer.valueOf(TAG_FOCUS_INFO), "Focus Info");
        _tagNameMap.put(12288, "Raw Info");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_EXPOSURE_MODE), "Exposure Mode");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_FLASH_MODE), "Flash Mode");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_WHITE_BALANCE), "White Balance");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_IMAGE_SIZE), "Image Size");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_IMAGE_QUALITY), "Image Quality");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_SHOOTING_MODE), "Shooting Mode");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_METERING_MODE), "Metering Mode");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_APEX_FILM_SPEED_VALUE), "Apex Film Speed Value");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_APEX_SHUTTER_SPEED_TIME_VALUE), "Apex Shutter Speed Time Value");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_APEX_APERTURE_VALUE), "Apex Aperture Value");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_MACRO_MODE), "Macro Mode");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_DIGITAL_ZOOM), "Digital Zoom");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_EXPOSURE_COMPENSATION), "Exposure Compensation");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_BRACKET_STEP), "Bracket Step");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_INTERVAL_LENGTH), "Interval Length");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_INTERVAL_NUMBER), "Interval Number");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_FOCAL_LENGTH), "Focal Length");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_FOCUS_DISTANCE), "Focus Distance");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_FLASH_FIRED), "Flash Fired");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_DATE), "Date");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_TIME), "Time");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_MAX_APERTURE_AT_FOCAL_LENGTH), "Max Aperture at Focal Length");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_FILE_NUMBER_MEMORY), "File Number Memory");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_LAST_FILE_NUMBER), "Last File Number");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_WHITE_BALANCE_RED), "White Balance Red");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_WHITE_BALANCE_GREEN), "White Balance Green");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_WHITE_BALANCE_BLUE), "White Balance Blue");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_SATURATION), "Saturation");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_CONTRAST), "Contrast");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_SHARPNESS), "Sharpness");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_SUBJECT_PROGRAM), "Subject Program");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_FLASH_COMPENSATION), "Flash Compensation");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_ISO_SETTING), "ISO Setting");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_CAMERA_MODEL), "Camera Model");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_INTERVAL_MODE), "Interval Mode");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_FOLDER_NAME), "Folder Name");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_COLOR_MODE), "Color Mode");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_COLOR_FILTER), "Color Filter");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_BLACK_AND_WHITE_FILTER), "Black and White Filter");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_INTERNAL_FLASH), "Internal Flash");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_APEX_BRIGHTNESS_VALUE), "Apex Brightness Value");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_SPOT_FOCUS_POINT_X_COORDINATE), "Spot Focus Point X Coordinate");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_SPOT_FOCUS_POINT_Y_COORDINATE), "Spot Focus Point Y Coordinate");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_WIDE_FOCUS_ZONE), "Wide Focus Zone");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_FOCUS_MODE), "Focus Mode");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_FOCUS_AREA), "Focus Area");
        _tagNameMap.put(Integer.valueOf(CameraSettings.TAG_DEC_SWITCH_POSITION), "DEC Switch Position");
    }

    public OlympusMakernoteDirectory() {
        setDescriptor(new OlympusMakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    @NotNull
    public String getName() {
        return "Olympus Makernote";
    }

    @Override // com.drew.metadata.Directory
    public void setByteArray(int tagType, @NotNull byte[] bytes) {
        if (tagType == 1 || tagType == 3) {
            processCameraSettings(bytes);
        } else {
            super.setByteArray(tagType, bytes);
        }
    }

    private void processCameraSettings(byte[] bytes) {
        SequentialByteArrayReader reader = new SequentialByteArrayReader(bytes);
        reader.setMotorolaByteOrder(true);
        int count = bytes.length / 4;
        for (int i = 0; i < count; i++) {
            try {
                int value = reader.getInt32();
                setInt(61440 + i, value);
            } catch (IOException e) {
                e.printStackTrace();
                return;
            }
        }
    }

    public boolean isIntervalMode() {
        Long value = getLongObject(CameraSettings.TAG_SHOOTING_MODE);
        return value != null && value.longValue() == 5;
    }

    @Override // com.drew.metadata.Directory
    @NotNull
    protected HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}

.class public Lcom/drew/metadata/exif/GpsDirectory;
.super Lcom/drew/metadata/exif/ExifDirectoryBase;
.source "GpsDirectory.java"


# static fields
.field public static final TAG_ALTITUDE:I = 0x6

.field public static final TAG_ALTITUDE_REF:I = 0x5

.field public static final TAG_AREA_INFORMATION:I = 0x1c

.field public static final TAG_DATE_STAMP:I = 0x1d

.field public static final TAG_DEST_BEARING:I = 0x18

.field public static final TAG_DEST_BEARING_REF:I = 0x17

.field public static final TAG_DEST_DISTANCE:I = 0x1a

.field public static final TAG_DEST_DISTANCE_REF:I = 0x19

.field public static final TAG_DEST_LATITUDE:I = 0x14

.field public static final TAG_DEST_LATITUDE_REF:I = 0x13

.field public static final TAG_DEST_LONGITUDE:I = 0x16

.field public static final TAG_DEST_LONGITUDE_REF:I = 0x15

.field public static final TAG_DIFFERENTIAL:I = 0x1e

.field public static final TAG_DOP:I = 0xb

.field public static final TAG_IMG_DIRECTION:I = 0x11

.field public static final TAG_IMG_DIRECTION_REF:I = 0x10

.field public static final TAG_LATITUDE:I = 0x2

.field public static final TAG_LATITUDE_REF:I = 0x1

.field public static final TAG_LONGITUDE:I = 0x4

.field public static final TAG_LONGITUDE_REF:I = 0x3

.field public static final TAG_MAP_DATUM:I = 0x12

.field public static final TAG_MEASURE_MODE:I = 0xa

.field public static final TAG_PROCESSING_METHOD:I = 0x1b

.field public static final TAG_SATELLITES:I = 0x8

.field public static final TAG_SPEED:I = 0xd

.field public static final TAG_SPEED_REF:I = 0xc

.field public static final TAG_STATUS:I = 0x9

.field public static final TAG_TIME_STAMP:I = 0x7

.field public static final TAG_TRACK:I = 0xf

.field public static final TAG_TRACK_REF:I = 0xe

.field public static final TAG_VERSION_ID:I

.field protected static final _tagNameMap:Ljava/util/HashMap;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 105
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    .line 109
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    invoke-static {v0}, Lcom/drew/metadata/exif/GpsDirectory;->addExifTagNames(Ljava/util/HashMap;)V

    .line 111
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Version ID"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Latitude Ref"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Latitude"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Longitude Ref"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Longitude"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Altitude Ref"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Altitude"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Time-Stamp"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Satellites"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x9

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Status"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0xa

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Measure Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0xb

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS DOP"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0xc

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Speed Ref"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0xd

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Speed"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0xe

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Track Ref"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0xf

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Track"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x10

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Img Direction Ref"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x11

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Img Direction"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x12

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Map Datum"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x13

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Dest Latitude Ref"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x14

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Dest Latitude"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x15

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Dest Longitude Ref"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x16

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Dest Longitude"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x17

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Dest Bearing Ref"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x18

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Dest Bearing"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x19

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Dest Distance Ref"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Dest Distance"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Processing Method"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Area Information"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Date Stamp"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "GPS Differential"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 145
    invoke-direct {p0}, Lcom/drew/metadata/exif/ExifDirectoryBase;-><init>()V

    .line 146
    new-instance v0, Lcom/drew/metadata/exif/GpsDescriptor;

    invoke-direct {v0, p0}, Lcom/drew/metadata/exif/GpsDescriptor;-><init>(Lcom/drew/metadata/exif/GpsDirectory;)V

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/GpsDirectory;->setDescriptor(Lcom/drew/metadata/TagDescriptor;)V

    .line 147
    return-void
.end method


# virtual methods
.method public getGeoLocation()Lcom/drew/lang/GeoLocation;
    .registers 15
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v13, 0x0

    const/4 v8, 0x3

    const/4 v12, 0x2

    const/4 v11, 0x1

    const/4 v6, 0x0

    .line 172
    invoke-virtual {p0, v12}, Lcom/drew/metadata/exif/GpsDirectory;->getRationalArray(I)[Lcom/drew/lang/Rational;

    move-result-object v2

    .line 173
    .local v2, "latitudes":[Lcom/drew/lang/Rational;
    const/4 v7, 0x4

    invoke-virtual {p0, v7}, Lcom/drew/metadata/exif/GpsDirectory;->getRationalArray(I)[Lcom/drew/lang/Rational;

    move-result-object v5

    .line 174
    .local v5, "longitudes":[Lcom/drew/lang/Rational;
    invoke-virtual {p0, v11}, Lcom/drew/metadata/exif/GpsDirectory;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 175
    .local v1, "latitudeRef":Ljava/lang/String;
    invoke-virtual {p0, v8}, Lcom/drew/metadata/exif/GpsDirectory;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 178
    .local v4, "longitudeRef":Ljava/lang/String;
    if-eqz v2, :cond_1b

    array-length v7, v2

    if-eq v7, v8, :cond_1c

    .line 192
    :cond_1b
    :goto_1b
    return-object v6

    .line 180
    :cond_1c
    if-eqz v5, :cond_1b

    array-length v7, v5

    if-ne v7, v8, :cond_1b

    .line 182
    if-eqz v1, :cond_1b

    if-eqz v4, :cond_1b

    .line 185
    aget-object v7, v2, v13

    aget-object v8, v2, v11

    aget-object v9, v2, v12

    const-string v10, "S"

    invoke-virtual {v1, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    invoke-static {v7, v8, v9, v10}, Lcom/drew/lang/GeoLocation;->degreesMinutesSecondsToDecimal(Lcom/drew/lang/Rational;Lcom/drew/lang/Rational;Lcom/drew/lang/Rational;Z)Ljava/lang/Double;

    move-result-object v0

    .line 186
    .local v0, "lat":Ljava/lang/Double;
    aget-object v7, v5, v13

    aget-object v8, v5, v11

    aget-object v9, v5, v12

    const-string v10, "W"

    invoke-virtual {v4, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    invoke-static {v7, v8, v9, v10}, Lcom/drew/lang/GeoLocation;->degreesMinutesSecondsToDecimal(Lcom/drew/lang/Rational;Lcom/drew/lang/Rational;Lcom/drew/lang/Rational;Z)Ljava/lang/Double;

    move-result-object v3

    .line 189
    .local v3, "lon":Ljava/lang/Double;
    if-eqz v0, :cond_1b

    if-eqz v3, :cond_1b

    .line 192
    new-instance v6, Lcom/drew/lang/GeoLocation;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v7

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v9

    invoke-direct {v6, v7, v8, v9, v10}, Lcom/drew/lang/GeoLocation;-><init>(DD)V

    goto :goto_1b
.end method

.method public getGpsDate()Ljava/util/Date;
    .registers 14
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v12, 0x3

    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    const/4 v5, 0x0

    .line 204
    const/16 v6, 0x1d

    invoke-virtual {p0, v6}, Lcom/drew/metadata/exif/GpsDirectory;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 205
    .local v0, "date":Ljava/lang/String;
    const/4 v6, 0x7

    invoke-virtual {p0, v6}, Lcom/drew/metadata/exif/GpsDirectory;->getRationalArray(I)[Lcom/drew/lang/Rational;

    move-result-object v4

    .line 208
    .local v4, "timeComponents":[Lcom/drew/lang/Rational;
    if-nez v0, :cond_13

    .line 219
    :cond_12
    :goto_12
    return-object v5

    .line 210
    :cond_13
    if-eqz v4, :cond_12

    array-length v6, v4

    if-ne v6, v12, :cond_12

    .line 213
    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "%s %02d:%02d:%02.3f UTC"

    const/4 v8, 0x4

    new-array v8, v8, [Ljava/lang/Object;

    aput-object v0, v8, v9

    aget-object v9, v4, v9

    invoke-virtual {v9}, Lcom/drew/lang/Rational;->intValue()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v10

    aget-object v9, v4, v10

    invoke-virtual {v9}, Lcom/drew/lang/Rational;->intValue()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v11

    aget-object v9, v4, v11

    invoke-virtual {v9}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v9

    aput-object v9, v8, v12

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 216
    .local v1, "dateTime":Ljava/lang/String;
    :try_start_49
    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v6, "yyyy:MM:dd HH:mm:ss.S z"

    invoke-direct {v3, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 217
    .local v3, "parser":Ljava/text/DateFormat;
    invoke-virtual {v3, v1}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_53
    .catch Ljava/text/ParseException; {:try_start_49 .. :try_end_53} :catch_55

    move-result-object v5

    goto :goto_12

    .line 218
    .end local v3    # "parser":Ljava/text/DateFormat;
    :catch_55
    move-exception v2

    .line 219
    .local v2, "e":Ljava/text/ParseException;
    goto :goto_12
.end method

.method public getName()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 153
    const-string v0, "GPS"

    return-object v0
.end method

.method protected getTagNameMap()Ljava/util/HashMap;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 160
    sget-object v0, Lcom/drew/metadata/exif/GpsDirectory;->_tagNameMap:Ljava/util/HashMap;

    return-object v0
.end method

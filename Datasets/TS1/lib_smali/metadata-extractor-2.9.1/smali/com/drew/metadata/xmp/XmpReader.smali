.class public Lcom/drew/metadata/xmp/XmpReader;
.super Ljava/lang/Object;
.source "XmpReader.java"

# interfaces
.implements Lcom/drew/imaging/jpeg/JpegSegmentMetadataReader;


# static fields
.field private static final FMT_DOUBLE:I = 0x4

.field private static final FMT_INT:I = 0x3

.field private static final FMT_RATIONAL:I = 0x2

.field private static final FMT_STRING:I = 0x1

.field private static final FMT_STRING_ARRAY:I = 0x5

.field private static final SCHEMA_EXIF_ADDITIONAL_PROPERTIES:Ljava/lang/String; = "http://ns.adobe.com/exif/1.0/aux/"
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field private static final SCHEMA_EXIF_SPECIFIC_PROPERTIES:Ljava/lang/String; = "http://ns.adobe.com/exif/1.0/"
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field private static final SCHEMA_EXIF_TIFF_PROPERTIES:Ljava/lang/String; = "http://ns.adobe.com/tiff/1.0/"
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field private static final SCHEMA_XMP_PROPERTIES:Ljava/lang/String; = "http://ns.adobe.com/xap/1.0/"
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field public static final XMP_JPEG_PREAMBLE:Ljava/lang/String; = "http://ns.adobe.com/xap/1.0/\u0000"
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static processXmpTag(Lcom/adobe/xmp/XMPMeta;Lcom/drew/metadata/xmp/XmpDirectory;II)V
    .registers 17
    .param p0, "meta"    # Lcom/adobe/xmp/XMPMeta;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p1, "directory"    # Lcom/drew/metadata/xmp/XmpDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "tagType"    # I
    .param p3, "formatCode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    .line 247
    sget-object v9, Lcom/drew/metadata/xmp/XmpDirectory;->_tagSchemaMap:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 248
    .local v8, "schemaNS":Ljava/lang/String;
    sget-object v9, Lcom/drew/metadata/xmp/XmpDirectory;->_tagPropNameMap:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 249
    .local v4, "propName":Ljava/lang/String;
    invoke-interface {p0, v8, v4}, Lcom/adobe/xmp/XMPMeta;->getPropertyString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 251
    .local v5, "property":Ljava/lang/String;
    if-nez v5, :cond_1f

    .line 298
    :goto_1e
    return-void

    .line 254
    :cond_1f
    packed-switch p3, :pswitch_data_e8

    .line 296
    const-string v9, "Unknown format code %d for tag %d"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p1, v9}, Lcom/drew/metadata/xmp/XmpDirectory;->addError(Ljava/lang/String;)V

    goto :goto_1e

    .line 256
    :pswitch_3d
    const-string v9, "/"

    const/4 v10, 0x2

    invoke-virtual {v5, v9, v10}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v7

    .line 257
    .local v7, "rationalParts":[Ljava/lang/String;
    array-length v9, v7

    const/4 v10, 0x2

    if-ne v9, v10, :cond_72

    .line 259
    :try_start_48
    new-instance v6, Lcom/drew/lang/Rational;

    const/4 v9, 0x0

    aget-object v9, v7, v9

    invoke-static {v9}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v9

    float-to-long v9, v9

    const/4 v11, 0x1

    aget-object v11, v7, v11

    invoke-static {v11}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v11

    float-to-long v11, v11

    invoke-direct {v6, v9, v10, v11, v12}, Lcom/drew/lang/Rational;-><init>(JJ)V

    .line 260
    .local v6, "rational":Lcom/drew/lang/Rational;
    invoke-virtual {p1, p2, v6}, Lcom/drew/metadata/xmp/XmpDirectory;->setRational(ILcom/drew/lang/Rational;)V
    :try_end_60
    .catch Ljava/lang/NumberFormatException; {:try_start_48 .. :try_end_60} :catch_61

    goto :goto_1e

    .line 261
    .end local v6    # "rational":Lcom/drew/lang/Rational;
    :catch_61
    move-exception v2

    .line 262
    .local v2, "ex":Ljava/lang/NumberFormatException;
    const-string v9, "Unable to parse XMP property %s as a Rational."

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v4, v10, v11

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p1, v9}, Lcom/drew/metadata/xmp/XmpDirectory;->addError(Ljava/lang/String;)V

    goto :goto_1e

    .line 265
    .end local v2    # "ex":Ljava/lang/NumberFormatException;
    :cond_72
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Error in rational format for tag "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p1, v9}, Lcom/drew/metadata/xmp/XmpDirectory;->addError(Ljava/lang/String;)V

    goto :goto_1e

    .line 270
    .end local v7    # "rationalParts":[Ljava/lang/String;
    :pswitch_89
    :try_start_89
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    invoke-virtual {p1, p2, v9}, Lcom/drew/metadata/xmp/XmpDirectory;->setInt(II)V
    :try_end_94
    .catch Ljava/lang/NumberFormatException; {:try_start_89 .. :try_end_94} :catch_95

    goto :goto_1e

    .line 271
    :catch_95
    move-exception v2

    .line 272
    .restart local v2    # "ex":Ljava/lang/NumberFormatException;
    const-string v9, "Unable to parse XMP property %s as an int."

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v4, v10, v11

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p1, v9}, Lcom/drew/metadata/xmp/XmpDirectory;->addError(Ljava/lang/String;)V

    goto/16 :goto_1e

    .line 277
    .end local v2    # "ex":Ljava/lang/NumberFormatException;
    :pswitch_a7
    :try_start_a7
    invoke-static {v5}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v9

    invoke-virtual {p1, p2, v9, v10}, Lcom/drew/metadata/xmp/XmpDirectory;->setDouble(ID)V
    :try_end_b2
    .catch Ljava/lang/NumberFormatException; {:try_start_a7 .. :try_end_b2} :catch_b4

    goto/16 :goto_1e

    .line 278
    :catch_b4
    move-exception v2

    .line 279
    .restart local v2    # "ex":Ljava/lang/NumberFormatException;
    const-string v9, "Unable to parse XMP property %s as an double."

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v4, v10, v11

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p1, v9}, Lcom/drew/metadata/xmp/XmpDirectory;->addError(Ljava/lang/String;)V

    goto/16 :goto_1e

    .line 283
    .end local v2    # "ex":Ljava/lang/NumberFormatException;
    :pswitch_c6
    invoke-virtual {p1, p2, v5}, Lcom/drew/metadata/xmp/XmpDirectory;->setString(ILjava/lang/String;)V

    goto/16 :goto_1e

    .line 287
    :pswitch_cb
    invoke-interface {p0, v8, v4}, Lcom/adobe/xmp/XMPMeta;->countArrayItems(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 288
    .local v1, "count":I
    new-array v0, v1, [Ljava/lang/String;

    .line 289
    .local v0, "array":[Ljava/lang/String;
    const/4 v3, 0x1

    .local v3, "i":I
    :goto_d2
    if-gt v3, v1, :cond_e3

    .line 291
    add-int/lit8 v9, v3, -0x1

    invoke-interface {p0, v8, v4, v3}, Lcom/adobe/xmp/XMPMeta;->getArrayItem(Ljava/lang/String;Ljava/lang/String;I)Lcom/adobe/xmp/properties/XMPProperty;

    move-result-object v10

    invoke-interface {v10}, Lcom/adobe/xmp/properties/XMPProperty;->getValue()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v0, v9

    .line 289
    add-int/lit8 v3, v3, 0x1

    goto :goto_d2

    .line 293
    :cond_e3
    invoke-virtual {p1, p2, v0}, Lcom/drew/metadata/xmp/XmpDirectory;->setStringArray(I[Ljava/lang/String;)V

    goto/16 :goto_1e

    .line 254
    :pswitch_data_e8
    .packed-switch 0x1
        :pswitch_c6
        :pswitch_3d
        :pswitch_89
        :pswitch_a7
        :pswitch_cb
    .end packed-switch
.end method

.method private static processXmpTags(Lcom/drew/metadata/xmp/XmpDirectory;Lcom/adobe/xmp/XMPMeta;)V
    .registers 12
    .param p0, "directory"    # Lcom/drew/metadata/xmp/XmpDirectory;
    .param p1, "xmpMeta"    # Lcom/adobe/xmp/XMPMeta;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x5

    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    .line 176
    invoke-virtual {p0, p1}, Lcom/drew/metadata/xmp/XmpDirectory;->setXMPMeta(Lcom/adobe/xmp/XMPMeta;)V

    .line 180
    const/4 v4, 0x6

    invoke-static {p1, p0, v4, v5}, Lcom/drew/metadata/xmp/XmpReader;->processXmpTag(Lcom/adobe/xmp/XMPMeta;Lcom/drew/metadata/xmp/XmpDirectory;II)V

    .line 181
    const/4 v4, 0x7

    invoke-static {p1, p0, v4, v5}, Lcom/drew/metadata/xmp/XmpReader;->processXmpTag(Lcom/adobe/xmp/XMPMeta;Lcom/drew/metadata/xmp/XmpDirectory;II)V

    .line 182
    const/16 v4, 0x8

    invoke-static {p1, p0, v4, v5}, Lcom/drew/metadata/xmp/XmpReader;->processXmpTag(Lcom/adobe/xmp/XMPMeta;Lcom/drew/metadata/xmp/XmpDirectory;II)V

    .line 183
    const/16 v4, 0x9

    invoke-static {p1, p0, v4, v5}, Lcom/drew/metadata/xmp/XmpReader;->processXmpTag(Lcom/adobe/xmp/XMPMeta;Lcom/drew/metadata/xmp/XmpDirectory;II)V

    .line 185
    invoke-static {p1, p0, v5, v5}, Lcom/drew/metadata/xmp/XmpReader;->processXmpTag(Lcom/adobe/xmp/XMPMeta;Lcom/drew/metadata/xmp/XmpDirectory;II)V

    .line 186
    invoke-static {p1, p0, v6, v5}, Lcom/drew/metadata/xmp/XmpReader;->processXmpTag(Lcom/adobe/xmp/XMPMeta;Lcom/drew/metadata/xmp/XmpDirectory;II)V

    .line 188
    invoke-static {p1, p0, v7, v5}, Lcom/drew/metadata/xmp/XmpReader;->processXmpTag(Lcom/adobe/xmp/XMPMeta;Lcom/drew/metadata/xmp/XmpDirectory;II)V

    .line 189
    const/16 v4, 0xc

    invoke-static {p1, p0, v4, v7}, Lcom/drew/metadata/xmp/XmpReader;->processXmpTag(Lcom/adobe/xmp/XMPMeta;Lcom/drew/metadata/xmp/XmpDirectory;II)V

    .line 190
    const/16 v4, 0xb

    invoke-static {p1, p0, v4, v6}, Lcom/drew/metadata/xmp/XmpReader;->processXmpTag(Lcom/adobe/xmp/XMPMeta;Lcom/drew/metadata/xmp/XmpDirectory;II)V

    .line 191
    invoke-static {p1, p0, v9, v6}, Lcom/drew/metadata/xmp/XmpReader;->processXmpTag(Lcom/adobe/xmp/XMPMeta;Lcom/drew/metadata/xmp/XmpDirectory;II)V

    .line 192
    const/16 v4, 0xa

    invoke-static {p1, p0, v4, v6}, Lcom/drew/metadata/xmp/XmpReader;->processXmpTag(Lcom/adobe/xmp/XMPMeta;Lcom/drew/metadata/xmp/XmpDirectory;II)V

    .line 193
    invoke-static {p1, p0, v8, v6}, Lcom/drew/metadata/xmp/XmpReader;->processXmpTag(Lcom/adobe/xmp/XMPMeta;Lcom/drew/metadata/xmp/XmpDirectory;II)V

    .line 195
    const/16 v4, 0xd

    invoke-static {p1, p0, v4, v5}, Lcom/drew/metadata/xmp/XmpReader;->processXmpTag(Lcom/adobe/xmp/XMPMeta;Lcom/drew/metadata/xmp/XmpDirectory;II)V

    .line 196
    const/16 v4, 0xe

    invoke-static {p1, p0, v4, v5}, Lcom/drew/metadata/xmp/XmpReader;->processXmpTag(Lcom/adobe/xmp/XMPMeta;Lcom/drew/metadata/xmp/XmpDirectory;II)V

    .line 198
    const/16 v4, 0x201

    invoke-static {p1, p0, v4, v5}, Lcom/drew/metadata/xmp/XmpReader;->processXmpTag(Lcom/adobe/xmp/XMPMeta;Lcom/drew/metadata/xmp/XmpDirectory;II)V

    .line 199
    const/16 v4, 0x202

    invoke-static {p1, p0, v4, v5}, Lcom/drew/metadata/xmp/XmpReader;->processXmpTag(Lcom/adobe/xmp/XMPMeta;Lcom/drew/metadata/xmp/XmpDirectory;II)V

    .line 200
    const/16 v4, 0x203

    invoke-static {p1, p0, v4, v5}, Lcom/drew/metadata/xmp/XmpReader;->processXmpTag(Lcom/adobe/xmp/XMPMeta;Lcom/drew/metadata/xmp/XmpDirectory;II)V

    .line 201
    const/16 v4, 0x204

    invoke-static {p1, p0, v4, v5}, Lcom/drew/metadata/xmp/XmpReader;->processXmpTag(Lcom/adobe/xmp/XMPMeta;Lcom/drew/metadata/xmp/XmpDirectory;II)V

    .line 202
    const/16 v4, 0x205

    invoke-static {p1, p0, v4, v5}, Lcom/drew/metadata/xmp/XmpReader;->processXmpTag(Lcom/adobe/xmp/XMPMeta;Lcom/drew/metadata/xmp/XmpDirectory;II)V

    .line 203
    const/16 v4, 0x206

    invoke-static {p1, p0, v4, v5}, Lcom/drew/metadata/xmp/XmpReader;->processXmpTag(Lcom/adobe/xmp/XMPMeta;Lcom/drew/metadata/xmp/XmpDirectory;II)V

    .line 204
    const/16 v4, 0x207

    invoke-static {p1, p0, v4, v5}, Lcom/drew/metadata/xmp/XmpReader;->processXmpTag(Lcom/adobe/xmp/XMPMeta;Lcom/drew/metadata/xmp/XmpDirectory;II)V

    .line 205
    const/16 v4, 0x1001

    invoke-static {p1, p0, v4, v8}, Lcom/drew/metadata/xmp/XmpReader;->processXmpTag(Lcom/adobe/xmp/XMPMeta;Lcom/drew/metadata/xmp/XmpDirectory;II)V

    .line 206
    const/16 v4, 0x2000

    invoke-static {p1, p0, v4, v5}, Lcom/drew/metadata/xmp/XmpReader;->processXmpTag(Lcom/adobe/xmp/XMPMeta;Lcom/drew/metadata/xmp/XmpDirectory;II)V

    .line 210
    sget v4, Lcom/drew/metadata/xmp/XmpDirectory;->TAG_SUBJECT:I

    invoke-static {p1, p0, v4, v9}, Lcom/drew/metadata/xmp/XmpReader;->processXmpTag(Lcom/adobe/xmp/XMPMeta;Lcom/drew/metadata/xmp/XmpDirectory;II)V

    .line 233
    invoke-interface {p1}, Lcom/adobe/xmp/XMPMeta;->iterator()Lcom/adobe/xmp/XMPIterator;

    move-result-object v0

    .local v0, "iterator":Lcom/adobe/xmp/XMPIterator;
    :cond_78
    :goto_78
    invoke-interface {v0}, Lcom/adobe/xmp/XMPIterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_94

    .line 234
    invoke-interface {v0}, Lcom/adobe/xmp/XMPIterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/xmp/properties/XMPPropertyInfo;

    .line 235
    .local v2, "propInfo":Lcom/adobe/xmp/properties/XMPPropertyInfo;
    invoke-interface {v2}, Lcom/adobe/xmp/properties/XMPPropertyInfo;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 236
    .local v1, "path":Ljava/lang/String;
    invoke-interface {v2}, Lcom/adobe/xmp/properties/XMPPropertyInfo;->getValue()Ljava/lang/String;

    move-result-object v3

    .line 237
    .local v3, "value":Ljava/lang/String;
    if-eqz v1, :cond_78

    if-eqz v3, :cond_78

    .line 238
    invoke-virtual {p0, v1, v3}, Lcom/drew/metadata/xmp/XmpDirectory;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_78

    .line 240
    .end local v1    # "path":Ljava/lang/String;
    .end local v2    # "propInfo":Lcom/adobe/xmp/properties/XMPPropertyInfo;
    .end local v3    # "value":Ljava/lang/String;
    :cond_94
    return-void
.end method


# virtual methods
.method public extract(Ljava/lang/String;Lcom/drew/metadata/Metadata;)V
    .registers 4
    .param p1, "xmpString"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 147
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/drew/metadata/xmp/XmpReader;->extract(Ljava/lang/String;Lcom/drew/metadata/Metadata;Lcom/drew/metadata/Directory;)V

    .line 148
    return-void
.end method

.method public extract(Ljava/lang/String;Lcom/drew/metadata/Metadata;Lcom/drew/metadata/Directory;)V
    .registers 9
    .param p1, "xmpString"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p3, "parentDirectory"    # Lcom/drew/metadata/Directory;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param

    .prologue
    .line 157
    new-instance v0, Lcom/drew/metadata/xmp/XmpDirectory;

    invoke-direct {v0}, Lcom/drew/metadata/xmp/XmpDirectory;-><init>()V

    .line 159
    .local v0, "directory":Lcom/drew/metadata/xmp/XmpDirectory;
    if-eqz p3, :cond_a

    .line 160
    invoke-virtual {v0, p3}, Lcom/drew/metadata/xmp/XmpDirectory;->setParent(Lcom/drew/metadata/Directory;)V

    .line 163
    :cond_a
    :try_start_a
    invoke-static {p1}, Lcom/adobe/xmp/XMPMetaFactory;->parseFromString(Ljava/lang/String;)Lcom/adobe/xmp/XMPMeta;

    move-result-object v2

    .line 164
    .local v2, "xmpMeta":Lcom/adobe/xmp/XMPMeta;
    invoke-static {v0, v2}, Lcom/drew/metadata/xmp/XmpReader;->processXmpTags(Lcom/drew/metadata/xmp/XmpDirectory;Lcom/adobe/xmp/XMPMeta;)V
    :try_end_11
    .catch Lcom/adobe/xmp/XMPException; {:try_start_a .. :try_end_11} :catch_1b

    .line 169
    .end local v2    # "xmpMeta":Lcom/adobe/xmp/XMPMeta;
    :goto_11
    invoke-virtual {v0}, Lcom/drew/metadata/xmp/XmpDirectory;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1a

    .line 170
    invoke-virtual {p2, v0}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    .line 171
    :cond_1a
    return-void

    .line 165
    :catch_1b
    move-exception v1

    .line 166
    .local v1, "e":Lcom/adobe/xmp/XMPException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error processing XMP data: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lcom/adobe/xmp/XMPException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/drew/metadata/xmp/XmpDirectory;->addError(Ljava/lang/String;)V

    goto :goto_11
.end method

.method public extract([BLcom/drew/metadata/Metadata;)V
    .registers 4
    .param p1, "xmpBytes"    # [B
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 114
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/drew/metadata/xmp/XmpReader;->extract([BLcom/drew/metadata/Metadata;Lcom/drew/metadata/Directory;)V

    .line 115
    return-void
.end method

.method public extract([BLcom/drew/metadata/Metadata;Lcom/drew/metadata/Directory;)V
    .registers 9
    .param p1, "xmpBytes"    # [B
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p3, "parentDirectory"    # Lcom/drew/metadata/Directory;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param

    .prologue
    .line 124
    new-instance v0, Lcom/drew/metadata/xmp/XmpDirectory;

    invoke-direct {v0}, Lcom/drew/metadata/xmp/XmpDirectory;-><init>()V

    .line 126
    .local v0, "directory":Lcom/drew/metadata/xmp/XmpDirectory;
    if-eqz p3, :cond_a

    .line 127
    invoke-virtual {v0, p3}, Lcom/drew/metadata/xmp/XmpDirectory;->setParent(Lcom/drew/metadata/Directory;)V

    .line 130
    :cond_a
    :try_start_a
    invoke-static {p1}, Lcom/adobe/xmp/XMPMetaFactory;->parseFromBuffer([B)Lcom/adobe/xmp/XMPMeta;

    move-result-object v2

    .line 131
    .local v2, "xmpMeta":Lcom/adobe/xmp/XMPMeta;
    invoke-static {v0, v2}, Lcom/drew/metadata/xmp/XmpReader;->processXmpTags(Lcom/drew/metadata/xmp/XmpDirectory;Lcom/adobe/xmp/XMPMeta;)V
    :try_end_11
    .catch Lcom/adobe/xmp/XMPException; {:try_start_a .. :try_end_11} :catch_1b

    .line 136
    .end local v2    # "xmpMeta":Lcom/adobe/xmp/XMPMeta;
    :goto_11
    invoke-virtual {v0}, Lcom/drew/metadata/xmp/XmpDirectory;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1a

    .line 137
    invoke-virtual {p2, v0}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    .line 138
    :cond_1a
    return-void

    .line 132
    :catch_1b
    move-exception v1

    .line 133
    .local v1, "e":Lcom/adobe/xmp/XMPException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error processing XMP data: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lcom/adobe/xmp/XMPException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/drew/metadata/xmp/XmpDirectory;->addError(Ljava/lang/String;)V

    goto :goto_11
.end method

.method public getSegmentTypes()Ljava/lang/Iterable;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/drew/imaging/jpeg/JpegSegmentType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 74
    sget-object v0, Lcom/drew/imaging/jpeg/JpegSegmentType;->APP1:Lcom/drew/imaging/jpeg/JpegSegmentType;

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public readJpegSegments(Ljava/lang/Iterable;Lcom/drew/metadata/Metadata;Lcom/drew/imaging/jpeg/JpegSegmentType;)V
    .registers 12
    .param p1    # Ljava/lang/Iterable;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p3, "segmentType"    # Lcom/drew/imaging/jpeg/JpegSegmentType;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<[B>;",
            "Lcom/drew/metadata/Metadata;",
            "Lcom/drew/imaging/jpeg/JpegSegmentType;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "segments":Ljava/lang/Iterable;, "Ljava/lang/Iterable<[B>;"
    const/4 v7, 0x0

    .line 87
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_5
    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_41

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    .line 89
    .local v2, "segmentBytes":[B
    const-string v4, "http://ns.adobe.com/xap/1.0/\u0000"

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v1

    .line 91
    .local v1, "preambleLength":I
    array-length v4, v2

    if-lt v4, v1, :cond_5

    .line 97
    const-string v4, "http://ns.adobe.com/xap/1.0/\u0000"

    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v2, v7, v1}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_35

    const-string v4, "XMP"

    new-instance v5, Ljava/lang/String;

    const/4 v6, 0x3

    invoke-direct {v5, v2, v7, v6}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 101
    :cond_35
    array-length v4, v2

    sub-int/2addr v4, v1

    new-array v3, v4, [B

    .line 102
    .local v3, "xmlBytes":[B
    array-length v4, v3

    invoke-static {v2, v1, v3, v7, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 103
    invoke-virtual {p0, v3, p2}, Lcom/drew/metadata/xmp/XmpReader;->extract([BLcom/drew/metadata/Metadata;)V

    goto :goto_5

    .line 105
    .end local v1    # "preambleLength":I
    .end local v2    # "segmentBytes":[B
    .end local v3    # "xmlBytes":[B
    :cond_41
    return-void
.end method

.class public Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;
.super Lcom/drew/metadata/Directory;
.source "CasioType2MakernoteDirectory.java"


# static fields
.field public static final TAG_BESTSHOT_MODE:I = 0x3007

.field public static final TAG_CCD_ISO_SENSITIVITY:I = 0x3014

.field public static final TAG_COLOUR_MODE:I = 0x3015

.field public static final TAG_CONTRAST:I = 0x20

.field public static final TAG_ENHANCEMENT:I = 0x3016

.field public static final TAG_FILTER:I = 0x3017

.field public static final TAG_FLASH_DISTANCE:I = 0x2034

.field public static final TAG_FOCAL_LENGTH:I = 0x1d

.field public static final TAG_FOCUS_MODE_1:I = 0xd

.field public static final TAG_FOCUS_MODE_2:I = 0x3003

.field public static final TAG_IMAGE_SIZE:I = 0x9

.field public static final TAG_ISO_SENSITIVITY:I = 0x14

.field public static final TAG_OBJECT_DISTANCE:I = 0x2022

.field public static final TAG_PREVIEW_THUMBNAIL:I = 0x2000

.field public static final TAG_PRINT_IMAGE_MATCHING_INFO:I = 0xe00

.field public static final TAG_QUALITY:I = 0x3002

.field public static final TAG_QUALITY_MODE:I = 0x8

.field public static final TAG_RECORD_MODE:I = 0x3000

.field public static final TAG_SATURATION:I = 0x1f

.field public static final TAG_SELF_TIMER:I = 0x3001

.field public static final TAG_SHARPNESS:I = 0x21

.field public static final TAG_THUMBNAIL_DIMENSIONS:I = 0x2

.field public static final TAG_THUMBNAIL_OFFSET:I = 0x4

.field public static final TAG_THUMBNAIL_SIZE:I = 0x3

.field public static final TAG_TIME_ZONE:I = 0x3006

.field public static final TAG_WHITE_BALANCE_1:I = 0x19

.field public static final TAG_WHITE_BALANCE_2:I = 0x2012

.field public static final TAG_WHITE_BALANCE_BIAS:I = 0x2011

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
    .line 180
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    .line 185
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Thumbnail Dimensions"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Thumbnail Size"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Thumbnail Offset"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Quality Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x9

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Image Size"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0xd

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Focus Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x14

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "ISO Sensitivity"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x19

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Balance"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Focal Length"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x1f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Saturation"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x20

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Contrast"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x21

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Sharpness"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0xe00

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Print Image Matching (PIM) Info"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2000

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Casio Preview Thumbnail"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2011

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Balance Bias"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2012

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "White Balance"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2022

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Object Distance"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2034

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flash Distance"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x3000

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Record Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x3001

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Self Timer"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x3002

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Quality"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x3003

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Focus Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x3006

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Time Zone"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x3007

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "BestShot Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x3014

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "CCD ISO Sensitivity"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x3015

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Colour Mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x3016

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Enhancement"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x3017

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Filter"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 216
    invoke-direct {p0}, Lcom/drew/metadata/Directory;-><init>()V

    .line 217
    new-instance v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;

    invoke-direct {v0, p0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDescriptor;-><init>(Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;)V

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->setDescriptor(Lcom/drew/metadata/TagDescriptor;)V

    .line 218
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 224
    const-string v0, "Casio Makernote"

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
    .line 231
    sget-object v0, Lcom/drew/metadata/exif/makernotes/CasioType2MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    return-object v0
.end method

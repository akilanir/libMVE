.class public Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "OlympusCameraSettingsMakernoteDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;",
        ">;"
    }
.end annotation


# static fields
.field private static final _filters:Ljava/util/HashMap;
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
    .line 1316
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    .line 1319
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Off"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1320
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Soft Focus"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1321
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Pop Art"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1322
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Pale & Light Color"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1323
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Light Tone"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1324
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/4 v1, 0x5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Pin Hole"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1325
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/4 v1, 0x6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Grainy Film"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1326
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0x9

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Diorama"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1327
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0xa

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Cross Process"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1328
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0xc

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Fish Eye"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1329
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0xd

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Drawing"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1330
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0xe

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Gentle Sepia"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1331
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0xf

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Pale & Light Color II"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1332
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0x10

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Pop Art II"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1333
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0x11

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Pin Hole II"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1334
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0x12

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Pin Hole III"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1335
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0x13

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Grainy Film II"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1336
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0x14

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Dramatic Tone"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1337
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0x15

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Punk"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1338
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0x16

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Soft Focus 2"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1339
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0x17

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Sparkle"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1340
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0x18

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Watercolor"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1341
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0x19

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Key Line"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1342
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0x1a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Key Line II"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1343
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0x1b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Miniature"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1344
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0x1c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Reflection"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1345
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0x1d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Fragmented"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1346
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0x1f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Cross Process II"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1347
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0x20

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Dramatic Tone II"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1348
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0x21

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Watercolor I"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1349
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0x22

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Watercolor II"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1350
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0x23

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Diorama II"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1351
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0x24

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Vintage"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1352
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0x25

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Vintage II"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1353
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0x26

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Vintage III"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1354
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0x27

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Partial Color"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1355
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0x28

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Partial Color II"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1356
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    const/16 v1, 0x29

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Partial Color III"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1357
    return-void
.end method

.method public constructor <init>(Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 49
    return-void
.end method

.method private getFiltersDescription(I)Ljava/lang/String;
    .registers 7
    .param p1, "tagId"    # I

    .prologue
    .line 1299
    iget-object v3, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v3, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    invoke-virtual {v3, p1}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getIntArray(I)[I

    move-result-object v2

    .line 1300
    .local v2, "values":[I
    if-eqz v2, :cond_d

    array-length v3, v2

    if-nez v3, :cond_f

    .line 1301
    :cond_d
    const/4 v3, 0x0

    .line 1312
    :goto_e
    return-object v3

    .line 1303
    :cond_f
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 1304
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_15
    array-length v3, v2

    if-ge v0, v3, :cond_4a

    .line 1305
    if-nez v0, :cond_44

    .line 1306
    sget-object v3, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    aget v4, v2, v0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_41

    sget-object v3, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    aget v4, v2, v0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    :goto_36
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1309
    :goto_39
    const-string v3, "; "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1304
    add-int/lit8 v0, v0, 0x1

    goto :goto_15

    .line 1306
    :cond_41
    const-string v3, "[unknown]"

    goto :goto_36

    .line 1308
    :cond_44
    aget v3, v2, v0

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_39

    .line 1312
    :cond_4a
    const/4 v3, 0x0

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x2

    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_e
.end method

.method private getValueMinMaxDescription(I)Ljava/lang/String;
    .registers 9
    .param p1, "tagId"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v2, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1290
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    invoke-virtual {v1, p1}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getIntArray(I)[I

    move-result-object v0

    .line 1291
    .local v0, "values":[I
    if-eqz v0, :cond_11

    array-length v1, v0

    if-ge v1, v2, :cond_13

    .line 1292
    :cond_11
    const/4 v1, 0x0

    .line 1294
    :goto_12
    return-object v1

    :cond_13
    const-string v1, "%d (min %d, max %d)"

    new-array v2, v2, [Ljava/lang/Object;

    aget v3, v0, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    aget v3, v0, v5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    aget v3, v0, v6

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_12
.end method


# virtual methods
.method public getAeLockDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 200
    const/16 v0, 0x201

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "On"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAfAreasDescription()Ljava/lang/String;
    .registers 16
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v8, 0x0

    const-wide/16 v13, 0xff

    .line 359
    iget-object v7, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v7, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v9, 0x304

    invoke-virtual {v7, v9}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getObject(I)Ljava/lang/Object;

    move-result-object v3

    .line 360
    .local v3, "obj":Ljava/lang/Object;
    if-eqz v3, :cond_13

    instance-of v7, v3, [J

    if-nez v7, :cond_15

    :cond_13
    move-object v7, v8

    .line 384
    .end local v3    # "obj":Ljava/lang/Object;
    :goto_14
    return-object v7

    .line 363
    .restart local v3    # "obj":Ljava/lang/Object;
    :cond_15
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 364
    .local v6, "sb":Ljava/lang/StringBuilder;
    check-cast v3, [J

    .end local v3    # "obj":Ljava/lang/Object;
    move-object v0, v3

    check-cast v0, [J

    .local v0, "arr$":[J
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_21
    if-ge v1, v2, :cond_9b

    aget-wide v4, v0, v1

    .line 365
    .local v4, "point":J
    const-wide/16 v9, 0x0

    cmp-long v7, v4, v9

    if-nez v7, :cond_2e

    .line 364
    :goto_2b
    add-int/lit8 v1, v1, 0x1

    goto :goto_21

    .line 367
    :cond_2e
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    if-eqz v7, :cond_39

    .line 368
    const-string v7, ", "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 370
    :cond_39
    const-wide/32 v9, 0x36794285

    cmp-long v7, v4, v9

    if-nez v7, :cond_7f

    .line 371
    const-string v7, "Left "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 377
    :cond_45
    :goto_45
    const-string v7, "(%d/255,%d/255)-(%d/255,%d/255)"

    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const/16 v11, 0x18

    shr-long v11, v4, v11

    and-long/2addr v11, v13

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x1

    const/16 v11, 0x10

    shr-long v11, v4, v11

    and-long/2addr v11, v13

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x2

    const/16 v11, 0x8

    shr-long v11, v4, v11

    and-long/2addr v11, v13

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x3

    and-long v11, v4, v13

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v7, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2b

    .line 372
    :cond_7f
    const-wide/32 v9, 0x79798585

    cmp-long v7, v4, v9

    if-nez v7, :cond_8c

    .line 373
    const-string v7, "Center "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_45

    .line 374
    :cond_8c
    const-wide v9, 0xbd79c985L

    cmp-long v7, v4, v9

    if-nez v7, :cond_45

    .line 375
    const-string v7, "Right "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_45

    .line 384
    .end local v4    # "point":J
    :cond_9b
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    if-nez v7, :cond_a4

    move-object v7, v8

    goto/16 :goto_14

    :cond_a4
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_14
.end method

.method public getAfFineTuneDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 417
    const/16 v0, 0x306

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "On"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAfPointSelectedDescription()Ljava/lang/String;
    .registers 15
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v13, 0x4

    const/4 v12, 0x0

    const-wide/high16 v10, 0x4059000000000000L    # 100.0

    .line 394
    iget-object v6, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v6, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v7, 0x305

    invoke-virtual {v6, v7}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getRationalArray(I)[Lcom/drew/lang/Rational;

    move-result-object v5

    .line 395
    .local v5, "values":[Lcom/drew/lang/Rational;
    if-nez v5, :cond_13

    .line 396
    const-string v6, "n/a"

    .line 410
    :goto_12
    return-object v6

    .line 398
    :cond_13
    array-length v6, v5

    if-ge v6, v13, :cond_18

    .line 399
    const/4 v6, 0x0

    goto :goto_12

    .line 401
    :cond_18
    const/4 v0, 0x0

    .line 402
    .local v0, "index":I
    array-length v6, v5

    const/4 v7, 0x5

    if-ne v6, v7, :cond_2a

    aget-object v6, v5, v12

    invoke-virtual {v6}, Lcom/drew/lang/Rational;->longValue()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-nez v6, :cond_2a

    .line 403
    const/4 v0, 0x1

    .line 405
    :cond_2a
    aget-object v6, v5, v0

    invoke-virtual {v6}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v6

    mul-double/2addr v6, v10

    double-to-int v1, v6

    .line 406
    .local v1, "p1":I
    add-int/lit8 v6, v0, 0x1

    aget-object v6, v5, v6

    invoke-virtual {v6}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v6

    mul-double/2addr v6, v10

    double-to-int v2, v6

    .line 407
    .local v2, "p2":I
    add-int/lit8 v6, v0, 0x2

    aget-object v6, v5, v6

    invoke-virtual {v6}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v6

    mul-double/2addr v6, v10

    double-to-int v3, v6

    .line 408
    .local v3, "p3":I
    add-int/lit8 v6, v0, 0x3

    aget-object v6, v5, v6

    invoke-virtual {v6}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v6

    mul-double/2addr v6, v10

    double-to-int v4, v6

    .line 410
    .local v4, "p4":I
    const-string v6, "(%d%%,%d%%) (%d%%,%d%%)"

    new-array v7, v13, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v12

    const/4 v8, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    goto :goto_12
.end method

.method public getAfSearchDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 349
    const/16 v0, 0x303

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Not Ready"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Ready"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getArtFilterDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 985
    const/16 v0, 0x529

    invoke-direct {p0, v0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getFiltersDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getArtFilterEffectDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 1036
    iget-object v3, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v3, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v4, 0x52f

    invoke-virtual {v3, v4}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getIntArray(I)[I

    move-result-object v2

    .line 1037
    .local v2, "values":[I
    if-eqz v2, :cond_f

    array-length v3, v2

    if-nez v3, :cond_11

    .line 1038
    :cond_f
    const/4 v3, 0x0

    .line 1077
    :goto_10
    return-object v3

    .line 1040
    :cond_11
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 1041
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_17
    array-length v3, v2

    if-ge v0, v3, :cond_90

    .line 1042
    if-nez v0, :cond_46

    .line 1043
    sget-object v3, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    aget v4, v2, v0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_43

    sget-object v3, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_filters:Ljava/util/HashMap;

    aget v4, v2, v0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    :goto_38
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1074
    :goto_3b
    const-string v3, "; "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1041
    add-int/lit8 v0, v0, 0x1

    goto :goto_17

    .line 1043
    :cond_43
    const-string v3, "[unknown]"

    goto :goto_38

    .line 1044
    :cond_46
    const/4 v3, 0x4

    if-ne v0, v3, :cond_8a

    .line 1045
    aget v3, v2, v0

    sparse-switch v3, :sswitch_data_9e

    .line 1068
    const-string v3, "Unknown ("

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget v4, v2, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3b

    .line 1047
    :sswitch_60
    const-string v3, "No Effect"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3b

    .line 1050
    :sswitch_66
    const-string v3, "Star Light"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3b

    .line 1053
    :sswitch_6c
    const-string v3, "Pin Hole"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3b

    .line 1056
    :sswitch_72
    const-string v3, "Frame"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3b

    .line 1059
    :sswitch_78
    const-string v3, "Soft Focus"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3b

    .line 1062
    :sswitch_7e
    const-string v3, "White Edge"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3b

    .line 1065
    :sswitch_84
    const-string v3, "B&W"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3b

    .line 1072
    :cond_8a
    aget v3, v2, v0

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_3b

    .line 1077
    :cond_90
    const/4 v3, 0x0

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x2

    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_10

    .line 1045
    nop

    :sswitch_data_9e
    .sparse-switch
        0x0 -> :sswitch_60
        0x8010 -> :sswitch_66
        0x8020 -> :sswitch_6c
        0x8030 -> :sswitch_72
        0x8040 -> :sswitch_78
        0x8050 -> :sswitch_7e
        0x8060 -> :sswitch_84
    .end sparse-switch
.end method

.method public getCameraSettingsVersionDescription()Ljava/lang/String;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 180
    const/4 v0, 0x0

    const/4 v1, 0x4

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getVersionBytesDescription(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getColorSpaceDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 672
    const/16 v0, 0x507

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "sRGB"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Adobe RGB"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Pro Photo RGB"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getContrastSettingDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 660
    const/16 v0, 0x505

    invoke-direct {p0, v0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getValueMinMaxDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCustomSaturationDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 647
    const/16 v0, 0x503

    invoke-direct {p0, v0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getValueMinMaxDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDateTimeUTCDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 1281
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v2, 0x908

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getObject(I)Ljava/lang/Object;

    move-result-object v0

    .line 1282
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_e

    .line 1283
    const/4 v1, 0x0

    .line 1284
    :goto_d
    return-object v1

    :cond_e
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_d
.end method

.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 55
    sparse-switch p1, :sswitch_data_134

    .line 173
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 57
    :sswitch_8
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getCameraSettingsVersionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 59
    :sswitch_d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getPreviewImageValidDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 62
    :sswitch_12
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getExposureModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 64
    :sswitch_17
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getAeLockDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 66
    :sswitch_1c
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getMeteringModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 68
    :sswitch_21
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getExposureShiftDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 70
    :sswitch_26
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getNdFilterDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 73
    :sswitch_2b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getMacroModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 75
    :sswitch_30
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getFocusModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 77
    :sswitch_35
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getFocusProcessDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 79
    :sswitch_3a
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getAfSearchDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 81
    :sswitch_3f
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getAfAreasDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 83
    :sswitch_44
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getAfPointSelectedDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 85
    :sswitch_49
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getAfFineTuneDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 88
    :sswitch_4e
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getFlashModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 90
    :sswitch_53
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getFlashRemoteControlDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 92
    :sswitch_58
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getFlashControlModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 94
    :sswitch_5d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getFlashIntensityDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 96
    :sswitch_62
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getManualFlashStrengthDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 99
    :sswitch_67
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getWhiteBalance2Description()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 101
    :sswitch_6c
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getWhiteBalanceTemperatureDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 103
    :sswitch_71
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getCustomSaturationDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 105
    :sswitch_76
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getModifiedSaturationDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 107
    :sswitch_7b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getContrastSettingDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 109
    :sswitch_80
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getSharpnessSettingDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 111
    :sswitch_85
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getColorSpaceDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 113
    :sswitch_8b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getSceneModeDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 115
    :sswitch_91
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getNoiseReductionDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 117
    :sswitch_97
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getDistortionCorrectionDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 119
    :sswitch_9d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getShadingCompensationDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 121
    :sswitch_a3
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getGradationDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 123
    :sswitch_a9
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getPictureModeDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 125
    :sswitch_af
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getPictureModeSaturationDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 127
    :sswitch_b5
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getPictureModeContrastDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 129
    :sswitch_bb
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getPictureModeSharpnessDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 131
    :sswitch_c1
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getPictureModeBWFilterDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 133
    :sswitch_c7
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getPictureModeToneDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 135
    :sswitch_cd
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getNoiseFilterDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 137
    :sswitch_d3
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getArtFilterDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 139
    :sswitch_d9
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getMagicFilterDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 141
    :sswitch_df
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getPictureModeEffectDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 143
    :sswitch_e5
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getToneLevelDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 145
    :sswitch_eb
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getArtFilterEffectDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 148
    :sswitch_f1
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getDriveModeDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 150
    :sswitch_f7
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getPanoramaModeDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 152
    :sswitch_fd
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getImageQuality2Description()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 154
    :sswitch_103
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getImageStabilizationDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 157
    :sswitch_109
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getStackedImageDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 160
    :sswitch_10f
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getManometerPressureDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 162
    :sswitch_115
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getManometerReadingDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 164
    :sswitch_11b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getExtendedWBDetectDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 166
    :sswitch_121
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getRollAngleDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 168
    :sswitch_127
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getPitchAngleDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 170
    :sswitch_12d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getDateTimeUTCDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 55
    nop

    :sswitch_data_134
    .sparse-switch
        0x0 -> :sswitch_8
        0x100 -> :sswitch_d
        0x200 -> :sswitch_12
        0x201 -> :sswitch_17
        0x202 -> :sswitch_1c
        0x203 -> :sswitch_21
        0x204 -> :sswitch_26
        0x300 -> :sswitch_2b
        0x301 -> :sswitch_30
        0x302 -> :sswitch_35
        0x303 -> :sswitch_3a
        0x304 -> :sswitch_3f
        0x305 -> :sswitch_44
        0x306 -> :sswitch_49
        0x400 -> :sswitch_4e
        0x403 -> :sswitch_53
        0x404 -> :sswitch_58
        0x405 -> :sswitch_5d
        0x406 -> :sswitch_62
        0x500 -> :sswitch_67
        0x501 -> :sswitch_6c
        0x503 -> :sswitch_71
        0x504 -> :sswitch_76
        0x505 -> :sswitch_7b
        0x506 -> :sswitch_80
        0x507 -> :sswitch_85
        0x509 -> :sswitch_8b
        0x50a -> :sswitch_91
        0x50b -> :sswitch_97
        0x50c -> :sswitch_9d
        0x50f -> :sswitch_a3
        0x520 -> :sswitch_a9
        0x521 -> :sswitch_af
        0x523 -> :sswitch_b5
        0x524 -> :sswitch_bb
        0x525 -> :sswitch_c1
        0x526 -> :sswitch_c7
        0x527 -> :sswitch_cd
        0x529 -> :sswitch_d3
        0x52c -> :sswitch_d9
        0x52d -> :sswitch_df
        0x52e -> :sswitch_e5
        0x52f -> :sswitch_eb
        0x600 -> :sswitch_f1
        0x601 -> :sswitch_f7
        0x603 -> :sswitch_fd
        0x604 -> :sswitch_103
        0x804 -> :sswitch_109
        0x900 -> :sswitch_10f
        0x901 -> :sswitch_115
        0x902 -> :sswitch_11b
        0x903 -> :sswitch_121
        0x904 -> :sswitch_127
        0x908 -> :sswitch_12d
    .end sparse-switch
.end method

.method public getDistortionCorrectionDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 829
    const/16 v0, 0x50b

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "On"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDriveModeDescription()Ljava/lang/String;
    .registers 7
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 1087
    iget-object v3, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v3, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v4, 0x600

    invoke-virtual {v3, v4}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getIntArray(I)[I

    move-result-object v2

    .line 1088
    .local v2, "values":[I
    if-nez v2, :cond_f

    .line 1089
    const/4 v3, 0x0

    .line 1127
    :goto_e
    return-object v3

    .line 1091
    :cond_f
    array-length v3, v2

    if-eqz v3, :cond_16

    aget v3, v2, v5

    if-nez v3, :cond_19

    .line 1092
    :cond_16
    const-string v3, "Single Shot"

    goto :goto_e

    .line 1094
    :cond_19
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1096
    .local v0, "a":Ljava/lang/StringBuilder;
    aget v3, v2, v5

    const/4 v4, 0x5

    if-ne v3, v4, :cond_75

    array-length v3, v2

    const/4 v4, 0x3

    if-lt v3, v4, :cond_75

    .line 1097
    const/4 v3, 0x2

    aget v1, v2, v3

    .line 1098
    .local v1, "c":I
    and-int/lit8 v3, v1, 0x1

    if-lez v3, :cond_33

    const-string v3, "AE"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1099
    :cond_33
    shr-int/lit8 v3, v1, 0x1

    and-int/lit8 v3, v3, 0x1

    if-lez v3, :cond_3e

    const-string v3, "WB"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1100
    :cond_3e
    shr-int/lit8 v3, v1, 0x2

    and-int/lit8 v3, v3, 0x1

    if-lez v3, :cond_49

    const-string v3, "FL"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1101
    :cond_49
    shr-int/lit8 v3, v1, 0x3

    and-int/lit8 v3, v3, 0x1

    if-lez v3, :cond_54

    const-string v3, "MF"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1102
    :cond_54
    shr-int/lit8 v3, v1, 0x6

    and-int/lit8 v3, v3, 0x1

    if-lez v3, :cond_5f

    const-string v3, "Focus"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1104
    :cond_5f
    const-string v3, " Bracketing"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1125
    .end local v1    # "c":I
    :goto_64
    const-string v3, ", Shot "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v4, 0x1

    aget v4, v2, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1127
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_e

    .line 1106
    :cond_75
    aget v3, v2, v5

    packed-switch v3, :pswitch_data_a4

    .line 1120
    const-string v3, "Unknown ("

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget v4, v2, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_64

    .line 1108
    :pswitch_8c
    const-string v3, "Continuous Shooting"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_64

    .line 1111
    :pswitch_92
    const-string v3, "Exposure Bracketing"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_64

    .line 1114
    :pswitch_98
    const-string v3, "White Balance Bracketing"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_64

    .line 1117
    :pswitch_9e
    const-string v3, "Exposure+WB Bracketing"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_64

    .line 1106
    :pswitch_data_a4
    .packed-switch 0x1
        :pswitch_8c
        :pswitch_92
        :pswitch_98
        :pswitch_9e
    .end packed-switch
.end method

.method public getExposureModeDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 193
    const/16 v0, 0x200

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Manual"

    aput-object v3, v1, v2

    const-string v2, "Program"

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-string v3, "Aperture-priority AE"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Shutter speed priority"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Program-shift"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExposureShiftDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 232
    const/16 v0, 0x203

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getRationalOrDoubleString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExtendedWBDetectDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 1232
    const/16 v0, 0x902

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "On"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFlashControlModeDescription()Ljava/lang/String;
    .registers 8
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v6, 0x0

    .line 490
    iget-object v3, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v3, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v5, 0x404

    invoke-virtual {v3, v5}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getIntArray(I)[I

    move-result-object v2

    .line 491
    .local v2, "values":[I
    if-nez v2, :cond_10

    move-object v3, v4

    .line 520
    :goto_f
    return-object v3

    .line 494
    :cond_10
    array-length v3, v2

    if-nez v3, :cond_15

    move-object v3, v4

    .line 495
    goto :goto_f

    .line 497
    :cond_15
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 499
    .local v1, "sb":Ljava/lang/StringBuilder;
    aget v3, v2, v6

    packed-switch v3, :pswitch_data_60

    .line 513
    :pswitch_1f
    const-string v3, "Unknown ("

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget v4, v2, v6

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 517
    :goto_30
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_31
    array-length v3, v2

    if-ge v0, v3, :cond_5a

    .line 518
    const-string v3, "; "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget v4, v2, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 517
    add-int/lit8 v0, v0, 0x1

    goto :goto_31

    .line 501
    .end local v0    # "i":I
    :pswitch_42
    const-string v3, "Off"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_30

    .line 504
    :pswitch_48
    const-string v3, "TTL"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_30

    .line 507
    :pswitch_4e
    const-string v3, "Auto"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_30

    .line 510
    :pswitch_54
    const-string v3, "Manual"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_30

    .line 520
    .restart local v0    # "i":I
    :cond_5a
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_f

    .line 499
    nop

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_42
        :pswitch_1f
        :pswitch_1f
        :pswitch_48
        :pswitch_4e
        :pswitch_54
    .end packed-switch
.end method

.method public getFlashIntensityDescription()Ljava/lang/String;
    .registers 15
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v13, 0x3

    const/4 v12, 0x2

    const/4 v11, 0x1

    const/4 v10, 0x0

    const-wide/16 v8, 0x0

    .line 530
    iget-object v6, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v6, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v7, 0x405

    invoke-virtual {v6, v7}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getRationalArray(I)[Lcom/drew/lang/Rational;

    move-result-object v5

    .line 531
    .local v5, "values":[Lcom/drew/lang/Rational;
    if-eqz v5, :cond_15

    array-length v6, v5

    if-nez v6, :cond_17

    .line 532
    :cond_15
    const/4 v6, 0x0

    .line 546
    :goto_16
    return-object v6

    .line 534
    :cond_17
    array-length v6, v5

    if-ne v6, v13, :cond_3b

    .line 535
    aget-object v6, v5, v10

    invoke-virtual {v6}, Lcom/drew/lang/Rational;->getDenominator()J

    move-result-wide v6

    cmp-long v6, v6, v8

    if-nez v6, :cond_6a

    aget-object v6, v5, v11

    invoke-virtual {v6}, Lcom/drew/lang/Rational;->getDenominator()J

    move-result-wide v6

    cmp-long v6, v6, v8

    if-nez v6, :cond_6a

    aget-object v6, v5, v12

    invoke-virtual {v6}, Lcom/drew/lang/Rational;->getDenominator()J

    move-result-wide v6

    cmp-long v6, v6, v8

    if-nez v6, :cond_6a

    .line 536
    const-string v6, "n/a"

    goto :goto_16

    .line 537
    :cond_3b
    array-length v6, v5

    const/4 v7, 0x4

    if-ne v6, v7, :cond_6a

    .line 538
    aget-object v6, v5, v10

    invoke-virtual {v6}, Lcom/drew/lang/Rational;->getDenominator()J

    move-result-wide v6

    cmp-long v6, v6, v8

    if-nez v6, :cond_6a

    aget-object v6, v5, v11

    invoke-virtual {v6}, Lcom/drew/lang/Rational;->getDenominator()J

    move-result-wide v6

    cmp-long v6, v6, v8

    if-nez v6, :cond_6a

    aget-object v6, v5, v12

    invoke-virtual {v6}, Lcom/drew/lang/Rational;->getDenominator()J

    move-result-wide v6

    cmp-long v6, v6, v8

    if-nez v6, :cond_6a

    aget-object v6, v5, v13

    invoke-virtual {v6}, Lcom/drew/lang/Rational;->getDenominator()J

    move-result-wide v6

    cmp-long v6, v6, v8

    if-nez v6, :cond_6a

    .line 539
    const-string v6, "n/a (x4)"

    goto :goto_16

    .line 542
    :cond_6a
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 543
    .local v3, "sb":Ljava/lang/StringBuilder;
    move-object v0, v5

    .local v0, "arr$":[Lcom/drew/lang/Rational;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_72
    if-ge v1, v2, :cond_82

    aget-object v4, v0, v1

    .line 544
    .local v4, "t":Lcom/drew/lang/Rational;
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 543
    add-int/lit8 v1, v1, 0x1

    goto :goto_72

    .line 546
    .end local v4    # "t":Lcom/drew/lang/Rational;
    :cond_82
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x2

    invoke-virtual {v3, v10, v6}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v6

    goto :goto_16
.end method

.method public getFlashModeDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 423
    iget-object v3, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v3, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v4, 0x400

    invoke-virtual {v3, v4}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v2

    .line 424
    .local v2, "value":Ljava/lang/Integer;
    if-nez v2, :cond_e

    .line 425
    const/4 v3, 0x0

    .line 440
    :goto_d
    return-object v3

    .line 427
    :cond_e
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-nez v3, :cond_17

    .line 428
    const-string v3, "Off"

    goto :goto_d

    .line 430
    :cond_17
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 431
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 433
    .local v1, "v":I
    and-int/lit8 v3, v1, 0x1

    if-eqz v3, :cond_29

    const-string v3, "On, "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 434
    :cond_29
    shr-int/lit8 v3, v1, 0x1

    and-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_34

    const-string v3, "Fill-in, "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 435
    :cond_34
    shr-int/lit8 v3, v1, 0x2

    and-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_3f

    const-string v3, "Red-eye, "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 436
    :cond_3f
    shr-int/lit8 v3, v1, 0x3

    and-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_4a

    const-string v3, "Slow-sync, "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 437
    :cond_4a
    shr-int/lit8 v3, v1, 0x4

    and-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_55

    const-string v3, "Forced On, "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 438
    :cond_55
    shr-int/lit8 v3, v1, 0x5

    and-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_60

    const-string v3, "2nd Curtain, "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 440
    :cond_60
    const/4 v3, 0x0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x2

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_d
.end method

.method public getFlashRemoteControlDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 446
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v2, 0x403

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 447
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 448
    const/4 v1, 0x0

    .line 479
    :goto_d
    return-object v1

    .line 450
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    packed-switch v1, :pswitch_data_56

    .line 479
    :pswitch_15
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_d

    .line 452
    :pswitch_2f
    const-string v1, "Off"

    goto :goto_d

    .line 454
    :pswitch_32
    const-string v1, "Channel 1, Low"

    goto :goto_d

    .line 456
    :pswitch_35
    const-string v1, "Channel 2, Low"

    goto :goto_d

    .line 458
    :pswitch_38
    const-string v1, "Channel 3, Low"

    goto :goto_d

    .line 460
    :pswitch_3b
    const-string v1, "Channel 4, Low"

    goto :goto_d

    .line 462
    :pswitch_3e
    const-string v1, "Channel 1, Mid"

    goto :goto_d

    .line 464
    :pswitch_41
    const-string v1, "Channel 2, Mid"

    goto :goto_d

    .line 466
    :pswitch_44
    const-string v1, "Channel 3, Mid"

    goto :goto_d

    .line 468
    :pswitch_47
    const-string v1, "Channel 4, Mid"

    goto :goto_d

    .line 470
    :pswitch_4a
    const-string v1, "Channel 1, High"

    goto :goto_d

    .line 472
    :pswitch_4d
    const-string v1, "Channel 2, High"

    goto :goto_d

    .line 474
    :pswitch_50
    const-string v1, "Channel 3, High"

    goto :goto_d

    .line 476
    :pswitch_53
    const-string v1, "Channel 4, High"

    goto :goto_d

    .line 450
    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_2f
        :pswitch_32
        :pswitch_35
        :pswitch_38
        :pswitch_3b
        :pswitch_15
        :pswitch_15
        :pswitch_15
        :pswitch_15
        :pswitch_3e
        :pswitch_41
        :pswitch_44
        :pswitch_47
        :pswitch_15
        :pswitch_15
        :pswitch_15
        :pswitch_15
        :pswitch_4a
        :pswitch_4d
        :pswitch_50
        :pswitch_53
    .end packed-switch
.end method

.method public getFocusModeDescription()Ljava/lang/String;
    .registers 10
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/16 v8, 0x301

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 250
    iget-object v4, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v4, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    invoke-virtual {v4, v8}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getIntArray(I)[I

    move-result-object v3

    .line 251
    .local v3, "values":[I
    if-nez v3, :cond_23

    .line 253
    iget-object v4, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v4, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    invoke-virtual {v4, v8}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v1

    .line 254
    .local v1, "value":Ljava/lang/Integer;
    if-nez v1, :cond_1b

    move-object v4, v5

    .line 307
    .end local v1    # "value":Ljava/lang/Integer;
    :goto_1a
    return-object v4

    .line 257
    .restart local v1    # "value":Ljava/lang/Integer;
    :cond_1b
    new-array v3, v7, [I

    .end local v3    # "values":[I
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    aput v4, v3, v6

    .line 260
    .end local v1    # "value":Ljava/lang/Integer;
    .restart local v3    # "values":[I
    :cond_23
    array-length v4, v3

    if-nez v4, :cond_28

    move-object v4, v5

    .line 261
    goto :goto_1a

    .line 263
    :cond_28
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 264
    .local v0, "sb":Ljava/lang/StringBuilder;
    aget v4, v3, v6

    packed-switch v4, :pswitch_data_e0

    .line 284
    :pswitch_32
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unknown ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget v5, v3, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 288
    :goto_50
    array-length v4, v3

    if-le v4, v7, :cond_61

    .line 289
    const-string v4, "; "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 290
    aget v2, v3, v7

    .line 292
    .local v2, "value1":I
    if-nez v2, :cond_8a

    .line 293
    const-string v4, "(none)"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 307
    .end local v2    # "value1":I
    :cond_61
    :goto_61
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_1a

    .line 266
    :pswitch_66
    const-string v4, "Single AF"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_50

    .line 269
    :pswitch_6c
    const-string v4, "Sequential shooting AF"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_50

    .line 272
    :pswitch_72
    const-string v4, "Continuous AF"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_50

    .line 275
    :pswitch_78
    const-string v4, "Multi AF"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_50

    .line 278
    :pswitch_7e
    const-string v4, "Face detect"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_50

    .line 281
    :pswitch_84
    const-string v4, "MF"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_50

    .line 295
    .restart local v2    # "value1":I
    :cond_8a
    and-int/lit8 v4, v2, 0x1

    if-lez v4, :cond_93

    const-string v4, "S-AF, "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 296
    :cond_93
    shr-int/lit8 v4, v2, 0x2

    and-int/lit8 v4, v4, 0x1

    if-lez v4, :cond_9e

    const-string v4, "C-AF, "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 297
    :cond_9e
    shr-int/lit8 v4, v2, 0x4

    and-int/lit8 v4, v4, 0x1

    if-lez v4, :cond_a9

    const-string v4, "MF, "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    :cond_a9
    shr-int/lit8 v4, v2, 0x5

    and-int/lit8 v4, v4, 0x1

    if-lez v4, :cond_b4

    const-string v4, "Face detect, "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 299
    :cond_b4
    shr-int/lit8 v4, v2, 0x6

    and-int/lit8 v4, v4, 0x1

    if-lez v4, :cond_bf

    const-string v4, "Imager AF, "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 300
    :cond_bf
    shr-int/lit8 v4, v2, 0x7

    and-int/lit8 v4, v4, 0x1

    if-lez v4, :cond_ca

    const-string v4, "Live View Magnification Frame, "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 301
    :cond_ca
    shr-int/lit8 v4, v2, 0x8

    and-int/lit8 v4, v4, 0x1

    if-lez v4, :cond_d5

    const-string v4, "AF sensor, "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    :cond_d5
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x2

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->setLength(I)V

    goto :goto_61

    .line 264
    nop

    :pswitch_data_e0
    .packed-switch 0x0
        :pswitch_66
        :pswitch_6c
        :pswitch_72
        :pswitch_78
        :pswitch_7e
        :pswitch_32
        :pswitch_32
        :pswitch_32
        :pswitch_32
        :pswitch_32
        :pswitch_84
    .end packed-switch
.end method

.method public getFocusProcessDescription()Ljava/lang/String;
    .registers 9
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/16 v7, 0x302

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 313
    iget-object v3, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v3, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    invoke-virtual {v3, v7}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getIntArray(I)[I

    move-result-object v2

    .line 314
    .local v2, "values":[I
    if-nez v2, :cond_23

    .line 316
    iget-object v3, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v3, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    invoke-virtual {v3, v7}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v1

    .line 317
    .local v1, "value":Ljava/lang/Integer;
    if-nez v1, :cond_1b

    move-object v3, v4

    .line 343
    .end local v1    # "value":Ljava/lang/Integer;
    :goto_1a
    return-object v3

    .line 320
    .restart local v1    # "value":Ljava/lang/Integer;
    :cond_1b
    new-array v2, v6, [I

    .end local v2    # "values":[I
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput v3, v2, v5

    .line 323
    .end local v1    # "value":Ljava/lang/Integer;
    .restart local v2    # "values":[I
    :cond_23
    array-length v3, v2

    if-nez v3, :cond_28

    move-object v3, v4

    .line 324
    goto :goto_1a

    .line 326
    :cond_28
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 328
    .local v0, "sb":Ljava/lang/StringBuilder;
    aget v3, v2, v5

    packed-switch v3, :pswitch_data_7c

    .line 336
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget v4, v2, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 340
    :goto_50
    array-length v3, v2

    if-le v3, v6, :cond_6b

    .line 341
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "; "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget v4, v2, v6

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 343
    :cond_6b
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_1a

    .line 330
    :pswitch_70
    const-string v3, "AF not used"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_50

    .line 333
    :pswitch_76
    const-string v3, "AF used"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_50

    .line 328
    :pswitch_data_7c
    .packed-switch 0x0
        :pswitch_70
        :pswitch_76
    .end packed-switch
.end method

.method public getGradationDescription()Ljava/lang/String;
    .registers 11
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x0

    const/4 v7, 0x1

    const/4 v6, 0x3

    .line 845
    iget-object v3, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v3, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v4, 0x50f

    invoke-virtual {v3, v4}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getIntArray(I)[I

    move-result-object v2

    .line 846
    .local v2, "values":[I
    if-eqz v2, :cond_13

    array-length v3, v2

    if-ge v3, v6, :cond_15

    .line 847
    :cond_13
    const/4 v1, 0x0

    .line 871
    :cond_14
    :goto_14
    return-object v1

    .line 849
    :cond_15
    const-string v3, "%d %d %d"

    new-array v4, v6, [Ljava/lang/Object;

    aget v5, v2, v8

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v8

    aget v5, v2, v7

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    aget v5, v2, v9

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v9

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 852
    .local v0, "join":Ljava/lang/String;
    const-string v3, "0 0 0"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5a

    .line 853
    const-string v1, "n/a"

    .line 864
    .local v1, "ret":Ljava/lang/String;
    :goto_3f
    array-length v3, v2

    if-le v3, v6, :cond_14

    .line 865
    aget v3, v2, v6

    if-nez v3, :cond_95

    .line 866
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; User-Selected"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_14

    .line 854
    .end local v1    # "ret":Ljava/lang/String;
    :cond_5a
    const-string v3, "-1 -1 1"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_65

    .line 855
    const-string v1, "Low Key"

    .restart local v1    # "ret":Ljava/lang/String;
    goto :goto_3f

    .line 856
    .end local v1    # "ret":Ljava/lang/String;
    :cond_65
    const-string v3, "0 -1 1"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_70

    .line 857
    const-string v1, "Normal"

    .restart local v1    # "ret":Ljava/lang/String;
    goto :goto_3f

    .line 858
    .end local v1    # "ret":Ljava/lang/String;
    :cond_70
    const-string v3, "1 -1 1"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7b

    .line 859
    const-string v1, "High Key"

    .restart local v1    # "ret":Ljava/lang/String;
    goto :goto_3f

    .line 861
    .end local v1    # "ret":Ljava/lang/String;
    :cond_7b
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "ret":Ljava/lang/String;
    goto :goto_3f

    .line 867
    :cond_95
    aget v3, v2, v6

    if-ne v3, v7, :cond_14

    .line 868
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; Auto-Override"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_14
.end method

.method public getImageQuality2Description()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 1169
    const/16 v0, 0x603

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "SQ"

    aput-object v3, v1, v2

    const-string v2, "HQ"

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-string v3, "SHQ"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "RAW"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "SQ (5)"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getImageStabilizationDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 1176
    const/16 v0, 0x604

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "On, Mode 1"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "On, Mode 2"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "On, Mode 3"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "On, Mode 4"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMacroModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 244
    const/16 v0, 0x300

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "On"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Super Macro"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMagicFilterDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 991
    const/16 v0, 0x52c

    invoke-direct {p0, v0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getFiltersDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getManometerPressureDescription()Ljava/lang/String;
    .registers 10
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 1205
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v2, 0x900

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 1206
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 1207
    const/4 v1, 0x0

    .line 1209
    :goto_d
    return-object v1

    :cond_e
    const-string v1, "%s kPa"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    new-instance v4, Ljava/text/DecimalFormat;

    const-string v5, "#.##"

    invoke-direct {v4, v5}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-double v5, v5

    const-wide/high16 v7, 0x4024000000000000L    # 10.0

    div-double/2addr v5, v7

    invoke-virtual {v4, v5, v6}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_d
.end method

.method public getManometerReadingDescription()Ljava/lang/String;
    .registers 11
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    const-wide/high16 v6, 0x4024000000000000L    # 10.0

    .line 1219
    iget-object v2, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v3, 0x901

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getIntArray(I)[I

    move-result-object v1

    .line 1220
    .local v1, "values":[I
    if-eqz v1, :cond_14

    array-length v2, v1

    if-ge v2, v4, :cond_16

    .line 1221
    :cond_14
    const/4 v2, 0x0

    .line 1224
    :goto_15
    return-object v2

    .line 1223
    :cond_16
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v2, "#.##"

    invoke-direct {v0, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 1224
    .local v0, "format":Ljava/text/DecimalFormat;
    const-string v2, "%s m, %s ft"

    new-array v3, v4, [Ljava/lang/Object;

    aget v4, v1, v8

    int-to-double v4, v4

    div-double/2addr v4, v6

    invoke-virtual {v0, v4, v5}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v8

    aget v4, v1, v9

    int-to-double v4, v4

    div-double/2addr v4, v6

    invoke-virtual {v0, v4, v5}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v9

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_15
.end method

.method public getManualFlashStrengthDescription()Ljava/lang/String;
    .registers 15
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v13, 0x3

    const/4 v12, 0x2

    const/4 v11, 0x1

    const/4 v10, 0x0

    const-wide/16 v8, 0x0

    .line 552
    iget-object v6, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v6, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v7, 0x406

    invoke-virtual {v6, v7}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getRationalArray(I)[Lcom/drew/lang/Rational;

    move-result-object v5

    .line 553
    .local v5, "values":[Lcom/drew/lang/Rational;
    if-eqz v5, :cond_15

    array-length v6, v5

    if-nez v6, :cond_18

    .line 554
    :cond_15
    const-string v6, "n/a"

    .line 568
    :goto_17
    return-object v6

    .line 556
    :cond_18
    array-length v6, v5

    if-ne v6, v13, :cond_3c

    .line 557
    aget-object v6, v5, v10

    invoke-virtual {v6}, Lcom/drew/lang/Rational;->getDenominator()J

    move-result-wide v6

    cmp-long v6, v6, v8

    if-nez v6, :cond_6b

    aget-object v6, v5, v11

    invoke-virtual {v6}, Lcom/drew/lang/Rational;->getDenominator()J

    move-result-wide v6

    cmp-long v6, v6, v8

    if-nez v6, :cond_6b

    aget-object v6, v5, v12

    invoke-virtual {v6}, Lcom/drew/lang/Rational;->getDenominator()J

    move-result-wide v6

    cmp-long v6, v6, v8

    if-nez v6, :cond_6b

    .line 558
    const-string v6, "n/a"

    goto :goto_17

    .line 559
    :cond_3c
    array-length v6, v5

    const/4 v7, 0x4

    if-ne v6, v7, :cond_6b

    .line 560
    aget-object v6, v5, v10

    invoke-virtual {v6}, Lcom/drew/lang/Rational;->getDenominator()J

    move-result-wide v6

    cmp-long v6, v6, v8

    if-nez v6, :cond_6b

    aget-object v6, v5, v11

    invoke-virtual {v6}, Lcom/drew/lang/Rational;->getDenominator()J

    move-result-wide v6

    cmp-long v6, v6, v8

    if-nez v6, :cond_6b

    aget-object v6, v5, v12

    invoke-virtual {v6}, Lcom/drew/lang/Rational;->getDenominator()J

    move-result-wide v6

    cmp-long v6, v6, v8

    if-nez v6, :cond_6b

    aget-object v6, v5, v13

    invoke-virtual {v6}, Lcom/drew/lang/Rational;->getDenominator()J

    move-result-wide v6

    cmp-long v6, v6, v8

    if-nez v6, :cond_6b

    .line 561
    const-string v6, "n/a (x4)"

    goto :goto_17

    .line 564
    :cond_6b
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 565
    .local v3, "sb":Ljava/lang/StringBuilder;
    move-object v0, v5

    .local v0, "arr$":[Lcom/drew/lang/Rational;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_73
    if-ge v1, v2, :cond_83

    aget-object v4, v0, v1

    .line 566
    .local v4, "t":Lcom/drew/lang/Rational;
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 565
    add-int/lit8 v1, v1, 0x1

    goto :goto_73

    .line 568
    .end local v4    # "t":Lcom/drew/lang/Rational;
    :cond_83
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x2

    invoke-virtual {v3, v10, v6}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v6

    goto :goto_17
.end method

.method public getMeteringModeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 207
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v2, 0x202

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 208
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 209
    const/4 v1, 0x0

    .line 225
    :goto_d
    return-object v1

    .line 211
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_42

    .line 225
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_d

    .line 213
    :sswitch_2f
    const-string v1, "Center-weighted average"

    goto :goto_d

    .line 215
    :sswitch_32
    const-string v1, "Spot"

    goto :goto_d

    .line 217
    :sswitch_35
    const-string v1, "ESP"

    goto :goto_d

    .line 219
    :sswitch_38
    const-string v1, "Pattern+AF"

    goto :goto_d

    .line 221
    :sswitch_3b
    const-string v1, "Spot+Highlight control"

    goto :goto_d

    .line 223
    :sswitch_3e
    const-string v1, "Spot+Shadow control"

    goto :goto_d

    .line 211
    nop

    :sswitch_data_42
    .sparse-switch
        0x2 -> :sswitch_2f
        0x3 -> :sswitch_32
        0x5 -> :sswitch_35
        0x105 -> :sswitch_38
        0x203 -> :sswitch_3b
        0x403 -> :sswitch_3e
    .end sparse-switch
.end method

.method public getModifiedSaturationDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 653
    const/16 v0, 0x504

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "CM1 (Red Enhance)"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "CM2 (Green Enhance)"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "CM3 (Blue Enhance)"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "CM4 (Skin Tones)"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNdFilterDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 238
    const/16 v0, 0x204

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "On"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNoiseFilterDescription()Ljava/lang/String;
    .registers 9
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 963
    iget-object v2, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v3, 0x527

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getIntArray(I)[I

    move-result-object v1

    .line 964
    .local v1, "values":[I
    if-nez v1, :cond_11

    .line 965
    const/4 v2, 0x0

    .line 979
    :goto_10
    return-object v2

    .line 967
    :cond_11
    const-string v2, "%d %d %d"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    aget v4, v1, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    aget v4, v1, v6

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    aget v4, v1, v7

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 969
    .local v0, "join":Ljava/lang/String;
    const-string v2, "0 0 0"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3d

    .line 970
    const-string v2, "n/a"

    goto :goto_10

    .line 971
    :cond_3d
    const-string v2, "-2 -2 1"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_48

    .line 972
    const-string v2, "Off"

    goto :goto_10

    .line 973
    :cond_48
    const-string v2, "-1 -2 1"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_53

    .line 974
    const-string v2, "Low"

    goto :goto_10

    .line 975
    :cond_53
    const-string v2, "0 -2 1"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5e

    .line 976
    const-string v2, "Standard"

    goto :goto_10

    .line 977
    :cond_5e
    const-string v2, "1 -2 1"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_69

    .line 978
    const-string v2, "High"

    goto :goto_10

    .line 979
    :cond_69
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_10
.end method

.method public getNoiseReductionDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 806
    iget-object v3, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v3, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v4, 0x50a

    invoke-virtual {v3, v4}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v2

    .line 807
    .local v2, "value":Ljava/lang/Integer;
    if-nez v2, :cond_e

    .line 808
    const/4 v3, 0x0

    .line 821
    :goto_d
    return-object v3

    .line 810
    :cond_e
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-nez v3, :cond_17

    .line 811
    const-string v3, "(none)"

    goto :goto_d

    .line 813
    :cond_17
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 814
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 816
    .local v1, "v":I
    and-int/lit8 v3, v1, 0x1

    if-eqz v3, :cond_29

    const-string v3, "Noise Reduction, "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 817
    :cond_29
    shr-int/lit8 v3, v1, 0x1

    and-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_34

    const-string v3, "Noise Filter, "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 818
    :cond_34
    shr-int/lit8 v3, v1, 0x2

    and-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_3f

    const-string v3, "Noise Filter (ISO Boost), "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 819
    :cond_3f
    shr-int/lit8 v3, v1, 0x3

    and-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_4a

    const-string v3, "Auto, "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 821
    :cond_4a
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-eqz v3, :cond_5c

    const/4 v3, 0x0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x2

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_d

    :cond_5c
    const-string v3, "(none)"

    goto :goto_d
.end method

.method public getPanoramaModeDescription()Ljava/lang/String;
    .registers 7
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1137
    iget-object v2, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v3, 0x601

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getIntArray(I)[I

    move-result-object v1

    .line 1138
    .local v1, "values":[I
    if-nez v1, :cond_10

    .line 1139
    const/4 v2, 0x0

    .line 1163
    :goto_f
    return-object v2

    .line 1141
    :cond_10
    array-length v2, v1

    if-eqz v2, :cond_17

    aget v2, v1, v4

    if-nez v2, :cond_1a

    .line 1142
    :cond_17
    const-string v2, "Off"

    goto :goto_f

    .line 1145
    :cond_1a
    aget v2, v1, v4

    packed-switch v2, :pswitch_data_5a

    .line 1159
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget v3, v1, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1163
    .local v0, "a":Ljava/lang/String;
    :goto_3a
    const-string v2, "%s, Shot %d"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v4

    aget v4, v1, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_f

    .line 1147
    .end local v0    # "a":Ljava/lang/String;
    :pswitch_4e
    const-string v0, "Left to Right"

    .line 1148
    .restart local v0    # "a":Ljava/lang/String;
    goto :goto_3a

    .line 1150
    .end local v0    # "a":Ljava/lang/String;
    :pswitch_51
    const-string v0, "Right to Left"

    .line 1151
    .restart local v0    # "a":Ljava/lang/String;
    goto :goto_3a

    .line 1153
    .end local v0    # "a":Ljava/lang/String;
    :pswitch_54
    const-string v0, "Bottom to Top"

    .line 1154
    .restart local v0    # "a":Ljava/lang/String;
    goto :goto_3a

    .line 1156
    .end local v0    # "a":Ljava/lang/String;
    :pswitch_57
    const-string v0, "Top to Bottom"

    .line 1157
    .restart local v0    # "a":Ljava/lang/String;
    goto :goto_3a

    .line 1145
    :pswitch_data_5a
    .packed-switch 0x1
        :pswitch_4e
        :pswitch_51
        :pswitch_54
        :pswitch_57
    .end packed-switch
.end method

.method public getPictureModeBWFilterDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 949
    const/16 v0, 0x525

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "n/a"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Neutral"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Yellow"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Orange"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Red"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "Green"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPictureModeContrastDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 937
    const/16 v0, 0x523

    invoke-direct {p0, v0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getValueMinMaxDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPictureModeDescription()Ljava/lang/String;
    .registers 9
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 881
    iget-object v3, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v3, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v5, 0x520

    invoke-virtual {v3, v5}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getIntArray(I)[I

    move-result-object v2

    .line 882
    .local v2, "values":[I
    if-nez v2, :cond_25

    .line 884
    iget-object v3, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v3, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v5, 0x50a

    invoke-virtual {v3, v5}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v1

    .line 885
    .local v1, "value":Ljava/lang/Integer;
    if-nez v1, :cond_1d

    move-object v3, v4

    .line 925
    .end local v1    # "value":Ljava/lang/Integer;
    :goto_1c
    return-object v3

    .line 888
    .restart local v1    # "value":Ljava/lang/Integer;
    :cond_1d
    new-array v2, v7, [I

    .end local v2    # "values":[I
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput v3, v2, v6

    .line 891
    .end local v1    # "value":Ljava/lang/Integer;
    .restart local v2    # "values":[I
    :cond_25
    array-length v3, v2

    if-nez v3, :cond_2a

    move-object v3, v4

    .line 892
    goto :goto_1c

    .line 894
    :cond_2a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 895
    .local v0, "sb":Ljava/lang/StringBuilder;
    aget v3, v2, v6

    sparse-switch v3, :sswitch_data_82

    .line 918
    const-string v3, "Unknown ("

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget v4, v2, v6

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 922
    :goto_45
    array-length v3, v2

    if-le v3, v7, :cond_53

    .line 923
    const-string v3, "; "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget v4, v2, v7

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 925
    :cond_53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_1c

    .line 897
    :sswitch_58
    const-string v3, "Vivid"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_45

    .line 900
    :sswitch_5e
    const-string v3, "Natural"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_45

    .line 903
    :sswitch_64
    const-string v3, "Muted"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_45

    .line 906
    :sswitch_6a
    const-string v3, "Portrait"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_45

    .line 909
    :sswitch_70
    const-string v3, "i-Enhance"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_45

    .line 912
    :sswitch_76
    const-string v3, "Monotone"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_45

    .line 915
    :sswitch_7c
    const-string v3, "Sepia"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_45

    .line 895
    :sswitch_data_82
    .sparse-switch
        0x1 -> :sswitch_58
        0x2 -> :sswitch_5e
        0x3 -> :sswitch_64
        0x4 -> :sswitch_6a
        0x5 -> :sswitch_70
        0x100 -> :sswitch_76
        0x200 -> :sswitch_7c
    .end sparse-switch
.end method

.method public getPictureModeEffectDescription()Ljava/lang/String;
    .registers 9
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 997
    iget-object v2, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v3, 0x52d

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getIntArray(I)[I

    move-result-object v1

    .line 998
    .local v1, "values":[I
    if-nez v1, :cond_11

    .line 999
    const/4 v2, 0x0

    .line 1010
    :goto_10
    return-object v2

    .line 1001
    :cond_11
    const-string v2, "%d %d %d"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    aget v4, v1, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    aget v4, v1, v6

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    aget v4, v1, v7

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1002
    .local v0, "key":Ljava/lang/String;
    const-string v2, "0 0 0"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3d

    .line 1003
    const-string v2, "n/a"

    goto :goto_10

    .line 1004
    :cond_3d
    const-string v2, "-1 -1 1"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_48

    .line 1005
    const-string v2, "Low"

    goto :goto_10

    .line 1006
    :cond_48
    const-string v2, "0 -1 1"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_53

    .line 1007
    const-string v2, "Standard"

    goto :goto_10

    .line 1008
    :cond_53
    const-string v2, "1 -1 1"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5e

    .line 1009
    const-string v2, "High"

    goto :goto_10

    .line 1010
    :cond_5e
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_10
.end method

.method public getPictureModeSaturationDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 931
    const/16 v0, 0x521

    invoke-direct {p0, v0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getValueMinMaxDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPictureModeSharpnessDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 943
    const/16 v0, 0x524

    invoke-direct {p0, v0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getValueMinMaxDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPictureModeToneDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 956
    const/16 v0, 0x526

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "n/a"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Neutral"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Sepia"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Blue"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Purple"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "Green"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPitchAngleDescription()Ljava/lang/String;
    .registers 10
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 1266
    iget-object v2, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v3, 0x904

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getIntArray(I)[I

    move-result-object v1

    .line 1267
    .local v1, "values":[I
    if-eqz v1, :cond_12

    array-length v2, v1

    if-ge v2, v8, :cond_14

    .line 1268
    :cond_12
    const/4 v2, 0x0

    .line 1275
    :goto_13
    return-object v2

    .line 1271
    :cond_14
    aget v2, v1, v6

    if-eqz v2, :cond_35

    aget v2, v1, v6

    int-to-double v2, v2

    const-wide/high16 v4, 0x4024000000000000L    # 10.0

    div-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v0

    .line 1275
    .local v0, "ret":Ljava/lang/String;
    :goto_22
    const-string v2, "%s %d"

    new-array v3, v8, [Ljava/lang/Object;

    aput-object v0, v3, v6

    aget v4, v1, v7

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_13

    .line 1271
    .end local v0    # "ret":Ljava/lang/String;
    :cond_35
    const-string v0, "n/a"

    goto :goto_22
.end method

.method public getPreviewImageValidDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 186
    const/16 v0, 0x100

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "No"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Yes"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRollAngleDescription()Ljava/lang/String;
    .registers 10
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 1245
    iget-object v2, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v3, 0x903

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getIntArray(I)[I

    move-result-object v1

    .line 1246
    .local v1, "values":[I
    if-eqz v1, :cond_12

    array-length v2, v1

    if-ge v2, v8, :cond_14

    .line 1247
    :cond_12
    const/4 v2, 0x0

    .line 1253
    :goto_13
    return-object v2

    .line 1249
    :cond_14
    aget v2, v1, v6

    if-eqz v2, :cond_36

    aget v2, v1, v6

    neg-int v2, v2

    int-to-double v2, v2

    const-wide/high16 v4, 0x4024000000000000L    # 10.0

    div-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v0

    .line 1253
    .local v0, "ret":Ljava/lang/String;
    :goto_23
    const-string v2, "%s %d"

    new-array v3, v8, [Ljava/lang/Object;

    aput-object v0, v3, v6

    aget v4, v1, v7

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_13

    .line 1249
    .end local v0    # "ret":Ljava/lang/String;
    :cond_36
    const-string v0, "n/a"

    goto :goto_23
.end method

.method public getSceneModeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 679
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v2, 0x509

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 680
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 681
    const/4 v1, 0x0

    .line 799
    :goto_d
    return-object v1

    .line 683
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_f4

    .line 799
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_d

    .line 685
    :sswitch_2f
    const-string v1, "Standard"

    goto :goto_d

    .line 687
    :sswitch_32
    const-string v1, "Auto"

    goto :goto_d

    .line 689
    :sswitch_35
    const-string v1, "Sport"

    goto :goto_d

    .line 691
    :sswitch_38
    const-string v1, "Portrait"

    goto :goto_d

    .line 693
    :sswitch_3b
    const-string v1, "Landscape+Portrait"

    goto :goto_d

    .line 695
    :sswitch_3e
    const-string v1, "Landscape"

    goto :goto_d

    .line 697
    :sswitch_41
    const-string v1, "Night Scene"

    goto :goto_d

    .line 699
    :sswitch_44
    const-string v1, "Self Portrait"

    goto :goto_d

    .line 701
    :sswitch_47
    const-string v1, "Panorama"

    goto :goto_d

    .line 703
    :sswitch_4a
    const-string v1, "2 in 1"

    goto :goto_d

    .line 705
    :sswitch_4d
    const-string v1, "Movie"

    goto :goto_d

    .line 707
    :sswitch_50
    const-string v1, "Landscape+Portrait"

    goto :goto_d

    .line 709
    :sswitch_53
    const-string v1, "Night+Portrait"

    goto :goto_d

    .line 711
    :sswitch_56
    const-string v1, "Indoor"

    goto :goto_d

    .line 713
    :sswitch_59
    const-string v1, "Fireworks"

    goto :goto_d

    .line 715
    :sswitch_5c
    const-string v1, "Sunset"

    goto :goto_d

    .line 717
    :sswitch_5f
    const-string v1, "Beauty Skin"

    goto :goto_d

    .line 719
    :sswitch_62
    const-string v1, "Macro"

    goto :goto_d

    .line 721
    :sswitch_65
    const-string v1, "Super Macro"

    goto :goto_d

    .line 723
    :sswitch_68
    const-string v1, "Food"

    goto :goto_d

    .line 725
    :sswitch_6b
    const-string v1, "Documents"

    goto :goto_d

    .line 727
    :sswitch_6e
    const-string v1, "Museum"

    goto :goto_d

    .line 729
    :sswitch_71
    const-string v1, "Shoot & Select"

    goto :goto_d

    .line 731
    :sswitch_74
    const-string v1, "Beach & Snow"

    goto :goto_d

    .line 733
    :sswitch_77
    const-string v1, "Self Portrait+Timer"

    goto :goto_d

    .line 735
    :sswitch_7a
    const-string v1, "Candle"

    goto :goto_d

    .line 737
    :sswitch_7d
    const-string v1, "Available Light"

    goto :goto_d

    .line 739
    :sswitch_80
    const-string v1, "Behind Glass"

    goto :goto_d

    .line 741
    :sswitch_83
    const-string v1, "My Mode"

    goto :goto_d

    .line 743
    :sswitch_86
    const-string v1, "Pet"

    goto :goto_d

    .line 745
    :sswitch_89
    const-string v1, "Underwater Wide1"

    goto :goto_d

    .line 747
    :sswitch_8c
    const-string v1, "Underwater Macro"

    goto/16 :goto_d

    .line 749
    :sswitch_90
    const-string v1, "Shoot & Select1"

    goto/16 :goto_d

    .line 751
    :sswitch_94
    const-string v1, "Shoot & Select2"

    goto/16 :goto_d

    .line 753
    :sswitch_98
    const-string v1, "High Key"

    goto/16 :goto_d

    .line 755
    :sswitch_9c
    const-string v1, "Digital Image Stabilization"

    goto/16 :goto_d

    .line 757
    :sswitch_a0
    const-string v1, "Auction"

    goto/16 :goto_d

    .line 759
    :sswitch_a4
    const-string v1, "Beach"

    goto/16 :goto_d

    .line 761
    :sswitch_a8
    const-string v1, "Snow"

    goto/16 :goto_d

    .line 763
    :sswitch_ac
    const-string v1, "Underwater Wide2"

    goto/16 :goto_d

    .line 765
    :sswitch_b0
    const-string v1, "Low Key"

    goto/16 :goto_d

    .line 767
    :sswitch_b4
    const-string v1, "Children"

    goto/16 :goto_d

    .line 769
    :sswitch_b8
    const-string v1, "Vivid"

    goto/16 :goto_d

    .line 771
    :sswitch_bc
    const-string v1, "Nature Macro"

    goto/16 :goto_d

    .line 773
    :sswitch_c0
    const-string v1, "Underwater Snapshot"

    goto/16 :goto_d

    .line 775
    :sswitch_c4
    const-string v1, "Shooting Guide"

    goto/16 :goto_d

    .line 777
    :sswitch_c8
    const-string v1, "Face Portrait"

    goto/16 :goto_d

    .line 779
    :sswitch_cc
    const-string v1, "Bulb"

    goto/16 :goto_d

    .line 781
    :sswitch_d0
    const-string v1, "Smile Shot"

    goto/16 :goto_d

    .line 783
    :sswitch_d4
    const-string v1, "Quick Shutter"

    goto/16 :goto_d

    .line 785
    :sswitch_d8
    const-string v1, "Slow Shutter"

    goto/16 :goto_d

    .line 787
    :sswitch_dc
    const-string v1, "Bird Watching"

    goto/16 :goto_d

    .line 789
    :sswitch_e0
    const-string v1, "Multiple Exposure"

    goto/16 :goto_d

    .line 791
    :sswitch_e4
    const-string v1, "e-Portrait"

    goto/16 :goto_d

    .line 793
    :sswitch_e8
    const-string v1, "Soft Background Shot"

    goto/16 :goto_d

    .line 795
    :sswitch_ec
    const-string v1, "Hand-held Starlight"

    goto/16 :goto_d

    .line 797
    :sswitch_f0
    const-string v1, "HDR"

    goto/16 :goto_d

    .line 683
    :sswitch_data_f4
    .sparse-switch
        0x0 -> :sswitch_2f
        0x6 -> :sswitch_32
        0x7 -> :sswitch_35
        0x8 -> :sswitch_38
        0x9 -> :sswitch_3b
        0xa -> :sswitch_3e
        0xb -> :sswitch_41
        0xc -> :sswitch_44
        0xd -> :sswitch_47
        0xe -> :sswitch_4a
        0xf -> :sswitch_4d
        0x10 -> :sswitch_50
        0x11 -> :sswitch_53
        0x12 -> :sswitch_56
        0x13 -> :sswitch_59
        0x14 -> :sswitch_5c
        0x15 -> :sswitch_5f
        0x16 -> :sswitch_62
        0x17 -> :sswitch_65
        0x18 -> :sswitch_68
        0x19 -> :sswitch_6b
        0x1a -> :sswitch_6e
        0x1b -> :sswitch_71
        0x1c -> :sswitch_74
        0x1d -> :sswitch_77
        0x1e -> :sswitch_7a
        0x1f -> :sswitch_7d
        0x20 -> :sswitch_80
        0x21 -> :sswitch_83
        0x22 -> :sswitch_86
        0x23 -> :sswitch_89
        0x24 -> :sswitch_8c
        0x25 -> :sswitch_90
        0x26 -> :sswitch_94
        0x27 -> :sswitch_98
        0x28 -> :sswitch_9c
        0x29 -> :sswitch_a0
        0x2a -> :sswitch_a4
        0x2b -> :sswitch_a8
        0x2c -> :sswitch_ac
        0x2d -> :sswitch_b0
        0x2e -> :sswitch_b4
        0x2f -> :sswitch_b8
        0x30 -> :sswitch_bc
        0x31 -> :sswitch_c0
        0x32 -> :sswitch_c4
        0x36 -> :sswitch_c8
        0x39 -> :sswitch_cc
        0x3b -> :sswitch_d0
        0x3c -> :sswitch_d4
        0x3f -> :sswitch_d8
        0x40 -> :sswitch_dc
        0x41 -> :sswitch_e0
        0x42 -> :sswitch_e4
        0x43 -> :sswitch_e8
        0x8e -> :sswitch_ec
        0x9a -> :sswitch_f0
    .end sparse-switch
.end method

.method public getShadingCompensationDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 835
    const/16 v0, 0x50c

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "On"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSharpnessSettingDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 666
    const/16 v0, 0x506

    invoke-direct {p0, v0}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->getValueMinMaxDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStackedImageDescription()Ljava/lang/String;
    .registers 9
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v5, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 1183
    iget-object v3, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v3, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v4, 0x804

    invoke-virtual {v3, v4}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getIntArray(I)[I

    move-result-object v2

    .line 1184
    .local v2, "values":[I
    if-eqz v2, :cond_12

    array-length v3, v2

    if-ge v3, v5, :cond_14

    .line 1185
    :cond_12
    const/4 v3, 0x0

    .line 1195
    :goto_13
    return-object v3

    .line 1187
    :cond_14
    aget v0, v2, v6

    .line 1188
    .local v0, "v1":I
    aget v1, v2, v7

    .line 1190
    .local v1, "v2":I
    if-nez v0, :cond_1f

    if-nez v1, :cond_1f

    .line 1191
    const-string v3, "No"

    goto :goto_13

    .line 1192
    :cond_1f
    const/16 v3, 0x9

    if-ne v0, v3, :cond_2a

    const/16 v3, 0x8

    if-ne v1, v3, :cond_2a

    .line 1193
    const-string v3, "Focus-stacked (8 images)"

    goto :goto_13

    .line 1195
    :cond_2a
    const-string v3, "Unknown (%d %d)"

    new-array v4, v5, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_13
.end method

.method public getToneLevelDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 1016
    iget-object v3, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v3, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v4, 0x52e

    invoke-virtual {v3, v4}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getIntArray(I)[I

    move-result-object v2

    .line 1017
    .local v2, "values":[I
    if-eqz v2, :cond_f

    array-length v3, v2

    if-nez v3, :cond_11

    .line 1018
    :cond_f
    const/4 v3, 0x0

    .line 1030
    :goto_10
    return-object v3

    .line 1020
    :cond_11
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 1021
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_17
    array-length v3, v2

    if-ge v0, v3, :cond_39

    .line 1022
    const/4 v3, 0x1

    if-ne v0, v3, :cond_30

    .line 1023
    const-string v3, "Highlights "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1027
    :cond_22
    :goto_22
    aget v3, v2, v0

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1021
    add-int/lit8 v0, v0, 0x1

    goto :goto_17

    .line 1024
    :cond_30
    const/4 v3, 0x5

    if-ne v0, v3, :cond_22

    .line 1025
    const-string v3, "Shadows "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_22

    .line 1030
    :cond_39
    const/4 v3, 0x0

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x2

    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_10
.end method

.method public getWhiteBalance2Description()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 574
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v2, 0x500

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 575
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 576
    const/4 v1, 0x0

    .line 626
    :goto_d
    return-object v1

    .line 578
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_74

    .line 626
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_d

    .line 580
    :sswitch_2f
    const-string v1, "Auto"

    goto :goto_d

    .line 582
    :sswitch_32
    const-string v1, "Auto (Keep Warm Color Off)"

    goto :goto_d

    .line 584
    :sswitch_35
    const-string v1, "7500K (Fine Weather with Shade)"

    goto :goto_d

    .line 586
    :sswitch_38
    const-string v1, "6000K (Cloudy)"

    goto :goto_d

    .line 588
    :sswitch_3b
    const-string v1, "5300K (Fine Weather)"

    goto :goto_d

    .line 590
    :sswitch_3e
    const-string v1, "3000K (Tungsten light)"

    goto :goto_d

    .line 592
    :sswitch_41
    const-string v1, "3600K (Tungsten light-like)"

    goto :goto_d

    .line 594
    :sswitch_44
    const-string v1, "Auto Setup"

    goto :goto_d

    .line 596
    :sswitch_47
    const-string v1, "5500K (Flash)"

    goto :goto_d

    .line 598
    :sswitch_4a
    const-string v1, "6600K (Daylight fluorescent)"

    goto :goto_d

    .line 600
    :sswitch_4d
    const-string v1, "4500K (Neutral white fluorescent)"

    goto :goto_d

    .line 602
    :sswitch_50
    const-string v1, "4000K (Cool white fluorescent)"

    goto :goto_d

    .line 604
    :sswitch_53
    const-string v1, "White Fluorescent"

    goto :goto_d

    .line 606
    :sswitch_56
    const-string v1, "3600K (Tungsten light-like)"

    goto :goto_d

    .line 608
    :sswitch_59
    const-string v1, "Underwater"

    goto :goto_d

    .line 610
    :sswitch_5c
    const-string v1, "One Touch WB 1"

    goto :goto_d

    .line 612
    :sswitch_5f
    const-string v1, "One Touch WB 2"

    goto :goto_d

    .line 614
    :sswitch_62
    const-string v1, "One Touch WB 3"

    goto :goto_d

    .line 616
    :sswitch_65
    const-string v1, "One Touch WB 4"

    goto :goto_d

    .line 618
    :sswitch_68
    const-string v1, "Custom WB 1"

    goto :goto_d

    .line 620
    :sswitch_6b
    const-string v1, "Custom WB 2"

    goto :goto_d

    .line 622
    :sswitch_6e
    const-string v1, "Custom WB 3"

    goto :goto_d

    .line 624
    :sswitch_71
    const-string v1, "Custom WB 4"

    goto :goto_d

    .line 578
    :sswitch_data_74
    .sparse-switch
        0x0 -> :sswitch_2f
        0x1 -> :sswitch_32
        0x10 -> :sswitch_35
        0x11 -> :sswitch_38
        0x12 -> :sswitch_3b
        0x14 -> :sswitch_3e
        0x15 -> :sswitch_41
        0x16 -> :sswitch_44
        0x17 -> :sswitch_47
        0x21 -> :sswitch_4a
        0x22 -> :sswitch_4d
        0x23 -> :sswitch_50
        0x24 -> :sswitch_53
        0x30 -> :sswitch_56
        0x43 -> :sswitch_59
        0x100 -> :sswitch_5c
        0x101 -> :sswitch_5f
        0x102 -> :sswitch_62
        0x103 -> :sswitch_65
        0x200 -> :sswitch_68
        0x201 -> :sswitch_6b
        0x202 -> :sswitch_6e
        0x203 -> :sswitch_71
    .end sparse-switch
.end method

.method public getWhiteBalanceTemperatureDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 633
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;

    const/16 v2, 0x501

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/OlympusCameraSettingsMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 634
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 635
    const/4 v1, 0x0

    .line 638
    :goto_d
    return-object v1

    .line 636
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-nez v1, :cond_17

    .line 637
    const-string v1, "Auto"

    goto :goto_d

    .line 638
    :cond_17
    invoke-virtual {v0}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_d
.end method

.class public Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "OlympusEquipmentMakernoteDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;",
        ">;"
    }
.end annotation


# static fields
.field private static final _olympusExtenderTypes:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final _olympusLensTypes:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 250
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    .line 251
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusExtenderTypes:Ljava/util/HashMap;

    .line 254
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 00 00"

    const-string v2, "None"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 01 00"

    const-string v2, "Olympus Zuiko Digital ED 50mm F2.0 Macro"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 01 01"

    const-string v2, "Olympus Zuiko Digital 40-150mm F3.5-4.5"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 01 10"

    const-string v2, "Olympus M.Zuiko Digital ED 14-42mm F3.5-5.6"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 259
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 02 00"

    const-string v2, "Olympus Zuiko Digital ED 150mm F2.0"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 02 10"

    const-string v2, "Olympus M.Zuiko Digital 17mm F2.8 Pancake"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 03 00"

    const-string v2, "Olympus Zuiko Digital ED 300mm F2.8"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 262
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 03 10"

    const-string v2, "Olympus M.Zuiko Digital ED 14-150mm F4.0-5.6 [II]"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 04 10"

    const-string v2, "Olympus M.Zuiko Digital ED 9-18mm F4.0-5.6"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 264
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 05 00"

    const-string v2, "Olympus Zuiko Digital 14-54mm F2.8-3.5"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 05 01"

    const-string v2, "Olympus Zuiko Digital Pro ED 90-250mm F2.8"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 05 10"

    const-string v2, "Olympus M.Zuiko Digital ED 14-42mm F3.5-5.6 L"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 06 00"

    const-string v2, "Olympus Zuiko Digital ED 50-200mm F2.8-3.5"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 268
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 06 01"

    const-string v2, "Olympus Zuiko Digital ED 8mm F3.5 Fisheye"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 269
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 06 10"

    const-string v2, "Olympus M.Zuiko Digital ED 40-150mm F4.0-5.6"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 270
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 07 00"

    const-string v2, "Olympus Zuiko Digital 11-22mm F2.8-3.5"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 271
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 07 01"

    const-string v2, "Olympus Zuiko Digital 18-180mm F3.5-6.3"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 272
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 07 10"

    const-string v2, "Olympus M.Zuiko Digital ED 12mm F2.0"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 08 01"

    const-string v2, "Olympus Zuiko Digital 70-300mm F4.0-5.6"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 274
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 08 10"

    const-string v2, "Olympus M.Zuiko Digital ED 75-300mm F4.8-6.7"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 275
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 09 10"

    const-string v2, "Olympus M.Zuiko Digital 14-42mm F3.5-5.6 II"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 276
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 10 01"

    const-string v2, "Kenko Tokina Reflex 300mm F6.3 MF Macro"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 277
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 10 10"

    const-string v2, "Olympus M.Zuiko Digital ED 12-50mm F3.5-6.3 EZ"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 11 10"

    const-string v2, "Olympus M.Zuiko Digital 45mm F1.8"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 279
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 12 10"

    const-string v2, "Olympus M.Zuiko Digital ED 60mm F2.8 Macro"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 280
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 13 10"

    const-string v2, "Olympus M.Zuiko Digital 14-42mm F3.5-5.6 II R"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 281
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 14 10"

    const-string v2, "Olympus M.Zuiko Digital ED 40-150mm F4.0-5.6 R"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 15 00"

    const-string v2, "Olympus Zuiko Digital ED 7-14mm F4.0"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 284
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 15 10"

    const-string v2, "Olympus M.Zuiko Digital ED 75mm F1.8"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 285
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 16 10"

    const-string v2, "Olympus M.Zuiko Digital 17mm F1.8"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 286
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 17 00"

    const-string v2, "Olympus Zuiko Digital Pro ED 35-100mm F2.0"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 287
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 18 00"

    const-string v2, "Olympus Zuiko Digital 14-45mm F3.5-5.6"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 288
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 18 10"

    const-string v2, "Olympus M.Zuiko Digital ED 75-300mm F4.8-6.7 II"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 19 10"

    const-string v2, "Olympus M.Zuiko Digital ED 12-40mm F2.8 Pro"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 290
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 20 00"

    const-string v2, "Olympus Zuiko Digital 35mm F3.5 Macro"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 20 10"

    const-string v2, "Olympus M.Zuiko Digital ED 40-150mm F2.8 Pro"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 21 10"

    const-string v2, "Olympus M.Zuiko Digital ED 14-42mm F3.5-5.6 EZ"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 293
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 22 00"

    const-string v2, "Olympus Zuiko Digital 17.5-45mm F3.5-5.6"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 22 10"

    const-string v2, "Olympus M.Zuiko Digital 25mm F1.8"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 295
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 23 00"

    const-string v2, "Olympus Zuiko Digital ED 14-42mm F3.5-5.6"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 296
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 23 10"

    const-string v2, "Olympus M.Zuiko Digital ED 7-14mm F2.8 Pro"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 297
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 24 00"

    const-string v2, "Olympus Zuiko Digital ED 40-150mm F4.0-5.6"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 24 10"

    const-string v2, "Olympus M.Zuiko Digital ED 300mm F4.0 IS Pro"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 25 10"

    const-string v2, "Olympus M.Zuiko Digital ED 8mm F1.8 Fisheye Pro"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 300
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 30 00"

    const-string v2, "Olympus Zuiko Digital ED 50-200mm F2.8-3.5 SWD"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 301
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 31 00"

    const-string v2, "Olympus Zuiko Digital ED 12-60mm F2.8-4.0 SWD"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 32 00"

    const-string v2, "Olympus Zuiko Digital ED 14-35mm F2.0 SWD"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 303
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 33 00"

    const-string v2, "Olympus Zuiko Digital 25mm F2.8"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 34 00"

    const-string v2, "Olympus Zuiko Digital ED 9-18mm F4.0-5.6"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "0 35 00"

    const-string v2, "Olympus Zuiko Digital 14-54mm F2.8-3.5 II"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 307
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "1 01 00"

    const-string v2, "Sigma 18-50mm F3.5-5.6 DC"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 308
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "1 01 10"

    const-string v2, "Sigma 30mm F2.8 EX DN"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 309
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "1 02 00"

    const-string v2, "Sigma 55-200mm F4.0-5.6 DC"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 310
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "1 02 10"

    const-string v2, "Sigma 19mm F2.8 EX DN"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 311
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "1 03 00"

    const-string v2, "Sigma 18-125mm F3.5-5.6 DC"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 312
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "1 03 10"

    const-string v2, "Sigma 30mm F2.8 DN | A"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 313
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "1 04 00"

    const-string v2, "Sigma 18-125mm F3.5-5.6 DC"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 314
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "1 04 10"

    const-string v2, "Sigma 19mm F2.8 DN | A"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "1 05 00"

    const-string v2, "Sigma 30mm F1.4 EX DC HSM"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 316
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "1 05 10"

    const-string v2, "Sigma 60mm F2.8 DN | A"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 317
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "1 06 00"

    const-string v2, "Sigma APO 50-500mm F4.0-6.3 EX DG HSM"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 318
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "1 07 00"

    const-string v2, "Sigma Macro 105mm F2.8 EX DG"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "1 08 00"

    const-string v2, "Sigma APO Macro 150mm F2.8 EX DG HSM"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 320
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "1 09 00"

    const-string v2, "Sigma 18-50mm F2.8 EX DC Macro"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 321
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "1 10 00"

    const-string v2, "Sigma 24mm F1.8 EX DG Aspherical Macro"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 322
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "1 11 00"

    const-string v2, "Sigma APO 135-400mm F4.5-5.6 DG"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 323
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "1 12 00"

    const-string v2, "Sigma APO 300-800mm F5.6 EX DG HSM"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 324
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "1 13 00"

    const-string v2, "Sigma 30mm F1.4 EX DC HSM"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 325
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "1 14 00"

    const-string v2, "Sigma APO 50-500mm F4.0-6.3 EX DG HSM"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 326
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "1 15 00"

    const-string v2, "Sigma 10-20mm F4.0-5.6 EX DC HSM"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 327
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "1 16 00"

    const-string v2, "Sigma APO 70-200mm F2.8 II EX DG Macro HSM"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 328
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "1 17 00"

    const-string v2, "Sigma 50mm F1.4 EX DG HSM"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 330
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 01 00"

    const-string v2, "Leica D Vario Elmarit 14-50mm F2.8-3.5 Asph."

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 331
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 01 10"

    const-string v2, "Lumix G Vario 14-45mm F3.5-5.6 Asph. Mega OIS"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 332
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 02 00"

    const-string v2, "Leica D Summilux 25mm F1.4 Asph."

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 333
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 02 10"

    const-string v2, "Lumix G Vario 45-200mm F4.0-5.6 Mega OIS"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 334
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 03 00"

    const-string v2, "Leica D Vario Elmar 14-50mm F3.8-5.6 Asph. Mega OIS"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 335
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 03 01"

    const-string v2, "Leica D Vario Elmar 14-50mm F3.8-5.6 Asph."

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 336
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 03 10"

    const-string v2, "Lumix G Vario HD 14-140mm F4.0-5.8 Asph. Mega OIS"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 337
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 04 00"

    const-string v2, "Leica D Vario Elmar 14-150mm F3.5-5.6"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 338
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 04 10"

    const-string v2, "Lumix G Vario 7-14mm F4.0 Asph."

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 339
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 05 10"

    const-string v2, "Lumix G 20mm F1.7 Asph."

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 340
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 06 10"

    const-string v2, "Leica DG Macro-Elmarit 45mm F2.8 Asph. Mega OIS"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 341
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 07 10"

    const-string v2, "Lumix G Vario 14-42mm F3.5-5.6 Asph. Mega OIS"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 342
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 08 10"

    const-string v2, "Lumix G Fisheye 8mm F3.5"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 343
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 09 10"

    const-string v2, "Lumix G Vario 100-300mm F4.0-5.6 Mega OIS"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 344
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 10 10"

    const-string v2, "Lumix G 14mm F2.5 Asph."

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 345
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 11 10"

    const-string v2, "Lumix G 12.5mm F12 3D"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 346
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 12 10"

    const-string v2, "Leica DG Summilux 25mm F1.4 Asph."

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 347
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 13 10"

    const-string v2, "Lumix G X Vario PZ 45-175mm F4.0-5.6 Asph. Power OIS"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 348
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 14 10"

    const-string v2, "Lumix G X Vario PZ 14-42mm F3.5-5.6 Asph. Power OIS"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 349
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 15 10"

    const-string v2, "Lumix G X Vario 12-35mm F2.8 Asph. Power OIS"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 350
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 16 10"

    const-string v2, "Lumix G Vario 45-150mm F4.0-5.6 Asph. Mega OIS"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 351
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 17 10"

    const-string v2, "Lumix G X Vario 35-100mm F2.8 Power OIS"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 352
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 18 10"

    const-string v2, "Lumix G Vario 14-42mm F3.5-5.6 II Asph. Mega OIS"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 353
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 19 10"

    const-string v2, "Lumix G Vario 14-140mm F3.5-5.6 Asph. Power OIS"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 354
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 20 10"

    const-string v2, "Lumix G Vario 12-32mm F3.5-5.6 Asph. Mega OIS"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 355
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 21 10"

    const-string v2, "Leica DG Nocticron 42.5mm F1.2 Asph. Power OIS"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 356
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 22 10"

    const-string v2, "Leica DG Summilux 15mm F1.7 Asph."

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 358
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 24 10"

    const-string v2, "Lumix G Macro 30mm F2.8 Asph. Mega OIS"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 359
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "2 25 10"

    const-string v2, "Lumix G 42.5mm F1.7 Asph. Power OIS"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 360
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "3 01 00"

    const-string v2, "Leica D Vario Elmarit 14-50mm F2.8-3.5 Asph."

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 361
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "3 02 00"

    const-string v2, "Leica D Summilux 25mm F1.4 Asph."

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 363
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v1, "5 01 10"

    const-string v2, "Tamron 14-150mm F3.5-5.8 Di III"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 366
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusExtenderTypes:Ljava/util/HashMap;

    const-string v1, "0 00"

    const-string v2, "None"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 367
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusExtenderTypes:Ljava/util/HashMap;

    const-string v1, "0 04"

    const-string v2, "Olympus Zuiko Digital EC-14 1.4x Teleconverter"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 368
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusExtenderTypes:Ljava/util/HashMap;

    const-string v1, "0 08"

    const-string v2, "Olympus EX-25 Extension Tube"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 369
    sget-object v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusExtenderTypes:Ljava/util/HashMap;

    const-string v1, "0 10"

    const-string v2, "Olympus Zuiko Digital EC-20 2.0x Teleconverter"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 370
    return-void
.end method

.method public constructor <init>(Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 48
    return-void
.end method

.method private static CalcMaxAperture(I)D
    .registers 7
    .param p0, "value"    # I

    .prologue
    .line 190
    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    int-to-double v2, p0

    const-wide/high16 v4, 0x4070000000000000L    # 256.0

    div-double/2addr v2, v4

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    return-wide v0
.end method


# virtual methods
.method public GetBodyFirmwareVersionDescription()Ljava/lang/String;
    .registers 8
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 99
    iget-object v2, p0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;

    const/16 v3, 0x104

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v1

    .line 100
    .local v1, "value":Ljava/lang/Integer;
    if-nez v1, :cond_10

    .line 101
    const/4 v2, 0x0

    .line 104
    :goto_f
    return-object v2

    .line 103
    :cond_10
    const-string v2, "%04X"

    new-array v3, v6, [Ljava/lang/Object;

    aput-object v1, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 104
    .local v0, "hex":Ljava/lang/String;
    const-string v2, "%s.%s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x3

    invoke-virtual {v0, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x3

    invoke-virtual {v0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_f
.end method

.method public GetEquipmentVersionDescription()Ljava/lang/String;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 87
    const/4 v0, 0x0

    const/4 v1, 0x4

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->getVersionBytesDescription(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public GetExtenderDescription()Ljava/lang/String;
    .registers 12
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 206
    iget-object v6, p0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v6, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;

    const/16 v8, 0x301

    invoke-virtual {v6, v8}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 208
    .local v4, "str":Ljava/lang/String;
    if-nez v4, :cond_f

    move-object v6, v7

    .line 232
    :goto_e
    return-object v6

    .line 221
    :cond_f
    const-string v6, " "

    invoke-virtual {v4, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 223
    .local v5, "values":[Ljava/lang/String;
    array-length v6, v5

    const/4 v8, 0x6

    if-ge v6, v8, :cond_1b

    move-object v6, v7

    .line 224
    goto :goto_e

    .line 227
    :cond_1b
    const/4 v6, 0x0

    :try_start_1c
    aget-object v6, v5, v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 228
    .local v2, "num1":I
    const/4 v6, 0x2

    aget-object v6, v5, v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 229
    .local v3, "num2":I
    const-string v6, "%X %02X"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v6, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 230
    .local v1, "extenderType":Ljava/lang/String;
    sget-object v6, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusExtenderTypes:Ljava/util/HashMap;

    invoke-virtual {v6, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;
    :try_end_48
    .catch Ljava/lang/NumberFormatException; {:try_start_1c .. :try_end_48} :catch_49

    goto :goto_e

    .line 231
    .end local v1    # "extenderType":Ljava/lang/String;
    .end local v2    # "num1":I
    .end local v3    # "num2":I
    :catch_49
    move-exception v0

    .local v0, "e":Ljava/lang/NumberFormatException;
    move-object v6, v7

    .line 232
    goto :goto_e
.end method

.method public GetFlashModelDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 246
    const/16 v0, 0x1001

    const/16 v1, 0x8

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "None"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "FL-20"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "FL-50"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "RF-11"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "TF-22"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "FL-36"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "FL-50R"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "FL-36R"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public GetFlashTypeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 239
    const/16 v0, 0x1000

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "None"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const/4 v3, 0x0

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Simple E-System"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "E-System"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public GetFocalPlaneDiagonalDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 93
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;

    const/16 v2, 0x103

    invoke-virtual {v0, v2}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " mm"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public GetLensFirmwareVersionDescription()Ljava/lang/String;
    .registers 8
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 145
    iget-object v2, p0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;

    const/16 v3, 0x204

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v1

    .line 146
    .local v1, "value":Ljava/lang/Integer;
    if-nez v1, :cond_10

    .line 147
    const/4 v2, 0x0

    .line 150
    :goto_f
    return-object v2

    .line 149
    :cond_10
    const-string v2, "%04X"

    new-array v3, v6, [Ljava/lang/Object;

    aput-object v1, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 150
    .local v0, "hex":Ljava/lang/String;
    const-string v2, "%s.%s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x3

    invoke-virtual {v0, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x3

    invoke-virtual {v0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_f
.end method

.method public GetLensPropertiesDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 196
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;

    const/16 v2, 0x20b

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 197
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 198
    const/4 v1, 0x0

    .line 200
    :goto_d
    return-object v1

    :cond_e
    const-string v1, "0x%04X"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_d
.end method

.method public GetLensTypeDescription()Ljava/lang/String;
    .registers 13
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 112
    iget-object v6, p0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v6, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;

    const/16 v8, 0x201

    invoke-virtual {v6, v8}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 114
    .local v4, "str":Ljava/lang/String;
    if-nez v4, :cond_f

    move-object v6, v7

    .line 138
    :goto_e
    return-object v6

    .line 127
    :cond_f
    const-string v6, " "

    invoke-virtual {v4, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 129
    .local v5, "values":[Ljava/lang/String;
    array-length v6, v5

    const/4 v8, 0x6

    if-ge v6, v8, :cond_1b

    move-object v6, v7

    .line 130
    goto :goto_e

    .line 133
    :cond_1b
    const/4 v6, 0x0

    :try_start_1c
    aget-object v6, v5, v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 134
    .local v1, "num1":I
    const/4 v6, 0x2

    aget-object v6, v5, v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 135
    .local v2, "num2":I
    const/4 v6, 0x3

    aget-object v6, v5, v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 136
    .local v3, "num3":I
    sget-object v6, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_olympusLensTypes:Ljava/util/HashMap;

    const-string v8, "%X %02X %02X"

    const/4 v9, 0x3

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;
    :try_end_56
    .catch Ljava/lang/NumberFormatException; {:try_start_1c .. :try_end_56} :catch_57

    goto :goto_e

    .line 137
    .end local v1    # "num1":I
    .end local v2    # "num2":I
    .end local v3    # "num3":I
    :catch_57
    move-exception v0

    .local v0, "e":Ljava/lang/NumberFormatException;
    move-object v6, v7

    .line 138
    goto :goto_e
.end method

.method public GetMaxApertureAtMaxFocalDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 169
    iget-object v2, p0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;

    const/16 v3, 0x206

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v1

    .line 170
    .local v1, "value":Ljava/lang/Integer;
    if-nez v1, :cond_e

    .line 171
    const/4 v2, 0x0

    .line 174
    :goto_d
    return-object v2

    .line 173
    :cond_e
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v2, "0.#"

    invoke-direct {v0, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 174
    .local v0, "format":Ljava/text/DecimalFormat;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->CalcMaxAperture(I)D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v2

    goto :goto_d
.end method

.method public GetMaxApertureAtMinFocalDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 158
    iget-object v2, p0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;

    const/16 v3, 0x205

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v1

    .line 159
    .local v1, "value":Ljava/lang/Integer;
    if-nez v1, :cond_e

    .line 160
    const/4 v2, 0x0

    .line 163
    :goto_d
    return-object v2

    .line 162
    :cond_e
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v2, "0.#"

    invoke-direct {v0, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 163
    .local v0, "format":Ljava/text/DecimalFormat;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->CalcMaxAperture(I)D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v2

    goto :goto_d
.end method

.method public GetMaxApertureDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 180
    iget-object v2, p0, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;

    const/16 v3, 0x20a

    invoke-virtual {v2, v3}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v1

    .line 181
    .local v1, "value":Ljava/lang/Integer;
    if-nez v1, :cond_e

    .line 182
    const/4 v2, 0x0

    .line 185
    :goto_d
    return-object v2

    .line 184
    :cond_e
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v2, "0.#"

    invoke-direct {v0, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 185
    .local v0, "format":Ljava/text/DecimalFormat;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->CalcMaxAperture(I)D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v2

    goto :goto_d
.end method

.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 54
    sparse-switch p1, :sswitch_data_44

    .line 80
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 56
    :sswitch_8
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->GetEquipmentVersionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 58
    :sswitch_d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->GetFocalPlaneDiagonalDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 60
    :sswitch_12
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->GetBodyFirmwareVersionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 62
    :sswitch_17
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->GetLensTypeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 64
    :sswitch_1c
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->GetLensFirmwareVersionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 66
    :sswitch_21
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->GetMaxApertureAtMinFocalDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 68
    :sswitch_26
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->GetMaxApertureAtMaxFocalDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 70
    :sswitch_2b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->GetMaxApertureDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 72
    :sswitch_30
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->GetLensPropertiesDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 74
    :sswitch_35
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->GetExtenderDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 76
    :sswitch_3a
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->GetFlashTypeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 78
    :sswitch_3f
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/OlympusEquipmentMakernoteDescriptor;->GetFlashModelDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 54
    :sswitch_data_44
    .sparse-switch
        0x0 -> :sswitch_8
        0x103 -> :sswitch_d
        0x104 -> :sswitch_12
        0x201 -> :sswitch_17
        0x204 -> :sswitch_1c
        0x205 -> :sswitch_21
        0x206 -> :sswitch_26
        0x20a -> :sswitch_2b
        0x20b -> :sswitch_30
        0x301 -> :sswitch_35
        0x1000 -> :sswitch_3a
        0x1001 -> :sswitch_3f
    .end sparse-switch
.end method

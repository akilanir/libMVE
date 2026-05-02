.class public Lezvcard/parameter/VCardParameters;
.super Lezvcard/util/ListMultimap;
.source "VCardParameters.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lezvcard/util/ListMultimap",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# static fields
.field public static final ALTID:Ljava/lang/String; = "ALTID"

.field public static final CALSCALE:Ljava/lang/String; = "CALSCALE"

.field public static final CHARSET:Ljava/lang/String; = "CHARSET"

.field public static final ENCODING:Ljava/lang/String; = "ENCODING"

.field public static final GEO:Ljava/lang/String; = "GEO"

.field public static final INDEX:Ljava/lang/String; = "INDEX"

.field public static final LABEL:Ljava/lang/String; = "LABEL"

.field public static final LANGUAGE:Ljava/lang/String; = "LANGUAGE"

.field public static final LEVEL:Ljava/lang/String; = "LEVEL"

.field public static final MEDIATYPE:Ljava/lang/String; = "MEDIATYPE"

.field public static final PID:Ljava/lang/String; = "PID"

.field public static final PREF:Ljava/lang/String; = "PREF"

.field public static final SORT_AS:Ljava/lang/String; = "SORT-AS"

.field public static final TYPE:Ljava/lang/String; = "TYPE"

.field public static final TZ:Ljava/lang/String; = "TZ"

.field public static final VALUE:Ljava/lang/String; = "VALUE"

.field private static final supportedVersions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Lezvcard/VCardVersion;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 77
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 78
    .local v0, "m":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/Set<Lezvcard/VCardVersion;>;>;"
    const-string v1, "ALTID"

    sget-object v2, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    invoke-static {v2}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    const-string v1, "CALSCALE"

    sget-object v2, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    invoke-static {v2}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    const-string v1, "CHARSET"

    sget-object v2, Lezvcard/VCardVersion;->V2_1:Lezvcard/VCardVersion;

    invoke-static {v2}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    const-string v1, "GEO"

    sget-object v2, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    invoke-static {v2}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    const-string v1, "INDEX"

    sget-object v2, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    invoke-static {v2}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    const-string v1, "LEVEL"

    sget-object v2, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    invoke-static {v2}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    const-string v1, "MEDIATYPE"

    sget-object v2, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    invoke-static {v2}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    const-string v1, "PID"

    sget-object v2, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    invoke-static {v2}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    const-string v1, "SORT-AS"

    sget-object v2, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    invoke-static {v2}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    const-string v1, "TZ"

    sget-object v2, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    invoke-static {v2}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    sput-object v1, Lezvcard/parameter/VCardParameters;->supportedVersions:Ljava/util/Map;

    .line 98
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 103
    invoke-direct {p0}, Lezvcard/util/ListMultimap;-><init>()V

    .line 105
    return-void
.end method

.method public constructor <init>(Lezvcard/parameter/VCardParameters;)V
    .registers 2
    .param p1, "orig"    # Lezvcard/parameter/VCardParameters;

    .prologue
    .line 112
    invoke-direct {p0, p1}, Lezvcard/util/ListMultimap;-><init>(Lezvcard/util/ListMultimap;)V

    .line 113
    return-void
.end method


# virtual methods
.method public addPid(I)V
    .registers 5
    .param p1, "localId"    # I

    .prologue
    .line 690
    const-string v0, "PID"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lezvcard/parameter/VCardParameters;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 691
    return-void
.end method

.method public addPid(II)V
    .registers 6
    .param p1, "localId"    # I
    .param p2, "clientPidMapRef"    # I

    .prologue
    .line 713
    const-string v0, "PID"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lezvcard/parameter/VCardParameters;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 714
    return-void
.end method

.method public addType(Ljava/lang/String;)V
    .registers 3
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 315
    const-string v0, "TYPE"

    invoke-virtual {p0, v0, p1}, Lezvcard/parameter/VCardParameters;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 316
    return-void
.end method

.method public getAltId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 482
    const-string v0, "ALTID"

    invoke-virtual {p0, v0}, Lezvcard/parameter/VCardParameters;->first(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getCalscale()Lezvcard/parameter/Calscale;
    .registers 3

    .prologue
    .line 617
    const-string v1, "CALSCALE"

    invoke-virtual {p0, v1}, Lezvcard/parameter/VCardParameters;->first(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 618
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-static {v0}, Lezvcard/parameter/Calscale;->get(Ljava/lang/String;)Lezvcard/parameter/Calscale;

    move-result-object v1

    goto :goto_b
.end method

.method public getCharset()Ljava/lang/String;
    .registers 2

    .prologue
    .line 196
    const-string v0, "CHARSET"

    invoke-virtual {p0, v0}, Lezvcard/parameter/VCardParameters;->first(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getEncoding()Lezvcard/parameter/Encoding;
    .registers 3

    .prologue
    .line 126
    const-string v1, "ENCODING"

    invoke-virtual {p0, v1}, Lezvcard/parameter/VCardParameters;->first(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 127
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-static {v0}, Lezvcard/parameter/Encoding;->get(Ljava/lang/String;)Lezvcard/parameter/Encoding;

    move-result-object v1

    goto :goto_b
.end method

.method public getGeo()[D
    .registers 8

    .prologue
    .line 534
    const-string v3, "GEO"

    invoke-virtual {p0, v3}, Lezvcard/parameter/VCardParameters;->first(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 535
    .local v2, "value":Ljava/lang/String;
    if-nez v2, :cond_c

    .line 536
    const/4 v3, 0x0

    .line 541
    :goto_b
    return-object v3

    .line 540
    :cond_c
    :try_start_c
    invoke-static {v2}, Lezvcard/util/GeoUri;->parse(Ljava/lang/String;)Lezvcard/util/GeoUri;

    move-result-object v1

    .line 541
    .local v1, "geoUri":Lezvcard/util/GeoUri;
    const/4 v3, 0x2

    new-array v3, v3, [D

    const/4 v4, 0x0

    invoke-virtual {v1}, Lezvcard/util/GeoUri;->getCoordA()Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v5

    aput-wide v5, v3, v4

    const/4 v4, 0x1

    invoke-virtual {v1}, Lezvcard/util/GeoUri;->getCoordB()Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v5

    aput-wide v5, v3, v4
    :try_end_29
    .catch Ljava/lang/IllegalArgumentException; {:try_start_c .. :try_end_29} :catch_2a

    goto :goto_b

    .line 542
    .end local v1    # "geoUri":Lezvcard/util/GeoUri;
    :catch_2a
    move-exception v0

    .line 543
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "GEO parameter value is malformed and could not be parsed. Retrieve its raw text value instead."

    invoke-direct {v3, v4, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public getIndex()Ljava/lang/Integer;
    .registers 5

    .prologue
    .line 806
    const-string v2, "INDEX"

    invoke-virtual {p0, v2}, Lezvcard/parameter/VCardParameters;->first(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 807
    .local v1, "index":Ljava/lang/String;
    if-nez v1, :cond_c

    .line 808
    const/4 v2, 0x0

    .line 812
    :goto_b
    return-object v2

    :cond_c
    :try_start_c
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;
    :try_end_f
    .catch Ljava/lang/NumberFormatException; {:try_start_c .. :try_end_f} :catch_11

    move-result-object v2

    goto :goto_b

    .line 813
    :catch_11
    move-exception v0

    .line 814
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "INDEX parameter value is malformed and could not be parsed. Retrieve its raw text value instead."

    invoke-direct {v2, v3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public getLabel()Ljava/lang/String;
    .registers 2

    .prologue
    .line 250
    const-string v0, "LABEL"

    invoke-virtual {p0, v0}, Lezvcard/parameter/VCardParameters;->first(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getLanguage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 223
    const-string v0, "LANGUAGE"

    invoke-virtual {p0, v0}, Lezvcard/parameter/VCardParameters;->first(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getLevel()Ljava/lang/String;
    .registers 2

    .prologue
    .line 770
    const-string v0, "LEVEL"

    invoke-virtual {p0, v0}, Lezvcard/parameter/VCardParameters;->first(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getMediaType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 740
    const-string v0, "MEDIATYPE"

    invoke-virtual {p0, v0}, Lezvcard/parameter/VCardParameters;->first(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getPids()Ljava/util/List;
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<[",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    .line 657
    const-string v8, "PID"

    invoke-virtual {p0, v8}, Lezvcard/parameter/VCardParameters;->get(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    .line 658
    .local v7, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v8

    invoke-direct {v4, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 659
    .local v4, "pids":Ljava/util/List;, "Ljava/util/List<[Ljava/lang/Integer;>;"
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_14
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 660
    .local v6, "value":Ljava/lang/String;
    const-string v8, "\\."

    invoke-virtual {v6, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 662
    .local v5, "split":[Ljava/lang/String;
    const/4 v8, 0x0

    :try_start_27
    aget-object v8, v5, v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    .line 663
    .local v3, "localId":Ljava/lang/Integer;
    array-length v8, v5

    if-le v8, v10, :cond_4d

    const/4 v8, 0x1

    aget-object v8, v5, v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    .line 664
    .local v0, "clientPidMapRef":Ljava/lang/Integer;
    :goto_37
    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Integer;

    const/4 v9, 0x0

    aput-object v3, v8, v9

    const/4 v9, 0x1

    aput-object v0, v8, v9

    invoke-interface {v4, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_43
    .catch Ljava/lang/NumberFormatException; {:try_start_27 .. :try_end_43} :catch_44

    goto :goto_14

    .line 665
    .end local v0    # "clientPidMapRef":Ljava/lang/Integer;
    .end local v3    # "localId":Ljava/lang/Integer;
    :catch_44
    move-exception v1

    .line 666
    .local v1, "e":Ljava/lang/NumberFormatException;
    new-instance v8, Ljava/lang/IllegalStateException;

    const-string v9, "PID parameter value is malformed and could not be parsed. Retrieve its raw text value instead."

    invoke-direct {v8, v9, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 663
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    .restart local v3    # "localId":Ljava/lang/Integer;
    :cond_4d
    const/4 v0, 0x0

    goto :goto_37

    .line 669
    .end local v3    # "localId":Ljava/lang/Integer;
    .end local v5    # "split":[Ljava/lang/String;
    .end local v6    # "value":Ljava/lang/String;
    :cond_4f
    return-object v4
.end method

.method public getPref()Ljava/lang/Integer;
    .registers 5

    .prologue
    .line 402
    const-string v2, "PREF"

    invoke-virtual {p0, v2}, Lezvcard/parameter/VCardParameters;->first(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 403
    .local v1, "pref":Ljava/lang/String;
    if-nez v1, :cond_c

    .line 404
    const/4 v2, 0x0

    .line 408
    :goto_b
    return-object v2

    :cond_c
    :try_start_c
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;
    :try_end_f
    .catch Ljava/lang/NumberFormatException; {:try_start_c .. :try_end_f} :catch_11

    move-result-object v2

    goto :goto_b

    .line 409
    :catch_11
    move-exception v0

    .line 410
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "PREF parameter value is malformed and could not be parsed. Retrieve its raw text value instead."

    invoke-direct {v2, v3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public getSortAs()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 580
    const-string v0, "SORT-AS"

    invoke-virtual {p0, v0}, Lezvcard/parameter/VCardParameters;->get(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getTimezone()Ljava/lang/String;
    .registers 2

    .prologue
    .line 276
    const-string v0, "TZ"

    invoke-virtual {p0, v0}, Lezvcard/parameter/VCardParameters;->first(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 3

    .prologue
    .line 328
    invoke-virtual {p0}, Lezvcard/parameter/VCardParameters;->getTypes()Ljava/util/Set;

    move-result-object v0

    .line 329
    .local v0, "types":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_b
.end method

.method public getTypes()Ljava/util/Set;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 302
    new-instance v0, Ljava/util/HashSet;

    const-string v1, "TYPE"

    invoke-virtual {p0, v1}, Lezvcard/parameter/VCardParameters;->get(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getValue()Lezvcard/VCardDataType;
    .registers 3

    .prologue
    .line 155
    const-string v1, "VALUE"

    invoke-virtual {p0, v1}, Lezvcard/parameter/VCardParameters;->first(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 156
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-static {v0}, Lezvcard/VCardDataType;->get(Ljava/lang/String;)Lezvcard/VCardDataType;

    move-result-object v1

    goto :goto_b
.end method

.method public removePids()V
    .registers 2

    .prologue
    .line 725
    const-string v0, "PID"

    invoke-virtual {p0, v0}, Lezvcard/parameter/VCardParameters;->removeAll(Ljava/lang/Object;)Ljava/util/List;

    .line 726
    return-void
.end method

.method public removeType(Ljava/lang/String;)V
    .registers 3
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 355
    const-string v0, "TYPE"

    invoke-virtual {p0, v0, p1}, Lezvcard/parameter/VCardParameters;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 356
    return-void
.end method

.method public removeTypes()V
    .registers 2

    .prologue
    .line 367
    const-string v0, "TYPE"

    invoke-virtual {p0, v0}, Lezvcard/parameter/VCardParameters;->removeAll(Ljava/lang/Object;)Ljava/util/List;

    .line 368
    return-void
.end method

.method public removeValue()V
    .registers 2

    .prologue
    .line 183
    const-string v0, "VALUE"

    invoke-virtual {p0, v0}, Lezvcard/parameter/VCardParameters;->removeAll(Ljava/lang/Object;)Ljava/util/List;

    .line 184
    return-void
.end method

.method protected bridge synthetic sanitizeKey(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 57
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lezvcard/parameter/VCardParameters;->sanitizeKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected sanitizeKey(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 945
    if-nez p1, :cond_4

    const/4 v0, 0x0

    :goto_3
    return-object v0

    :cond_4
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method public setAltId(Ljava/lang/String;)V
    .registers 3
    .param p1, "altId"    # Ljava/lang/String;

    .prologue
    .line 516
    const-string v0, "ALTID"

    invoke-virtual {p0, v0, p1}, Lezvcard/parameter/VCardParameters;->replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/List;

    .line 517
    return-void
.end method

.method public setCalscale(Lezvcard/parameter/Calscale;)V
    .registers 4
    .param p1, "value"    # Lezvcard/parameter/Calscale;

    .prologue
    .line 632
    const-string v1, "CALSCALE"

    if-nez p1, :cond_9

    const/4 v0, 0x0

    :goto_5
    invoke-virtual {p0, v1, v0}, Lezvcard/parameter/VCardParameters;->replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/List;

    .line 633
    return-void

    .line 632
    :cond_9
    invoke-virtual {p1}, Lezvcard/parameter/Calscale;->getValue()Ljava/lang/String;

    move-result-object v0

    goto :goto_5
.end method

.method public setCharset(Ljava/lang/String;)V
    .registers 3
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 209
    const-string v0, "CHARSET"

    invoke-virtual {p0, v0, p1}, Lezvcard/parameter/VCardParameters;->replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/List;

    .line 210
    return-void
.end method

.method public setEncoding(Lezvcard/parameter/Encoding;)V
    .registers 4
    .param p1, "encoding"    # Lezvcard/parameter/Encoding;

    .prologue
    .line 141
    const-string v1, "ENCODING"

    if-nez p1, :cond_9

    const/4 v0, 0x0

    :goto_5
    invoke-virtual {p0, v1, v0}, Lezvcard/parameter/VCardParameters;->replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/List;

    .line 142
    return-void

    .line 141
    :cond_9
    invoke-virtual {p1}, Lezvcard/parameter/Encoding;->getValue()Ljava/lang/String;

    move-result-object v0

    goto :goto_5
.end method

.method public setGeo(DD)V
    .registers 9
    .param p1, "latitude"    # D
    .param p3, "longitude"    # D

    .prologue
    .line 560
    new-instance v1, Lezvcard/util/GeoUri$Builder;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lezvcard/util/GeoUri$Builder;-><init>(Ljava/lang/Double;Ljava/lang/Double;)V

    invoke-virtual {v1}, Lezvcard/util/GeoUri$Builder;->build()Lezvcard/util/GeoUri;

    move-result-object v0

    .line 561
    .local v0, "geoUri":Lezvcard/util/GeoUri;
    const-string v1, "GEO"

    invoke-virtual {v0}, Lezvcard/util/GeoUri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lezvcard/parameter/VCardParameters;->replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/List;

    .line 562
    return-void
.end method

.method public setIndex(Ljava/lang/Integer;)V
    .registers 5
    .param p1, "index"    # Ljava/lang/Integer;

    .prologue
    .line 834
    if-eqz p1, :cond_10

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-gtz v1, :cond_10

    .line 835
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Index value must be greater than 0."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 837
    :cond_10
    if-nez p1, :cond_19

    const/4 v0, 0x0

    .line 838
    .local v0, "value":Ljava/lang/String;
    :goto_13
    const-string v1, "INDEX"

    invoke-virtual {p0, v1, v0}, Lezvcard/parameter/VCardParameters;->replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/List;

    .line 839
    return-void

    .line 837
    .end local v0    # "value":Ljava/lang/String;
    :cond_19
    invoke-virtual {p1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_13
.end method

.method public setLabel(Ljava/lang/String;)V
    .registers 3
    .param p1, "label"    # Ljava/lang/String;

    .prologue
    .line 263
    const-string v0, "LABEL"

    invoke-virtual {p0, v0, p1}, Lezvcard/parameter/VCardParameters;->replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/List;

    .line 264
    return-void
.end method

.method public setLanguage(Ljava/lang/String;)V
    .registers 3
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 237
    const-string v0, "LANGUAGE"

    invoke-virtual {p0, v0, p1}, Lezvcard/parameter/VCardParameters;->replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/List;

    .line 238
    return-void
.end method

.method public setLevel(Ljava/lang/String;)V
    .registers 3
    .param p1, "level"    # Ljava/lang/String;

    .prologue
    .line 785
    const-string v0, "LEVEL"

    invoke-virtual {p0, v0, p1}, Lezvcard/parameter/VCardParameters;->replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/List;

    .line 786
    return-void
.end method

.method public setMediaType(Ljava/lang/String;)V
    .registers 3
    .param p1, "mediaType"    # Ljava/lang/String;

    .prologue
    .line 755
    const-string v0, "MEDIATYPE"

    invoke-virtual {p0, v0, p1}, Lezvcard/parameter/VCardParameters;->replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/List;

    .line 756
    return-void
.end method

.method public setPref(Ljava/lang/Integer;)V
    .registers 5
    .param p1, "pref"    # Ljava/lang/Integer;

    .prologue
    .line 444
    if-eqz p1, :cond_19

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x1

    if-lt v1, v2, :cond_11

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0x64

    if-le v1, v2, :cond_19

    .line 445
    :cond_11
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Preference value must be between 1 and 100 inclusive."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 447
    :cond_19
    if-nez p1, :cond_22

    const/4 v0, 0x0

    .line 448
    .local v0, "value":Ljava/lang/String;
    :goto_1c
    const-string v1, "PREF"

    invoke-virtual {p0, v1, v0}, Lezvcard/parameter/VCardParameters;->replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/List;

    .line 449
    return-void

    .line 447
    .end local v0    # "value":Ljava/lang/String;
    :cond_22
    invoke-virtual {p1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1c
.end method

.method public varargs setSortAs([Ljava/lang/String;)V
    .registers 7
    .param p1, "names"    # [Ljava/lang/String;

    .prologue
    .line 598
    const-string v4, "SORT-AS"

    invoke-virtual {p0, v4}, Lezvcard/parameter/VCardParameters;->removeAll(Ljava/lang/Object;)Ljava/util/List;

    .line 599
    if-eqz p1, :cond_19

    array-length v4, p1

    if-lez v4, :cond_19

    .line 600
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_d
    if-ge v1, v2, :cond_19

    aget-object v3, v0, v1

    .line 601
    .local v3, "name":Ljava/lang/String;
    const-string v4, "SORT-AS"

    invoke-virtual {p0, v4, v3}, Lezvcard/parameter/VCardParameters;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 600
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 604
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "name":Ljava/lang/String;
    :cond_19
    return-void
.end method

.method public setTimezone(Ljava/lang/String;)V
    .registers 3
    .param p1, "tz"    # Ljava/lang/String;

    .prologue
    .line 289
    const-string v0, "TZ"

    invoke-virtual {p0, v0, p1}, Lezvcard/parameter/VCardParameters;->replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/List;

    .line 290
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .registers 3
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 342
    const-string v0, "TYPE"

    invoke-virtual {p0, v0, p1}, Lezvcard/parameter/VCardParameters;->replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/List;

    .line 343
    return-void
.end method

.method public setValue(Lezvcard/VCardDataType;)V
    .registers 4
    .param p1, "value"    # Lezvcard/VCardDataType;

    .prologue
    .line 170
    const-string v1, "VALUE"

    if-nez p1, :cond_9

    const/4 v0, 0x0

    :goto_5
    invoke-virtual {p0, v1, v0}, Lezvcard/parameter/VCardParameters;->replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/List;

    .line 171
    return-void

    .line 170
    :cond_9
    invoke-virtual {p1}, Lezvcard/VCardDataType;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_5
.end method

.method public validate(Lezvcard/VCardVersion;)Ljava/util/List;
    .registers 23
    .param p1, "version"    # Lezvcard/VCardVersion;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/VCardVersion;",
            ")",
            "Ljava/util/List",
            "<",
            "Lezvcard/Warning;",
            ">;"
        }
    .end annotation

    .prologue
    .line 850
    new-instance v16, Ljava/util/ArrayList;

    const/16 v17, 0x0

    invoke-direct/range {v16 .. v17}, Ljava/util/ArrayList;-><init>(I)V

    .line 853
    .local v16, "warnings":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    const/4 v11, 0x3

    .line 854
    .local v11, "nonStandardCode":I
    const/4 v14, 0x4

    .line 856
    .local v14, "valueNotSupportedCode":I
    const-string v17, "CALSCALE"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lezvcard/parameter/VCardParameters;->first(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 857
    .local v13, "value":Ljava/lang/String;
    if-eqz v13, :cond_43

    invoke-static {v13}, Lezvcard/parameter/Calscale;->find(Ljava/lang/String;)Lezvcard/parameter/Calscale;

    move-result-object v17

    if-nez v17, :cond_43

    .line 858
    new-instance v17, Lezvcard/Warning;

    const/16 v18, 0x3

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    const-string v20, "CALSCALE"

    aput-object v20, v18, v19

    const/16 v19, 0x1

    aput-object v13, v18, v19

    const/16 v19, 0x2

    invoke-static {}, Lezvcard/parameter/Calscale;->all()Ljava/util/Collection;

    move-result-object v20

    aput-object v20, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v11, v1}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface/range {v16 .. v17}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 861
    :cond_43
    const-string v17, "ENCODING"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lezvcard/parameter/VCardParameters;->first(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    .end local v13    # "value":Ljava/lang/String;
    check-cast v13, Ljava/lang/String;

    .line 862
    .restart local v13    # "value":Ljava/lang/String;
    if-eqz v13, :cond_7d

    .line 863
    invoke-static {v13}, Lezvcard/parameter/Encoding;->find(Ljava/lang/String;)Lezvcard/parameter/Encoding;

    move-result-object v5

    .line 864
    .local v5, "encoding":Lezvcard/parameter/Encoding;
    if-nez v5, :cond_112

    .line 865
    new-instance v17, Lezvcard/Warning;

    const/16 v18, 0x3

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    const-string v20, "ENCODING"

    aput-object v20, v18, v19

    const/16 v19, 0x1

    aput-object v13, v18, v19

    const/16 v19, 0x2

    invoke-static {}, Lezvcard/parameter/Encoding;->all()Ljava/util/Collection;

    move-result-object v20

    aput-object v20, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v11, v1}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface/range {v16 .. v17}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 871
    .end local v5    # "encoding":Lezvcard/parameter/Encoding;
    :cond_7d
    :goto_7d
    const-string v17, "VALUE"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lezvcard/parameter/VCardParameters;->first(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    .end local v13    # "value":Ljava/lang/String;
    check-cast v13, Ljava/lang/String;

    .line 872
    .restart local v13    # "value":Ljava/lang/String;
    if-eqz v13, :cond_b7

    .line 873
    invoke-static {v13}, Lezvcard/VCardDataType;->find(Ljava/lang/String;)Lezvcard/VCardDataType;

    move-result-object v3

    .line 874
    .local v3, "dataType":Lezvcard/VCardDataType;
    if-nez v3, :cond_13a

    .line 875
    new-instance v17, Lezvcard/Warning;

    const/16 v18, 0x3

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    const-string v20, "VALUE"

    aput-object v20, v18, v19

    const/16 v19, 0x1

    aput-object v13, v18, v19

    const/16 v19, 0x2

    invoke-static {}, Lezvcard/VCardDataType;->all()Ljava/util/Collection;

    move-result-object v20

    aput-object v20, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v11, v1}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface/range {v16 .. v17}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 883
    .end local v3    # "dataType":Lezvcard/VCardDataType;
    :cond_b7
    :goto_b7
    const/4 v9, 0x5

    .line 886
    .local v9, "malformedCode":I
    :try_start_b8
    invoke-virtual/range {p0 .. p0}, Lezvcard/parameter/VCardParameters;->getGeo()[D
    :try_end_bb
    .catch Ljava/lang/IllegalStateException; {:try_start_b8 .. :try_end_bb} :catch_162

    .line 892
    :goto_bb
    :try_start_bb
    invoke-virtual/range {p0 .. p0}, Lezvcard/parameter/VCardParameters;->getIndex()Ljava/lang/Integer;
    :try_end_be
    .catch Ljava/lang/IllegalStateException; {:try_start_bb .. :try_end_be} :catch_18d

    .line 898
    :goto_be
    :try_start_be
    invoke-virtual/range {p0 .. p0}, Lezvcard/parameter/VCardParameters;->getPids()Ljava/util/List;
    :try_end_c1
    .catch Ljava/lang/IllegalStateException; {:try_start_be .. :try_end_c1} :catch_1b8

    .line 904
    :goto_c1
    :try_start_c1
    invoke-virtual/range {p0 .. p0}, Lezvcard/parameter/VCardParameters;->getPref()Ljava/lang/Integer;
    :try_end_c4
    .catch Ljava/lang/IllegalStateException; {:try_start_c1 .. :try_end_c4} :catch_1e3

    .line 911
    :goto_c4
    const/4 v12, 0x6

    .line 912
    .local v12, "paramNotSupportedCode":I
    sget-object v17, Lezvcard/parameter/VCardParameters;->supportedVersions:Ljava/util/Map;

    invoke-interface/range {v17 .. v17}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :cond_cf
    :goto_cf
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_20e

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 913
    .local v6, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Set<Lezvcard/VCardVersion;>;>;"
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 914
    .local v10, "name":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lezvcard/parameter/VCardParameters;->first(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    .end local v13    # "value":Ljava/lang/String;
    check-cast v13, Ljava/lang/String;

    .line 915
    .restart local v13    # "value":Ljava/lang/String;
    if-eqz v13, :cond_cf

    .line 919
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/util/Set;

    .line 920
    .local v15, "versions":Ljava/util/Set;, "Ljava/util/Set<Lezvcard/VCardVersion;>;"
    move-object/from16 v0, p1

    invoke-interface {v15, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_cf

    .line 921
    new-instance v17, Lezvcard/Warning;

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v10, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v12, v1}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface/range {v16 .. v17}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_cf

    .line 866
    .end local v6    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Set<Lezvcard/VCardVersion;>;>;"
    .end local v7    # "i$":Ljava/util/Iterator;
    .end local v9    # "malformedCode":I
    .end local v10    # "name":Ljava/lang/String;
    .end local v12    # "paramNotSupportedCode":I
    .end local v15    # "versions":Ljava/util/Set;, "Ljava/util/Set<Lezvcard/VCardVersion;>;"
    .restart local v5    # "encoding":Lezvcard/parameter/Encoding;
    :cond_112
    move-object/from16 v0, p1

    invoke-virtual {v5, v0}, Lezvcard/parameter/Encoding;->isSupported(Lezvcard/VCardVersion;)Z

    move-result v17

    if-nez v17, :cond_7d

    .line 867
    new-instance v17, Lezvcard/Warning;

    const/16 v18, 0x2

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    const-string v20, "ENCODING"

    aput-object v20, v18, v19

    const/16 v19, 0x1

    aput-object v13, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v14, v1}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface/range {v16 .. v17}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_7d

    .line 876
    .end local v5    # "encoding":Lezvcard/parameter/Encoding;
    .restart local v3    # "dataType":Lezvcard/VCardDataType;
    :cond_13a
    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Lezvcard/VCardDataType;->isSupported(Lezvcard/VCardVersion;)Z

    move-result v17

    if-nez v17, :cond_b7

    .line 877
    new-instance v17, Lezvcard/Warning;

    const/16 v18, 0x2

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    const-string v20, "VALUE"

    aput-object v20, v18, v19

    const/16 v19, 0x1

    aput-object v13, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v14, v1}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface/range {v16 .. v17}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_b7

    .line 887
    .end local v3    # "dataType":Lezvcard/VCardDataType;
    .restart local v9    # "malformedCode":I
    :catch_162
    move-exception v4

    .line 888
    .local v4, "e":Ljava/lang/IllegalStateException;
    new-instance v17, Lezvcard/Warning;

    const/16 v18, 0x2

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    const-string v20, "GEO"

    aput-object v20, v18, v19

    const/16 v19, 0x1

    const-string v20, "GEO"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lezvcard/parameter/VCardParameters;->first(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    aput-object v20, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v9, v1}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface/range {v16 .. v17}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_bb

    .line 893
    .end local v4    # "e":Ljava/lang/IllegalStateException;
    :catch_18d
    move-exception v4

    .line 894
    .restart local v4    # "e":Ljava/lang/IllegalStateException;
    new-instance v17, Lezvcard/Warning;

    const/16 v18, 0x2

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    const-string v20, "INDEX"

    aput-object v20, v18, v19

    const/16 v19, 0x1

    const-string v20, "INDEX"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lezvcard/parameter/VCardParameters;->first(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    aput-object v20, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v9, v1}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface/range {v16 .. v17}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_be

    .line 899
    .end local v4    # "e":Ljava/lang/IllegalStateException;
    :catch_1b8
    move-exception v4

    .line 900
    .restart local v4    # "e":Ljava/lang/IllegalStateException;
    new-instance v17, Lezvcard/Warning;

    const/16 v18, 0x2

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    const-string v20, "PID"

    aput-object v20, v18, v19

    const/16 v19, 0x1

    const-string v20, "PID"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lezvcard/parameter/VCardParameters;->first(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    aput-object v20, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v9, v1}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface/range {v16 .. v17}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_c1

    .line 905
    .end local v4    # "e":Ljava/lang/IllegalStateException;
    :catch_1e3
    move-exception v4

    .line 906
    .restart local v4    # "e":Ljava/lang/IllegalStateException;
    new-instance v17, Lezvcard/Warning;

    const/16 v18, 0x2

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    const-string v20, "PREF"

    aput-object v20, v18, v19

    const/16 v19, 0x1

    const-string v20, "PREF"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lezvcard/parameter/VCardParameters;->first(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    aput-object v20, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v9, v1}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface/range {v16 .. v17}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_c4

    .line 927
    .end local v4    # "e":Ljava/lang/IllegalStateException;
    .restart local v7    # "i$":Ljava/util/Iterator;
    .restart local v12    # "paramNotSupportedCode":I
    :cond_20e
    const/16 v8, 0x16

    .line 928
    .local v8, "invalidCharsetCode":I
    invoke-virtual/range {p0 .. p0}, Lezvcard/parameter/VCardParameters;->getCharset()Ljava/lang/String;

    move-result-object v2

    .line 929
    .local v2, "charsetStr":Ljava/lang/String;
    if-eqz v2, :cond_219

    .line 931
    :try_start_216
    invoke-static {v2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;
    :try_end_219
    .catch Ljava/nio/charset/IllegalCharsetNameException; {:try_start_216 .. :try_end_219} :catch_21a
    .catch Ljava/nio/charset/UnsupportedCharsetException; {:try_start_216 .. :try_end_219} :catch_234

    .line 940
    :cond_219
    :goto_219
    return-object v16

    .line 932
    :catch_21a
    move-exception v4

    .line 933
    .local v4, "e":Ljava/nio/charset/IllegalCharsetNameException;
    new-instance v17, Lezvcard/Warning;

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v2, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v8, v1}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface/range {v16 .. v17}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_219

    .line 934
    .end local v4    # "e":Ljava/nio/charset/IllegalCharsetNameException;
    :catch_234
    move-exception v4

    .line 935
    .local v4, "e":Ljava/nio/charset/UnsupportedCharsetException;
    new-instance v17, Lezvcard/Warning;

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v2, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v8, v1}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface/range {v16 .. v17}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_219
.end method

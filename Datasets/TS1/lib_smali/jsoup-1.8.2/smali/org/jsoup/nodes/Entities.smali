.class public Lorg/jsoup/nodes/Entities;
.super Ljava/lang/Object;
.source "Entities.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jsoup/nodes/Entities$1;,
        Lorg/jsoup/nodes/Entities$CoreCharset;,
        Lorg/jsoup/nodes/Entities$EscapeMode;
    }
.end annotation


# static fields
.field private static final base:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Character;",
            ">;"
        }
    .end annotation
.end field

.field private static final baseByVal:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Character;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final full:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Character;",
            ">;"
        }
    .end annotation
.end field

.field private static final fullByVal:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Character;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final xhtmlArray:[[Ljava/lang/Object;

.field private static final xhtmlByVal:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Character;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 11

    .prologue
    const/4 v8, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 210
    const/4 v5, 0x4

    new-array v5, v5, [[Ljava/lang/Object;

    new-array v6, v8, [Ljava/lang/Object;

    const-string v7, "quot"

    aput-object v7, v6, v9

    const/16 v7, 0x22

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v10

    aput-object v6, v5, v9

    new-array v6, v8, [Ljava/lang/Object;

    const-string v7, "amp"

    aput-object v7, v6, v9

    const/16 v7, 0x26

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v10

    aput-object v6, v5, v10

    new-array v6, v8, [Ljava/lang/Object;

    const-string v7, "lt"

    aput-object v7, v6, v9

    const/16 v7, 0x3c

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v10

    aput-object v6, v5, v8

    const/4 v6, 0x3

    new-array v7, v8, [Ljava/lang/Object;

    const-string v8, "gt"

    aput-object v8, v7, v9

    const/16 v8, 0x3e

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v10

    aput-object v7, v5, v6

    sput-object v5, Lorg/jsoup/nodes/Entities;->xhtmlArray:[[Ljava/lang/Object;

    .line 218
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    sput-object v5, Lorg/jsoup/nodes/Entities;->xhtmlByVal:Ljava/util/Map;

    .line 219
    const-string v5, "entities-base.properties"

    invoke-static {v5}, Lorg/jsoup/nodes/Entities;->loadEntities(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v5

    sput-object v5, Lorg/jsoup/nodes/Entities;->base:Ljava/util/Map;

    .line 220
    sget-object v5, Lorg/jsoup/nodes/Entities;->base:Ljava/util/Map;

    invoke-static {v5}, Lorg/jsoup/nodes/Entities;->toCharacterKey(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v5

    sput-object v5, Lorg/jsoup/nodes/Entities;->baseByVal:Ljava/util/Map;

    .line 221
    const-string v5, "entities-full.properties"

    invoke-static {v5}, Lorg/jsoup/nodes/Entities;->loadEntities(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v5

    sput-object v5, Lorg/jsoup/nodes/Entities;->full:Ljava/util/Map;

    .line 222
    sget-object v5, Lorg/jsoup/nodes/Entities;->full:Ljava/util/Map;

    invoke-static {v5}, Lorg/jsoup/nodes/Entities;->toCharacterKey(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v5

    sput-object v5, Lorg/jsoup/nodes/Entities;->fullByVal:Ljava/util/Map;

    .line 224
    sget-object v0, Lorg/jsoup/nodes/Entities;->xhtmlArray:[[Ljava/lang/Object;

    .local v0, "arr$":[[Ljava/lang/Object;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_74
    if-ge v3, v4, :cond_91

    aget-object v2, v0, v3

    .line 225
    .local v2, "entity":[Ljava/lang/Object;
    aget-object v5, v2, v10

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-char v5, v5

    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1

    .line 226
    .local v1, "c":Ljava/lang/Character;
    sget-object v6, Lorg/jsoup/nodes/Entities;->xhtmlByVal:Ljava/util/Map;

    aget-object v5, v2, v9

    check-cast v5, Ljava/lang/String;

    invoke-interface {v6, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    add-int/lit8 v3, v3, 0x1

    goto :goto_74

    .line 228
    .end local v1    # "c":Ljava/lang/Character;
    .end local v2    # "entity":[Ljava/lang/Object;
    :cond_91
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/util/Map;
    .registers 1

    .prologue
    .line 16
    sget-object v0, Lorg/jsoup/nodes/Entities;->xhtmlByVal:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$100()Ljava/util/Map;
    .registers 1

    .prologue
    .line 16
    sget-object v0, Lorg/jsoup/nodes/Entities;->baseByVal:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$200()Ljava/util/Map;
    .registers 1

    .prologue
    .line 16
    sget-object v0, Lorg/jsoup/nodes/Entities;->fullByVal:Ljava/util/Map;

    return-object v0
.end method

.method private static canEncode(Lorg/jsoup/nodes/Entities$CoreCharset;CLjava/nio/charset/CharsetEncoder;)Z
    .registers 6
    .param p0, "charset"    # Lorg/jsoup/nodes/Entities$CoreCharset;
    .param p1, "c"    # C
    .param p2, "fallback"    # Ljava/nio/charset/CharsetEncoder;

    .prologue
    const/4 v0, 0x1

    .line 186
    sget-object v1, Lorg/jsoup/nodes/Entities$1;->$SwitchMap$org$jsoup$nodes$Entities$CoreCharset:[I

    invoke-virtual {p0}, Lorg/jsoup/nodes/Entities$CoreCharset;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_18

    .line 192
    invoke-virtual {p2, p1}, Ljava/nio/charset/CharsetEncoder;->canEncode(C)Z

    move-result v0

    :cond_10
    :goto_10
    :pswitch_10
    return v0

    .line 188
    :pswitch_11
    const/16 v1, 0x80

    if-lt p1, v1, :cond_10

    const/4 v0, 0x0

    goto :goto_10

    .line 186
    nop

    :pswitch_data_18
    .packed-switch 0x1
        :pswitch_11
        :pswitch_10
    .end packed-switch
.end method

.method static escape(Ljava/lang/String;Lorg/jsoup/nodes/Document$OutputSettings;)Ljava/lang/String;
    .registers 8
    .param p0, "string"    # Ljava/lang/String;
    .param p1, "out"    # Lorg/jsoup/nodes/Document$OutputSettings;

    .prologue
    const/4 v3, 0x0

    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    mul-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .local v0, "accum":Ljava/lang/StringBuilder;
    move-object v1, p0

    move-object v2, p1

    move v4, v3

    move v5, v3

    .line 74
    invoke-static/range {v0 .. v5}, Lorg/jsoup/nodes/Entities;->escape(Ljava/lang/StringBuilder;Ljava/lang/String;Lorg/jsoup/nodes/Document$OutputSettings;ZZZ)V

    .line 75
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method static escape(Ljava/lang/StringBuilder;Ljava/lang/String;Lorg/jsoup/nodes/Document$OutputSettings;ZZZ)V
    .registers 18
    .param p0, "accum"    # Ljava/lang/StringBuilder;
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "out"    # Lorg/jsoup/nodes/Document$OutputSettings;
    .param p3, "inAttribute"    # Z
    .param p4, "normaliseWhite"    # Z
    .param p5, "stripLeadingWhite"    # Z

    .prologue
    .line 82
    const/4 v5, 0x0

    .line 83
    .local v5, "lastWasWhite":Z
    const/4 v9, 0x0

    .line 84
    .local v9, "reachedNonWhite":Z
    invoke-virtual {p2}, Lorg/jsoup/nodes/Document$OutputSettings;->escapeMode()Lorg/jsoup/nodes/Entities$EscapeMode;

    move-result-object v4

    .line 85
    .local v4, "escapeMode":Lorg/jsoup/nodes/Entities$EscapeMode;
    invoke-virtual {p2}, Lorg/jsoup/nodes/Document$OutputSettings;->encoder()Ljava/nio/charset/CharsetEncoder;

    move-result-object v3

    .line 86
    .local v3, "encoder":Ljava/nio/charset/CharsetEncoder;
    invoke-virtual {v3}, Ljava/nio/charset/CharsetEncoder;->charset()Ljava/nio/charset/Charset;

    move-result-object v10

    invoke-virtual {v10}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v10

    # invokes: Lorg/jsoup/nodes/Entities$CoreCharset;->byName(Ljava/lang/String;)Lorg/jsoup/nodes/Entities$CoreCharset;
    invoke-static {v10}, Lorg/jsoup/nodes/Entities$CoreCharset;->access$300(Ljava/lang/String;)Lorg/jsoup/nodes/Entities$CoreCharset;

    move-result-object v2

    .line 87
    .local v2, "coreCharset":Lorg/jsoup/nodes/Entities$CoreCharset;
    invoke-virtual {v4}, Lorg/jsoup/nodes/Entities$EscapeMode;->getMap()Ljava/util/Map;

    move-result-object v7

    .line 88
    .local v7, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Character;Ljava/lang/String;>;"
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    .line 91
    .local v6, "length":I
    const/4 v8, 0x0

    .local v8, "offset":I
    :goto_1f
    if-ge v8, v6, :cond_ee

    .line 92
    invoke-virtual {p1, v8}, Ljava/lang/String;->codePointAt(I)I

    move-result v1

    .line 94
    .local v1, "codePoint":I
    if-eqz p4, :cond_42

    .line 95
    invoke-static {v1}, Lorg/jsoup/helper/StringUtil;->isWhitespace(I)Z

    move-result v10

    if-eqz v10, :cond_40

    .line 96
    if-eqz p5, :cond_31

    if-eqz v9, :cond_33

    :cond_31
    if-eqz v5, :cond_39

    .line 91
    :cond_33
    :goto_33
    invoke-static {v1}, Ljava/lang/Character;->charCount(I)I

    move-result v10

    add-int/2addr v8, v10

    goto :goto_1f

    .line 98
    :cond_39
    const/16 v10, 0x20

    invoke-virtual {p0, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 99
    const/4 v5, 0x1

    .line 100
    goto :goto_33

    .line 102
    :cond_40
    const/4 v5, 0x0

    .line 103
    const/4 v9, 0x1

    .line 107
    :cond_42
    const/high16 v10, 0x10000

    if-ge v1, v10, :cond_c5

    .line 108
    int-to-char v0, v1

    .line 110
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_f0

    .line 139
    invoke-static {v2, v0, v3}, Lorg/jsoup/nodes/Entities;->canEncode(Lorg/jsoup/nodes/Entities$CoreCharset;CLjava/nio/charset/CharsetEncoder;)Z

    move-result v10

    if-eqz v10, :cond_8c

    .line 140
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_33

    .line 112
    :sswitch_54
    const-string v10, "&amp;"

    invoke-virtual {p0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_33

    .line 115
    :sswitch_5a
    sget-object v10, Lorg/jsoup/nodes/Entities$EscapeMode;->xhtml:Lorg/jsoup/nodes/Entities$EscapeMode;

    if-eq v4, v10, :cond_64

    .line 116
    const-string v10, "&nbsp;"

    invoke-virtual {p0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_33

    .line 118
    :cond_64
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_33

    .line 121
    :sswitch_68
    if-nez p3, :cond_70

    .line 122
    const-string v10, "&lt;"

    invoke-virtual {p0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_33

    .line 124
    :cond_70
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_33

    .line 127
    :sswitch_74
    if-nez p3, :cond_7c

    .line 128
    const-string v10, "&gt;"

    invoke-virtual {p0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_33

    .line 130
    :cond_7c
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_33

    .line 133
    :sswitch_80
    if-eqz p3, :cond_88

    .line 134
    const-string v10, "&quot;"

    invoke-virtual {p0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_33

    .line 136
    :cond_88
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_33

    .line 141
    :cond_8c
    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v10

    invoke-interface {v7, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_b0

    .line 142
    const/16 v10, 0x26

    invoke-virtual {p0, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v10

    invoke-interface {v7, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const/16 v11, 0x3b

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_33

    .line 144
    :cond_b0
    const-string v10, "&#x"

    invoke-virtual {p0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const/16 v11, 0x3b

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_33

    .line 147
    .end local v0    # "c":C
    :cond_c5
    new-instance v0, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v10

    invoke-direct {v0, v10}, Ljava/lang/String;-><init>([C)V

    .line 148
    .local v0, "c":Ljava/lang/String;
    invoke-virtual {v3, v0}, Ljava/nio/charset/CharsetEncoder;->canEncode(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_d9

    .line 149
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_33

    .line 151
    :cond_d9
    const-string v10, "&#x"

    invoke-virtual {p0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const/16 v11, 0x3b

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_33

    .line 154
    .end local v0    # "c":Ljava/lang/String;
    .end local v1    # "codePoint":I
    :cond_ee
    return-void

    .line 110
    nop

    :sswitch_data_f0
    .sparse-switch
        0x22 -> :sswitch_80
        0x26 -> :sswitch_54
        0x3c -> :sswitch_68
        0x3e -> :sswitch_74
        0xa0 -> :sswitch_5a
    .end sparse-switch
.end method

.method public static getCharacterByName(Ljava/lang/String;)Ljava/lang/Character;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 69
    sget-object v0, Lorg/jsoup/nodes/Entities;->full:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Character;

    return-object v0
.end method

.method public static isBaseNamedEntity(Ljava/lang/String;)Z
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 60
    sget-object v0, Lorg/jsoup/nodes/Entities;->base:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isNamedEntity(Ljava/lang/String;)Z
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 50
    sget-object v0, Lorg/jsoup/nodes/Entities;->full:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static loadEntities(Ljava/lang/String;)Ljava/util/Map;
    .registers 12
    .param p0, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Character;",
            ">;"
        }
    .end annotation

    .prologue
    .line 231
    new-instance v6, Ljava/util/Properties;

    invoke-direct {v6}, Ljava/util/Properties;-><init>()V

    .line 232
    .local v6, "properties":Ljava/util/Properties;
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 234
    .local v1, "entities":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Character;>;"
    :try_start_a
    const-class v8, Lorg/jsoup/nodes/Entities;

    invoke-virtual {v8, p0}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    .line 235
    .local v4, "in":Ljava/io/InputStream;
    invoke-virtual {v6, v4}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 236
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_16} :catch_45

    .line 241
    invoke-virtual {v6}, Ljava/util/Properties;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_1e
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_65

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 242
    .local v2, "entry":Ljava/util/Map$Entry;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    const/16 v9, 0x10

    invoke-static {v8, v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v8

    int-to-char v8, v8

    invoke-static {v8}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v7

    .line 243
    .local v7, "val":Ljava/lang/Character;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 244
    .local v5, "name":Ljava/lang/String;
    invoke-interface {v1, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1e

    .line 237
    .end local v2    # "entry":Ljava/util/Map$Entry;
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "in":Ljava/io/InputStream;
    .end local v5    # "name":Ljava/lang/String;
    .end local v7    # "val":Ljava/lang/Character;
    :catch_45
    move-exception v0

    .line 238
    .local v0, "e":Ljava/io/IOException;
    new-instance v8, Ljava/util/MissingResourceException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Error loading entities resource: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const-string v10, "Entities"

    invoke-direct {v8, v9, v10, p0}, Ljava/util/MissingResourceException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    throw v8

    .line 246
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v4    # "in":Ljava/io/InputStream;
    :cond_65
    return-object v1
.end method

.method private static toCharacterKey(Ljava/util/Map;)Ljava/util/Map;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Character;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Character;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 250
    .local p0, "inMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Character;>;"
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 251
    .local v4, "outMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Character;Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_d
    :goto_d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 252
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Character;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Character;

    .line 253
    .local v0, "character":Ljava/lang/Character;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 255
    .local v3, "name":Ljava/lang/String;
    invoke-interface {v4, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_39

    .line 257
    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d

    .line 258
    invoke-interface {v4, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d

    .line 260
    :cond_39
    invoke-interface {v4, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d

    .line 263
    .end local v0    # "character":Ljava/lang/Character;
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Character;>;"
    .end local v3    # "name":Ljava/lang/String;
    :cond_3d
    return-object v4
.end method

.method static unescape(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    .line 157
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/jsoup/nodes/Entities;->unescape(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static unescape(Ljava/lang/String;Z)Ljava/lang/String;
    .registers 3
    .param p0, "string"    # Ljava/lang/String;
    .param p1, "strict"    # Z

    .prologue
    .line 167
    invoke-static {p0, p1}, Lorg/jsoup/parser/Parser;->unescapeEntities(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

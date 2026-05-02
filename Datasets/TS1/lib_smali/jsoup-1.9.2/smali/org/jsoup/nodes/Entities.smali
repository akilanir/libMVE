.class public Lorg/jsoup/nodes/Entities;
.super Ljava/lang/Object;
.source "Entities.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
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
    .registers 9

    .prologue
    const/4 v6, 0x2

    const/4 v8, 0x1

    const/4 v4, 0x0

    .line 216
    const/4 v2, 0x4

    new-array v2, v2, [[Ljava/lang/Object;

    new-array v3, v6, [Ljava/lang/Object;

    const-string v5, "quot"

    aput-object v5, v3, v4

    const/16 v5, 0x22

    .line 217
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v8

    aput-object v3, v2, v4

    new-array v3, v6, [Ljava/lang/Object;

    const-string v5, "amp"

    aput-object v5, v3, v4

    const/16 v5, 0x26

    .line 218
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v8

    aput-object v3, v2, v8

    new-array v3, v6, [Ljava/lang/Object;

    const-string v5, "lt"

    aput-object v5, v3, v4

    const/16 v5, 0x3c

    .line 219
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v8

    aput-object v3, v2, v6

    const/4 v3, 0x3

    new-array v5, v6, [Ljava/lang/Object;

    const-string v6, "gt"

    aput-object v6, v5, v4

    const/16 v6, 0x3e

    .line 220
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v8

    aput-object v5, v2, v3

    sput-object v2, Lorg/jsoup/nodes/Entities;->xhtmlArray:[[Ljava/lang/Object;

    .line 224
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    sput-object v2, Lorg/jsoup/nodes/Entities;->xhtmlByVal:Ljava/util/Map;

    .line 225
    const-string v2, "entities-base.properties"

    invoke-static {v2}, Lorg/jsoup/nodes/Entities;->loadEntities(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v2

    sput-object v2, Lorg/jsoup/nodes/Entities;->base:Ljava/util/Map;

    .line 226
    sget-object v2, Lorg/jsoup/nodes/Entities;->base:Ljava/util/Map;

    invoke-static {v2}, Lorg/jsoup/nodes/Entities;->toCharacterKey(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v2

    sput-object v2, Lorg/jsoup/nodes/Entities;->baseByVal:Ljava/util/Map;

    .line 227
    const-string v2, "entities-full.properties"

    invoke-static {v2}, Lorg/jsoup/nodes/Entities;->loadEntities(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v2

    sput-object v2, Lorg/jsoup/nodes/Entities;->full:Ljava/util/Map;

    .line 228
    sget-object v2, Lorg/jsoup/nodes/Entities;->full:Ljava/util/Map;

    invoke-static {v2}, Lorg/jsoup/nodes/Entities;->toCharacterKey(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v2

    sput-object v2, Lorg/jsoup/nodes/Entities;->fullByVal:Ljava/util/Map;

    .line 230
    sget-object v5, Lorg/jsoup/nodes/Entities;->xhtmlArray:[[Ljava/lang/Object;

    array-length v6, v5

    move v3, v4

    .local v0, "c":Ljava/lang/Character;
    .local v1, "entity":[Ljava/lang/Object;
    :goto_74
    if-ge v3, v6, :cond_92

    aget-object v1, v5, v3

    .line 231
    aget-object v2, v1, v8

    .end local v0    # "c":Ljava/lang/Character;
    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-char v2, v2

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    .line 232
    .restart local v0    # "c":Ljava/lang/Character;
    sget-object v7, Lorg/jsoup/nodes/Entities;->xhtmlByVal:Ljava/util/Map;

    aget-object v2, v1, v4

    check-cast v2, Ljava/lang/String;

    invoke-interface {v7, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    add-int/lit8 v2, v3, 0x1

    move v3, v2

    goto :goto_74

    .line 234
    :cond_92
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/util/Map;
    .registers 1

    .prologue
    .line 17
    sget-object v0, Lorg/jsoup/nodes/Entities;->xhtmlByVal:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$100()Ljava/util/Map;
    .registers 1

    .prologue
    .line 17
    sget-object v0, Lorg/jsoup/nodes/Entities;->baseByVal:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$200()Ljava/util/Map;
    .registers 1

    .prologue
    .line 17
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

    .line 192
    sget-object v1, Lorg/jsoup/nodes/Entities$1;->$SwitchMap$org$jsoup$nodes$Entities$CoreCharset:[I

    invoke-virtual {p0}, Lorg/jsoup/nodes/Entities$CoreCharset;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_18

    .line 198
    invoke-virtual {p2, p1}, Ljava/nio/charset/CharsetEncoder;->canEncode(C)Z

    move-result v0

    :cond_10
    :goto_10
    :pswitch_10
    return v0

    .line 194
    :pswitch_11
    const/16 v1, 0x80

    if-lt p1, v1, :cond_10

    const/4 v0, 0x0

    goto :goto_10

    .line 192
    nop

    :pswitch_data_18
    .packed-switch 0x1
        :pswitch_11
        :pswitch_10
    .end packed-switch
.end method

.method static escape(Ljava/lang/String;Lorg/jsoup/nodes/Document$OutputSettings;)Ljava/lang/String;
    .registers 9
    .param p0, "string"    # Ljava/lang/String;
    .param p1, "out"    # Lorg/jsoup/nodes/Document$OutputSettings;

    .prologue
    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    mul-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 76
    .local v0, "accum":Ljava/lang/StringBuilder;
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    :try_start_10
    invoke-static/range {v0 .. v5}, Lorg/jsoup/nodes/Entities;->escape(Ljava/lang/Appendable;Ljava/lang/String;Lorg/jsoup/nodes/Document$OutputSettings;ZZZ)V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_13} :catch_18

    .line 80
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 77
    :catch_18
    move-exception v6

    .line 78
    .local v6, "e":Ljava/io/IOException;
    new-instance v1, Lorg/jsoup/SerializationException;

    invoke-direct {v1, v6}, Lorg/jsoup/SerializationException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method static escape(Ljava/lang/Appendable;Ljava/lang/String;Lorg/jsoup/nodes/Document$OutputSettings;ZZZ)V
    .registers 18
    .param p0, "accum"    # Ljava/lang/Appendable;
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "out"    # Lorg/jsoup/nodes/Document$OutputSettings;
    .param p3, "inAttribute"    # Z
    .param p4, "normaliseWhite"    # Z
    .param p5, "stripLeadingWhite"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    const/4 v5, 0x0

    .line 88
    .local v5, "lastWasWhite":Z
    const/4 v9, 0x0

    .line 89
    .local v9, "reachedNonWhite":Z
    invoke-virtual {p2}, Lorg/jsoup/nodes/Document$OutputSettings;->escapeMode()Lorg/jsoup/nodes/Entities$EscapeMode;

    move-result-object v4

    .line 90
    .local v4, "escapeMode":Lorg/jsoup/nodes/Entities$EscapeMode;
    invoke-virtual {p2}, Lorg/jsoup/nodes/Document$OutputSettings;->encoder()Ljava/nio/charset/CharsetEncoder;

    move-result-object v3

    .line 91
    .local v3, "encoder":Ljava/nio/charset/CharsetEncoder;
    invoke-virtual {v3}, Ljava/nio/charset/CharsetEncoder;->charset()Ljava/nio/charset/Charset;

    move-result-object v10

    invoke-virtual {v10}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v10

    # invokes: Lorg/jsoup/nodes/Entities$CoreCharset;->byName(Ljava/lang/String;)Lorg/jsoup/nodes/Entities$CoreCharset;
    invoke-static {v10}, Lorg/jsoup/nodes/Entities$CoreCharset;->access$300(Ljava/lang/String;)Lorg/jsoup/nodes/Entities$CoreCharset;

    move-result-object v2

    .line 92
    .local v2, "coreCharset":Lorg/jsoup/nodes/Entities$CoreCharset;
    invoke-virtual {v4}, Lorg/jsoup/nodes/Entities$EscapeMode;->getMap()Ljava/util/Map;

    move-result-object v7

    .line 93
    .local v7, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Character;Ljava/lang/String;>;"
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    .line 96
    .local v6, "length":I
    const/4 v8, 0x0

    .local v8, "offset":I
    :goto_1f
    if-ge v8, v6, :cond_f5

    .line 97
    invoke-virtual {p1, v8}, Ljava/lang/String;->codePointAt(I)I

    move-result v1

    .line 99
    .local v1, "codePoint":I
    if-eqz p4, :cond_42

    .line 100
    invoke-static {v1}, Lorg/jsoup/helper/StringUtil;->isWhitespace(I)Z

    move-result v10

    if-eqz v10, :cond_40

    .line 101
    if-eqz p5, :cond_31

    if-eqz v9, :cond_33

    :cond_31
    if-eqz v5, :cond_39

    .line 96
    :cond_33
    :goto_33
    invoke-static {v1}, Ljava/lang/Character;->charCount(I)I

    move-result v10

    add-int/2addr v8, v10

    goto :goto_1f

    .line 103
    :cond_39
    const/16 v10, 0x20

    invoke-interface {p0, v10}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 104
    const/4 v5, 0x1

    .line 105
    goto :goto_33

    .line 107
    :cond_40
    const/4 v5, 0x0

    .line 108
    const/4 v9, 0x1

    .line 112
    :cond_42
    const/high16 v10, 0x10000

    if-ge v1, v10, :cond_cc

    .line 113
    int-to-char v0, v1

    .line 115
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_f6

    .line 145
    invoke-static {v2, v0, v3}, Lorg/jsoup/nodes/Entities;->canEncode(Lorg/jsoup/nodes/Entities$CoreCharset;CLjava/nio/charset/CharsetEncoder;)Z

    move-result v10

    if-eqz v10, :cond_92

    .line 146
    invoke-interface {p0, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto :goto_33

    .line 117
    :sswitch_54
    const-string v10, "&amp;"

    invoke-interface {p0, v10}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_33

    .line 120
    :sswitch_5a
    sget-object v10, Lorg/jsoup/nodes/Entities$EscapeMode;->xhtml:Lorg/jsoup/nodes/Entities$EscapeMode;

    if-eq v4, v10, :cond_64

    .line 121
    const-string v10, "&nbsp;"

    invoke-interface {p0, v10}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_33

    .line 123
    :cond_64
    const-string v10, "&#xa0;"

    invoke-interface {p0, v10}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_33

    .line 127
    :sswitch_6a
    if-eqz p3, :cond_70

    sget-object v10, Lorg/jsoup/nodes/Entities$EscapeMode;->xhtml:Lorg/jsoup/nodes/Entities$EscapeMode;

    if-ne v4, v10, :cond_76

    .line 128
    :cond_70
    const-string v10, "&lt;"

    invoke-interface {p0, v10}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_33

    .line 130
    :cond_76
    invoke-interface {p0, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto :goto_33

    .line 133
    :sswitch_7a
    if-nez p3, :cond_82

    .line 134
    const-string v10, "&gt;"

    invoke-interface {p0, v10}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_33

    .line 136
    :cond_82
    invoke-interface {p0, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto :goto_33

    .line 139
    :sswitch_86
    if-eqz p3, :cond_8e

    .line 140
    const-string v10, "&quot;"

    invoke-interface {p0, v10}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_33

    .line 142
    :cond_8e
    invoke-interface {p0, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto :goto_33

    .line 147
    :cond_92
    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v10

    invoke-interface {v7, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_b7

    .line 148
    const/16 v10, 0x26

    invoke-interface {p0, v10}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    move-result-object v11

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v10

    invoke-interface {v7, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/CharSequence;

    invoke-interface {v11, v10}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v10

    const/16 v11, 0x3b

    invoke-interface {v10, v11}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto/16 :goto_33

    .line 150
    :cond_b7
    const-string v10, "&#x"

    invoke-interface {p0, v10}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v10

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v10

    const/16 v11, 0x3b

    invoke-interface {v10, v11}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto/16 :goto_33

    .line 153
    .end local v0    # "c":C
    :cond_cc
    new-instance v0, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v10

    invoke-direct {v0, v10}, Ljava/lang/String;-><init>([C)V

    .line 154
    .local v0, "c":Ljava/lang/String;
    invoke-virtual {v3, v0}, Ljava/nio/charset/CharsetEncoder;->canEncode(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_e0

    .line 155
    invoke-interface {p0, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto/16 :goto_33

    .line 157
    :cond_e0
    const-string v10, "&#x"

    invoke-interface {p0, v10}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v10

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v10

    const/16 v11, 0x3b

    invoke-interface {v10, v11}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto/16 :goto_33

    .line 160
    .end local v0    # "c":Ljava/lang/String;
    .end local v1    # "codePoint":I
    :cond_f5
    return-void

    .line 115
    :sswitch_data_f6
    .sparse-switch
        0x22 -> :sswitch_86
        0x26 -> :sswitch_54
        0x3c -> :sswitch_6a
        0x3e -> :sswitch_7a
        0xa0 -> :sswitch_5a
    .end sparse-switch
.end method

.method public static getCharacterByName(Ljava/lang/String;)Ljava/lang/Character;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 70
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
    .line 61
    sget-object v0, Lorg/jsoup/nodes/Entities;->base:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isNamedEntity(Ljava/lang/String;)Z
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 51
    sget-object v0, Lorg/jsoup/nodes/Entities;->full:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static loadEntities(Ljava/lang/String;)Ljava/util/Map;
    .registers 11
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
    .line 237
    new-instance v5, Ljava/util/Properties;

    invoke-direct {v5}, Ljava/util/Properties;-><init>()V

    .line 238
    .local v5, "properties":Ljava/util/Properties;
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 240
    .local v1, "entities":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Character;>;"
    :try_start_a
    const-class v7, Lorg/jsoup/nodes/Entities;

    invoke-virtual {v7, p0}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    .line 241
    .local v3, "in":Ljava/io/InputStream;
    invoke-virtual {v5, v3}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 242
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_16} :catch_45

    .line 247
    invoke-virtual {v5}, Ljava/util/Properties;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1e
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_65

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 248
    .local v2, "entry":Ljava/util/Map$Entry;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    const/16 v9, 0x10

    invoke-static {v7, v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v7

    int-to-char v7, v7

    invoke-static {v7}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v6

    .line 249
    .local v6, "val":Ljava/lang/Character;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 250
    .local v4, "name":Ljava/lang/String;
    invoke-interface {v1, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1e

    .line 243
    .end local v2    # "entry":Ljava/util/Map$Entry;
    .end local v3    # "in":Ljava/io/InputStream;
    .end local v4    # "name":Ljava/lang/String;
    .end local v6    # "val":Ljava/lang/Character;
    :catch_45
    move-exception v0

    .line 244
    .local v0, "e":Ljava/io/IOException;
    new-instance v7, Ljava/util/MissingResourceException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Error loading entities resource: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, "Entities"

    invoke-direct {v7, v8, v9, p0}, Ljava/util/MissingResourceException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    throw v7

    .line 252
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v3    # "in":Ljava/io/InputStream;
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
    .line 256
    .local p0, "inMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Character;>;"
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 257
    .local v3, "outMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Character;Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_d
    :goto_d
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3d

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 258
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Character;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Character;

    .line 259
    .local v0, "character":Ljava/lang/Character;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 261
    .local v2, "name":Ljava/lang/String;
    invoke-interface {v3, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_39

    .line 263
    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d

    .line 264
    invoke-interface {v3, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d

    .line 266
    :cond_39
    invoke-interface {v3, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d

    .line 269
    .end local v0    # "character":Ljava/lang/Character;
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Character;>;"
    .end local v2    # "name":Ljava/lang/String;
    :cond_3d
    return-object v3
.end method

.method static unescape(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    .line 163
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
    .line 173
    invoke-static {p0, p1}, Lorg/jsoup/parser/Parser;->unescapeEntities(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

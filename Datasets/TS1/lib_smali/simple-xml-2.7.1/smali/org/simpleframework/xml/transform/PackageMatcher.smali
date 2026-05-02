.class Lorg/simpleframework/xml/transform/PackageMatcher;
.super Ljava/lang/Object;
.source "PackageMatcher.java"

# interfaces
.implements Lorg/simpleframework/xml/transform/Matcher;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    return-void
.end method

.method private matchEnum(Ljava/lang/Class;)Lorg/simpleframework/xml/transform/Transform;
    .registers 4
    .param p1, "type"    # Ljava/lang/Class;

    .prologue
    .line 104
    invoke-virtual {p1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    .line 106
    .local v0, "parent":Ljava/lang/Class;
    if-eqz v0, :cond_1e

    .line 107
    invoke-virtual {v0}, Ljava/lang/Class;->isEnum()Z

    move-result v1

    if-eqz v1, :cond_12

    .line 108
    new-instance v1, Lorg/simpleframework/xml/transform/EnumTransform;

    invoke-direct {v1, p1}, Lorg/simpleframework/xml/transform/EnumTransform;-><init>(Ljava/lang/Class;)V

    .line 114
    :goto_11
    return-object v1

    .line 110
    :cond_12
    invoke-virtual {p1}, Ljava/lang/Class;->isEnum()Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 111
    new-instance v1, Lorg/simpleframework/xml/transform/EnumTransform;

    invoke-direct {v1, p1}, Lorg/simpleframework/xml/transform/EnumTransform;-><init>(Ljava/lang/Class;)V

    goto :goto_11

    .line 114
    :cond_1e
    const/4 v1, 0x0

    goto :goto_11
.end method

.method private matchFile(Ljava/lang/Class;)Lorg/simpleframework/xml/transform/Transform;
    .registers 3
    .param p1, "type"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 255
    const-class v0, Ljava/io/File;

    if-ne p1, v0, :cond_a

    .line 256
    new-instance v0, Lorg/simpleframework/xml/transform/FileTransform;

    invoke-direct {v0}, Lorg/simpleframework/xml/transform/FileTransform;-><init>()V

    .line 258
    :goto_9
    return-object v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private matchLanguage(Ljava/lang/Class;)Lorg/simpleframework/xml/transform/Transform;
    .registers 3
    .param p1, "type"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 129
    const-class v0, Ljava/lang/Boolean;

    if-ne p1, v0, :cond_a

    .line 130
    new-instance v0, Lorg/simpleframework/xml/transform/BooleanTransform;

    invoke-direct {v0}, Lorg/simpleframework/xml/transform/BooleanTransform;-><init>()V

    .line 159
    :goto_9
    return-object v0

    .line 132
    :cond_a
    const-class v0, Ljava/lang/Integer;

    if-ne p1, v0, :cond_14

    .line 133
    new-instance v0, Lorg/simpleframework/xml/transform/IntegerTransform;

    invoke-direct {v0}, Lorg/simpleframework/xml/transform/IntegerTransform;-><init>()V

    goto :goto_9

    .line 135
    :cond_14
    const-class v0, Ljava/lang/Long;

    if-ne p1, v0, :cond_1e

    .line 136
    new-instance v0, Lorg/simpleframework/xml/transform/LongTransform;

    invoke-direct {v0}, Lorg/simpleframework/xml/transform/LongTransform;-><init>()V

    goto :goto_9

    .line 138
    :cond_1e
    const-class v0, Ljava/lang/Double;

    if-ne p1, v0, :cond_28

    .line 139
    new-instance v0, Lorg/simpleframework/xml/transform/DoubleTransform;

    invoke-direct {v0}, Lorg/simpleframework/xml/transform/DoubleTransform;-><init>()V

    goto :goto_9

    .line 141
    :cond_28
    const-class v0, Ljava/lang/Float;

    if-ne p1, v0, :cond_32

    .line 142
    new-instance v0, Lorg/simpleframework/xml/transform/FloatTransform;

    invoke-direct {v0}, Lorg/simpleframework/xml/transform/FloatTransform;-><init>()V

    goto :goto_9

    .line 144
    :cond_32
    const-class v0, Ljava/lang/Short;

    if-ne p1, v0, :cond_3c

    .line 145
    new-instance v0, Lorg/simpleframework/xml/transform/ShortTransform;

    invoke-direct {v0}, Lorg/simpleframework/xml/transform/ShortTransform;-><init>()V

    goto :goto_9

    .line 147
    :cond_3c
    const-class v0, Ljava/lang/Byte;

    if-ne p1, v0, :cond_46

    .line 148
    new-instance v0, Lorg/simpleframework/xml/transform/ByteTransform;

    invoke-direct {v0}, Lorg/simpleframework/xml/transform/ByteTransform;-><init>()V

    goto :goto_9

    .line 150
    :cond_46
    const-class v0, Ljava/lang/Character;

    if-ne p1, v0, :cond_50

    .line 151
    new-instance v0, Lorg/simpleframework/xml/transform/CharacterTransform;

    invoke-direct {v0}, Lorg/simpleframework/xml/transform/CharacterTransform;-><init>()V

    goto :goto_9

    .line 153
    :cond_50
    const-class v0, Ljava/lang/String;

    if-ne p1, v0, :cond_5a

    .line 154
    new-instance v0, Lorg/simpleframework/xml/transform/StringTransform;

    invoke-direct {v0}, Lorg/simpleframework/xml/transform/StringTransform;-><init>()V

    goto :goto_9

    .line 156
    :cond_5a
    const-class v0, Ljava/lang/Class;

    if-ne p1, v0, :cond_64

    .line 157
    new-instance v0, Lorg/simpleframework/xml/transform/ClassTransform;

    invoke-direct {v0}, Lorg/simpleframework/xml/transform/ClassTransform;-><init>()V

    goto :goto_9

    .line 159
    :cond_64
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private matchMath(Ljava/lang/Class;)Lorg/simpleframework/xml/transform/Transform;
    .registers 3
    .param p1, "type"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 174
    const-class v0, Ljava/math/BigDecimal;

    if-ne p1, v0, :cond_a

    .line 175
    new-instance v0, Lorg/simpleframework/xml/transform/BigDecimalTransform;

    invoke-direct {v0}, Lorg/simpleframework/xml/transform/BigDecimalTransform;-><init>()V

    .line 180
    :goto_9
    return-object v0

    .line 177
    :cond_a
    const-class v0, Ljava/math/BigInteger;

    if-ne p1, v0, :cond_14

    .line 178
    new-instance v0, Lorg/simpleframework/xml/transform/BigIntegerTransform;

    invoke-direct {v0}, Lorg/simpleframework/xml/transform/BigIntegerTransform;-><init>()V

    goto :goto_9

    .line 180
    :cond_14
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private matchSQL(Ljava/lang/Class;)Lorg/simpleframework/xml/transform/Transform;
    .registers 3
    .param p1, "type"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 231
    const-class v0, Ljava/sql/Time;

    if-ne p1, v0, :cond_a

    .line 232
    new-instance v0, Lorg/simpleframework/xml/transform/DateTransform;

    invoke-direct {v0, p1}, Lorg/simpleframework/xml/transform/DateTransform;-><init>(Ljava/lang/Class;)V

    .line 240
    :goto_9
    return-object v0

    .line 234
    :cond_a
    const-class v0, Ljava/sql/Date;

    if-ne p1, v0, :cond_14

    .line 235
    new-instance v0, Lorg/simpleframework/xml/transform/DateTransform;

    invoke-direct {v0, p1}, Lorg/simpleframework/xml/transform/DateTransform;-><init>(Ljava/lang/Class;)V

    goto :goto_9

    .line 237
    :cond_14
    const-class v0, Ljava/sql/Timestamp;

    if-ne p1, v0, :cond_1e

    .line 238
    new-instance v0, Lorg/simpleframework/xml/transform/DateTransform;

    invoke-direct {v0, p1}, Lorg/simpleframework/xml/transform/DateTransform;-><init>(Ljava/lang/Class;)V

    goto :goto_9

    .line 240
    :cond_1e
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private matchURL(Ljava/lang/Class;)Lorg/simpleframework/xml/transform/Transform;
    .registers 3
    .param p1, "type"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 273
    const-class v0, Ljava/net/URL;

    if-ne p1, v0, :cond_a

    .line 274
    new-instance v0, Lorg/simpleframework/xml/transform/URLTransform;

    invoke-direct {v0}, Lorg/simpleframework/xml/transform/URLTransform;-><init>()V

    .line 276
    :goto_9
    return-object v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private matchUtility(Ljava/lang/Class;)Lorg/simpleframework/xml/transform/Transform;
    .registers 3
    .param p1, "type"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 195
    const-class v0, Ljava/util/Date;

    if-ne p1, v0, :cond_a

    .line 196
    new-instance v0, Lorg/simpleframework/xml/transform/DateTransform;

    invoke-direct {v0, p1}, Lorg/simpleframework/xml/transform/DateTransform;-><init>(Ljava/lang/Class;)V

    .line 216
    :goto_9
    return-object v0

    .line 198
    :cond_a
    const-class v0, Ljava/util/Locale;

    if-ne p1, v0, :cond_14

    .line 199
    new-instance v0, Lorg/simpleframework/xml/transform/LocaleTransform;

    invoke-direct {v0}, Lorg/simpleframework/xml/transform/LocaleTransform;-><init>()V

    goto :goto_9

    .line 201
    :cond_14
    const-class v0, Ljava/util/Currency;

    if-ne p1, v0, :cond_1e

    .line 202
    new-instance v0, Lorg/simpleframework/xml/transform/CurrencyTransform;

    invoke-direct {v0}, Lorg/simpleframework/xml/transform/CurrencyTransform;-><init>()V

    goto :goto_9

    .line 204
    :cond_1e
    const-class v0, Ljava/util/GregorianCalendar;

    if-ne p1, v0, :cond_28

    .line 205
    new-instance v0, Lorg/simpleframework/xml/transform/GregorianCalendarTransform;

    invoke-direct {v0}, Lorg/simpleframework/xml/transform/GregorianCalendarTransform;-><init>()V

    goto :goto_9

    .line 207
    :cond_28
    const-class v0, Ljava/util/TimeZone;

    if-ne p1, v0, :cond_32

    .line 208
    new-instance v0, Lorg/simpleframework/xml/transform/TimeZoneTransform;

    invoke-direct {v0}, Lorg/simpleframework/xml/transform/TimeZoneTransform;-><init>()V

    goto :goto_9

    .line 210
    :cond_32
    const-class v0, Ljava/util/concurrent/atomic/AtomicInteger;

    if-ne p1, v0, :cond_3c

    .line 211
    new-instance v0, Lorg/simpleframework/xml/transform/AtomicIntegerTransform;

    invoke-direct {v0}, Lorg/simpleframework/xml/transform/AtomicIntegerTransform;-><init>()V

    goto :goto_9

    .line 213
    :cond_3c
    const-class v0, Ljava/util/concurrent/atomic/AtomicLong;

    if-ne p1, v0, :cond_46

    .line 214
    new-instance v0, Lorg/simpleframework/xml/transform/AtomicLongTransform;

    invoke-direct {v0}, Lorg/simpleframework/xml/transform/AtomicLongTransform;-><init>()V

    goto :goto_9

    .line 216
    :cond_46
    const/4 v0, 0x0

    goto :goto_9
.end method


# virtual methods
.method public match(Ljava/lang/Class;)Lorg/simpleframework/xml/transform/Transform;
    .registers 4
    .param p1, "type"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 71
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 73
    .local v0, "name":Ljava/lang/String;
    const-string v1, "java.lang"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 74
    invoke-direct {p0, p1}, Lorg/simpleframework/xml/transform/PackageMatcher;->matchLanguage(Ljava/lang/Class;)Lorg/simpleframework/xml/transform/Transform;

    move-result-object v1

    .line 91
    :goto_10
    return-object v1

    .line 76
    :cond_11
    const-string v1, "java.util"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 77
    invoke-direct {p0, p1}, Lorg/simpleframework/xml/transform/PackageMatcher;->matchUtility(Ljava/lang/Class;)Lorg/simpleframework/xml/transform/Transform;

    move-result-object v1

    goto :goto_10

    .line 79
    :cond_1e
    const-string v1, "java.net"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 80
    invoke-direct {p0, p1}, Lorg/simpleframework/xml/transform/PackageMatcher;->matchURL(Ljava/lang/Class;)Lorg/simpleframework/xml/transform/Transform;

    move-result-object v1

    goto :goto_10

    .line 82
    :cond_2b
    const-string v1, "java.io"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_38

    .line 83
    invoke-direct {p0, p1}, Lorg/simpleframework/xml/transform/PackageMatcher;->matchFile(Ljava/lang/Class;)Lorg/simpleframework/xml/transform/Transform;

    move-result-object v1

    goto :goto_10

    .line 85
    :cond_38
    const-string v1, "java.sql"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_45

    .line 86
    invoke-direct {p0, p1}, Lorg/simpleframework/xml/transform/PackageMatcher;->matchSQL(Ljava/lang/Class;)Lorg/simpleframework/xml/transform/Transform;

    move-result-object v1

    goto :goto_10

    .line 88
    :cond_45
    const-string v1, "java.math"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_52

    .line 89
    invoke-direct {p0, p1}, Lorg/simpleframework/xml/transform/PackageMatcher;->matchMath(Ljava/lang/Class;)Lorg/simpleframework/xml/transform/Transform;

    move-result-object v1

    goto :goto_10

    .line 91
    :cond_52
    invoke-direct {p0, p1}, Lorg/simpleframework/xml/transform/PackageMatcher;->matchEnum(Ljava/lang/Class;)Lorg/simpleframework/xml/transform/Transform;

    move-result-object v1

    goto :goto_10
.end method

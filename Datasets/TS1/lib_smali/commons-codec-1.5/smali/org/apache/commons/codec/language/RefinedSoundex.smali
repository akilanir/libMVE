.class public Lorg/apache/commons/codec/language/RefinedSoundex;
.super Ljava/lang/Object;
.source "RefinedSoundex.java"

# interfaces
.implements Lorg/apache/commons/codec/StringEncoder;


# static fields
.field public static final US_ENGLISH:Lorg/apache/commons/codec/language/RefinedSoundex;

.field private static final US_ENGLISH_MAPPING:[C

.field public static final US_ENGLISH_MAPPING_STRING:Ljava/lang/String; = "01360240043788015936020505"


# instance fields
.field private final soundexMapping:[C


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 43
    const-string v0, "01360240043788015936020505"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/apache/commons/codec/language/RefinedSoundex;->US_ENGLISH_MAPPING:[C

    .line 56
    new-instance v0, Lorg/apache/commons/codec/language/RefinedSoundex;

    invoke-direct {v0}, Lorg/apache/commons/codec/language/RefinedSoundex;-><init>()V

    sput-object v0, Lorg/apache/commons/codec/language/RefinedSoundex;->US_ENGLISH:Lorg/apache/commons/codec/language/RefinedSoundex;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    sget-object v0, Lorg/apache/commons/codec/language/RefinedSoundex;->US_ENGLISH_MAPPING:[C

    iput-object v0, p0, Lorg/apache/commons/codec/language/RefinedSoundex;->soundexMapping:[C

    .line 64
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "mapping"    # Ljava/lang/String;

    .prologue
    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/codec/language/RefinedSoundex;->soundexMapping:[C

    .line 90
    return-void
.end method

.method public constructor <init>([C)V
    .registers 5
    .param p1, "mapping"    # [C

    .prologue
    const/4 v2, 0x0

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    array-length v0, p1

    new-array v0, v0, [C

    iput-object v0, p0, Lorg/apache/commons/codec/language/RefinedSoundex;->soundexMapping:[C

    .line 77
    iget-object v0, p0, Lorg/apache/commons/codec/language/RefinedSoundex;->soundexMapping:[C

    array-length v1, p1

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 78
    return-void
.end method


# virtual methods
.method public difference(Ljava/lang/String;Ljava/lang/String;)I
    .registers 4
    .param p1, "s1"    # Ljava/lang/String;
    .param p2, "s2"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/codec/EncoderException;
        }
    .end annotation

    .prologue
    .line 115
    invoke-static {p0, p1, p2}, Lorg/apache/commons/codec/language/SoundexUtils;->difference(Lorg/apache/commons/codec/StringEncoder;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public encode(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "pObject"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/codec/EncoderException;
        }
    .end annotation

    .prologue
    .line 132
    instance-of v0, p1, Ljava/lang/String;

    if-nez v0, :cond_c

    .line 133
    new-instance v0, Lorg/apache/commons/codec/EncoderException;

    const-string v1, "Parameter supplied to RefinedSoundex encode is not of type java.lang.String"

    invoke-direct {v0, v1}, Lorg/apache/commons/codec/EncoderException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 135
    :cond_c
    check-cast p1, Ljava/lang/String;

    .end local p1    # "pObject":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/apache/commons/codec/language/RefinedSoundex;->soundex(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public encode(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "pString"    # Ljava/lang/String;

    .prologue
    .line 146
    invoke-virtual {p0, p1}, Lorg/apache/commons/codec/language/RefinedSoundex;->soundex(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getMappingCode(C)C
    .registers 4
    .param p1, "c"    # C

    .prologue
    .line 159
    invoke-static {p1}, Ljava/lang/Character;->isLetter(C)Z

    move-result v0

    if-nez v0, :cond_8

    .line 160
    const/4 v0, 0x0

    .line 162
    :goto_7
    return v0

    :cond_8
    iget-object v0, p0, Lorg/apache/commons/codec/language/RefinedSoundex;->soundexMapping:[C

    invoke-static {p1}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v1

    add-int/lit8 v1, v1, -0x41

    aget-char v0, v0, v1

    goto :goto_7
.end method

.method public soundex(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 173
    if-nez p1, :cond_4

    .line 174
    const/4 v4, 0x0

    .line 200
    :goto_3
    return-object v4

    .line 176
    :cond_4
    invoke-static {p1}, Lorg/apache/commons/codec/language/SoundexUtils;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 177
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_10

    move-object v4, p1

    .line 178
    goto :goto_3

    .line 181
    :cond_10
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 182
    .local v3, "sBuf":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 185
    const/16 v2, 0x2a

    .line 187
    .local v2, "last":C
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_20
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v1, v4, :cond_3a

    .line 189
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {p0, v4}, Lorg/apache/commons/codec/language/RefinedSoundex;->getMappingCode(C)C

    move-result v0

    .line 190
    .local v0, "current":C
    if-ne v0, v2, :cond_33

    .line 187
    :goto_30
    add-int/lit8 v1, v1, 0x1

    goto :goto_20

    .line 192
    :cond_33
    if-eqz v0, :cond_38

    .line 193
    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 196
    :cond_38
    move v2, v0

    goto :goto_30

    .line 200
    .end local v0    # "current":C
    :cond_3a
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_3
.end method

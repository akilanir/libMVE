.class public final Lorg/spongycastle/util/test/NumberParsing;
.super Ljava/lang/Object;
.source "NumberParsing.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    return-void
.end method

.method public static decodeIntFromHex(Ljava/lang/String;)I
    .registers 5
    .param p0, "intAsString"    # Ljava/lang/String;

    .prologue
    const/16 v3, 0x10

    const/4 v2, 0x1

    .line 26
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x78

    if-eq v0, v1, :cond_13

    .line 27
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x58

    if-ne v0, v1, :cond_1d

    .line 29
    :cond_13
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v0

    .line 32
    :goto_1c
    return v0

    :cond_1d
    invoke-static {p0, v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v0

    goto :goto_1c
.end method

.method public static decodeLongFromHex(Ljava/lang/String;)J
    .registers 5
    .param p0, "longAsString"    # Ljava/lang/String;

    .prologue
    const/16 v3, 0x10

    const/4 v2, 0x1

    .line 15
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x78

    if-eq v0, v1, :cond_13

    .line 16
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x58

    if-ne v0, v1, :cond_1d

    .line 18
    :cond_13
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v0

    .line 21
    :goto_1c
    return-wide v0

    :cond_1d
    invoke-static {p0, v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v0

    goto :goto_1c
.end method

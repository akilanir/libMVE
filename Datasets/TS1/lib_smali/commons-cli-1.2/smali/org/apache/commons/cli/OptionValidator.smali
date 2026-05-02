.class Lorg/apache/commons/cli/OptionValidator;
.super Ljava/lang/Object;
.source "OptionValidator.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static isValidChar(C)Z
    .registers 2
    .param p0, "c"    # C

    .prologue
    .line 99
    invoke-static {p0}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v0

    return v0
.end method

.method private static isValidOpt(C)Z
    .registers 2
    .param p0, "c"    # C

    .prologue
    .line 88
    invoke-static {p0}, Lorg/apache/commons/cli/OptionValidator;->isValidChar(C)Z

    move-result v0

    if-nez v0, :cond_12

    const/16 v0, 0x20

    if-eq p0, v0, :cond_12

    const/16 v0, 0x3f

    if-eq p0, v0, :cond_12

    const/16 v0, 0x40

    if-ne p0, v0, :cond_14

    :cond_12
    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method static validateOption(Ljava/lang/String;)V
    .registers 7
    .param p0, "opt"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 48
    if-nez p0, :cond_3

    .line 77
    :cond_2
    return-void

    .line 54
    :cond_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_34

    .line 56
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 58
    .local v0, "ch":C
    invoke-static {v0}, Lorg/apache/commons/cli/OptionValidator;->isValidOpt(C)Z

    move-result v3

    if-nez v3, :cond_2

    .line 60
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "illegal option value \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 67
    .end local v0    # "ch":C
    :cond_34
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 69
    .local v1, "chars":[C
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_39
    array-length v3, v1

    if-ge v2, v3, :cond_2

    .line 71
    aget-char v3, v1, v2

    invoke-static {v3}, Lorg/apache/commons/cli/OptionValidator;->isValidChar(C)Z

    move-result v3

    if-nez v3, :cond_65

    .line 73
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "opt contains illegal character value \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    aget-char v5, v1, v2

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 69
    :cond_65
    add-int/lit8 v2, v2, 0x1

    goto :goto_39
.end method

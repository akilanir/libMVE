.class public Lorg/apache/commons/lang3/CharUtils;
.super Ljava/lang/Object;
.source "CharUtils.java"


# static fields
.field private static final CHAR_STRING_ARRAY:[Ljava/lang/String;

.field public static final CR:C = '\r'

.field public static final LF:C = '\n'


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 32
    const/16 v1, 0x80

    new-array v1, v1, [Ljava/lang/String;

    sput-object v1, Lorg/apache/commons/lang3/CharUtils;->CHAR_STRING_ARRAY:[Ljava/lang/String;

    .line 54
    const/4 v0, 0x0

    .local v0, "c":C
    :goto_7
    sget-object v1, Lorg/apache/commons/lang3/CharUtils;->CHAR_STRING_ARRAY:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_18

    .line 55
    sget-object v1, Lorg/apache/commons/lang3/CharUtils;->CHAR_STRING_ARRAY:[Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    .line 54
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_7

    .line 57
    :cond_18
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    return-void
.end method

.method public static isAscii(C)Z
    .registers 2
    .param p0, "ch"    # C

    .prologue
    .line 403
    const/16 v0, 0x80

    if-ge p0, v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static isAsciiAlpha(C)Z
    .registers 2
    .param p0, "ch"    # C

    .prologue
    .line 460
    invoke-static {p0}, Lorg/apache/commons/lang3/CharUtils;->isAsciiAlphaUpper(C)Z

    move-result v0

    if-nez v0, :cond_c

    invoke-static {p0}, Lorg/apache/commons/lang3/CharUtils;->isAsciiAlphaLower(C)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public static isAsciiAlphaLower(C)Z
    .registers 2
    .param p0, "ch"    # C

    .prologue
    .line 498
    const/16 v0, 0x61

    if-lt p0, v0, :cond_a

    const/16 v0, 0x7a

    if-gt p0, v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static isAsciiAlphaUpper(C)Z
    .registers 2
    .param p0, "ch"    # C

    .prologue
    .line 479
    const/16 v0, 0x41

    if-lt p0, v0, :cond_a

    const/16 v0, 0x5a

    if-gt p0, v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static isAsciiAlphanumeric(C)Z
    .registers 2
    .param p0, "ch"    # C

    .prologue
    .line 536
    invoke-static {p0}, Lorg/apache/commons/lang3/CharUtils;->isAsciiAlpha(C)Z

    move-result v0

    if-nez v0, :cond_c

    invoke-static {p0}, Lorg/apache/commons/lang3/CharUtils;->isAsciiNumeric(C)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public static isAsciiControl(C)Z
    .registers 2
    .param p0, "ch"    # C

    .prologue
    .line 441
    const/16 v0, 0x20

    if-lt p0, v0, :cond_8

    const/16 v0, 0x7f

    if-ne p0, v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static isAsciiNumeric(C)Z
    .registers 2
    .param p0, "ch"    # C

    .prologue
    .line 517
    const/16 v0, 0x30

    if-lt p0, v0, :cond_a

    const/16 v0, 0x39

    if-gt p0, v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static isAsciiPrintable(C)Z
    .registers 2
    .param p0, "ch"    # C

    .prologue
    .line 422
    const/16 v0, 0x20

    if-lt p0, v0, :cond_a

    const/16 v0, 0x7f

    if-ge p0, v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static toChar(Ljava/lang/Character;)C
    .registers 3
    .param p0, "ch"    # Ljava/lang/Character;

    .prologue
    .line 130
    if-nez p0, :cond_a

    .line 131
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Character must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 133
    :cond_a
    invoke-virtual {p0}, Ljava/lang/Character;->charValue()C

    move-result v0

    return v0
.end method

.method public static toChar(Ljava/lang/Character;C)C
    .registers 2
    .param p0, "ch"    # Ljava/lang/Character;
    .param p1, "defaultValue"    # C

    .prologue
    .line 150
    if-nez p0, :cond_3

    .line 153
    .end local p1    # "defaultValue":C
    :goto_2
    return p1

    .restart local p1    # "defaultValue":C
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Character;->charValue()C

    move-result p1

    goto :goto_2
.end method

.method public static toChar(Ljava/lang/String;)C
    .registers 3
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 173
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 174
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The String must not be empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 176
    :cond_e
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    return v0
.end method

.method public static toChar(Ljava/lang/String;C)C
    .registers 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "defaultValue"    # C

    .prologue
    .line 195
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 198
    .end local p1    # "defaultValue":C
    :goto_6
    return p1

    .restart local p1    # "defaultValue":C
    :cond_7
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result p1

    goto :goto_6
.end method

.method public static toCharacterObject(C)Ljava/lang/Character;
    .registers 2
    .param p0, "ch"    # C
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 88
    invoke-static {p0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    return-object v0
.end method

.method public static toCharacterObject(Ljava/lang/String;)Ljava/lang/Character;
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 109
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 110
    const/4 v0, 0x0

    .line 112
    :goto_7
    return-object v0

    :cond_8
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    goto :goto_7
.end method

.method public static toIntValue(C)I
    .registers 4
    .param p0, "ch"    # C

    .prologue
    .line 218
    invoke-static {p0}, Lorg/apache/commons/lang3/CharUtils;->isAsciiNumeric(C)Z

    move-result v0

    if-nez v0, :cond_25

    .line 219
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The character "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not in the range \'0\' - \'9\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 221
    :cond_25
    add-int/lit8 v0, p0, -0x30

    return v0
.end method

.method public static toIntValue(CI)I
    .registers 3
    .param p0, "ch"    # C
    .param p1, "defaultValue"    # I

    .prologue
    .line 240
    invoke-static {p0}, Lorg/apache/commons/lang3/CharUtils;->isAsciiNumeric(C)Z

    move-result v0

    if-nez v0, :cond_7

    .line 243
    .end local p1    # "defaultValue":I
    :goto_6
    return p1

    .restart local p1    # "defaultValue":I
    :cond_7
    add-int/lit8 p1, p0, -0x30

    goto :goto_6
.end method

.method public static toIntValue(Ljava/lang/Character;)I
    .registers 3
    .param p0, "ch"    # Ljava/lang/Character;

    .prologue
    .line 263
    if-nez p0, :cond_a

    .line 264
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The character must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 266
    :cond_a
    invoke-virtual {p0}, Ljava/lang/Character;->charValue()C

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/lang3/CharUtils;->toIntValue(C)I

    move-result v0

    return v0
.end method

.method public static toIntValue(Ljava/lang/Character;I)I
    .registers 3
    .param p0, "ch"    # Ljava/lang/Character;
    .param p1, "defaultValue"    # I

    .prologue
    .line 286
    if-nez p0, :cond_3

    .line 289
    .end local p1    # "defaultValue":I
    :goto_2
    return p1

    .restart local p1    # "defaultValue":I
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Character;->charValue()C

    move-result v0

    invoke-static {v0, p1}, Lorg/apache/commons/lang3/CharUtils;->toIntValue(CI)I

    move-result p1

    goto :goto_2
.end method

.method public static toString(C)Ljava/lang/String;
    .registers 4
    .param p0, "ch"    # C

    .prologue
    .line 308
    const/16 v0, 0x80

    if-ge p0, v0, :cond_9

    .line 309
    sget-object v0, Lorg/apache/commons/lang3/CharUtils;->CHAR_STRING_ARRAY:[Ljava/lang/String;

    aget-object v0, v0, p0

    .line 311
    :goto_8
    return-object v0

    :cond_9
    new-instance v0, Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [C

    const/4 v2, 0x0

    aput-char p0, v1, v2

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    goto :goto_8
.end method

.method public static toString(Ljava/lang/Character;)Ljava/lang/String;
    .registers 2
    .param p0, "ch"    # Ljava/lang/Character;

    .prologue
    .line 332
    if-nez p0, :cond_4

    .line 333
    const/4 v0, 0x0

    .line 335
    :goto_3
    return-object v0

    :cond_4
    invoke-virtual {p0}, Ljava/lang/Character;->charValue()C

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/lang3/CharUtils;->toString(C)Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method public static unicodeEscaped(C)Ljava/lang/String;
    .registers 3
    .param p0, "ch"    # C

    .prologue
    .line 353
    const/16 v0, 0x10

    if-ge p0, v0, :cond_1c

    .line 354
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\\u000"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 360
    :goto_1b
    return-object v0

    .line 355
    :cond_1c
    const/16 v0, 0x100

    if-ge p0, v0, :cond_38

    .line 356
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\\u00"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1b

    .line 357
    :cond_38
    const/16 v0, 0x1000

    if-ge p0, v0, :cond_54

    .line 358
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\\u0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1b

    .line 360
    :cond_54
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\\u"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1b
.end method

.method public static unicodeEscaped(Ljava/lang/Character;)Ljava/lang/String;
    .registers 2
    .param p0, "ch"    # Ljava/lang/Character;

    .prologue
    .line 380
    if-nez p0, :cond_4

    .line 381
    const/4 v0, 0x0

    .line 383
    :goto_3
    return-object v0

    :cond_4
    invoke-virtual {p0}, Ljava/lang/Character;->charValue()C

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/lang3/CharUtils;->unicodeEscaped(C)Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.class public Lorg/mozilla/javascript/json/JsonParser;
.super Ljava/lang/Object;
.source "JsonParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/json/JsonParser$ParseException;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private cx:Lorg/mozilla/javascript/Context;

.field private length:I

.field private pos:I

.field private scope:Lorg/mozilla/javascript/Scriptable;

.field private src:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 23
    const-class v0, Lorg/mozilla/javascript/json/JsonParser;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lorg/mozilla/javascript/json/JsonParser;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)V
    .registers 3
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lorg/mozilla/javascript/json/JsonParser;->cx:Lorg/mozilla/javascript/Context;

    .line 34
    iput-object p2, p0, Lorg/mozilla/javascript/json/JsonParser;->scope:Lorg/mozilla/javascript/Scriptable;

    .line 35
    return-void
.end method

.method private consume(C)V
    .registers 6
    .param p1, "token"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/mozilla/javascript/json/JsonParser$ParseException;
        }
    .end annotation

    .prologue
    .line 390
    invoke-direct {p0}, Lorg/mozilla/javascript/json/JsonParser;->consumeWhitespace()V

    .line 391
    iget v1, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    iget v2, p0, Lorg/mozilla/javascript/json/JsonParser;->length:I

    if-lt v1, v2, :cond_28

    .line 392
    new-instance v1, Lorg/mozilla/javascript/json/JsonParser$ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " but reached end of stream"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/mozilla/javascript/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 394
    :cond_28
    iget-object v1, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v2, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 395
    .local v0, "c":C
    if-ne v0, p1, :cond_37

    .line 396
    return-void

    .line 398
    :cond_37
    new-instance v1, Lorg/mozilla/javascript/json/JsonParser$ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " found "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/mozilla/javascript/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private consumeWhitespace()V
    .registers 4

    .prologue
    .line 374
    :goto_0
    iget v1, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    iget v2, p0, Lorg/mozilla/javascript/json/JsonParser;->length:I

    if-ge v1, v2, :cond_11

    .line 375
    iget-object v1, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v2, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 376
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_1a

    .line 387
    .end local v0    # "c":C
    :cond_11
    return-void

    .line 381
    .restart local v0    # "c":C
    :sswitch_12
    iget v1, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    goto :goto_0

    .line 376
    nop

    :sswitch_data_1a
    .sparse-switch
        0x9 -> :sswitch_12
        0xa -> :sswitch_12
        0xd -> :sswitch_12
        0x20 -> :sswitch_12
    .end sparse-switch
.end method

.method private fromHex(C)I
    .registers 3
    .param p1, "c"    # C

    .prologue
    .line 264
    const/16 v0, 0x30

    if-lt p1, v0, :cond_b

    const/16 v0, 0x39

    if-gt p1, v0, :cond_b

    add-int/lit8 v0, p1, -0x30

    :goto_a
    return v0

    :cond_b
    const/16 v0, 0x41

    if-lt p1, v0, :cond_18

    const/16 v0, 0x46

    if-gt p1, v0, :cond_18

    add-int/lit8 v0, p1, -0x41

    add-int/lit8 v0, v0, 0xa

    goto :goto_a

    :cond_18
    const/16 v0, 0x61

    if-lt p1, v0, :cond_25

    const/16 v0, 0x66

    if-gt p1, v0, :cond_25

    add-int/lit8 v0, p1, -0x61

    add-int/lit8 v0, v0, 0xa

    goto :goto_a

    :cond_25
    const/4 v0, -0x1

    goto :goto_a
.end method

.method private nextOrNumberError(I)C
    .registers 5
    .param p1, "numberStart"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/mozilla/javascript/json/JsonParser$ParseException;
        }
    .end annotation

    .prologue
    .line 324
    iget v0, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    iget v1, p0, Lorg/mozilla/javascript/json/JsonParser;->length:I

    if-lt v0, v1, :cond_d

    .line 325
    iget v0, p0, Lorg/mozilla/javascript/json/JsonParser;->length:I

    invoke-direct {p0, p1, v0}, Lorg/mozilla/javascript/json/JsonParser;->numberError(II)Lorg/mozilla/javascript/json/JsonParser$ParseException;

    move-result-object v0

    throw v0

    .line 327
    :cond_d
    iget-object v0, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v1, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    return v0
.end method

.method private numberError(II)Lorg/mozilla/javascript/json/JsonParser$ParseException;
    .registers 6
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .line 320
    new-instance v0, Lorg/mozilla/javascript/json/JsonParser$ParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported number format: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    invoke-virtual {v2, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private readArray()Ljava/lang/Object;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/mozilla/javascript/json/JsonParser$ParseException;
        }
    .end annotation

    .prologue
    .line 139
    invoke-direct {p0}, Lorg/mozilla/javascript/json/JsonParser;->consumeWhitespace()V

    .line 141
    iget v3, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    iget v4, p0, Lorg/mozilla/javascript/json/JsonParser;->length:I

    if-ge v3, v4, :cond_25

    iget-object v3, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v4, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x5d

    if-ne v3, v4, :cond_25

    .line 142
    iget v3, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    .line 143
    iget-object v3, p0, Lorg/mozilla/javascript/json/JsonParser;->cx:Lorg/mozilla/javascript/Context;

    iget-object v4, p0, Lorg/mozilla/javascript/json/JsonParser;->scope:Lorg/mozilla/javascript/Scriptable;

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Scriptable;

    move-result-object v3

    .line 155
    :goto_24
    return-object v3

    .line 145
    :cond_25
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 146
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const/4 v2, 0x0

    .line 147
    .local v2, "needsComma":Z
    :goto_2b
    iget v3, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    iget v4, p0, Lorg/mozilla/javascript/json/JsonParser;->length:I

    if-ge v3, v4, :cond_81

    .line 148
    iget-object v3, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v4, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 149
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_8a

    .line 164
    if-eqz v2, :cond_78

    .line 165
    new-instance v3, Lorg/mozilla/javascript/json/JsonParser$ParseException;

    const-string v4, "Missing comma in array literal"

    invoke-direct {v3, v4}, Lorg/mozilla/javascript/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 151
    :sswitch_46
    if-nez v2, :cond_50

    .line 152
    new-instance v3, Lorg/mozilla/javascript/json/JsonParser$ParseException;

    const-string v4, "Unexpected comma in array literal"

    invoke-direct {v3, v4}, Lorg/mozilla/javascript/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 154
    :cond_50
    iget v3, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    .line 155
    iget-object v3, p0, Lorg/mozilla/javascript/json/JsonParser;->cx:Lorg/mozilla/javascript/Context;

    iget-object v4, p0, Lorg/mozilla/javascript/json/JsonParser;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v1}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v3

    goto :goto_24

    .line 157
    :sswitch_63
    if-nez v2, :cond_6d

    .line 158
    new-instance v3, Lorg/mozilla/javascript/json/JsonParser$ParseException;

    const-string v4, "Unexpected comma in array literal"

    invoke-direct {v3, v4}, Lorg/mozilla/javascript/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 160
    :cond_6d
    const/4 v2, 0x0

    .line 161
    iget v3, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    .line 170
    :goto_74
    invoke-direct {p0}, Lorg/mozilla/javascript/json/JsonParser;->consumeWhitespace()V

    goto :goto_2b

    .line 167
    :cond_78
    invoke-direct {p0}, Lorg/mozilla/javascript/json/JsonParser;->readValue()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    const/4 v2, 0x1

    goto :goto_74

    .line 172
    .end local v0    # "c":C
    :cond_81
    new-instance v3, Lorg/mozilla/javascript/json/JsonParser$ParseException;

    const-string v4, "Unterminated array literal"

    invoke-direct {v3, v4}, Lorg/mozilla/javascript/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 149
    nop

    :sswitch_data_8a
    .sparse-switch
        0x2c -> :sswitch_63
        0x5d -> :sswitch_46
    .end sparse-switch
.end method

.method private readDigits()V
    .registers 4

    .prologue
    .line 331
    :goto_0
    iget v1, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    iget v2, p0, Lorg/mozilla/javascript/json/JsonParser;->length:I

    if-ge v1, v2, :cond_16

    .line 332
    iget-object v1, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v2, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 333
    .local v0, "c":C
    const/16 v1, 0x30

    if-lt v0, v1, :cond_16

    const/16 v1, 0x39

    if-le v0, v1, :cond_17

    .line 337
    .end local v0    # "c":C
    :cond_16
    return-void

    .line 331
    .restart local v0    # "c":C
    :cond_17
    iget v1, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    goto :goto_0
.end method

.method private readFalse()Ljava/lang/Boolean;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/mozilla/javascript/json/JsonParser$ParseException;
        }
    .end annotation

    .prologue
    .line 351
    iget v0, p0, Lorg/mozilla/javascript/json/JsonParser;->length:I

    iget v1, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    sub-int/2addr v0, v1

    const/4 v1, 0x4

    if-lt v0, v1, :cond_3e

    iget-object v0, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v1, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x61

    if-ne v0, v1, :cond_3e

    iget-object v0, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v1, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x6c

    if-ne v0, v1, :cond_3e

    iget-object v0, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v1, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v1, v1, 0x2

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x73

    if-ne v0, v1, :cond_3e

    iget-object v0, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v1, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v1, v1, 0x3

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x65

    if-eq v0, v1, :cond_46

    .line 356
    :cond_3e
    new-instance v0, Lorg/mozilla/javascript/json/JsonParser$ParseException;

    const-string v1, "Unexpected token: f"

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 358
    :cond_46
    iget v0, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v0, v0, 0x4

    iput v0, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    .line 359
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v0
.end method

.method private readNull()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/mozilla/javascript/json/JsonParser$ParseException;
        }
    .end annotation

    .prologue
    const/16 v2, 0x6c

    .line 363
    iget v0, p0, Lorg/mozilla/javascript/json/JsonParser;->length:I

    iget v1, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    sub-int/2addr v0, v1

    const/4 v1, 0x3

    if-lt v0, v1, :cond_2e

    iget-object v0, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v1, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x75

    if-ne v0, v1, :cond_2e

    iget-object v0, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v1, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v2, :cond_2e

    iget-object v0, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v1, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v1, v1, 0x2

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-eq v0, v2, :cond_36

    .line 367
    :cond_2e
    new-instance v0, Lorg/mozilla/javascript/json/JsonParser$ParseException;

    const-string v1, "Unexpected token: n"

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 369
    :cond_36
    iget v0, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v0, v0, 0x3

    iput v0, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    .line 370
    const/4 v0, 0x0

    return-object v0
.end method

.method private readNumber(C)Ljava/lang/Number;
    .registers 12
    .param p1, "c"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/mozilla/javascript/json/JsonParser$ParseException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x2d

    const/16 v8, 0x39

    const/16 v7, 0x30

    .line 271
    sget-boolean v5, Lorg/mozilla/javascript/json/JsonParser;->$assertionsDisabled:Z

    if-nez v5, :cond_16

    if-eq p1, v9, :cond_16

    if-lt p1, v7, :cond_10

    if-le p1, v8, :cond_16

    :cond_10
    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5}, Ljava/lang/AssertionError;-><init>()V

    throw v5

    .line 272
    :cond_16
    iget v5, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v4, v5, -0x1

    .line 273
    .local v4, "numberStart":I
    if-ne p1, v9, :cond_2b

    .line 274
    invoke-direct {p0, v4}, Lorg/mozilla/javascript/json/JsonParser;->nextOrNumberError(I)C

    move-result p1

    .line 275
    if-lt p1, v7, :cond_24

    if-le p1, v8, :cond_2b

    .line 276
    :cond_24
    iget v5, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    invoke-direct {p0, v4, v5}, Lorg/mozilla/javascript/json/JsonParser;->numberError(II)Lorg/mozilla/javascript/json/JsonParser$ParseException;

    move-result-object v5

    throw v5

    .line 279
    :cond_2b
    if-eq p1, v7, :cond_30

    .line 280
    invoke-direct {p0}, Lorg/mozilla/javascript/json/JsonParser;->readDigits()V

    .line 283
    :cond_30
    iget v5, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    iget v6, p0, Lorg/mozilla/javascript/json/JsonParser;->length:I

    if-ge v5, v6, :cond_5a

    .line 284
    iget-object v5, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v6, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    invoke-virtual {v5, v6}, Ljava/lang/String;->charAt(I)C

    move-result p1

    .line 285
    const/16 v5, 0x2e

    if-ne p1, v5, :cond_5a

    .line 286
    iget v5, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    .line 287
    invoke-direct {p0, v4}, Lorg/mozilla/javascript/json/JsonParser;->nextOrNumberError(I)C

    move-result p1

    .line 288
    if-lt p1, v7, :cond_50

    if-le p1, v8, :cond_57

    .line 289
    :cond_50
    iget v5, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    invoke-direct {p0, v4, v5}, Lorg/mozilla/javascript/json/JsonParser;->numberError(II)Lorg/mozilla/javascript/json/JsonParser$ParseException;

    move-result-object v5

    throw v5

    .line 291
    :cond_57
    invoke-direct {p0}, Lorg/mozilla/javascript/json/JsonParser;->readDigits()V

    .line 295
    :cond_5a
    iget v5, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    iget v6, p0, Lorg/mozilla/javascript/json/JsonParser;->length:I

    if-ge v5, v6, :cond_92

    .line 296
    iget-object v5, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v6, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    invoke-virtual {v5, v6}, Ljava/lang/String;->charAt(I)C

    move-result p1

    .line 297
    const/16 v5, 0x65

    if-eq p1, v5, :cond_70

    const/16 v5, 0x45

    if-ne p1, v5, :cond_92

    .line 298
    :cond_70
    iget v5, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    .line 299
    invoke-direct {p0, v4}, Lorg/mozilla/javascript/json/JsonParser;->nextOrNumberError(I)C

    move-result p1

    .line 300
    if-eq p1, v9, :cond_80

    const/16 v5, 0x2b

    if-ne p1, v5, :cond_84

    .line 301
    :cond_80
    invoke-direct {p0, v4}, Lorg/mozilla/javascript/json/JsonParser;->nextOrNumberError(I)C

    move-result p1

    .line 303
    :cond_84
    if-lt p1, v7, :cond_88

    if-le p1, v8, :cond_8f

    .line 304
    :cond_88
    iget v5, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    invoke-direct {p0, v4, v5}, Lorg/mozilla/javascript/json/JsonParser;->numberError(II)Lorg/mozilla/javascript/json/JsonParser$ParseException;

    move-result-object v5

    throw v5

    .line 306
    :cond_8f
    invoke-direct {p0}, Lorg/mozilla/javascript/json/JsonParser;->readDigits()V

    .line 309
    :cond_92
    iget-object v5, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v6, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    invoke-virtual {v5, v4, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 310
    .local v3, "num":Ljava/lang/String;
    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    .line 311
    .local v0, "dval":D
    double-to-int v2, v0

    .line 312
    .local v2, "ival":I
    int-to-double v5, v2

    cmpl-double v5, v5, v0

    if-nez v5, :cond_a9

    .line 313
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 315
    :goto_a8
    return-object v5

    :cond_a9
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    goto :goto_a8
.end method

.method private readObject()Ljava/lang/Object;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/mozilla/javascript/json/JsonParser$ParseException;
        }
    .end annotation

    .prologue
    .line 89
    invoke-direct {p0}, Lorg/mozilla/javascript/json/JsonParser;->consumeWhitespace()V

    .line 90
    iget-object v7, p0, Lorg/mozilla/javascript/json/JsonParser;->cx:Lorg/mozilla/javascript/Context;

    iget-object v8, p0, Lorg/mozilla/javascript/json/JsonParser;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-virtual {v7, v8}, Lorg/mozilla/javascript/Context;->newObject(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v5

    .line 92
    .local v5, "object":Lorg/mozilla/javascript/Scriptable;
    iget v7, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    iget v8, p0, Lorg/mozilla/javascript/json/JsonParser;->length:I

    if-ge v7, v8, :cond_24

    iget-object v7, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v8, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    invoke-virtual {v7, v8}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v8, 0x7d

    if-ne v7, v8, :cond_24

    .line 93
    iget v7, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    .line 106
    :cond_23
    return-object v5

    .line 98
    :cond_24
    const/4 v4, 0x0

    .line 99
    .local v4, "needsComma":Z
    :goto_25
    iget v7, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    iget v8, p0, Lorg/mozilla/javascript/json/JsonParser;->length:I

    if-ge v7, v8, :cond_86

    .line 100
    iget-object v7, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v8, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    invoke-virtual {v7, v8}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 101
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_8e

    .line 131
    new-instance v7, Lorg/mozilla/javascript/json/JsonParser$ParseException;

    const-string v8, "Unexpected token in object literal"

    invoke-direct {v7, v8}, Lorg/mozilla/javascript/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 103
    :sswitch_42
    if-nez v4, :cond_23

    .line 104
    new-instance v7, Lorg/mozilla/javascript/json/JsonParser$ParseException;

    const-string v8, "Unexpected comma in object literal"

    invoke-direct {v7, v8}, Lorg/mozilla/javascript/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 108
    :sswitch_4c
    if-nez v4, :cond_56

    .line 109
    new-instance v7, Lorg/mozilla/javascript/json/JsonParser$ParseException;

    const-string v8, "Unexpected comma in object literal"

    invoke-direct {v7, v8}, Lorg/mozilla/javascript/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 111
    :cond_56
    const/4 v4, 0x0

    .line 133
    :goto_57
    invoke-direct {p0}, Lorg/mozilla/javascript/json/JsonParser;->consumeWhitespace()V

    goto :goto_25

    .line 114
    :sswitch_5b
    if-eqz v4, :cond_65

    .line 115
    new-instance v7, Lorg/mozilla/javascript/json/JsonParser$ParseException;

    const-string v8, "Missing comma in object literal"

    invoke-direct {v7, v8}, Lorg/mozilla/javascript/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 117
    :cond_65
    invoke-direct {p0}, Lorg/mozilla/javascript/json/JsonParser;->readString()Ljava/lang/String;

    move-result-object v1

    .line 118
    .local v1, "id":Ljava/lang/String;
    const/16 v7, 0x3a

    invoke-direct {p0, v7}, Lorg/mozilla/javascript/json/JsonParser;->consume(C)V

    .line 119
    invoke-direct {p0}, Lorg/mozilla/javascript/json/JsonParser;->readValue()Ljava/lang/Object;

    move-result-object v6

    .line 121
    .local v6, "value":Ljava/lang/Object;
    invoke-static {v1}, Lorg/mozilla/javascript/ScriptRuntime;->indexFromString(Ljava/lang/String;)J

    move-result-wide v2

    .line 122
    .local v2, "index":J
    const-wide/16 v7, 0x0

    cmp-long v7, v2, v7

    if-gez v7, :cond_81

    .line 123
    invoke-interface {v5, v1, v5, v6}, Lorg/mozilla/javascript/Scriptable;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 128
    :goto_7f
    const/4 v4, 0x1

    .line 129
    goto :goto_57

    .line 125
    :cond_81
    long-to-int v7, v2

    invoke-interface {v5, v7, v5, v6}, Lorg/mozilla/javascript/Scriptable;->put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_7f

    .line 135
    .end local v0    # "c":C
    .end local v1    # "id":Ljava/lang/String;
    .end local v2    # "index":J
    .end local v6    # "value":Ljava/lang/Object;
    :cond_86
    new-instance v7, Lorg/mozilla/javascript/json/JsonParser$ParseException;

    const-string v8, "Unterminated object literal"

    invoke-direct {v7, v8}, Lorg/mozilla/javascript/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 101
    :sswitch_data_8e
    .sparse-switch
        0x22 -> :sswitch_5b
        0x2c -> :sswitch_4c
        0x7d -> :sswitch_42
    .end sparse-switch
.end method

.method private readString()Ljava/lang/String;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/mozilla/javascript/json/JsonParser$ParseException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x1f

    const/16 v8, 0x22

    const/16 v7, 0x5c

    .line 180
    iget v3, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    .line 181
    .local v3, "stringStart":I
    :cond_8
    iget v4, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    iget v5, p0, Lorg/mozilla/javascript/json/JsonParser;->length:I

    if-ge v4, v5, :cond_26

    .line 182
    iget-object v4, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v5, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 183
    .local v1, "c":C
    if-gt v1, v9, :cond_24

    .line 184
    new-instance v4, Lorg/mozilla/javascript/json/JsonParser$ParseException;

    const-string v5, "String contains control character"

    invoke-direct {v4, v5}, Lorg/mozilla/javascript/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 185
    :cond_24
    if-ne v1, v7, :cond_47

    .line 197
    .end local v1    # "c":C
    :cond_26
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 198
    .local v0, "b":Ljava/lang/StringBuilder;
    :cond_2b
    iget v4, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    iget v5, p0, Lorg/mozilla/javascript/json/JsonParser;->length:I

    if-ge v4, v5, :cond_193

    .line 199
    sget-boolean v4, Lorg/mozilla/javascript/json/JsonParser;->$assertionsDisabled:Z

    if-nez v4, :cond_54

    iget-object v4, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v5, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-eq v4, v7, :cond_54

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 187
    .end local v0    # "b":Ljava/lang/StringBuilder;
    .restart local v1    # "c":C
    :cond_47
    if-ne v1, v8, :cond_8

    .line 188
    iget-object v4, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v5, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 256
    :goto_53
    return-object v4

    .line 200
    .end local v1    # "c":C
    .restart local v0    # "b":Ljava/lang/StringBuilder;
    :cond_54
    iget-object v4, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v5, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v0, v4, v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 201
    iget v4, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    iget v5, p0, Lorg/mozilla/javascript/json/JsonParser;->length:I

    if-lt v4, v5, :cond_6b

    .line 202
    new-instance v4, Lorg/mozilla/javascript/json/JsonParser$ParseException;

    const-string v5, "Unterminated string"

    invoke-direct {v4, v5}, Lorg/mozilla/javascript/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 204
    :cond_6b
    iget-object v4, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v5, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 205
    .restart local v1    # "c":C
    sparse-switch v1, :sswitch_data_19c

    .line 245
    new-instance v4, Lorg/mozilla/javascript/json/JsonParser$ParseException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unexpected character in string: \'\\"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/mozilla/javascript/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 207
    :sswitch_99
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 247
    :goto_9c
    iget v3, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    .line 248
    :cond_9e
    iget v4, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    iget v5, p0, Lorg/mozilla/javascript/json/JsonParser;->length:I

    if-ge v4, v5, :cond_2b

    .line 249
    iget-object v4, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v5, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 250
    if-gt v1, v9, :cond_180

    .line 251
    new-instance v4, Lorg/mozilla/javascript/json/JsonParser$ParseException;

    const-string v5, "String contains control character"

    invoke-direct {v4, v5}, Lorg/mozilla/javascript/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 210
    :sswitch_ba
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_9c

    .line 213
    :sswitch_be
    const/16 v4, 0x2f

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_9c

    .line 216
    :sswitch_c4
    const/16 v4, 0x8

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_9c

    .line 219
    :sswitch_ca
    const/16 v4, 0xc

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_9c

    .line 222
    :sswitch_d0
    const/16 v4, 0xa

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_9c

    .line 225
    :sswitch_d6
    const/16 v4, 0xd

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_9c

    .line 228
    :sswitch_dc
    const/16 v4, 0x9

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_9c

    .line 231
    :sswitch_e2
    iget v4, p0, Lorg/mozilla/javascript/json/JsonParser;->length:I

    iget v5, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    sub-int/2addr v4, v5

    const/4 v5, 0x5

    if-ge v4, v5, :cond_10b

    .line 232
    new-instance v4, Lorg/mozilla/javascript/json/JsonParser$ParseException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid character code: \\u"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v7, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    invoke-virtual {v6, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/mozilla/javascript/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 234
    :cond_10b
    iget-object v4, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v5, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v5, v5, 0x0

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-direct {p0, v4}, Lorg/mozilla/javascript/json/JsonParser;->fromHex(C)I

    move-result v4

    shl-int/lit8 v4, v4, 0xc

    iget-object v5, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v6, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-direct {p0, v5}, Lorg/mozilla/javascript/json/JsonParser;->fromHex(C)I

    move-result v5

    shl-int/lit8 v5, v5, 0x8

    or-int/2addr v4, v5

    iget-object v5, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v6, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v6, v6, 0x2

    invoke-virtual {v5, v6}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-direct {p0, v5}, Lorg/mozilla/javascript/json/JsonParser;->fromHex(C)I

    move-result v5

    shl-int/lit8 v5, v5, 0x4

    or-int/2addr v4, v5

    iget-object v5, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v6, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v6, v6, 0x3

    invoke-virtual {v5, v6}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-direct {p0, v5}, Lorg/mozilla/javascript/json/JsonParser;->fromHex(C)I

    move-result v5

    or-int v2, v4, v5

    .line 238
    .local v2, "code":I
    if-gez v2, :cond_174

    .line 239
    new-instance v4, Lorg/mozilla/javascript/json/JsonParser$ParseException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid character code: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v7, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    iget v8, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v8, v8, 0x4

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/mozilla/javascript/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 241
    :cond_174
    iget v4, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v4, v4, 0x4

    iput v4, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    .line 242
    int-to-char v4, v2

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_9c

    .line 252
    .end local v2    # "code":I
    :cond_180
    if-eq v1, v7, :cond_2b

    .line 254
    if-ne v1, v8, :cond_9e

    .line 255
    iget-object v4, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v5, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v0, v4, v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 256
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_53

    .line 260
    .end local v1    # "c":C
    :cond_193
    new-instance v4, Lorg/mozilla/javascript/json/JsonParser$ParseException;

    const-string v5, "Unterminated string literal"

    invoke-direct {v4, v5}, Lorg/mozilla/javascript/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 205
    nop

    :sswitch_data_19c
    .sparse-switch
        0x22 -> :sswitch_99
        0x2f -> :sswitch_be
        0x5c -> :sswitch_ba
        0x62 -> :sswitch_c4
        0x66 -> :sswitch_ca
        0x6e -> :sswitch_d0
        0x72 -> :sswitch_d6
        0x74 -> :sswitch_dc
        0x75 -> :sswitch_e2
    .end sparse-switch
.end method

.method private readTrue()Ljava/lang/Boolean;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/mozilla/javascript/json/JsonParser$ParseException;
        }
    .end annotation

    .prologue
    .line 340
    iget v0, p0, Lorg/mozilla/javascript/json/JsonParser;->length:I

    iget v1, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    sub-int/2addr v0, v1

    const/4 v1, 0x3

    if-lt v0, v1, :cond_30

    iget-object v0, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v1, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x72

    if-ne v0, v1, :cond_30

    iget-object v0, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v1, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x75

    if-ne v0, v1, :cond_30

    iget-object v0, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v1, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v1, v1, 0x2

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x65

    if-eq v0, v1, :cond_38

    .line 344
    :cond_30
    new-instance v0, Lorg/mozilla/javascript/json/JsonParser$ParseException;

    const-string v1, "Unexpected token: t"

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 346
    :cond_38
    iget v0, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v0, v0, 0x3

    iput v0, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    .line 347
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0
.end method

.method private readValue()Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/mozilla/javascript/json/JsonParser$ParseException;
        }
    .end annotation

    .prologue
    .line 53
    invoke-direct {p0}, Lorg/mozilla/javascript/json/JsonParser;->consumeWhitespace()V

    .line 54
    iget v1, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    iget v2, p0, Lorg/mozilla/javascript/json/JsonParser;->length:I

    if-ge v1, v2, :cond_54

    .line 55
    iget-object v1, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    iget v2, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 56
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_5c

    .line 82
    new-instance v1, Lorg/mozilla/javascript/json/JsonParser$ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected token: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/mozilla/javascript/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 58
    :sswitch_31
    invoke-direct {p0}, Lorg/mozilla/javascript/json/JsonParser;->readObject()Ljava/lang/Object;

    move-result-object v1

    .line 80
    :goto_35
    return-object v1

    .line 60
    :sswitch_36
    invoke-direct {p0}, Lorg/mozilla/javascript/json/JsonParser;->readArray()Ljava/lang/Object;

    move-result-object v1

    goto :goto_35

    .line 62
    :sswitch_3b
    invoke-direct {p0}, Lorg/mozilla/javascript/json/JsonParser;->readTrue()Ljava/lang/Boolean;

    move-result-object v1

    goto :goto_35

    .line 64
    :sswitch_40
    invoke-direct {p0}, Lorg/mozilla/javascript/json/JsonParser;->readFalse()Ljava/lang/Boolean;

    move-result-object v1

    goto :goto_35

    .line 66
    :sswitch_45
    invoke-direct {p0}, Lorg/mozilla/javascript/json/JsonParser;->readString()Ljava/lang/String;

    move-result-object v1

    goto :goto_35

    .line 68
    :sswitch_4a
    invoke-direct {p0}, Lorg/mozilla/javascript/json/JsonParser;->readNull()Ljava/lang/Object;

    move-result-object v1

    goto :goto_35

    .line 80
    :sswitch_4f
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/json/JsonParser;->readNumber(C)Ljava/lang/Number;

    move-result-object v1

    goto :goto_35

    .line 85
    .end local v0    # "c":C
    :cond_54
    new-instance v1, Lorg/mozilla/javascript/json/JsonParser$ParseException;

    const-string v2, "Empty JSON string"

    invoke-direct {v1, v2}, Lorg/mozilla/javascript/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 56
    :sswitch_data_5c
    .sparse-switch
        0x22 -> :sswitch_45
        0x2d -> :sswitch_4f
        0x30 -> :sswitch_4f
        0x31 -> :sswitch_4f
        0x32 -> :sswitch_4f
        0x33 -> :sswitch_4f
        0x34 -> :sswitch_4f
        0x35 -> :sswitch_4f
        0x36 -> :sswitch_4f
        0x37 -> :sswitch_4f
        0x38 -> :sswitch_4f
        0x39 -> :sswitch_4f
        0x5b -> :sswitch_36
        0x66 -> :sswitch_40
        0x6e -> :sswitch_4a
        0x74 -> :sswitch_3b
        0x7b -> :sswitch_31
    .end sparse-switch
.end method


# virtual methods
.method public declared-synchronized parseValue(Ljava/lang/String;)Ljava/lang/Object;
    .registers 6
    .param p1, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/mozilla/javascript/json/JsonParser$ParseException;
        }
    .end annotation

    .prologue
    .line 38
    monitor-enter p0

    if-nez p1, :cond_e

    .line 39
    :try_start_3
    new-instance v1, Lorg/mozilla/javascript/json/JsonParser$ParseException;

    const-string v2, "Input string may not be null"

    invoke-direct {v1, v2}, Lorg/mozilla/javascript/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_b

    .line 38
    :catchall_b
    move-exception v1

    monitor-exit p0

    throw v1

    .line 41
    :cond_e
    const/4 v1, 0x0

    :try_start_f
    iput v1, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    .line 42
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    iput v1, p0, Lorg/mozilla/javascript/json/JsonParser;->length:I

    .line 43
    iput-object p1, p0, Lorg/mozilla/javascript/json/JsonParser;->src:Ljava/lang/String;

    .line 44
    invoke-direct {p0}, Lorg/mozilla/javascript/json/JsonParser;->readValue()Ljava/lang/Object;

    move-result-object v0

    .line 45
    .local v0, "value":Ljava/lang/Object;
    invoke-direct {p0}, Lorg/mozilla/javascript/json/JsonParser;->consumeWhitespace()V

    .line 46
    iget v1, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    iget v2, p0, Lorg/mozilla/javascript/json/JsonParser;->length:I

    if-ge v1, v2, :cond_41

    .line 47
    new-instance v1, Lorg/mozilla/javascript/json/JsonParser$ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected end of stream at char "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lorg/mozilla/javascript/json/JsonParser;->pos:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/mozilla/javascript/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_41
    .catchall {:try_start_f .. :try_end_41} :catchall_b

    .line 49
    :cond_41
    monitor-exit p0

    return-object v0
.end method

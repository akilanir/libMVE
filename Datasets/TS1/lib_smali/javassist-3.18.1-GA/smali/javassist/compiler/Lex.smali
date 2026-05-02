.class public Ljavassist/compiler/Lex;
.super Ljava/lang/Object;
.source "Lex.java"

# interfaces
.implements Ljavassist/compiler/TokenId;


# static fields
.field private static final equalOps:[I

.field private static final ktable:Ljavassist/compiler/KeywordTable;


# instance fields
.field private currentToken:Ljavassist/compiler/Token;

.field private input:Ljava/lang/String;

.field private lastChar:I

.field private lineNumber:I

.field private lookAheadTokens:Ljavassist/compiler/Token;

.field private maxlen:I

.field private position:I

.field private textBuffer:Ljava/lang/StringBuffer;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 355
    const/16 v0, 0x1f

    new-array v0, v0, [I

    fill-array-data v0, :array_1dc

    sput-object v0, Ljavassist/compiler/Lex;->equalOps:[I

    .line 458
    new-instance v0, Ljavassist/compiler/KeywordTable;

    invoke-direct {v0}, Ljavassist/compiler/KeywordTable;-><init>()V

    sput-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    .line 461
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "abstract"

    const/16 v2, 0x12c

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 462
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "boolean"

    const/16 v2, 0x12d

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 463
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "break"

    const/16 v2, 0x12e

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 464
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "byte"

    const/16 v2, 0x12f

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 465
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "case"

    const/16 v2, 0x130

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 466
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "catch"

    const/16 v2, 0x131

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 467
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "char"

    const/16 v2, 0x132

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 468
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "class"

    const/16 v2, 0x133

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 469
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "const"

    const/16 v2, 0x134

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 470
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "continue"

    const/16 v2, 0x135

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 471
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "default"

    const/16 v2, 0x136

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 472
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "do"

    const/16 v2, 0x137

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 473
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "double"

    const/16 v2, 0x138

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 474
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "else"

    const/16 v2, 0x139

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 475
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "extends"

    const/16 v2, 0x13a

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 476
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "false"

    const/16 v2, 0x19b

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 477
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "final"

    const/16 v2, 0x13b

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 478
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "finally"

    const/16 v2, 0x13c

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 479
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "float"

    const/16 v2, 0x13d

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 480
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "for"

    const/16 v2, 0x13e

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 481
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "goto"

    const/16 v2, 0x13f

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 482
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "if"

    const/16 v2, 0x140

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 483
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "implements"

    const/16 v2, 0x141

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 484
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "import"

    const/16 v2, 0x142

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 485
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "instanceof"

    const/16 v2, 0x143

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 486
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "int"

    const/16 v2, 0x144

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 487
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "interface"

    const/16 v2, 0x145

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 488
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "long"

    const/16 v2, 0x146

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 489
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "native"

    const/16 v2, 0x147

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 490
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "new"

    const/16 v2, 0x148

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 491
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "null"

    const/16 v2, 0x19c

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 492
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "package"

    const/16 v2, 0x149

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 493
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "private"

    const/16 v2, 0x14a

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 494
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "protected"

    const/16 v2, 0x14b

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 495
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "public"

    const/16 v2, 0x14c

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 496
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "return"

    const/16 v2, 0x14d

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 497
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "short"

    const/16 v2, 0x14e

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 498
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "static"

    const/16 v2, 0x14f

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 499
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "strictfp"

    const/16 v2, 0x15b

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 500
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "super"

    const/16 v2, 0x150

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 501
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "switch"

    const/16 v2, 0x151

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 502
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "synchronized"

    const/16 v2, 0x152

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 503
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "this"

    const/16 v2, 0x153

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 504
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "throw"

    const/16 v2, 0x154

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 505
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "throws"

    const/16 v2, 0x155

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 506
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "transient"

    const/16 v2, 0x156

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 507
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "true"

    const/16 v2, 0x19a

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 508
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "try"

    const/16 v2, 0x157

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 509
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "void"

    const/16 v2, 0x158

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 510
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "volatile"

    const/16 v2, 0x159

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 511
    sget-object v0, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    const-string v1, "while"

    const/16 v2, 0x15a

    invoke-virtual {v0, v1, v2}, Ljavassist/compiler/KeywordTable;->append(Ljava/lang/String;I)V

    .line 512
    return-void

    .line 355
    :array_1dc
    .array-data 4
        0x15e
        0x0
        0x0
        0x0
        0x15f
        0x160
        0x0
        0x0
        0x0
        0x161
        0x162
        0x0
        0x163
        0x0
        0x164
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x165
        0x166
        0x167
        0x0
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    const/4 v0, -0x1

    iput v0, p0, Ljavassist/compiler/Lex;->lastChar:I

    .line 42
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Ljavassist/compiler/Lex;->textBuffer:Ljava/lang/StringBuffer;

    .line 43
    new-instance v0, Ljavassist/compiler/Token;

    invoke-direct {v0}, Ljavassist/compiler/Token;-><init>()V

    iput-object v0, p0, Ljavassist/compiler/Lex;->currentToken:Ljavassist/compiler/Token;

    .line 44
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/compiler/Lex;->lookAheadTokens:Ljavassist/compiler/Token;

    .line 46
    iput-object p1, p0, Ljavassist/compiler/Lex;->input:Ljava/lang/String;

    .line 47
    iput v1, p0, Ljavassist/compiler/Lex;->position:I

    .line 48
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    iput v0, p0, Ljavassist/compiler/Lex;->maxlen:I

    .line 49
    iput v1, p0, Ljavassist/compiler/Lex;->lineNumber:I

    .line 50
    return-void
.end method

.method private get(Ljavassist/compiler/Token;)I
    .registers 4
    .param p1, "token"    # Ljavassist/compiler/Token;

    .prologue
    .line 104
    :cond_0
    invoke-direct {p0, p1}, Ljavassist/compiler/Lex;->readLine(Ljavassist/compiler/Token;)I

    move-result v0

    .line 105
    .local v0, "t":I
    const/16 v1, 0xa

    if-eq v0, v1, :cond_0

    .line 106
    iput v0, p1, Ljavassist/compiler/Token;->tokenId:I

    .line 107
    return v0
.end method

.method private getNextNonWhiteChar()I
    .registers 6

    .prologue
    const/16 v4, 0x2a

    const/4 v3, -0x1

    const/16 v2, 0x2f

    .line 146
    :cond_5
    invoke-direct {p0}, Ljavassist/compiler/Lex;->getc()I

    move-result v0

    .line 147
    .local v0, "c":I
    if-ne v0, v2, :cond_1f

    .line 148
    invoke-direct {p0}, Ljavassist/compiler/Lex;->getc()I

    move-result v0

    .line 149
    if-ne v0, v2, :cond_26

    .line 151
    :cond_11
    invoke-direct {p0}, Ljavassist/compiler/Lex;->getc()I

    move-result v0

    .line 152
    const/16 v1, 0xa

    if-eq v0, v1, :cond_1f

    const/16 v1, 0xd

    if-eq v0, v1, :cond_1f

    if-ne v0, v3, :cond_11

    .line 171
    :cond_1f
    :goto_1f
    invoke-static {v0}, Ljavassist/compiler/Lex;->isBlank(I)Z

    move-result v1

    if-nez v1, :cond_5

    .line 172
    return v0

    .line 153
    :cond_26
    if-ne v0, v4, :cond_3d

    .line 155
    :cond_28
    :goto_28
    invoke-direct {p0}, Ljavassist/compiler/Lex;->getc()I

    move-result v0

    .line 156
    if-eq v0, v3, :cond_1f

    .line 158
    if-ne v0, v4, :cond_28

    .line 159
    invoke-direct {p0}, Ljavassist/compiler/Lex;->getc()I

    move-result v0

    if-ne v0, v2, :cond_39

    .line 160
    const/16 v0, 0x20

    .line 161
    goto :goto_1f

    .line 164
    :cond_39
    invoke-direct {p0, v0}, Ljavassist/compiler/Lex;->ungetc(I)V

    goto :goto_28

    .line 167
    :cond_3d
    invoke-direct {p0, v0}, Ljavassist/compiler/Lex;->ungetc(I)V

    .line 168
    const/16 v0, 0x2f

    goto :goto_1f
.end method

.method private getc()I
    .registers 5

    .prologue
    const/4 v1, -0x1

    .line 540
    iget v2, p0, Ljavassist/compiler/Lex;->lastChar:I

    if-gez v2, :cond_1a

    .line 541
    iget v2, p0, Ljavassist/compiler/Lex;->position:I

    iget v3, p0, Ljavassist/compiler/Lex;->maxlen:I

    if-ge v2, v3, :cond_18

    .line 542
    iget-object v1, p0, Ljavassist/compiler/Lex;->input:Ljava/lang/String;

    iget v2, p0, Ljavassist/compiler/Lex;->position:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Ljavassist/compiler/Lex;->position:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 548
    :goto_17
    return v0

    :cond_18
    move v0, v1

    .line 544
    goto :goto_17

    .line 546
    :cond_1a
    iget v0, p0, Ljavassist/compiler/Lex;->lastChar:I

    .line 547
    .local v0, "c":I
    iput v1, p0, Ljavassist/compiler/Lex;->lastChar:I

    goto :goto_17
.end method

.method private static isBlank(I)Z
    .registers 2
    .param p0, "c"    # I

    .prologue
    .line 515
    const/16 v0, 0x20

    if-eq p0, v0, :cond_14

    const/16 v0, 0x9

    if-eq p0, v0, :cond_14

    const/16 v0, 0xc

    if-eq p0, v0, :cond_14

    const/16 v0, 0xd

    if-eq p0, v0, :cond_14

    const/16 v0, 0xa

    if-ne p0, v0, :cond_16

    :cond_14
    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method private static isDigit(I)Z
    .registers 2
    .param p0, "c"    # I

    .prologue
    .line 520
    const/16 v0, 0x30

    if-gt v0, p0, :cond_a

    const/16 v0, 0x39

    if-gt p0, v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private readCharConst(Ljavassist/compiler/Token;)I
    .registers 6
    .param p1, "token"    # Ljavassist/compiler/Token;

    .prologue
    .line 177
    const/4 v1, 0x0

    .line 178
    .local v1, "value":I
    :goto_1
    invoke-direct {p0}, Ljavassist/compiler/Lex;->getc()I

    move-result v0

    .local v0, "c":I
    const/16 v2, 0x27

    if-eq v0, v2, :cond_25

    .line 179
    const/16 v2, 0x5c

    if-ne v0, v2, :cond_12

    .line 180
    invoke-direct {p0}, Ljavassist/compiler/Lex;->readEscapeChar()I

    move-result v1

    goto :goto_1

    .line 181
    :cond_12
    const/16 v2, 0x20

    if-ge v0, v2, :cond_23

    .line 182
    const/16 v2, 0xa

    if-ne v0, v2, :cond_20

    .line 183
    iget v2, p0, Ljavassist/compiler/Lex;->lineNumber:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Ljavassist/compiler/Lex;->lineNumber:I

    .line 185
    :cond_20
    const/16 v2, 0x1f4

    .line 191
    :goto_22
    return v2

    .line 188
    :cond_23
    move v1, v0

    goto :goto_1

    .line 190
    :cond_25
    int-to-long v2, v1

    iput-wide v2, p1, Ljavassist/compiler/Token;->longValue:J

    .line 191
    const/16 v2, 0x191

    goto :goto_22
.end method

.method private readDouble(Ljava/lang/StringBuffer;ILjavassist/compiler/Token;)I
    .registers 11
    .param p1, "sbuf"    # Ljava/lang/StringBuffer;
    .param p2, "c"    # I
    .param p3, "token"    # Ljavassist/compiler/Token;

    .prologue
    const/16 v6, 0x64

    const/16 v5, 0x45

    const/16 v4, 0x44

    const/16 v3, 0x39

    const/16 v2, 0x30

    .line 312
    if-eq p2, v5, :cond_25

    const/16 v1, 0x65

    if-eq p2, v1, :cond_25

    if-eq p2, v4, :cond_25

    if-eq p2, v6, :cond_25

    .line 313
    int-to-char v1, p2

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 315
    :goto_18
    invoke-direct {p0}, Ljavassist/compiler/Lex;->getc()I

    move-result p2

    .line 316
    if-gt v2, p2, :cond_25

    if-gt p2, v3, :cond_25

    .line 317
    int-to-char v1, p2

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_18

    .line 323
    :cond_25
    if-eq p2, v5, :cond_2b

    const/16 v1, 0x65

    if-ne p2, v1, :cond_50

    .line 324
    :cond_2b
    int-to-char v1, p2

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 325
    invoke-direct {p0}, Ljavassist/compiler/Lex;->getc()I

    move-result p2

    .line 326
    const/16 v1, 0x2b

    if-eq p2, v1, :cond_3b

    const/16 v1, 0x2d

    if-ne p2, v1, :cond_43

    .line 327
    :cond_3b
    int-to-char v1, p2

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 328
    invoke-direct {p0}, Ljavassist/compiler/Lex;->getc()I

    move-result p2

    .line 331
    :cond_43
    :goto_43
    if-gt v2, p2, :cond_50

    if-gt p2, v3, :cond_50

    .line 332
    int-to-char v1, p2

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 333
    invoke-direct {p0}, Ljavassist/compiler/Lex;->getc()I

    move-result p2

    goto :goto_43

    .line 338
    :cond_50
    :try_start_50
    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v1

    iput-wide v1, p3, Ljavassist/compiler/Token;->doubleValue:D
    :try_end_5a
    .catch Ljava/lang/NumberFormatException; {:try_start_50 .. :try_end_5a} :catch_65

    .line 344
    const/16 v1, 0x46

    if-eq p2, v1, :cond_62

    const/16 v1, 0x66

    if-ne p2, v1, :cond_69

    .line 345
    :cond_62
    const/16 v1, 0x194

    .line 350
    :goto_64
    return v1

    .line 340
    :catch_65
    move-exception v0

    .line 341
    .local v0, "e":Ljava/lang/NumberFormatException;
    const/16 v1, 0x1f4

    goto :goto_64

    .line 347
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :cond_69
    if-eq p2, v4, :cond_70

    if-eq p2, v6, :cond_70

    .line 348
    invoke-direct {p0, p2}, Ljavassist/compiler/Lex;->ungetc(I)V

    .line 350
    :cond_70
    const/16 v1, 0x195

    goto :goto_64
.end method

.method private readEscapeChar()I
    .registers 3

    .prologue
    .line 195
    invoke-direct {p0}, Ljavassist/compiler/Lex;->getc()I

    move-result v0

    .line 196
    .local v0, "c":I
    const/16 v1, 0x6e

    if-ne v0, v1, :cond_b

    .line 197
    const/16 v0, 0xa

    .line 207
    :cond_a
    :goto_a
    return v0

    .line 198
    :cond_b
    const/16 v1, 0x74

    if-ne v0, v1, :cond_12

    .line 199
    const/16 v0, 0x9

    goto :goto_a

    .line 200
    :cond_12
    const/16 v1, 0x72

    if-ne v0, v1, :cond_19

    .line 201
    const/16 v0, 0xd

    goto :goto_a

    .line 202
    :cond_19
    const/16 v1, 0x66

    if-ne v0, v1, :cond_20

    .line 203
    const/16 v0, 0xc

    goto :goto_a

    .line 204
    :cond_20
    const/16 v1, 0xa

    if-ne v0, v1, :cond_a

    .line 205
    iget v1, p0, Ljavassist/compiler/Lex;->lineNumber:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Ljavassist/compiler/Lex;->lineNumber:I

    goto :goto_a
.end method

.method private readIdentifier(ILjavassist/compiler/Token;)I
    .registers 7
    .param p1, "c"    # I
    .param p2, "token"    # Ljavassist/compiler/Token;

    .prologue
    .line 431
    iget-object v2, p0, Ljavassist/compiler/Lex;->textBuffer:Ljava/lang/StringBuffer;

    .line 432
    .local v2, "tbuf":Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 435
    :cond_6
    int-to-char v3, p1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 436
    invoke-direct {p0}, Ljavassist/compiler/Lex;->getc()I

    move-result p1

    .line 437
    int-to-char v3, p1

    invoke-static {v3}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v3

    if-nez v3, :cond_6

    .line 439
    invoke-direct {p0, p1}, Ljavassist/compiler/Lex;->ungetc(I)V

    .line 441
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 442
    .local v0, "name":Ljava/lang/String;
    sget-object v3, Ljavassist/compiler/Lex;->ktable:Ljavassist/compiler/KeywordTable;

    invoke-virtual {v3, v0}, Ljavassist/compiler/KeywordTable;->lookup(Ljava/lang/String;)I

    move-result v1

    .line 443
    .local v1, "t":I
    if-ltz v1, :cond_25

    .line 454
    .end local v1    # "t":I
    :goto_24
    return v1

    .line 453
    .restart local v1    # "t":I
    :cond_25
    iput-object v0, p2, Ljavassist/compiler/Token;->textValue:Ljava/lang/String;

    .line 454
    const/16 v1, 0x190

    goto :goto_24
.end method

.method private readLine(Ljavassist/compiler/Token;)I
    .registers 8
    .param p1, "token"    # Ljavassist/compiler/Token;

    .prologue
    const/16 v5, 0x39

    const/16 v4, 0x30

    const/16 v2, 0xa

    const/16 v3, 0x2e

    .line 111
    invoke-direct {p0}, Ljavassist/compiler/Lex;->getNextNonWhiteChar()I

    move-result v0

    .line 112
    .local v0, "c":I
    if-gez v0, :cond_10

    move v2, v0

    .line 140
    :goto_f
    return v2

    .line 114
    :cond_10
    if-ne v0, v2, :cond_19

    .line 115
    iget v3, p0, Ljavassist/compiler/Lex;->lineNumber:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Ljavassist/compiler/Lex;->lineNumber:I

    goto :goto_f

    .line 118
    :cond_19
    const/16 v2, 0x27

    if-ne v0, v2, :cond_22

    .line 119
    invoke-direct {p0, p1}, Ljavassist/compiler/Lex;->readCharConst(Ljavassist/compiler/Token;)I

    move-result v2

    goto :goto_f

    .line 120
    :cond_22
    const/16 v2, 0x22

    if-ne v0, v2, :cond_2b

    .line 121
    invoke-direct {p0, p1}, Ljavassist/compiler/Lex;->readStringL(Ljavassist/compiler/Token;)I

    move-result v2

    goto :goto_f

    .line 122
    :cond_2b
    if-gt v4, v0, :cond_34

    if-gt v0, v5, :cond_34

    .line 123
    invoke-direct {p0, v0, p1}, Ljavassist/compiler/Lex;->readNumber(ILjavassist/compiler/Token;)I

    move-result v2

    goto :goto_f

    .line 124
    :cond_34
    if-ne v0, v3, :cond_54

    .line 125
    invoke-direct {p0}, Ljavassist/compiler/Lex;->getc()I

    move-result v0

    .line 126
    if-gt v4, v0, :cond_4c

    if-gt v0, v5, :cond_4c

    .line 127
    iget-object v1, p0, Ljavassist/compiler/Lex;->textBuffer:Ljava/lang/StringBuffer;

    .line 128
    .local v1, "tbuf":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 129
    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 130
    invoke-direct {p0, v1, v0, p1}, Ljavassist/compiler/Lex;->readDouble(Ljava/lang/StringBuffer;ILjavassist/compiler/Token;)I

    move-result v2

    goto :goto_f

    .line 133
    .end local v1    # "tbuf":Ljava/lang/StringBuffer;
    :cond_4c
    invoke-direct {p0, v0}, Ljavassist/compiler/Lex;->ungetc(I)V

    .line 134
    invoke-direct {p0, v3}, Ljavassist/compiler/Lex;->readSeparator(I)I

    move-result v2

    goto :goto_f

    .line 137
    :cond_54
    int-to-char v2, v0

    invoke-static {v2}, Ljava/lang/Character;->isJavaIdentifierStart(C)Z

    move-result v2

    if-eqz v2, :cond_60

    .line 138
    invoke-direct {p0, v0, p1}, Ljavassist/compiler/Lex;->readIdentifier(ILjavassist/compiler/Token;)I

    move-result v2

    goto :goto_f

    .line 140
    :cond_60
    invoke-direct {p0, v0}, Ljavassist/compiler/Lex;->readSeparator(I)I

    move-result v2

    goto :goto_f
.end method

.method private readNumber(ILjavassist/compiler/Token;)I
    .registers 16
    .param p1, "c"    # I
    .param p2, "token"    # Ljavassist/compiler/Token;

    .prologue
    const/16 v5, 0x193

    const/16 v4, 0x192

    const/16 v12, 0x6c

    const/16 v11, 0x4c

    const/16 v10, 0x30

    .line 245
    const-wide/16 v2, 0x0

    .line 246
    .local v2, "value":J
    invoke-direct {p0}, Ljavassist/compiler/Lex;->getc()I

    move-result v0

    .line 247
    .local v0, "c2":I
    if-ne p1, v10, :cond_87

    .line 248
    const/16 v6, 0x58

    if-eq v0, v6, :cond_1a

    const/16 v6, 0x78

    if-ne v0, v6, :cond_5f

    .line 250
    :cond_1a
    :goto_1a
    invoke-direct {p0}, Ljavassist/compiler/Lex;->getc()I

    move-result p1

    .line 251
    if-gt v10, p1, :cond_2d

    const/16 v6, 0x39

    if-gt p1, v6, :cond_2d

    .line 252
    const-wide/16 v6, 0x10

    mul-long/2addr v6, v2

    add-int/lit8 v8, p1, -0x30

    int-to-long v8, v8

    add-long v2, v6, v8

    goto :goto_1a

    .line 253
    :cond_2d
    const/16 v6, 0x41

    if-gt v6, p1, :cond_40

    const/16 v6, 0x46

    if-gt p1, v6, :cond_40

    .line 254
    const-wide/16 v6, 0x10

    mul-long/2addr v6, v2

    add-int/lit8 v8, p1, -0x41

    add-int/lit8 v8, v8, 0xa

    int-to-long v8, v8

    add-long v2, v6, v8

    goto :goto_1a

    .line 255
    :cond_40
    const/16 v6, 0x61

    if-gt v6, p1, :cond_53

    const/16 v6, 0x66

    if-gt p1, v6, :cond_53

    .line 256
    const-wide/16 v6, 0x10

    mul-long/2addr v6, v2

    add-int/lit8 v8, p1, -0x61

    add-int/lit8 v8, v8, 0xa

    int-to-long v8, v8

    add-long v2, v6, v8

    goto :goto_1a

    .line 258
    :cond_53
    iput-wide v2, p2, Ljavassist/compiler/Token;->longValue:J

    .line 259
    if-eq p1, v11, :cond_59

    if-ne p1, v12, :cond_5b

    :cond_59
    move v4, v5

    .line 307
    :goto_5a
    return v4

    .line 262
    :cond_5b
    invoke-direct {p0, p1}, Ljavassist/compiler/Lex;->ungetc(I)V

    goto :goto_5a

    .line 267
    :cond_5f
    if-gt v10, v0, :cond_87

    const/16 v6, 0x37

    if-gt v0, v6, :cond_87

    .line 268
    add-int/lit8 v6, v0, -0x30

    int-to-long v2, v6

    .line 270
    :goto_68
    invoke-direct {p0}, Ljavassist/compiler/Lex;->getc()I

    move-result p1

    .line 271
    if-gt v10, p1, :cond_7b

    const/16 v6, 0x37

    if-gt p1, v6, :cond_7b

    .line 272
    const-wide/16 v6, 0x8

    mul-long/2addr v6, v2

    add-int/lit8 v8, p1, -0x30

    int-to-long v8, v8

    add-long v2, v6, v8

    goto :goto_68

    .line 274
    :cond_7b
    iput-wide v2, p2, Ljavassist/compiler/Token;->longValue:J

    .line 275
    if-eq p1, v11, :cond_81

    if-ne p1, v12, :cond_83

    :cond_81
    move v4, v5

    .line 276
    goto :goto_5a

    .line 278
    :cond_83
    invoke-direct {p0, p1}, Ljavassist/compiler/Lex;->ungetc(I)V

    goto :goto_5a

    .line 285
    :cond_87
    add-int/lit8 v6, p1, -0x30

    int-to-long v2, v6

    .line 286
    :goto_8a
    if-gt v10, v0, :cond_9e

    const/16 v6, 0x39

    if-gt v0, v6, :cond_9e

    .line 287
    const-wide/16 v6, 0xa

    mul-long/2addr v6, v2

    int-to-long v8, v0

    add-long/2addr v6, v8

    const-wide/16 v8, 0x30

    sub-long v2, v6, v8

    .line 288
    invoke-direct {p0}, Ljavassist/compiler/Lex;->getc()I

    move-result v0

    goto :goto_8a

    .line 291
    :cond_9e
    iput-wide v2, p2, Ljavassist/compiler/Token;->longValue:J

    .line 292
    const/16 v6, 0x46

    if-eq v0, v6, :cond_a8

    const/16 v6, 0x66

    if-ne v0, v6, :cond_ae

    .line 293
    :cond_a8
    long-to-double v4, v2

    iput-wide v4, p2, Ljavassist/compiler/Token;->doubleValue:D

    .line 294
    const/16 v4, 0x194

    goto :goto_5a

    .line 296
    :cond_ae
    const/16 v6, 0x45

    if-eq v0, v6, :cond_c2

    const/16 v6, 0x65

    if-eq v0, v6, :cond_c2

    const/16 v6, 0x44

    if-eq v0, v6, :cond_c2

    const/16 v6, 0x64

    if-eq v0, v6, :cond_c2

    const/16 v6, 0x2e

    if-ne v0, v6, :cond_d0

    .line 298
    :cond_c2
    iget-object v1, p0, Ljavassist/compiler/Lex;->textBuffer:Ljava/lang/StringBuffer;

    .line 299
    .local v1, "tbuf":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 300
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    .line 301
    invoke-direct {p0, v1, v0, p2}, Ljavassist/compiler/Lex;->readDouble(Ljava/lang/StringBuffer;ILjavassist/compiler/Token;)I

    move-result v4

    goto :goto_5a

    .line 303
    .end local v1    # "tbuf":Ljava/lang/StringBuffer;
    :cond_d0
    if-eq v0, v11, :cond_d4

    if-ne v0, v12, :cond_d6

    :cond_d4
    move v4, v5

    .line 304
    goto :goto_5a

    .line 306
    :cond_d6
    invoke-direct {p0, v0}, Ljavassist/compiler/Lex;->ungetc(I)V

    goto :goto_5a
.end method

.method private readSeparator(I)I
    .registers 8
    .param p1, "c"    # I

    .prologue
    const/16 v4, 0x7c

    const/16 v5, 0x3d

    .line 363
    const/16 v3, 0x21

    if-gt v3, p1, :cond_63

    const/16 v3, 0x3f

    if-gt p1, v3, :cond_63

    .line 364
    sget-object v3, Ljavassist/compiler/Lex;->equalOps:[I

    add-int/lit8 v4, p1, -0x21

    aget v2, v3, v4

    .line 365
    .local v2, "t":I
    if-nez v2, :cond_15

    .line 427
    .end local v2    # "t":I
    .end local p1    # "c":I
    :cond_14
    :goto_14
    return p1

    .line 368
    .restart local v2    # "t":I
    .restart local p1    # "c":I
    :cond_15
    invoke-direct {p0}, Ljavassist/compiler/Lex;->getc()I

    move-result v0

    .line 369
    .local v0, "c2":I
    if-ne p1, v0, :cond_5f

    .line 370
    sparse-switch p1, :sswitch_data_80

    .line 426
    .end local v2    # "t":I
    :cond_1e
    invoke-direct {p0, v0}, Ljavassist/compiler/Lex;->ungetc(I)V

    goto :goto_14

    .line 372
    .restart local v2    # "t":I
    :sswitch_22
    const/16 p1, 0x166

    goto :goto_14

    .line 374
    :sswitch_25
    const/16 p1, 0x16a

    goto :goto_14

    .line 376
    :sswitch_28
    const/16 p1, 0x16b

    goto :goto_14

    .line 378
    :sswitch_2b
    const/16 p1, 0x171

    goto :goto_14

    .line 380
    :sswitch_2e
    invoke-direct {p0}, Ljavassist/compiler/Lex;->getc()I

    move-result v1

    .line 381
    .local v1, "c3":I
    if-ne v1, v5, :cond_37

    .line 382
    const/16 p1, 0x16d

    goto :goto_14

    .line 384
    :cond_37
    invoke-direct {p0, v1}, Ljavassist/compiler/Lex;->ungetc(I)V

    .line 385
    const/16 p1, 0x16c

    goto :goto_14

    .line 388
    .end local v1    # "c3":I
    :sswitch_3d
    invoke-direct {p0}, Ljavassist/compiler/Lex;->getc()I

    move-result v1

    .line 389
    .restart local v1    # "c3":I
    if-ne v1, v5, :cond_46

    .line 390
    const/16 p1, 0x16f

    goto :goto_14

    .line 391
    :cond_46
    const/16 v3, 0x3e

    if-ne v1, v3, :cond_59

    .line 392
    invoke-direct {p0}, Ljavassist/compiler/Lex;->getc()I

    move-result v1

    .line 393
    if-ne v1, v5, :cond_53

    .line 394
    const/16 p1, 0x173

    goto :goto_14

    .line 396
    :cond_53
    invoke-direct {p0, v1}, Ljavassist/compiler/Lex;->ungetc(I)V

    .line 397
    const/16 p1, 0x172

    goto :goto_14

    .line 401
    :cond_59
    invoke-direct {p0, v1}, Ljavassist/compiler/Lex;->ungetc(I)V

    .line 402
    const/16 p1, 0x16e

    goto :goto_14

    .line 407
    .end local v1    # "c3":I
    :cond_5f
    if-ne v0, v5, :cond_1e

    move p1, v2

    .line 408
    goto :goto_14

    .line 411
    .end local v0    # "c2":I
    .end local v2    # "t":I
    :cond_63
    const/16 v3, 0x5e

    if-ne p1, v3, :cond_70

    .line 412
    invoke-direct {p0}, Ljavassist/compiler/Lex;->getc()I

    move-result v0

    .line 413
    .restart local v0    # "c2":I
    if-ne v0, v5, :cond_1e

    .line 414
    const/16 p1, 0x168

    goto :goto_14

    .line 416
    .end local v0    # "c2":I
    :cond_70
    if-ne p1, v4, :cond_14

    .line 417
    invoke-direct {p0}, Ljavassist/compiler/Lex;->getc()I

    move-result v0

    .line 418
    .restart local v0    # "c2":I
    if-ne v0, v5, :cond_7b

    .line 419
    const/16 p1, 0x169

    goto :goto_14

    .line 420
    :cond_7b
    if-ne v0, v4, :cond_1e

    .line 421
    const/16 p1, 0x170

    goto :goto_14

    .line 370
    :sswitch_data_80
    .sparse-switch
        0x26 -> :sswitch_2b
        0x2b -> :sswitch_25
        0x2d -> :sswitch_28
        0x3c -> :sswitch_2e
        0x3d -> :sswitch_22
        0x3e -> :sswitch_3d
    .end sparse-switch
.end method

.method private readStringL(Ljavassist/compiler/Token;)I
    .registers 7
    .param p1, "token"    # Ljavassist/compiler/Token;

    .prologue
    const/16 v4, 0x22

    const/16 v3, 0xa

    .line 212
    iget-object v1, p0, Ljavassist/compiler/Lex;->textBuffer:Ljava/lang/StringBuffer;

    .line 213
    .local v1, "tbuf":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 215
    :cond_a
    :goto_a
    invoke-direct {p0}, Ljavassist/compiler/Lex;->getc()I

    move-result v0

    .local v0, "c":I
    if-eq v0, v4, :cond_2a

    .line 216
    const/16 v2, 0x5c

    if-ne v0, v2, :cond_1d

    .line 217
    invoke-direct {p0}, Ljavassist/compiler/Lex;->readEscapeChar()I

    move-result v0

    .line 223
    :cond_18
    int-to-char v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_a

    .line 218
    :cond_1d
    if-eq v0, v3, :cond_21

    if-gez v0, :cond_18

    .line 219
    :cond_21
    iget v2, p0, Ljavassist/compiler/Lex;->lineNumber:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Ljavassist/compiler/Lex;->lineNumber:I

    .line 220
    const/16 v2, 0x1f4

    .line 241
    :goto_29
    return v2

    .line 227
    :cond_2a
    :goto_2a
    invoke-direct {p0}, Ljavassist/compiler/Lex;->getc()I

    move-result v0

    .line 228
    if-ne v0, v3, :cond_37

    .line 229
    iget v2, p0, Ljavassist/compiler/Lex;->lineNumber:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Ljavassist/compiler/Lex;->lineNumber:I

    goto :goto_2a

    .line 230
    :cond_37
    invoke-static {v0}, Ljavassist/compiler/Lex;->isBlank(I)Z

    move-result v2

    if-nez v2, :cond_2a

    .line 234
    if-eq v0, v4, :cond_a

    .line 235
    invoke-direct {p0, v0}, Ljavassist/compiler/Lex;->ungetc(I)V

    .line 240
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Ljavassist/compiler/Token;->textValue:Ljava/lang/String;

    .line 241
    const/16 v2, 0x196

    goto :goto_29
.end method

.method private ungetc(I)V
    .registers 2
    .param p1, "c"    # I

    .prologue
    .line 524
    iput p1, p0, Ljavassist/compiler/Lex;->lastChar:I

    .line 525
    return-void
.end method


# virtual methods
.method public get()I
    .registers 3

    .prologue
    .line 53
    iget-object v1, p0, Ljavassist/compiler/Lex;->lookAheadTokens:Ljavassist/compiler/Token;

    if-nez v1, :cond_b

    .line 54
    iget-object v1, p0, Ljavassist/compiler/Lex;->currentToken:Ljavassist/compiler/Token;

    invoke-direct {p0, v1}, Ljavassist/compiler/Lex;->get(Ljavassist/compiler/Token;)I

    move-result v1

    .line 59
    :goto_a
    return v1

    .line 57
    :cond_b
    iget-object v0, p0, Ljavassist/compiler/Lex;->lookAheadTokens:Ljavassist/compiler/Token;

    .local v0, "t":Ljavassist/compiler/Token;
    iput-object v0, p0, Ljavassist/compiler/Lex;->currentToken:Ljavassist/compiler/Token;

    .line 58
    iget-object v1, p0, Ljavassist/compiler/Lex;->lookAheadTokens:Ljavassist/compiler/Token;

    iget-object v1, v1, Ljavassist/compiler/Token;->next:Ljavassist/compiler/Token;

    iput-object v1, p0, Ljavassist/compiler/Lex;->lookAheadTokens:Ljavassist/compiler/Token;

    .line 59
    iget v1, v0, Ljavassist/compiler/Token;->tokenId:I

    goto :goto_a
.end method

.method public getDouble()D
    .registers 3

    .prologue
    .line 98
    iget-object v0, p0, Ljavassist/compiler/Lex;->currentToken:Ljavassist/compiler/Token;

    iget-wide v0, v0, Ljavassist/compiler/Token;->doubleValue:D

    return-wide v0
.end method

.method public getLong()J
    .registers 3

    .prologue
    .line 94
    iget-object v0, p0, Ljavassist/compiler/Lex;->currentToken:Ljavassist/compiler/Token;

    iget-wide v0, v0, Ljavassist/compiler/Token;->longValue:J

    return-wide v0
.end method

.method public getString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 90
    iget-object v0, p0, Ljavassist/compiler/Lex;->currentToken:Ljavassist/compiler/Token;

    iget-object v0, v0, Ljavassist/compiler/Token;->textValue:Ljava/lang/String;

    return-object v0
.end method

.method public getTextAround()Ljava/lang/String;
    .registers 4

    .prologue
    .line 528
    iget v2, p0, Ljavassist/compiler/Lex;->position:I

    add-int/lit8 v0, v2, -0xa

    .line 529
    .local v0, "begin":I
    if-gez v0, :cond_7

    .line 530
    const/4 v0, 0x0

    .line 532
    :cond_7
    iget v2, p0, Ljavassist/compiler/Lex;->position:I

    add-int/lit8 v1, v2, 0xa

    .line 533
    .local v1, "end":I
    iget v2, p0, Ljavassist/compiler/Lex;->maxlen:I

    if-le v1, v2, :cond_11

    .line 534
    iget v1, p0, Ljavassist/compiler/Lex;->maxlen:I

    .line 536
    :cond_11
    iget-object v2, p0, Ljavassist/compiler/Lex;->input:Ljava/lang/String;

    invoke-virtual {v2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public lookAhead()I
    .registers 2

    .prologue
    .line 67
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljavassist/compiler/Lex;->lookAhead(I)I

    move-result v0

    return v0
.end method

.method public lookAhead(I)I
    .registers 6
    .param p1, "i"    # I

    .prologue
    .line 71
    iget-object v1, p0, Ljavassist/compiler/Lex;->lookAheadTokens:Ljavassist/compiler/Token;

    .line 72
    .local v1, "tk":Ljavassist/compiler/Token;
    if-nez v1, :cond_e

    .line 73
    iget-object v1, p0, Ljavassist/compiler/Lex;->currentToken:Ljavassist/compiler/Token;

    iput-object v1, p0, Ljavassist/compiler/Lex;->lookAheadTokens:Ljavassist/compiler/Token;

    .line 74
    const/4 v3, 0x0

    iput-object v3, v1, Ljavassist/compiler/Token;->next:Ljavassist/compiler/Token;

    .line 75
    invoke-direct {p0, v1}, Ljavassist/compiler/Lex;->get(Ljavassist/compiler/Token;)I

    :cond_e
    move v0, p1

    .line 78
    .end local p1    # "i":I
    .local v0, "i":I
    :goto_f
    add-int/lit8 p1, v0, -0x1

    .end local v0    # "i":I
    .restart local p1    # "i":I
    if-lez v0, :cond_25

    .line 79
    iget-object v3, v1, Ljavassist/compiler/Token;->next:Ljavassist/compiler/Token;

    if-nez v3, :cond_21

    .line 81
    new-instance v2, Ljavassist/compiler/Token;

    invoke-direct {v2}, Ljavassist/compiler/Token;-><init>()V

    .local v2, "tk2":Ljavassist/compiler/Token;
    iput-object v2, v1, Ljavassist/compiler/Token;->next:Ljavassist/compiler/Token;

    .line 82
    invoke-direct {p0, v2}, Ljavassist/compiler/Lex;->get(Ljavassist/compiler/Token;)I

    .line 78
    .end local v2    # "tk2":Ljavassist/compiler/Token;
    :cond_21
    iget-object v1, v1, Ljavassist/compiler/Token;->next:Ljavassist/compiler/Token;

    move v0, p1

    .end local p1    # "i":I
    .restart local v0    # "i":I
    goto :goto_f

    .line 85
    .end local v0    # "i":I
    .restart local p1    # "i":I
    :cond_25
    iput-object v1, p0, Ljavassist/compiler/Lex;->currentToken:Ljavassist/compiler/Token;

    .line 86
    iget v3, v1, Ljavassist/compiler/Token;->tokenId:I

    return v3
.end method

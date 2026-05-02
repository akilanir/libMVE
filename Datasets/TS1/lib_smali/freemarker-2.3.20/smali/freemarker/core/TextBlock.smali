.class public final Lfreemarker/core/TextBlock;
.super Lfreemarker/core/TemplateElement;
.source "TextBlock.java"


# static fields
.field static final EMPTY_BLOCK:Lfreemarker/core/TextBlock;

.field private static final EMPTY_CHAR_ARRAY:[C


# instance fields
.field private text:[C

.field private final unparsed:Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x0

    .line 63
    new-array v0, v2, [C

    sput-object v0, Lfreemarker/core/TextBlock;->EMPTY_CHAR_ARRAY:[C

    .line 64
    new-instance v0, Lfreemarker/core/TextBlock;

    sget-object v1, Lfreemarker/core/TextBlock;->EMPTY_CHAR_ARRAY:[C

    invoke-direct {v0, v1, v2}, Lfreemarker/core/TextBlock;-><init>([CZ)V

    sput-object v0, Lfreemarker/core/TextBlock;->EMPTY_BLOCK:Lfreemarker/core/TextBlock;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 74
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lfreemarker/core/TextBlock;-><init>(Ljava/lang/String;Z)V

    .line 75
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 4
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "unparsed"    # Z

    .prologue
    .line 78
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lfreemarker/core/TextBlock;-><init>([CZ)V

    .line 79
    return-void
.end method

.method private constructor <init>([CZ)V
    .registers 3
    .param p1, "text"    # [C
    .param p2, "unparsed"    # Z

    .prologue
    .line 81
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 82
    iput-object p1, p0, Lfreemarker/core/TextBlock;->text:[C

    .line 83
    iput-boolean p2, p0, Lfreemarker/core/TextBlock;->unparsed:Z

    .line 84
    return-void
.end method

.method private static concat([C[C)[C
    .registers 6
    .param p0, "c1"    # [C
    .param p1, "c2"    # [C

    .prologue
    const/4 v3, 0x0

    .line 420
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    new-array v0, v1, [C

    .line 421
    .local v0, "c":[C
    array-length v1, p0

    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 422
    array-length v1, p0

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 423
    return-object v0
.end method

.method private deliberateLeftTrim()Z
    .registers 12

    .prologue
    const/4 v10, 0x0

    .line 159
    const/4 v6, 0x0

    .line 160
    .local v6, "result":Z
    invoke-virtual {p0}, Lfreemarker/core/TextBlock;->nextTerminalNode()Lfreemarker/core/TemplateElement;

    move-result-object v0

    .line 161
    .local v0, "elem":Lfreemarker/core/TemplateElement;
    :goto_6
    if-eqz v0, :cond_65

    iget v8, v0, Lfreemarker/core/TemplateElement;->beginLine:I

    iget v9, p0, Lfreemarker/core/TextBlock;->endLine:I

    if-ne v8, v9, :cond_65

    .line 164
    instance-of v8, v0, Lfreemarker/core/TrimInstruction;

    if-eqz v8, :cond_49

    move-object v7, v0

    .line 165
    check-cast v7, Lfreemarker/core/TrimInstruction;

    .line 166
    .local v7, "ti":Lfreemarker/core/TrimInstruction;
    iget-boolean v8, v7, Lfreemarker/core/TrimInstruction;->left:Z

    if-nez v8, :cond_1e

    iget-boolean v8, v7, Lfreemarker/core/TrimInstruction;->right:Z

    if-nez v8, :cond_1e

    .line 167
    const/4 v6, 0x1

    .line 169
    :cond_1e
    iget-boolean v8, v7, Lfreemarker/core/TrimInstruction;->left:Z

    if-eqz v8, :cond_49

    .line 170
    const/4 v6, 0x1

    .line 171
    invoke-direct {p0}, Lfreemarker/core/TextBlock;->lastNewLineIndex()I

    move-result v4

    .line 172
    .local v4, "lastNewLineIndex":I
    if-gez v4, :cond_2e

    iget v8, p0, Lfreemarker/core/TextBlock;->beginColumn:I

    const/4 v9, 0x1

    if-ne v8, v9, :cond_49

    .line 173
    :cond_2e
    iget-object v8, p0, Lfreemarker/core/TextBlock;->text:[C

    add-int/lit8 v9, v4, 0x1

    invoke-static {v8, v10, v9}, Lfreemarker/core/TextBlock;->substring([CII)[C

    move-result-object v1

    .line 174
    .local v1, "firstPart":[C
    iget-object v8, p0, Lfreemarker/core/TextBlock;->text:[C

    add-int/lit8 v9, v4, 0x1

    invoke-static {v8, v9}, Lfreemarker/core/TextBlock;->substring([CI)[C

    move-result-object v3

    .line 175
    .local v3, "lastLine":[C
    invoke-static {v3}, Lfreemarker/core/TextBlock;->trim([C)[C

    move-result-object v8

    array-length v8, v8

    if-nez v8, :cond_4e

    .line 176
    iput-object v1, p0, Lfreemarker/core/TextBlock;->text:[C

    .line 177
    iput v10, p0, Lfreemarker/core/TextBlock;->endColumn:I

    .line 162
    .end local v1    # "firstPart":[C
    .end local v3    # "lastLine":[C
    .end local v4    # "lastNewLineIndex":I
    .end local v7    # "ti":Lfreemarker/core/TrimInstruction;
    :cond_49
    :goto_49
    invoke-virtual {v0}, Lfreemarker/core/TemplateElement;->nextTerminalNode()Lfreemarker/core/TemplateElement;

    move-result-object v0

    goto :goto_6

    .line 179
    .restart local v1    # "firstPart":[C
    .restart local v3    # "lastLine":[C
    .restart local v4    # "lastNewLineIndex":I
    .restart local v7    # "ti":Lfreemarker/core/TrimInstruction;
    :cond_4e
    const/4 v2, 0x0

    .line 180
    .local v2, "i":I
    :goto_4f
    aget-char v8, v3, v2

    invoke-static {v8}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v8

    if-eqz v8, :cond_5a

    .line 181
    add-int/lit8 v2, v2, 0x1

    goto :goto_4f

    .line 183
    :cond_5a
    invoke-static {v3, v2}, Lfreemarker/core/TextBlock;->substring([CI)[C

    move-result-object v5

    .line 184
    .local v5, "printablePart":[C
    invoke-static {v1, v5}, Lfreemarker/core/TextBlock;->concat([C[C)[C

    move-result-object v8

    iput-object v8, p0, Lfreemarker/core/TextBlock;->text:[C

    goto :goto_49

    .line 190
    .end local v1    # "firstPart":[C
    .end local v2    # "i":I
    .end local v3    # "lastLine":[C
    .end local v4    # "lastNewLineIndex":I
    .end local v5    # "printablePart":[C
    .end local v7    # "ti":Lfreemarker/core/TrimInstruction;
    :cond_65
    if-eqz v6, :cond_67

    .line 192
    :cond_67
    return v6
.end method

.method private deliberateRightTrim()Z
    .registers 14

    .prologue
    const/4 v11, 0x0

    .line 200
    const/4 v5, 0x0

    .line 201
    .local v5, "result":Z
    invoke-virtual {p0}, Lfreemarker/core/TextBlock;->prevTerminalNode()Lfreemarker/core/TemplateElement;

    move-result-object v0

    .line 202
    .local v0, "elem":Lfreemarker/core/TemplateElement;
    :goto_6
    if-eqz v0, :cond_b8

    iget v10, v0, Lfreemarker/core/TemplateElement;->endLine:I

    iget v12, p0, Lfreemarker/core/TextBlock;->beginLine:I

    if-ne v10, v12, :cond_b8

    .line 205
    instance-of v10, v0, Lfreemarker/core/TrimInstruction;

    if-eqz v10, :cond_64

    move-object v7, v0

    .line 206
    check-cast v7, Lfreemarker/core/TrimInstruction;

    .line 207
    .local v7, "ti":Lfreemarker/core/TrimInstruction;
    iget-boolean v10, v7, Lfreemarker/core/TrimInstruction;->left:Z

    if-nez v10, :cond_1e

    iget-boolean v10, v7, Lfreemarker/core/TrimInstruction;->right:Z

    if-nez v10, :cond_1e

    .line 208
    const/4 v5, 0x1

    .line 210
    :cond_1e
    iget-boolean v10, v7, Lfreemarker/core/TrimInstruction;->right:Z

    if-eqz v10, :cond_64

    .line 211
    const/4 v5, 0x1

    .line 212
    invoke-direct {p0}, Lfreemarker/core/TextBlock;->firstNewLineIndex()I

    move-result v10

    add-int/lit8 v1, v10, 0x1

    .line 213
    .local v1, "firstLineIndex":I
    if-nez v1, :cond_2d

    move v10, v11

    .line 257
    .end local v1    # "firstLineIndex":I
    .end local v7    # "ti":Lfreemarker/core/TrimInstruction;
    :goto_2c
    return v10

    .line 216
    .restart local v1    # "firstLineIndex":I
    .restart local v7    # "ti":Lfreemarker/core/TrimInstruction;
    :cond_2d
    iget-object v10, p0, Lfreemarker/core/TextBlock;->text:[C

    array-length v10, v10

    if-le v10, v1, :cond_46

    iget-object v10, p0, Lfreemarker/core/TextBlock;->text:[C

    add-int/lit8 v12, v1, -0x1

    aget-char v10, v10, v12

    const/16 v12, 0xd

    if-ne v10, v12, :cond_46

    iget-object v10, p0, Lfreemarker/core/TextBlock;->text:[C

    aget-char v10, v10, v1

    const/16 v12, 0xa

    if-ne v10, v12, :cond_46

    .line 220
    add-int/lit8 v1, v1, 0x1

    .line 222
    :cond_46
    iget-object v10, p0, Lfreemarker/core/TextBlock;->text:[C

    invoke-static {v10, v1}, Lfreemarker/core/TextBlock;->substring([CI)[C

    move-result-object v8

    .line 223
    .local v8, "trailingPart":[C
    iget-object v10, p0, Lfreemarker/core/TextBlock;->text:[C

    invoke-static {v10, v11, v1}, Lfreemarker/core/TextBlock;->substring([CII)[C

    move-result-object v3

    .line 224
    .local v3, "openingPart":[C
    invoke-static {v3}, Lfreemarker/core/TextBlock;->trim([C)[C

    move-result-object v10

    array-length v10, v10

    if-nez v10, :cond_69

    .line 225
    iput-object v8, p0, Lfreemarker/core/TextBlock;->text:[C

    .line 226
    iget v10, p0, Lfreemarker/core/TextBlock;->beginLine:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p0, Lfreemarker/core/TextBlock;->beginLine:I

    .line 227
    const/4 v10, 0x1

    iput v10, p0, Lfreemarker/core/TextBlock;->beginColumn:I

    .line 203
    .end local v1    # "firstLineIndex":I
    .end local v3    # "openingPart":[C
    .end local v7    # "ti":Lfreemarker/core/TrimInstruction;
    .end local v8    # "trailingPart":[C
    :cond_64
    :goto_64
    invoke-virtual {v0}, Lfreemarker/core/TemplateElement;->prevTerminalNode()Lfreemarker/core/TemplateElement;

    move-result-object v0

    goto :goto_6

    .line 229
    .restart local v1    # "firstLineIndex":I
    .restart local v3    # "openingPart":[C
    .restart local v7    # "ti":Lfreemarker/core/TrimInstruction;
    .restart local v8    # "trailingPart":[C
    :cond_69
    array-length v10, v3

    add-int/lit8 v2, v10, -0x1

    .line 230
    .local v2, "lastNonWS":I
    :goto_6c
    iget-object v10, p0, Lfreemarker/core/TextBlock;->text:[C

    aget-char v10, v10, v2

    invoke-static {v10}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v10

    if-eqz v10, :cond_79

    .line 231
    add-int/lit8 v2, v2, -0x1

    goto :goto_6c

    .line 233
    :cond_79
    iget-object v10, p0, Lfreemarker/core/TextBlock;->text:[C

    add-int/lit8 v12, v2, 0x1

    invoke-static {v10, v11, v12}, Lfreemarker/core/TextBlock;->substring([CII)[C

    move-result-object v4

    .line 234
    .local v4, "printablePart":[C
    invoke-static {v8}, Lfreemarker/core/TextBlock;->trim([C)[C

    move-result-object v10

    array-length v10, v10

    if-nez v10, :cond_ac

    .line 236
    const/4 v9, 0x1

    .line 237
    .local v9, "trimTrailingPart":Z
    invoke-virtual {p0}, Lfreemarker/core/TextBlock;->nextTerminalNode()Lfreemarker/core/TemplateElement;

    move-result-object v6

    .line 238
    .local v6, "te":Lfreemarker/core/TemplateElement;
    :goto_8d
    if-eqz v6, :cond_a8

    iget v10, v6, Lfreemarker/core/TemplateElement;->beginLine:I

    iget v12, p0, Lfreemarker/core/TextBlock;->endLine:I

    if-ne v10, v12, :cond_a8

    .line 241
    invoke-virtual {v6}, Lfreemarker/core/TemplateElement;->heedsOpeningWhitespace()Z

    move-result v10

    if-eqz v10, :cond_9c

    .line 243
    const/4 v9, 0x0

    .line 245
    :cond_9c
    instance-of v10, v6, Lfreemarker/core/TrimInstruction;

    if-eqz v10, :cond_b3

    move-object v10, v6

    check-cast v10, Lfreemarker/core/TrimInstruction;

    iget-boolean v10, v10, Lfreemarker/core/TrimInstruction;->left:Z

    if-eqz v10, :cond_b3

    .line 246
    const/4 v9, 0x1

    .line 250
    :cond_a8
    if-eqz v9, :cond_ac

    sget-object v8, Lfreemarker/core/TextBlock;->EMPTY_CHAR_ARRAY:[C

    .line 252
    .end local v6    # "te":Lfreemarker/core/TemplateElement;
    .end local v9    # "trimTrailingPart":Z
    :cond_ac
    invoke-static {v4, v8}, Lfreemarker/core/TextBlock;->concat([C[C)[C

    move-result-object v10

    iput-object v10, p0, Lfreemarker/core/TextBlock;->text:[C

    goto :goto_64

    .line 239
    .restart local v6    # "te":Lfreemarker/core/TemplateElement;
    .restart local v9    # "trimTrailingPart":Z
    :cond_b3
    invoke-virtual {v6}, Lfreemarker/core/TemplateElement;->nextTerminalNode()Lfreemarker/core/TemplateElement;

    move-result-object v6

    goto :goto_8d

    .end local v1    # "firstLineIndex":I
    .end local v2    # "lastNonWS":I
    .end local v3    # "openingPart":[C
    .end local v4    # "printablePart":[C
    .end local v6    # "te":Lfreemarker/core/TemplateElement;
    .end local v7    # "ti":Lfreemarker/core/TrimInstruction;
    .end local v8    # "trailingPart":[C
    .end local v9    # "trimTrailingPart":Z
    :cond_b8
    move v10, v5

    .line 257
    goto/16 :goto_2c
.end method

.method private firstNewLineIndex()I
    .registers 6

    .prologue
    .line 271
    new-instance v0, Ljava/lang/String;

    iget-object v4, p0, Lfreemarker/core/TextBlock;->text:[C

    invoke-direct {v0, v4}, Ljava/lang/String;-><init>([C)V

    .line 272
    .local v0, "content":Ljava/lang/String;
    const/16 v4, 0xa

    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 273
    .local v1, "newlineIndex1":I
    const/16 v4, 0xd

    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 274
    .local v2, "newlineIndex2":I
    if-ltz v1, :cond_1f

    move v3, v1

    .line 275
    .local v3, "result":I
    :goto_16
    if-ltz v1, :cond_1e

    if-ltz v2, :cond_1e

    .line 276
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 278
    :cond_1e
    return v3

    .end local v3    # "result":I
    :cond_1f
    move v3, v2

    .line 274
    goto :goto_16
.end method

.method private lastNewLineIndex()I
    .registers 4

    .prologue
    .line 282
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lfreemarker/core/TextBlock;->text:[C

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    .line 283
    .local v0, "content":Ljava/lang/String;
    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    const/16 v2, 0xa

    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    return v1
.end method

.method private nonOutputtingType(Lfreemarker/core/TemplateElement;)Z
    .registers 3
    .param p1, "element"    # Lfreemarker/core/TemplateElement;

    .prologue
    .line 394
    instance-of v0, p1, Lfreemarker/core/Macro;

    if-nez v0, :cond_18

    instance-of v0, p1, Lfreemarker/core/Assignment;

    if-nez v0, :cond_18

    instance-of v0, p1, Lfreemarker/core/AssignmentInstruction;

    if-nez v0, :cond_18

    instance-of v0, p1, Lfreemarker/core/PropertySetting;

    if-nez v0, :cond_18

    instance-of v0, p1, Lfreemarker/core/LibraryLoad;

    if-nez v0, :cond_18

    instance-of v0, p1, Lfreemarker/core/Comment;

    if-eqz v0, :cond_1a

    :cond_18
    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method

.method private openingCharsToStrip()I
    .registers 6

    .prologue
    const/4 v2, 0x0

    .line 291
    invoke-direct {p0}, Lfreemarker/core/TextBlock;->firstNewLineIndex()I

    move-result v1

    .line 292
    .local v1, "newlineIndex":I
    const/4 v3, -0x1

    if-ne v1, v3, :cond_e

    iget v3, p0, Lfreemarker/core/TextBlock;->beginColumn:I

    const/4 v4, 0x1

    if-eq v3, v4, :cond_e

    .line 315
    :cond_d
    :goto_d
    return v2

    .line 295
    :cond_e
    add-int/lit8 v1, v1, 0x1

    .line 296
    iget-object v3, p0, Lfreemarker/core/TextBlock;->text:[C

    array-length v3, v3

    if-le v3, v1, :cond_2b

    .line 297
    if-lez v1, :cond_2b

    iget-object v3, p0, Lfreemarker/core/TextBlock;->text:[C

    add-int/lit8 v4, v1, -0x1

    aget-char v3, v3, v4

    const/16 v4, 0xd

    if-ne v3, v4, :cond_2b

    iget-object v3, p0, Lfreemarker/core/TextBlock;->text:[C

    aget-char v3, v3, v1

    const/16 v4, 0xa

    if-ne v3, v4, :cond_2b

    .line 298
    add-int/lit8 v1, v1, 0x1

    .line 301
    :cond_2b
    new-instance v3, Ljava/lang/String;

    iget-object v4, p0, Lfreemarker/core/TextBlock;->text:[C

    invoke-direct {v3, v4}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v3, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-gtz v3, :cond_d

    .line 306
    invoke-virtual {p0}, Lfreemarker/core/TextBlock;->prevTerminalNode()Lfreemarker/core/TemplateElement;

    move-result-object v0

    .line 307
    .local v0, "elem":Lfreemarker/core/TemplateElement;
    :goto_44
    if-eqz v0, :cond_57

    iget v3, v0, Lfreemarker/core/TemplateElement;->endLine:I

    iget v4, p0, Lfreemarker/core/TextBlock;->beginLine:I

    if-ne v3, v4, :cond_57

    .line 310
    invoke-virtual {v0}, Lfreemarker/core/TemplateElement;->heedsOpeningWhitespace()Z

    move-result v3

    if-nez v3, :cond_d

    .line 308
    invoke-virtual {v0}, Lfreemarker/core/TemplateElement;->prevTerminalNode()Lfreemarker/core/TemplateElement;

    move-result-object v0

    goto :goto_44

    :cond_57
    move v2, v1

    .line 315
    goto :goto_d
.end method

.method private static substring([CI)[C
    .registers 3
    .param p0, "c"    # [C
    .param p1, "from"    # I

    .prologue
    .line 409
    array-length v0, p0

    invoke-static {p0, p1, v0}, Lfreemarker/core/TextBlock;->substring([CII)[C

    move-result-object v0

    return-object v0
.end method

.method private static substring([CII)[C
    .registers 6
    .param p0, "c"    # [C
    .param p1, "from"    # I
    .param p2, "to"    # I

    .prologue
    .line 403
    sub-int v1, p2, p1

    new-array v0, v1, [C

    .line 404
    .local v0, "c2":[C
    const/4 v1, 0x0

    array-length v2, v0

    invoke-static {p0, p1, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 405
    return-object v0
.end method

.method private trailingCharsToStrip()I
    .registers 8

    .prologue
    const/4 v4, 0x0

    .line 323
    new-instance v0, Ljava/lang/String;

    iget-object v5, p0, Lfreemarker/core/TextBlock;->text:[C

    invoke-direct {v0, v5}, Ljava/lang/String;-><init>([C)V

    .line 324
    .local v0, "content":Ljava/lang/String;
    invoke-direct {p0}, Lfreemarker/core/TextBlock;->lastNewLineIndex()I

    move-result v2

    .line 325
    .local v2, "lastNewlineIndex":I
    const/4 v5, -0x1

    if-ne v2, v5, :cond_15

    iget v5, p0, Lfreemarker/core/TextBlock;->beginColumn:I

    const/4 v6, 0x1

    if-eq v5, v6, :cond_15

    .line 343
    :cond_14
    :goto_14
    return v4

    .line 328
    :cond_15
    add-int/lit8 v5, v2, 0x1

    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 329
    .local v3, "substring":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-gtz v5, :cond_14

    .line 334
    invoke-virtual {p0}, Lfreemarker/core/TextBlock;->nextTerminalNode()Lfreemarker/core/TemplateElement;

    move-result-object v1

    .line 335
    .local v1, "elem":Lfreemarker/core/TemplateElement;
    :goto_29
    if-eqz v1, :cond_3c

    iget v5, v1, Lfreemarker/core/TemplateElement;->beginLine:I

    iget v6, p0, Lfreemarker/core/TextBlock;->endLine:I

    if-ne v5, v6, :cond_3c

    .line 338
    invoke-virtual {v1}, Lfreemarker/core/TemplateElement;->heedsTrailingWhitespace()Z

    move-result v5

    if-nez v5, :cond_14

    .line 336
    invoke-virtual {v1}, Lfreemarker/core/TemplateElement;->nextTerminalNode()Lfreemarker/core/TemplateElement;

    move-result-object v1

    goto :goto_29

    .line 343
    :cond_3c
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    goto :goto_14
.end method

.method private static trim([C)[C
    .registers 2
    .param p0, "c"    # [C

    .prologue
    .line 413
    array-length v0, p0

    if-nez v0, :cond_4

    .line 416
    .end local p0    # "c":[C
    :goto_3
    return-object p0

    .restart local p0    # "c":[C
    :cond_4
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    goto :goto_3
.end method


# virtual methods
.method public accept(Lfreemarker/core/Environment;)V
    .registers 4
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    invoke-virtual {p1}, Lfreemarker/core/Environment;->getOut()Ljava/io/Writer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/core/TextBlock;->text:[C

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write([C)V

    .line 93
    return-void
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 6
    .param p1, "canonical"    # Z

    .prologue
    .line 96
    if-eqz p1, :cond_27

    .line 97
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lfreemarker/core/TextBlock;->text:[C

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    .line 98
    .local v0, "text":Ljava/lang/String;
    iget-boolean v1, p0, Lfreemarker/core/TextBlock;->unparsed:Z

    if-eqz v1, :cond_26

    .line 99
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "<#noparse>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "</#noparse>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 103
    .end local v0    # "text":Ljava/lang/String;
    :cond_26
    :goto_26
    return-object v0

    :cond_27
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "text "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    new-instance v2, Ljava/lang/String;

    iget-object v3, p0, Lfreemarker/core/TextBlock;->text:[C

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>([C)V

    invoke-static {v2}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_26
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 108
    const-string v0, "#text"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 112
    const/4 v0, 0x1

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 121
    if-eqz p1, :cond_8

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 122
    :cond_8
    sget-object v0, Lfreemarker/core/ParameterRole;->CONTENT:Lfreemarker/core/ParameterRole;

    return-object v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 4
    .param p1, "idx"    # I

    .prologue
    .line 116
    if-eqz p1, :cond_8

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 117
    :cond_8
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lfreemarker/core/TextBlock;->text:[C

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    return-object v0
.end method

.method heedsOpeningWhitespace()Z
    .registers 6

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 363
    invoke-virtual {p0}, Lfreemarker/core/TextBlock;->isIgnorable()Z

    move-result v4

    if-eqz v4, :cond_9

    .line 375
    :cond_8
    :goto_8
    return v2

    .line 366
    :cond_9
    iget-object v4, p0, Lfreemarker/core/TextBlock;->text:[C

    array-length v4, v4

    add-int/lit8 v1, v4, -0x1

    .local v1, "i":I
    :goto_e
    if-ltz v1, :cond_27

    .line 367
    iget-object v4, p0, Lfreemarker/core/TextBlock;->text:[C

    aget-char v0, v4, v1

    .line 368
    .local v0, "c":C
    const/16 v4, 0xa

    if-eq v0, v4, :cond_8

    const/16 v4, 0xd

    if-eq v0, v4, :cond_8

    .line 371
    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v4

    if-nez v4, :cond_24

    move v2, v3

    .line 372
    goto :goto_8

    .line 366
    :cond_24
    add-int/lit8 v1, v1, -0x1

    goto :goto_e

    .end local v0    # "c":C
    :cond_27
    move v2, v3

    .line 375
    goto :goto_8
.end method

.method heedsTrailingWhitespace()Z
    .registers 6

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 347
    invoke-virtual {p0}, Lfreemarker/core/TextBlock;->isIgnorable()Z

    move-result v4

    if-eqz v4, :cond_9

    .line 359
    :cond_8
    :goto_8
    return v2

    .line 350
    :cond_9
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    iget-object v4, p0, Lfreemarker/core/TextBlock;->text:[C

    array-length v4, v4

    if-ge v1, v4, :cond_26

    .line 351
    iget-object v4, p0, Lfreemarker/core/TextBlock;->text:[C

    aget-char v0, v4, v1

    .line 352
    .local v0, "c":C
    const/16 v4, 0xa

    if-eq v0, v4, :cond_8

    const/16 v4, 0xd

    if-eq v0, v4, :cond_8

    .line 355
    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v4

    if-nez v4, :cond_23

    move v2, v3

    .line 356
    goto :goto_8

    .line 350
    :cond_23
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .end local v0    # "c":C
    :cond_26
    move v2, v3

    .line 359
    goto :goto_8
.end method

.method isIgnorable()Z
    .registers 7

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 379
    iget-object v5, p0, Lfreemarker/core/TextBlock;->text:[C

    if-eqz v5, :cond_b

    iget-object v5, p0, Lfreemarker/core/TextBlock;->text:[C

    array-length v5, v5

    if-nez v5, :cond_d

    :cond_b
    move v4, v3

    .line 388
    :cond_c
    :goto_c
    return v4

    .line 382
    :cond_d
    invoke-virtual {p0}, Lfreemarker/core/TextBlock;->isWhitespace()Z

    move-result v5

    if-eqz v5, :cond_c

    .line 385
    invoke-virtual {p0}, Lfreemarker/core/TextBlock;->getParent()Ljavax/swing/tree/TreeNode;

    move-result-object v5

    invoke-interface {v5}, Ljavax/swing/tree/TreeNode;->getParent()Ljavax/swing/tree/TreeNode;

    move-result-object v5

    if-nez v5, :cond_3c

    move v0, v3

    .line 386
    .local v0, "atTopLevel":Z
    :goto_1e
    invoke-virtual {p0}, Lfreemarker/core/TextBlock;->previousSibling()Lfreemarker/core/TemplateElement;

    move-result-object v2

    .line 387
    .local v2, "prevSibling":Lfreemarker/core/TemplateElement;
    invoke-virtual {p0}, Lfreemarker/core/TextBlock;->nextSibling()Lfreemarker/core/TemplateElement;

    move-result-object v1

    .line 388
    .local v1, "nextSibling":Lfreemarker/core/TemplateElement;
    if-nez v2, :cond_2a

    if-nez v0, :cond_30

    :cond_2a
    invoke-direct {p0, v2}, Lfreemarker/core/TextBlock;->nonOutputtingType(Lfreemarker/core/TemplateElement;)Z

    move-result v5

    if-eqz v5, :cond_c

    :cond_30
    if-nez v1, :cond_34

    if-nez v0, :cond_3a

    :cond_34
    invoke-direct {p0, v1}, Lfreemarker/core/TextBlock;->nonOutputtingType(Lfreemarker/core/TemplateElement;)Z

    move-result v5

    if-eqz v5, :cond_c

    :cond_3a
    move v4, v3

    goto :goto_c

    .end local v0    # "atTopLevel":Z
    .end local v1    # "nextSibling":Lfreemarker/core/TemplateElement;
    .end local v2    # "prevSibling":Lfreemarker/core/TemplateElement;
    :cond_3c
    move v0, v4

    .line 385
    goto :goto_1e
.end method

.method isWhitespace()Z
    .registers 2

    .prologue
    .line 427
    iget-object v0, p0, Lfreemarker/core/TextBlock;->text:[C

    if-eqz v0, :cond_d

    iget-object v0, p0, Lfreemarker/core/TextBlock;->text:[C

    invoke-static {v0}, Lfreemarker/core/TextBlock;->trim([C)[C

    move-result-object v0

    array-length v0, v0

    if-nez v0, :cond_f

    :cond_d
    const/4 v0, 0x1

    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method postParseCleanup(Z)Lfreemarker/core/TemplateElement;
    .registers 8
    .param p1, "stripWhitespace"    # Z

    .prologue
    .line 126
    iget-object v4, p0, Lfreemarker/core/TextBlock;->text:[C

    array-length v4, v4

    if-nez v4, :cond_6

    .line 151
    :cond_5
    :goto_5
    return-object p0

    .line 127
    :cond_6
    const/4 v2, 0x0

    .local v2, "openingCharsToStrip":I
    const/4 v3, 0x0

    .line 128
    .local v3, "trailingCharsToStrip":I
    invoke-direct {p0}, Lfreemarker/core/TextBlock;->deliberateLeftTrim()Z

    move-result v0

    .line 129
    .local v0, "deliberateLeftTrim":Z
    invoke-direct {p0}, Lfreemarker/core/TextBlock;->deliberateRightTrim()Z

    move-result v1

    .line 130
    .local v1, "deliberateRightTrim":Z
    if-eqz p1, :cond_5

    iget-object v4, p0, Lfreemarker/core/TextBlock;->text:[C

    array-length v4, v4

    if-eqz v4, :cond_5

    .line 133
    iget-object v4, p0, Lfreemarker/core/TextBlock;->parent:Lfreemarker/core/TemplateElement;

    iget-object v4, v4, Lfreemarker/core/TemplateElement;->parent:Lfreemarker/core/TemplateElement;

    if-nez v4, :cond_23

    invoke-virtual {p0}, Lfreemarker/core/TextBlock;->previousSibling()Lfreemarker/core/TemplateElement;

    move-result-object v4

    if-eqz v4, :cond_5

    .line 134
    :cond_23
    if-nez v0, :cond_29

    .line 135
    invoke-direct {p0}, Lfreemarker/core/TextBlock;->trailingCharsToStrip()I

    move-result v3

    .line 137
    :cond_29
    if-nez v1, :cond_2f

    .line 138
    invoke-direct {p0}, Lfreemarker/core/TextBlock;->openingCharsToStrip()I

    move-result v2

    .line 140
    :cond_2f
    if-nez v2, :cond_33

    if-eqz v3, :cond_5

    .line 143
    :cond_33
    iget-object v4, p0, Lfreemarker/core/TextBlock;->text:[C

    iget-object v5, p0, Lfreemarker/core/TextBlock;->text:[C

    array-length v5, v5

    sub-int/2addr v5, v3

    invoke-static {v4, v2, v5}, Lfreemarker/core/TextBlock;->substring([CII)[C

    move-result-object v4

    iput-object v4, p0, Lfreemarker/core/TextBlock;->text:[C

    .line 144
    if-lez v2, :cond_4a

    .line 145
    iget v4, p0, Lfreemarker/core/TextBlock;->beginLine:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lfreemarker/core/TextBlock;->beginLine:I

    .line 146
    const/4 v4, 0x1

    iput v4, p0, Lfreemarker/core/TextBlock;->beginColumn:I

    .line 148
    :cond_4a
    if-lez v3, :cond_5

    .line 149
    const/4 v4, 0x0

    iput v4, p0, Lfreemarker/core/TextBlock;->endColumn:I

    goto :goto_5
.end method

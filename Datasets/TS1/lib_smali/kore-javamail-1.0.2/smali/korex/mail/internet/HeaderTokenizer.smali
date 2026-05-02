.class public Lkorex/mail/internet/HeaderTokenizer;
.super Ljava/lang/Object;
.source "HeaderTokenizer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkorex/mail/internet/HeaderTokenizer$Token;
    }
.end annotation


# static fields
.field private static final EOFToken:Lkorex/mail/internet/HeaderTokenizer$Token;

.field public static final MIME:Ljava/lang/String; = "()<>@,;:\\\"\t []/?="

.field public static final RFC822:Ljava/lang/String; = "()<>@,;:\\\"\t .[]"


# instance fields
.field private currentPos:I

.field private delimiters:Ljava/lang/String;

.field private maxPos:I

.field private nextPos:I

.field private peekPos:I

.field private skipComments:Z

.field private string:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 155
    new-instance v0, Lkorex/mail/internet/HeaderTokenizer$Token;

    const/4 v1, -0x4

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lkorex/mail/internet/HeaderTokenizer$Token;-><init>(ILjava/lang/String;)V

    sput-object v0, Lkorex/mail/internet/HeaderTokenizer;->EOFToken:Lkorex/mail/internet/HeaderTokenizer$Token;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "header"    # Ljava/lang/String;

    .prologue
    .line 195
    const-string v0, "()<>@,;:\\\"\t .[]"

    invoke-direct {p0, p1, v0}, Lkorex/mail/internet/HeaderTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "header"    # Ljava/lang/String;
    .param p2, "delimiters"    # Ljava/lang/String;

    .prologue
    .line 184
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lkorex/mail/internet/HeaderTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 185
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 5
    .param p1, "header"    # Ljava/lang/String;
    .param p2, "delimiters"    # Ljava/lang/String;
    .param p3, "skipComments"    # Z

    .prologue
    .line 169
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 170
    if-nez p1, :cond_7

    const-string p1, ""

    .end local p1    # "header":Ljava/lang/String;
    :cond_7
    iput-object p1, p0, Lkorex/mail/internet/HeaderTokenizer;->string:Ljava/lang/String;

    .line 171
    iput-boolean p3, p0, Lkorex/mail/internet/HeaderTokenizer;->skipComments:Z

    .line 172
    iput-object p2, p0, Lkorex/mail/internet/HeaderTokenizer;->delimiters:Ljava/lang/String;

    .line 173
    const/4 v0, 0x0

    iput v0, p0, Lkorex/mail/internet/HeaderTokenizer;->peekPos:I

    iput v0, p0, Lkorex/mail/internet/HeaderTokenizer;->nextPos:I

    iput v0, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    .line 174
    iget-object v0, p0, Lkorex/mail/internet/HeaderTokenizer;->string:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    iput v0, p0, Lkorex/mail/internet/HeaderTokenizer;->maxPos:I

    .line 175
    return-void
.end method

.method private collectString(CZ)Lkorex/mail/internet/HeaderTokenizer$Token;
    .registers 11
    .param p1, "eos"    # C
    .param p2, "keepEscapes"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/ParseException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x22

    const/4 v6, -0x2

    .line 385
    const/4 v1, 0x0

    .line 386
    .local v1, "filter":Z
    iget v3, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    .local v3, "start":I
    :goto_6
    iget v4, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    iget v5, p0, Lkorex/mail/internet/HeaderTokenizer;->maxPos:I

    if-ge v4, v5, :cond_5d

    .line 387
    iget-object v4, p0, Lkorex/mail/internet/HeaderTokenizer;->string:Ljava/lang/String;

    iget v5, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 388
    .local v0, "c":C
    const/16 v4, 0x5c

    if-ne v0, v4, :cond_26

    .line 389
    iget v4, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    .line 390
    const/4 v1, 0x1

    .line 386
    :cond_1f
    :goto_1f
    iget v4, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    goto :goto_6

    .line 391
    :cond_26
    const/16 v4, 0xd

    if-ne v0, v4, :cond_2c

    .line 392
    const/4 v1, 0x1

    goto :goto_1f

    .line 393
    :cond_2c
    if-ne v0, p1, :cond_1f

    .line 394
    iget v4, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    .line 397
    if-eqz v1, :cond_52

    .line 398
    iget-object v4, p0, Lkorex/mail/internet/HeaderTokenizer;->string:Ljava/lang/String;

    iget v5, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    add-int/lit8 v5, v5, -0x1

    invoke-static {v4, v3, v5, p2}, Lkorex/mail/internet/HeaderTokenizer;->filterToken(Ljava/lang/String;IIZ)Ljava/lang/String;

    move-result-object v2

    .line 402
    .local v2, "s":Ljava/lang/String;
    :goto_40
    if-eq v0, v7, :cond_4c

    .line 403
    invoke-static {v2}, Lkorex/mail/internet/HeaderTokenizer;->trimWhiteSpace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 404
    iget v4, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    .line 407
    :cond_4c
    new-instance v4, Lkorex/mail/internet/HeaderTokenizer$Token;

    invoke-direct {v4, v6, v2}, Lkorex/mail/internet/HeaderTokenizer$Token;-><init>(ILjava/lang/String;)V

    .line 424
    .end local v0    # "c":C
    :goto_51
    return-object v4

    .line 400
    .end local v2    # "s":Ljava/lang/String;
    .restart local v0    # "c":C
    :cond_52
    iget-object v4, p0, Lkorex/mail/internet/HeaderTokenizer;->string:Ljava/lang/String;

    iget v5, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_40

    .line 414
    .end local v0    # "c":C
    .end local v2    # "s":Ljava/lang/String;
    :cond_5d
    if-ne p1, v7, :cond_67

    .line 415
    new-instance v4, Lkorex/mail/internet/ParseException;

    const-string v5, "Unbalanced quoted string"

    invoke-direct {v4, v5}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 419
    :cond_67
    if-eqz v1, :cond_7b

    .line 420
    iget-object v4, p0, Lkorex/mail/internet/HeaderTokenizer;->string:Ljava/lang/String;

    iget v5, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    invoke-static {v4, v3, v5, p2}, Lkorex/mail/internet/HeaderTokenizer;->filterToken(Ljava/lang/String;IIZ)Ljava/lang/String;

    move-result-object v2

    .line 423
    .restart local v2    # "s":Ljava/lang/String;
    :goto_71
    invoke-static {v2}, Lkorex/mail/internet/HeaderTokenizer;->trimWhiteSpace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 424
    new-instance v4, Lkorex/mail/internet/HeaderTokenizer$Token;

    invoke-direct {v4, v6, v2}, Lkorex/mail/internet/HeaderTokenizer$Token;-><init>(ILjava/lang/String;)V

    goto :goto_51

    .line 422
    .end local v2    # "s":Ljava/lang/String;
    :cond_7b
    iget-object v4, p0, Lkorex/mail/internet/HeaderTokenizer;->string:Ljava/lang/String;

    iget v5, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    invoke-virtual {v4, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_71
.end method

.method private static filterToken(Ljava/lang/String;IIZ)Ljava/lang/String;
    .registers 11
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "keepEscapes"    # Z

    .prologue
    const/16 v6, 0x5c

    .line 457
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 459
    .local v4, "sb":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .line 460
    .local v2, "gotEscape":Z
    const/4 v1, 0x0

    .line 462
    .local v1, "gotCR":Z
    move v3, p1

    .local v3, "i":I
    :goto_a
    if-ge v3, p2, :cond_35

    .line 463
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 464
    .local v0, "c":C
    const/16 v5, 0xa

    if-ne v0, v5, :cond_1a

    if-eqz v1, :cond_1a

    .line 467
    const/4 v1, 0x0

    .line 462
    :goto_17
    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    .line 471
    :cond_1a
    const/4 v1, 0x0

    .line 472
    if-nez v2, :cond_2b

    .line 474
    if-ne v0, v6, :cond_21

    .line 475
    const/4 v2, 0x1

    goto :goto_17

    .line 476
    :cond_21
    const/16 v5, 0xd

    if-ne v0, v5, :cond_27

    .line 477
    const/4 v1, 0x1

    goto :goto_17

    .line 479
    :cond_27
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_17

    .line 487
    :cond_2b
    if-eqz p3, :cond_30

    .line 488
    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 489
    :cond_30
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 490
    const/4 v2, 0x0

    goto :goto_17

    .line 493
    .end local v0    # "c":C
    :cond_35
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method private getNext(CZ)Lkorex/mail/internet/HeaderTokenizer$Token;
    .registers 16
    .param p1, "endOfAtom"    # C
    .param p2, "keepEscapes"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/ParseException;
        }
    .end annotation

    .prologue
    const/16 v12, 0x7f

    const/4 v11, -0x4

    const/16 v10, 0x28

    const/16 v9, 0x22

    const/16 v8, 0x20

    .line 290
    iget v6, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    iget v7, p0, Lkorex/mail/internet/HeaderTokenizer;->maxPos:I

    if-lt v6, v7, :cond_12

    .line 291
    sget-object v6, Lkorex/mail/internet/HeaderTokenizer;->EOFToken:Lkorex/mail/internet/HeaderTokenizer$Token;

    .line 379
    :goto_11
    return-object v6

    .line 294
    :cond_12
    invoke-direct {p0}, Lkorex/mail/internet/HeaderTokenizer;->skipWhiteSpace()I

    move-result v6

    if-ne v6, v11, :cond_1b

    .line 295
    sget-object v6, Lkorex/mail/internet/HeaderTokenizer;->EOFToken:Lkorex/mail/internet/HeaderTokenizer$Token;

    goto :goto_11

    .line 299
    :cond_1b
    const/4 v2, 0x0

    .line 301
    .local v2, "filter":Z
    iget-object v6, p0, Lkorex/mail/internet/HeaderTokenizer;->string:Ljava/lang/String;

    iget v7, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    invoke-virtual {v6, v7}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 305
    .local v0, "c":C
    :goto_24
    if-ne v0, v10, :cond_a0

    .line 308
    iget v6, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    add-int/lit8 v5, v6, 0x1

    iput v5, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    .local v5, "start":I
    const/4 v3, 0x1

    .line 309
    .local v3, "nesting":I
    :goto_2d
    if-lez v3, :cond_61

    iget v6, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    iget v7, p0, Lkorex/mail/internet/HeaderTokenizer;->maxPos:I

    if-ge v6, v7, :cond_61

    .line 311
    iget-object v6, p0, Lkorex/mail/internet/HeaderTokenizer;->string:Ljava/lang/String;

    iget v7, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    invoke-virtual {v6, v7}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 312
    const/16 v6, 0x5c

    if-ne v0, v6, :cond_4f

    .line 313
    iget v6, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    .line 314
    const/4 v2, 0x1

    .line 310
    :cond_48
    :goto_48
    iget v6, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    goto :goto_2d

    .line 315
    :cond_4f
    const/16 v6, 0xd

    if-ne v0, v6, :cond_55

    .line 316
    const/4 v2, 0x1

    goto :goto_48

    .line 317
    :cond_55
    if-ne v0, v10, :cond_5a

    .line 318
    add-int/lit8 v3, v3, 0x1

    goto :goto_48

    .line 319
    :cond_5a
    const/16 v6, 0x29

    if-ne v0, v6, :cond_48

    .line 320
    add-int/lit8 v3, v3, -0x1

    goto :goto_48

    .line 322
    :cond_61
    if-eqz v3, :cond_6b

    .line 323
    new-instance v6, Lkorex/mail/internet/ParseException;

    const-string v7, "Unbalanced comments"

    invoke-direct {v6, v7}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 325
    :cond_6b
    iget-boolean v6, p0, Lkorex/mail/internet/HeaderTokenizer;->skipComments:Z

    if-nez v6, :cond_8d

    .line 329
    if-eqz v2, :cond_82

    .line 330
    iget-object v6, p0, Lkorex/mail/internet/HeaderTokenizer;->string:Ljava/lang/String;

    iget v7, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    add-int/lit8 v7, v7, -0x1

    invoke-static {v6, v5, v7, p2}, Lkorex/mail/internet/HeaderTokenizer;->filterToken(Ljava/lang/String;IIZ)Ljava/lang/String;

    move-result-object v4

    .line 334
    .local v4, "s":Ljava/lang/String;
    :goto_7b
    new-instance v6, Lkorex/mail/internet/HeaderTokenizer$Token;

    const/4 v7, -0x3

    invoke-direct {v6, v7, v4}, Lkorex/mail/internet/HeaderTokenizer$Token;-><init>(ILjava/lang/String;)V

    goto :goto_11

    .line 332
    .end local v4    # "s":Ljava/lang/String;
    :cond_82
    iget-object v6, p0, Lkorex/mail/internet/HeaderTokenizer;->string:Ljava/lang/String;

    iget v7, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v6, v5, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .restart local v4    # "s":Ljava/lang/String;
    goto :goto_7b

    .line 338
    .end local v4    # "s":Ljava/lang/String;
    :cond_8d
    invoke-direct {p0}, Lkorex/mail/internet/HeaderTokenizer;->skipWhiteSpace()I

    move-result v6

    if-ne v6, v11, :cond_97

    .line 339
    sget-object v6, Lkorex/mail/internet/HeaderTokenizer;->EOFToken:Lkorex/mail/internet/HeaderTokenizer$Token;

    goto/16 :goto_11

    .line 340
    :cond_97
    iget-object v6, p0, Lkorex/mail/internet/HeaderTokenizer;->string:Ljava/lang/String;

    iget v7, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    invoke-virtual {v6, v7}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 341
    goto :goto_24

    .line 345
    .end local v3    # "nesting":I
    .end local v5    # "start":I
    :cond_a0
    if-ne v0, v9, :cond_ae

    .line 346
    iget v6, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    .line 347
    invoke-direct {p0, v9, p2}, Lkorex/mail/internet/HeaderTokenizer;->collectString(CZ)Lkorex/mail/internet/HeaderTokenizer$Token;

    move-result-object v6

    goto/16 :goto_11

    .line 351
    :cond_ae
    if-lt v0, v8, :cond_ba

    if-ge v0, v12, :cond_ba

    iget-object v6, p0, Lkorex/mail/internet/HeaderTokenizer;->delimiters:Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    if-ltz v6, :cond_dc

    .line 352
    :cond_ba
    if-lez p1, :cond_c4

    if-eq v0, p1, :cond_c4

    .line 355
    invoke-direct {p0, p1, p2}, Lkorex/mail/internet/HeaderTokenizer;->collectString(CZ)Lkorex/mail/internet/HeaderTokenizer$Token;

    move-result-object v6

    goto/16 :goto_11

    .line 357
    :cond_c4
    iget v6, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    .line 358
    const/4 v6, 0x1

    new-array v1, v6, [C

    .line 359
    .local v1, "ch":[C
    const/4 v6, 0x0

    aput-char v0, v1, v6

    .line 360
    new-instance v6, Lkorex/mail/internet/HeaderTokenizer$Token;

    new-instance v7, Ljava/lang/String;

    invoke-direct {v7, v1}, Ljava/lang/String;-><init>([C)V

    invoke-direct {v6, v0, v7}, Lkorex/mail/internet/HeaderTokenizer$Token;-><init>(ILjava/lang/String;)V

    goto/16 :goto_11

    .line 364
    .end local v1    # "ch":[C
    :cond_dc
    iget v5, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    .restart local v5    # "start":I
    :goto_de
    iget v6, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    iget v7, p0, Lkorex/mail/internet/HeaderTokenizer;->maxPos:I

    if-ge v6, v7, :cond_111

    .line 365
    iget-object v6, p0, Lkorex/mail/internet/HeaderTokenizer;->string:Ljava/lang/String;

    iget v7, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    invoke-virtual {v6, v7}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 368
    if-lt v0, v8, :cond_fe

    if-ge v0, v12, :cond_fe

    if-eq v0, v10, :cond_fe

    if-eq v0, v8, :cond_fe

    if-eq v0, v9, :cond_fe

    iget-object v6, p0, Lkorex/mail/internet/HeaderTokenizer;->delimiters:Ljava/lang/String;

    .line 369
    invoke-virtual {v6, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    if-ltz v6, :cond_10a

    .line 370
    :cond_fe
    if-lez p1, :cond_111

    if-eq v0, p1, :cond_111

    .line 373
    iput v5, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    .line 374
    invoke-direct {p0, p1, p2}, Lkorex/mail/internet/HeaderTokenizer;->collectString(CZ)Lkorex/mail/internet/HeaderTokenizer$Token;

    move-result-object v6

    goto/16 :goto_11

    .line 364
    :cond_10a
    iget v6, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    goto :goto_de

    .line 379
    :cond_111
    new-instance v6, Lkorex/mail/internet/HeaderTokenizer$Token;

    const/4 v7, -0x1

    iget-object v8, p0, Lkorex/mail/internet/HeaderTokenizer;->string:Ljava/lang/String;

    iget v9, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    invoke-virtual {v8, v5, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Lkorex/mail/internet/HeaderTokenizer$Token;-><init>(ILjava/lang/String;)V

    goto/16 :goto_11
.end method

.method private skipWhiteSpace()I
    .registers 4

    .prologue
    .line 430
    :goto_0
    iget v1, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    iget v2, p0, Lkorex/mail/internet/HeaderTokenizer;->maxPos:I

    if-ge v1, v2, :cond_28

    .line 431
    iget-object v1, p0, Lkorex/mail/internet/HeaderTokenizer;->string:Ljava/lang/String;

    iget v2, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .local v0, "c":C
    const/16 v1, 0x20

    if-eq v0, v1, :cond_21

    const/16 v1, 0x9

    if-eq v0, v1, :cond_21

    const/16 v1, 0xd

    if-eq v0, v1, :cond_21

    const/16 v1, 0xa

    if-eq v0, v1, :cond_21

    .line 433
    iget v1, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    .line 434
    .end local v0    # "c":C
    :goto_20
    return v1

    .line 430
    .restart local v0    # "c":C
    :cond_21
    iget v1, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    goto :goto_0

    .line 434
    .end local v0    # "c":C
    :cond_28
    const/4 v1, -0x4

    goto :goto_20
.end method

.method private static trimWhiteSpace(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 441
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, "i":I
    :goto_6
    if-ltz v1, :cond_1c

    .line 442
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .local v0, "c":C
    const/16 v2, 0x20

    if-eq v0, v2, :cond_21

    const/16 v2, 0x9

    if-eq v0, v2, :cond_21

    const/16 v2, 0xd

    if-eq v0, v2, :cond_21

    const/16 v2, 0xa

    if-eq v0, v2, :cond_21

    .line 446
    .end local v0    # "c":C
    :cond_1c
    if-gtz v1, :cond_24

    .line 447
    const-string v2, ""

    .line 449
    :goto_20
    return-object v2

    .line 441
    .restart local v0    # "c":C
    :cond_21
    add-int/lit8 v1, v1, -0x1

    goto :goto_6

    .line 449
    .end local v0    # "c":C
    :cond_24
    const/4 v2, 0x0

    add-int/lit8 v3, v1, 0x1

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_20
.end method


# virtual methods
.method public getRemainder()Ljava/lang/String;
    .registers 3

    .prologue
    .line 277
    iget v0, p0, Lkorex/mail/internet/HeaderTokenizer;->nextPos:I

    iget-object v1, p0, Lkorex/mail/internet/HeaderTokenizer;->string:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v0, v1, :cond_c

    .line 278
    const/4 v0, 0x0

    .line 279
    :goto_b
    return-object v0

    :cond_c
    iget-object v0, p0, Lkorex/mail/internet/HeaderTokenizer;->string:Ljava/lang/String;

    iget v1, p0, Lkorex/mail/internet/HeaderTokenizer;->nextPos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_b
.end method

.method public next()Lkorex/mail/internet/HeaderTokenizer$Token;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/ParseException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 208
    invoke-virtual {p0, v0, v0}, Lkorex/mail/internet/HeaderTokenizer;->next(CZ)Lkorex/mail/internet/HeaderTokenizer$Token;

    move-result-object v0

    return-object v0
.end method

.method public next(C)Lkorex/mail/internet/HeaderTokenizer$Token;
    .registers 3
    .param p1, "endOfAtom"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/ParseException;
        }
    .end annotation

    .prologue
    .line 225
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lkorex/mail/internet/HeaderTokenizer;->next(CZ)Lkorex/mail/internet/HeaderTokenizer$Token;

    move-result-object v0

    return-object v0
.end method

.method public next(CZ)Lkorex/mail/internet/HeaderTokenizer$Token;
    .registers 5
    .param p1, "endOfAtom"    # C
    .param p2, "keepEscapes"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/ParseException;
        }
    .end annotation

    .prologue
    .line 246
    iget v1, p0, Lkorex/mail/internet/HeaderTokenizer;->nextPos:I

    iput v1, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    .line 247
    invoke-direct {p0, p1, p2}, Lkorex/mail/internet/HeaderTokenizer;->getNext(CZ)Lkorex/mail/internet/HeaderTokenizer$Token;

    move-result-object v0

    .line 248
    .local v0, "tk":Lkorex/mail/internet/HeaderTokenizer$Token;
    iget v1, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    iput v1, p0, Lkorex/mail/internet/HeaderTokenizer;->peekPos:I

    iput v1, p0, Lkorex/mail/internet/HeaderTokenizer;->nextPos:I

    .line 249
    return-object v0
.end method

.method public peek()Lkorex/mail/internet/HeaderTokenizer$Token;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/ParseException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 264
    iget v1, p0, Lkorex/mail/internet/HeaderTokenizer;->peekPos:I

    iput v1, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    .line 265
    invoke-direct {p0, v2, v2}, Lkorex/mail/internet/HeaderTokenizer;->getNext(CZ)Lkorex/mail/internet/HeaderTokenizer$Token;

    move-result-object v0

    .line 266
    .local v0, "tk":Lkorex/mail/internet/HeaderTokenizer$Token;
    iget v1, p0, Lkorex/mail/internet/HeaderTokenizer;->currentPos:I

    iput v1, p0, Lkorex/mail/internet/HeaderTokenizer;->peekPos:I

    .line 267
    return-object v0
.end method

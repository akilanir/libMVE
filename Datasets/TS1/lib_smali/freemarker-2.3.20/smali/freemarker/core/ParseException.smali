.class public Lfreemarker/core/ParseException;
.super Ljava/io/IOException;
.source "ParseException.java"

# interfaces
.implements Lfreemarker/core/FMParserConstants;


# static fields
.field static class$freemarker$core$ParseException:Ljava/lang/Class;

.field private static volatile jbossToolsMode:Ljava/lang/Boolean;


# instance fields
.field private final cause:Ljava/lang/Throwable;

.field public columnNumber:I

.field public currentToken:Lfreemarker/core/Token;

.field private description:Ljava/lang/String;

.field protected eol:Ljava/lang/String;

.field public expectedTokenSequences:[[I

.field public lineNumber:I

.field private message:Ljava/lang/String;

.field private messageAndDescriptionRendered:Z

.field protected specialConstructor:Z

.field private templateName:Ljava/lang/String;

.field public tokenImage:[Ljava/lang/String;


# direct methods
.method protected constructor <init>()V
    .registers 3

    .prologue
    .line 154
    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    .line 109
    const-string v0, "line.separator"

    const-string v1, "\n"

    invoke-static {v0, v1}, Lfreemarker/template/utility/SecurityUtilities;->getSystemProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/core/ParseException;->eol:Ljava/lang/String;

    .line 155
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/core/ParseException;->cause:Ljava/lang/Throwable;

    .line 156
    return-void
.end method

.method public constructor <init>(Lfreemarker/core/Token;[[I[Ljava/lang/String;)V
    .registers 6
    .param p1, "currentTokenVal"    # Lfreemarker/core/Token;
    .param p2, "expectedTokenSequencesVal"    # [[I
    .param p3, "tokenImageVal"    # [Ljava/lang/String;

    .prologue
    .line 134
    const-string v0, ""

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 109
    const-string v0, "line.separator"

    const-string v1, "\n"

    invoke-static {v0, v1}, Lfreemarker/template/utility/SecurityUtilities;->getSystemProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/core/ParseException;->eol:Ljava/lang/String;

    .line 135
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/core/ParseException;->cause:Ljava/lang/Throwable;

    .line 136
    iput-object p1, p0, Lfreemarker/core/ParseException;->currentToken:Lfreemarker/core/Token;

    .line 137
    const/4 v0, 0x1

    iput-boolean v0, p0, Lfreemarker/core/ParseException;->specialConstructor:Z

    .line 138
    iput-object p2, p0, Lfreemarker/core/ParseException;->expectedTokenSequences:[[I

    .line 139
    iput-object p3, p0, Lfreemarker/core/ParseException;->tokenImage:[Ljava/lang/String;

    .line 140
    iget-object v0, p0, Lfreemarker/core/ParseException;->currentToken:Lfreemarker/core/Token;

    iget-object v0, v0, Lfreemarker/core/Token;->next:Lfreemarker/core/Token;

    iget v0, v0, Lfreemarker/core/Token;->beginLine:I

    iput v0, p0, Lfreemarker/core/ParseException;->lineNumber:I

    .line 141
    iget-object v0, p0, Lfreemarker/core/ParseException;->currentToken:Lfreemarker/core/Token;

    iget-object v0, v0, Lfreemarker/core/Token;->next:Lfreemarker/core/Token;

    iget v0, v0, Lfreemarker/core/Token;->beginColumn:I

    iput v0, p0, Lfreemarker/core/ParseException;->columnNumber:I

    .line 142
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 10
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "lineNumber"    # I
    .param p3, "columnNumber"    # I

    .prologue
    const/4 v5, 0x0

    .line 162
    move-object v2, v5

    check-cast v2, Lfreemarker/template/Template;

    move-object v0, p0

    move-object v1, p1

    move v3, p2

    move v4, p3

    invoke-direct/range {v0 .. v5}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;IILjava/lang/Throwable;)V

    .line 163
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lfreemarker/core/TemplateObject;)V
    .registers 4
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "tobj"    # Lfreemarker/core/TemplateObject;

    .prologue
    .line 203
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/core/TemplateObject;Ljava/lang/Throwable;)V

    .line 204
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lfreemarker/core/TemplateObject;Ljava/lang/Throwable;)V
    .registers 10
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "tobj"    # Lfreemarker/core/TemplateObject;
    .param p3, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 210
    invoke-virtual {p2}, Lfreemarker/core/TemplateObject;->getTemplate()Lfreemarker/template/Template;

    move-result-object v0

    if-nez v0, :cond_12

    const/4 v2, 0x0

    :goto_7
    iget v3, p2, Lfreemarker/core/TemplateObject;->beginLine:I

    iget v4, p2, Lfreemarker/core/TemplateObject;->beginColumn:I

    move-object v0, p0

    move-object v1, p1

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Ljava/lang/String;IILjava/lang/Throwable;)V

    .line 214
    return-void

    .line 210
    :cond_12
    invoke-virtual {p2}, Lfreemarker/core/TemplateObject;->getTemplate()Lfreemarker/template/Template;

    move-result-object v0

    invoke-virtual {v0}, Lfreemarker/template/Template;->getName()Ljava/lang/String;

    move-result-object v2

    goto :goto_7
.end method

.method public constructor <init>(Ljava/lang/String;Lfreemarker/template/Template;II)V
    .registers 11
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "template"    # Lfreemarker/template/Template;
    .param p3, "lineNumber"    # I
    .param p4, "columnNumber"    # I

    .prologue
    .line 169
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;IILjava/lang/Throwable;)V

    .line 170
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lfreemarker/template/Template;IILjava/lang/Throwable;)V
    .registers 12
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "template"    # Lfreemarker/template/Template;
    .param p3, "lineNumber"    # I
    .param p4, "columnNumber"    # I
    .param p5, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 176
    if-nez p2, :cond_c

    const/4 v2, 0x0

    :goto_3
    move-object v0, p0

    move-object v1, p1

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Ljava/lang/String;IILjava/lang/Throwable;)V

    .line 180
    return-void

    .line 176
    :cond_c
    invoke-virtual {p2}, Lfreemarker/template/Template;->getName()Ljava/lang/String;

    move-result-object v2

    goto :goto_3
.end method

.method public constructor <init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V
    .registers 5
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "template"    # Lfreemarker/template/Template;
    .param p3, "tk"    # Lfreemarker/core/Token;

    .prologue
    .line 186
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;Ljava/lang/Throwable;)V

    .line 187
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;Ljava/lang/Throwable;)V
    .registers 11
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "template"    # Lfreemarker/template/Template;
    .param p3, "tk"    # Lfreemarker/core/Token;
    .param p4, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 193
    if-nez p2, :cond_e

    const/4 v2, 0x0

    :goto_3
    iget v3, p3, Lfreemarker/core/Token;->beginLine:I

    iget v4, p3, Lfreemarker/core/Token;->beginColumn:I

    move-object v0, p0

    move-object v1, p1

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Ljava/lang/String;IILjava/lang/Throwable;)V

    .line 197
    return-void

    .line 193
    :cond_e
    invoke-virtual {p2}, Lfreemarker/template/Template;->getName()Ljava/lang/String;

    move-result-object v2

    goto :goto_3
.end method

.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;IILjava/lang/Throwable;)V
    .registers 8
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "templateName"    # Ljava/lang/String;
    .param p3, "lineNumber"    # I
    .param p4, "columnNumber"    # I
    .param p5, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 217
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 109
    const-string v0, "line.separator"

    const-string v1, "\n"

    invoke-static {v0, v1}, Lfreemarker/template/utility/SecurityUtilities;->getSystemProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/core/ParseException;->eol:Ljava/lang/String;

    .line 218
    iput-object p5, p0, Lfreemarker/core/ParseException;->cause:Ljava/lang/Throwable;

    .line 219
    iput-object p1, p0, Lfreemarker/core/ParseException;->description:Ljava/lang/String;

    .line 220
    iput-object p2, p0, Lfreemarker/core/ParseException;->templateName:Ljava/lang/String;

    .line 221
    iput p3, p0, Lfreemarker/core/ParseException;->lineNumber:I

    .line 222
    iput p4, p0, Lfreemarker/core/ParseException;->columnNumber:I

    .line 223
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 329
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private getCustomTokenErrorDescription()Ljava/lang/String;
    .registers 8

    .prologue
    .line 395
    iget-object v5, p0, Lfreemarker/core/ParseException;->currentToken:Lfreemarker/core/Token;

    iget-object v3, v5, Lfreemarker/core/Token;->next:Lfreemarker/core/Token;

    .line 396
    .local v3, "nextToken":Lfreemarker/core/Token;
    iget v1, v3, Lfreemarker/core/Token;->kind:I

    .line 397
    .local v1, "kind":I
    if-nez v1, :cond_82

    .line 398
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    iget-object v5, p0, Lfreemarker/core/ParseException;->expectedTokenSequences:[[I

    array-length v5, v5

    if-ge v0, v5, :cond_7f

    .line 399
    iget-object v5, p0, Lfreemarker/core/ParseException;->expectedTokenSequences:[[I

    aget-object v4, v5, v0

    .line 401
    .local v4, "sequence":[I
    const/4 v5, 0x0

    aget v5, v4, v5

    sparse-switch v5, :sswitch_data_ae

    .line 456
    const/4 v2, 0x0

    .line 458
    .local v2, "name":Ljava/lang/String;
    :goto_19
    if-eqz v2, :cond_7c

    .line 459
    const-string v5, "#"

    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2f

    const-string v5, "@"

    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2f

    invoke-static {v2}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 460
    :cond_2f
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Unclosed "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, " when the end of the file was reached."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 469
    .end local v0    # "i":I
    .end local v2    # "name":Ljava/lang/String;
    .end local v4    # "sequence":[I
    :goto_48
    return-object v5

    .line 403
    .restart local v0    # "i":I
    .restart local v4    # "sequence":[I
    :sswitch_49
    const-string v2, "#foreach"

    .line 404
    .restart local v2    # "name":Ljava/lang/String;
    goto :goto_19

    .line 406
    .end local v2    # "name":Ljava/lang/String;
    :sswitch_4c
    const-string v2, "#list"

    .line 407
    .restart local v2    # "name":Ljava/lang/String;
    goto :goto_19

    .line 409
    .end local v2    # "name":Ljava/lang/String;
    :sswitch_4f
    const-string v2, "#switch"

    .line 410
    .restart local v2    # "name":Ljava/lang/String;
    goto :goto_19

    .line 412
    .end local v2    # "name":Ljava/lang/String;
    :sswitch_52
    const-string v2, "#if"

    .line 413
    .restart local v2    # "name":Ljava/lang/String;
    goto :goto_19

    .line 415
    .end local v2    # "name":Ljava/lang/String;
    :sswitch_55
    const-string v2, "#compress"

    .line 416
    .restart local v2    # "name":Ljava/lang/String;
    goto :goto_19

    .line 420
    .end local v2    # "name":Ljava/lang/String;
    :sswitch_58
    const-string v2, "#macro or #function"

    .line 421
    .restart local v2    # "name":Ljava/lang/String;
    goto :goto_19

    .line 423
    .end local v2    # "name":Ljava/lang/String;
    :sswitch_5b
    const-string v2, "#transform"

    .line 424
    .restart local v2    # "name":Ljava/lang/String;
    goto :goto_19

    .line 426
    .end local v2    # "name":Ljava/lang/String;
    :sswitch_5e
    const-string v2, "#escape"

    .line 427
    .restart local v2    # "name":Ljava/lang/String;
    goto :goto_19

    .line 429
    .end local v2    # "name":Ljava/lang/String;
    :sswitch_61
    const-string v2, "#noescape"

    .line 430
    .restart local v2    # "name":Ljava/lang/String;
    goto :goto_19

    .line 432
    .end local v2    # "name":Ljava/lang/String;
    :sswitch_64
    const-string v2, "#assign"

    .line 433
    .restart local v2    # "name":Ljava/lang/String;
    goto :goto_19

    .line 435
    .end local v2    # "name":Ljava/lang/String;
    :sswitch_67
    const-string v2, "#local"

    .line 436
    .restart local v2    # "name":Ljava/lang/String;
    goto :goto_19

    .line 438
    .end local v2    # "name":Ljava/lang/String;
    :sswitch_6a
    const-string v2, "#global"

    .line 439
    .restart local v2    # "name":Ljava/lang/String;
    goto :goto_19

    .line 441
    .end local v2    # "name":Ljava/lang/String;
    :sswitch_6d
    const-string v2, "#attempt"

    .line 442
    .restart local v2    # "name":Ljava/lang/String;
    goto :goto_19

    .line 444
    .end local v2    # "name":Ljava/lang/String;
    :sswitch_70
    const-string v2, "{"

    .line 445
    .restart local v2    # "name":Ljava/lang/String;
    goto :goto_19

    .line 447
    .end local v2    # "name":Ljava/lang/String;
    :sswitch_73
    const-string v2, "["

    .line 448
    .restart local v2    # "name":Ljava/lang/String;
    goto :goto_19

    .line 450
    .end local v2    # "name":Ljava/lang/String;
    :sswitch_76
    const-string v2, "("

    .line 451
    .restart local v2    # "name":Ljava/lang/String;
    goto :goto_19

    .line 453
    .end local v2    # "name":Ljava/lang/String;
    :sswitch_79
    const-string v2, "@..."

    .line 454
    .restart local v2    # "name":Ljava/lang/String;
    goto :goto_19

    .line 398
    :cond_7c
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 463
    .end local v2    # "name":Ljava/lang/String;
    .end local v4    # "sequence":[I
    :cond_7f
    const-string v5, "Unexpected end of file reached."

    goto :goto_48

    .line 464
    .end local v0    # "i":I
    :cond_82
    const/16 v5, 0x1f

    if-eq v1, v5, :cond_8e

    const/16 v5, 0x9

    if-eq v1, v5, :cond_8e

    const/16 v5, 0x2c

    if-ne v1, v5, :cond_ac

    .line 465
    :cond_8e
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Unexpected directive, "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-static {v3}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, ". Check whether you have a valid #if-#elseif-#else structure."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_48

    .line 469
    :cond_ac
    const/4 v5, 0x0

    goto :goto_48

    .line 401
    :sswitch_data_ae
    .sparse-switch
        0x1f -> :sswitch_52
        0x20 -> :sswitch_4c
        0x22 -> :sswitch_6d
        0x23 -> :sswitch_49
        0x24 -> :sswitch_67
        0x25 -> :sswitch_6a
        0x26 -> :sswitch_64
        0x27 -> :sswitch_58
        0x28 -> :sswitch_58
        0x29 -> :sswitch_55
        0x2a -> :sswitch_5b
        0x2b -> :sswitch_4f
        0x3c -> :sswitch_5e
        0x3e -> :sswitch_61
        0x40 -> :sswitch_79
        0x70 -> :sswitch_73
        0x72 -> :sswitch_76
        0x74 -> :sswitch_70
    .end sparse-switch
.end method

.method private getDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 261
    monitor-enter p0

    .line 262
    :try_start_1
    iget-boolean v0, p0, Lfreemarker/core/ParseException;->messageAndDescriptionRendered:Z

    if-eqz v0, :cond_9

    iget-object v0, p0, Lfreemarker/core/ParseException;->description:Ljava/lang/String;

    monitor-exit p0

    .line 266
    :goto_8
    return-object v0

    .line 263
    :cond_9
    monitor-exit p0
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_15

    .line 264
    invoke-direct {p0}, Lfreemarker/core/ParseException;->renderMessageAndDescription()V

    .line 265
    monitor-enter p0

    .line 266
    :try_start_e
    iget-object v0, p0, Lfreemarker/core/ParseException;->description:Ljava/lang/String;

    monitor-exit p0

    goto :goto_8

    .line 267
    :catchall_12
    move-exception v0

    monitor-exit p0
    :try_end_14
    .catchall {:try_start_e .. :try_end_14} :catchall_12

    throw v0

    .line 263
    :catchall_15
    move-exception v0

    :try_start_16
    monitor-exit p0
    :try_end_17
    .catchall {:try_start_16 .. :try_end_17} :catchall_15

    throw v0
.end method

.method private getOrRenderDescription()Ljava/lang/String;
    .registers 10

    .prologue
    .line 344
    monitor-enter p0

    .line 345
    :try_start_1
    iget-object v6, p0, Lfreemarker/core/ParseException;->description:Ljava/lang/String;

    if-eqz v6, :cond_9

    iget-object v5, p0, Lfreemarker/core/ParseException;->description:Ljava/lang/String;

    monitor-exit p0

    .line 391
    :cond_8
    :goto_8
    return-object v5

    .line 346
    :cond_9
    monitor-exit p0
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_57

    .line 349
    iget-object v6, p0, Lfreemarker/core/ParseException;->currentToken:Lfreemarker/core/Token;

    if-eqz v6, :cond_111

    .line 350
    invoke-direct {p0}, Lfreemarker/core/ParseException;->getCustomTokenErrorDescription()Ljava/lang/String;

    move-result-object v5

    .line 351
    .local v5, "tokenErrDesc":Ljava/lang/String;
    if-nez v5, :cond_8

    .line 353
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 354
    .local v0, "expected":Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    .line 355
    .local v3, "maxSize":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1b
    iget-object v6, p0, Lfreemarker/core/ParseException;->expectedTokenSequences:[[I

    array-length v6, v6

    if-ge v1, v6, :cond_5d

    .line 356
    if-eqz v1, :cond_27

    .line 357
    iget-object v6, p0, Lfreemarker/core/ParseException;->eol:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 359
    :cond_27
    const-string v6, "    "

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 360
    iget-object v6, p0, Lfreemarker/core/ParseException;->expectedTokenSequences:[[I

    aget-object v6, v6, v1

    array-length v6, v6

    if-ge v3, v6, :cond_38

    .line 361
    iget-object v6, p0, Lfreemarker/core/ParseException;->expectedTokenSequences:[[I

    aget-object v6, v6, v1

    array-length v3, v6

    .line 363
    :cond_38
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_39
    iget-object v6, p0, Lfreemarker/core/ParseException;->expectedTokenSequences:[[I

    aget-object v6, v6, v1

    array-length v6, v6

    if-ge v2, v6, :cond_5a

    .line 364
    if-eqz v2, :cond_47

    const/16 v6, 0x20

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 365
    :cond_47
    iget-object v6, p0, Lfreemarker/core/ParseException;->tokenImage:[Ljava/lang/String;

    iget-object v7, p0, Lfreemarker/core/ParseException;->expectedTokenSequences:[[I

    aget-object v7, v7, v1

    aget v7, v7, v2

    aget-object v6, v6, v7

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 363
    add-int/lit8 v2, v2, 0x1

    goto :goto_39

    .line 346
    .end local v0    # "expected":Ljava/lang/StringBuffer;
    .end local v1    # "i":I
    .end local v2    # "j":I
    .end local v3    # "maxSize":I
    .end local v5    # "tokenErrDesc":Ljava/lang/String;
    :catchall_57
    move-exception v6

    :try_start_58
    monitor-exit p0
    :try_end_59
    .catchall {:try_start_58 .. :try_end_59} :catchall_57

    throw v6

    .line 355
    .restart local v0    # "expected":Ljava/lang/StringBuffer;
    .restart local v1    # "i":I
    .restart local v2    # "j":I
    .restart local v3    # "maxSize":I
    .restart local v5    # "tokenErrDesc":Ljava/lang/String;
    :cond_5a
    add-int/lit8 v1, v1, 0x1

    goto :goto_1b

    .line 368
    .end local v2    # "j":I
    :cond_5d
    const-string v5, "Encountered \""

    .line 369
    iget-object v6, p0, Lfreemarker/core/ParseException;->currentToken:Lfreemarker/core/Token;

    iget-object v4, v6, Lfreemarker/core/Token;->next:Lfreemarker/core/Token;

    .line 370
    .local v4, "tok":Lfreemarker/core/Token;
    const/4 v1, 0x0

    :goto_64
    if-ge v1, v3, :cond_95

    .line 371
    if-eqz v1, :cond_7b

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 372
    :cond_7b
    iget v6, v4, Lfreemarker/core/Token;->kind:I

    if-nez v6, :cond_da

    .line 373
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lfreemarker/core/ParseException;->tokenImage:[Ljava/lang/String;

    const/4 v8, 0x0

    aget-object v7, v7, v8

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 379
    :cond_95
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\", but "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 381
    iget-object v6, p0, Lfreemarker/core/ParseException;->expectedTokenSequences:[[I

    array-length v6, v6

    const/4 v7, 0x1

    if-ne v6, v7, :cond_f7

    .line 382
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "was expecting:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lfreemarker/core/ParseException;->eol:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 386
    :goto_c7
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 387
    goto/16 :goto_8

    .line 376
    :cond_da
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, v4, Lfreemarker/core/Token;->image:Ljava/lang/String;

    invoke-virtual {p0, v7}, Lfreemarker/core/ParseException;->add_escapes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 377
    iget-object v4, v4, Lfreemarker/core/Token;->next:Lfreemarker/core/Token;

    .line 370
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_64

    .line 384
    :cond_f7
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "was expecting one of:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lfreemarker/core/ParseException;->eol:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_c7

    .line 389
    .end local v0    # "expected":Ljava/lang/StringBuffer;
    .end local v1    # "i":I
    .end local v3    # "maxSize":I
    .end local v4    # "tok":Lfreemarker/core/Token;
    .end local v5    # "tokenErrDesc":Ljava/lang/String;
    :cond_111
    const/4 v5, 0x0

    .restart local v5    # "tokenErrDesc":Ljava/lang/String;
    goto/16 :goto_8
.end method

.method private isInJBossToolsMode()Z
    .registers 4

    .prologue
    .line 326
    sget-object v1, Lfreemarker/core/ParseException;->jbossToolsMode:Ljava/lang/Boolean;

    if-nez v1, :cond_25

    .line 328
    :try_start_4
    sget-object v1, Lfreemarker/core/ParseException;->class$freemarker$core$ParseException:Ljava/lang/Class;

    if-nez v1, :cond_2c

    const-string v1, "freemarker.core.ParseException"

    invoke-static {v1}, Lfreemarker/core/ParseException;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/core/ParseException;->class$freemarker$core$ParseException:Ljava/lang/Class;

    :goto_10
    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "[org.jboss.ide.eclipse.freemarker:"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_2f

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_23
    sput-object v1, Lfreemarker/core/ParseException;->jbossToolsMode:Ljava/lang/Boolean;
    :try_end_25
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_25} :catch_32

    .line 336
    :cond_25
    :goto_25
    sget-object v1, Lfreemarker/core/ParseException;->jbossToolsMode:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    return v1

    .line 328
    :cond_2c
    :try_start_2c
    sget-object v1, Lfreemarker/core/ParseException;->class$freemarker$core$ParseException:Ljava/lang/Class;

    goto :goto_10

    :cond_2f
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    :try_end_31
    .catch Ljava/lang/Throwable; {:try_start_2c .. :try_end_31} :catch_32

    goto :goto_23

    .line 332
    :catch_32
    move-exception v0

    .line 333
    .local v0, "e":Ljava/lang/Throwable;
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    sput-object v1, Lfreemarker/core/ParseException;->jbossToolsMode:Ljava/lang/Boolean;

    goto :goto_25
.end method

.method private renderMessageAndDescription()V
    .registers 8

    .prologue
    .line 304
    invoke-direct {p0}, Lfreemarker/core/ParseException;->getOrRenderDescription()Ljava/lang/String;

    move-result-object v0

    .line 307
    .local v0, "desc":Ljava/lang/String;
    invoke-direct {p0}, Lfreemarker/core/ParseException;->isInJBossToolsMode()Z

    move-result v3

    if-nez v3, :cond_50

    .line 308
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Parsing error "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lfreemarker/core/ParseException;->templateName:Ljava/lang/String;

    iget v5, p0, Lfreemarker/core/ParseException;->lineNumber:I

    iget v6, p0, Lfreemarker/core/ParseException;->columnNumber:I

    invoke-static {v4, v5, v6}, Lfreemarker/core/MessageUtil;->formatLocationForSimpleParsingError(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, ":\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 315
    .local v2, "prefix":Ljava/lang/String;
    :goto_2d
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 316
    .local v1, "msg":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 318
    monitor-enter p0

    .line 319
    :try_start_47
    iput-object v1, p0, Lfreemarker/core/ParseException;->message:Ljava/lang/String;

    .line 320
    iput-object v0, p0, Lfreemarker/core/ParseException;->description:Ljava/lang/String;

    .line 321
    const/4 v3, 0x1

    iput-boolean v3, p0, Lfreemarker/core/ParseException;->messageAndDescriptionRendered:Z

    .line 322
    monitor-exit p0
    :try_end_4f
    .catchall {:try_start_47 .. :try_end_4f} :catchall_6c

    .line 323
    return-void

    .line 312
    .end local v1    # "msg":Ljava/lang/String;
    .end local v2    # "prefix":Ljava/lang/String;
    :cond_50
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "[col. "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget v4, p0, Lfreemarker/core/ParseException;->columnNumber:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "] "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .restart local v2    # "prefix":Ljava/lang/String;
    goto :goto_2d

    .line 322
    .restart local v1    # "msg":Ljava/lang/String;
    :catchall_6c
    move-exception v3

    :try_start_6d
    monitor-exit p0
    :try_end_6e
    .catchall {:try_start_6d .. :try_end_6e} :catchall_6c

    throw v3
.end method


# virtual methods
.method protected add_escapes(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 478
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 480
    .local v2, "retval":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v1, v4, :cond_93

    .line 481
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    sparse-switch v4, :sswitch_data_98

    .line 510
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .local v0, "ch":C
    const/16 v4, 0x20

    if-lt v0, v4, :cond_1f

    const/16 v4, 0x7e

    if-le v0, v4, :cond_8f

    .line 511
    :cond_1f
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "0000"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const/16 v5, 0x10

    invoke-static {v0, v5}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 512
    .local v3, "s":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "\\u"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x4

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v3, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 480
    .end local v0    # "ch":C
    .end local v3    # "s":Ljava/lang/String;
    :goto_5c
    :sswitch_5c
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 486
    :sswitch_5f
    const-string v4, "\\b"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_5c

    .line 489
    :sswitch_65
    const-string v4, "\\t"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_5c

    .line 492
    :sswitch_6b
    const-string v4, "\\n"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_5c

    .line 495
    :sswitch_71
    const-string v4, "\\f"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_5c

    .line 498
    :sswitch_77
    const-string v4, "\\r"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_5c

    .line 501
    :sswitch_7d
    const-string v4, "\\\""

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_5c

    .line 504
    :sswitch_83
    const-string v4, "\\\'"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_5c

    .line 507
    :sswitch_89
    const-string v4, "\\\\"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_5c

    .line 514
    .restart local v0    # "ch":C
    :cond_8f
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_5c

    .line 519
    .end local v0    # "ch":C
    :cond_93
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 481
    :sswitch_data_98
    .sparse-switch
        0x0 -> :sswitch_5c
        0x8 -> :sswitch_5f
        0x9 -> :sswitch_65
        0xa -> :sswitch_6b
        0xc -> :sswitch_71
        0xd -> :sswitch_77
        0x22 -> :sswitch_7d
        0x27 -> :sswitch_83
        0x5c -> :sswitch_89
    .end sparse-switch
.end method

.method public getCause()Ljava/lang/Throwable;
    .registers 2

    .prologue
    .line 239
    iget-object v0, p0, Lfreemarker/core/ParseException;->cause:Ljava/lang/Throwable;

    return-object v0
.end method

.method public getColumnNumber()I
    .registers 2

    .prologue
    .line 300
    iget v0, p0, Lfreemarker/core/ParseException;->columnNumber:I

    return v0
.end method

.method public getEditorMessage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 276
    invoke-direct {p0}, Lfreemarker/core/ParseException;->getDescription()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLineNumber()I
    .registers 2

    .prologue
    .line 293
    iget v0, p0, Lfreemarker/core/ParseException;->lineNumber:I

    return v0
.end method

.method public getMessage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 251
    monitor-enter p0

    .line 252
    :try_start_1
    iget-boolean v0, p0, Lfreemarker/core/ParseException;->messageAndDescriptionRendered:Z

    if-eqz v0, :cond_9

    iget-object v0, p0, Lfreemarker/core/ParseException;->message:Ljava/lang/String;

    monitor-exit p0

    .line 256
    :goto_8
    return-object v0

    .line 253
    :cond_9
    monitor-exit p0
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_15

    .line 254
    invoke-direct {p0}, Lfreemarker/core/ParseException;->renderMessageAndDescription()V

    .line 255
    monitor-enter p0

    .line 256
    :try_start_e
    iget-object v0, p0, Lfreemarker/core/ParseException;->message:Ljava/lang/String;

    monitor-exit p0

    goto :goto_8

    .line 257
    :catchall_12
    move-exception v0

    monitor-exit p0
    :try_end_14
    .catchall {:try_start_e .. :try_end_14} :catchall_12

    throw v0

    .line 253
    :catchall_15
    move-exception v0

    :try_start_16
    monitor-exit p0
    :try_end_17
    .catchall {:try_start_16 .. :try_end_17} :catchall_15

    throw v0
.end method

.method public getTemplateName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 286
    iget-object v0, p0, Lfreemarker/core/ParseException;->templateName:Ljava/lang/String;

    return-object v0
.end method

.method public setTemplateName(Ljava/lang/String;)V
    .registers 3
    .param p1, "templateName"    # Ljava/lang/String;

    .prologue
    .line 231
    iput-object p1, p0, Lfreemarker/core/ParseException;->templateName:Ljava/lang/String;

    .line 232
    monitor-enter p0

    .line 233
    const/4 v0, 0x0

    :try_start_4
    iput-boolean v0, p0, Lfreemarker/core/ParseException;->messageAndDescriptionRendered:Z

    .line 234
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/core/ParseException;->message:Ljava/lang/String;

    .line 235
    monitor-exit p0

    .line 236
    return-void

    .line 235
    :catchall_b
    move-exception v0

    monitor-exit p0
    :try_end_d
    .catchall {:try_start_4 .. :try_end_d} :catchall_b

    throw v0
.end method

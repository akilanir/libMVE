.class public Lezvcard/io/text/VCardRawWriter;
.super Ljava/lang/Object;
.source "VCardRawWriter.java"

# interfaces
.implements Ljava/io/Closeable;
.implements Ljava/io/Flushable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lezvcard/io/text/VCardRawWriter$1;,
        Lezvcard/io/text/VCardRawWriter$ProblemsListener;
    }
.end annotation


# static fields
.field private static final invalidParamValueChars:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lezvcard/VCardVersion;",
            "Ljava/util/BitSet;",
            ">;"
        }
    .end annotation
.end field

.field private static final newlineRegex:Ljava/util/regex/Pattern;

.field private static final propertyNameRegex:Ljava/util/regex/Pattern;

.field private static final quoteMeRegex:Ljava/util/regex/Pattern;


# instance fields
.field private caretEncodingEnabled:Z

.field private problemsListener:Lezvcard/io/text/VCardRawWriter$ProblemsListener;

.field private version:Lezvcard/VCardVersion;

.field private final writer:Lezvcard/io/text/FoldedLineWriter;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/16 v5, 0x80

    const/4 v4, 0x0

    .line 57
    const-string v3, ".*?[,:;].*"

    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v3

    sput-object v3, Lezvcard/io/text/VCardRawWriter;->quoteMeRegex:Ljava/util/regex/Pattern;

    .line 62
    const-string v3, "\\r\\n|\\r|\\n"

    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v3

    sput-object v3, Lezvcard/io/text/VCardRawWriter;->newlineRegex:Ljava/util/regex/Pattern;

    .line 68
    const-string v3, "(?i)[-a-z0-9]+"

    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v3

    sput-object v3, Lezvcard/io/text/VCardRawWriter;->propertyNameRegex:Ljava/util/regex/Pattern;

    .line 76
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, v5}, Ljava/util/BitSet;-><init>(I)V

    .line 77
    .local v1, "controlChars":Ljava/util/BitSet;
    const/16 v3, 0x1f

    invoke-virtual {v1, v4, v3}, Ljava/util/BitSet;->set(II)V

    .line 78
    const/16 v3, 0x7f

    invoke-virtual {v1, v3}, Ljava/util/BitSet;->set(I)V

    .line 79
    const/16 v3, 0x9

    invoke-virtual {v1, v3, v4}, Ljava/util/BitSet;->set(IZ)V

    .line 80
    const/16 v3, 0xa

    invoke-virtual {v1, v3, v4}, Ljava/util/BitSet;->set(IZ)V

    .line 81
    const/16 v3, 0xd

    invoke-virtual {v1, v3, v4}, Ljava/util/BitSet;->set(IZ)V

    .line 83
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 87
    .local v2, "map":Ljava/util/Map;, "Ljava/util/Map<Lezvcard/VCardVersion;Ljava/util/BitSet;>;"
    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0, v5}, Ljava/util/BitSet;-><init>(I)V

    .line 88
    .local v0, "bitSet":Ljava/util/BitSet;
    invoke-virtual {v0, v1}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 90
    const/16 v3, 0x2c

    invoke-virtual {v0, v3}, Ljava/util/BitSet;->set(I)V

    .line 91
    const/16 v3, 0x2e

    invoke-virtual {v0, v3}, Ljava/util/BitSet;->set(I)V

    .line 92
    const/16 v3, 0x3a

    invoke-virtual {v0, v3}, Ljava/util/BitSet;->set(I)V

    .line 93
    const/16 v3, 0x3d

    invoke-virtual {v0, v3}, Ljava/util/BitSet;->set(I)V

    .line 94
    const/16 v3, 0x5b

    invoke-virtual {v0, v3}, Ljava/util/BitSet;->set(I)V

    .line 95
    const/16 v3, 0x5d

    invoke-virtual {v0, v3}, Ljava/util/BitSet;->set(I)V

    .line 97
    sget-object v3, Lezvcard/VCardVersion;->V2_1:Lezvcard/VCardVersion;

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    new-instance v0, Ljava/util/BitSet;

    .end local v0    # "bitSet":Ljava/util/BitSet;
    invoke-direct {v0, v5}, Ljava/util/BitSet;-><init>(I)V

    .line 103
    .restart local v0    # "bitSet":Ljava/util/BitSet;
    invoke-virtual {v0, v1}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 105
    sget-object v3, Lezvcard/VCardVersion;->V3_0:Lezvcard/VCardVersion;

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    sget-object v3, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v3

    sput-object v3, Lezvcard/io/text/VCardRawWriter;->invalidParamValueChars:Ljava/util/Map;

    .line 110
    return-void
.end method

.method public constructor <init>(Ljava/io/Writer;Lezvcard/VCardVersion;)V
    .registers 4
    .param p1, "writer"    # Ljava/io/Writer;
    .param p2, "version"    # Lezvcard/VCardVersion;

    .prologue
    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    const/4 v0, 0x0

    iput-boolean v0, p0, Lezvcard/io/text/VCardRawWriter;->caretEncodingEnabled:Z

    .line 123
    new-instance v0, Lezvcard/io/text/FoldedLineWriter;

    invoke-direct {v0, p1}, Lezvcard/io/text/FoldedLineWriter;-><init>(Ljava/io/Writer;)V

    iput-object v0, p0, Lezvcard/io/text/VCardRawWriter;->writer:Lezvcard/io/text/FoldedLineWriter;

    .line 124
    iput-object p2, p0, Lezvcard/io/text/VCardRawWriter;->version:Lezvcard/VCardVersion;

    .line 125
    return-void
.end method

.method private applyCaretEncoding(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 555
    const-string v0, "^"

    const-string v1, "^^"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 556
    sget-object v0, Lezvcard/io/text/VCardRawWriter;->newlineRegex:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    const-string v1, "^n"

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 557
    const-string v0, "\""

    const-string v1, "^\'"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 558
    return-object p1
.end method

.method private containsNewlines(Ljava/lang/String;)Z
    .registers 3
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 592
    sget-object v0, Lezvcard/io/text/VCardRawWriter;->newlineRegex:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    return v0
.end method

.method private escapeNewlines(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 575
    sget-object v0, Lezvcard/io/text/VCardRawWriter;->newlineRegex:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    const-string v1, "\\\\n"

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private removeInvalidParameterValueChars(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 528
    sget-object v4, Lezvcard/io/text/VCardRawWriter;->invalidParamValueChars:Ljava/util/Map;

    iget-object v5, p0, Lezvcard/io/text/VCardRawWriter;->version:Lezvcard/VCardVersion;

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/BitSet;

    .line 529
    .local v2, "invalidChars":Ljava/util/BitSet;
    const/4 v3, 0x0

    .line 531
    .local v3, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v1, v4, :cond_38

    .line 532
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 533
    .local v0, "ch":C
    invoke-virtual {v2, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v4

    if-eqz v4, :cond_32

    .line 534
    if-nez v3, :cond_2f

    .line 535
    new-instance v3, Ljava/lang/StringBuilder;

    .end local v3    # "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 536
    .restart local v3    # "sb":Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    invoke-virtual {p1, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 531
    :cond_2f
    :goto_2f
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 541
    :cond_32
    if-eqz v3, :cond_2f

    .line 542
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2f

    .line 546
    .end local v0    # "ch":C
    :cond_38
    if-nez v3, :cond_3b

    .end local p1    # "value":Ljava/lang/String;
    :goto_3a
    return-object p1

    .restart local p1    # "value":Ljava/lang/String;
    :cond_3b
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_3a
.end method

.method private sanitizeParameterValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 12
    .param p1, "parameterValue"    # Ljava/lang/String;
    .param p2, "parameterName"    # Ljava/lang/String;
    .param p3, "propertyName"    # Ljava/lang/String;

    .prologue
    const/16 v7, 0x27

    const/16 v6, 0x22

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 448
    const/4 v0, 0x0

    .line 449
    .local v0, "modifiedValue":Ljava/lang/String;
    const/4 v1, 0x0

    .line 453
    .local v1, "valueChanged":Z
    sget-object v4, Lezvcard/io/text/VCardRawWriter$1;->$SwitchMap$ezvcard$VCardVersion:[I

    iget-object v5, p0, Lezvcard/io/text/VCardRawWriter;->version:Lezvcard/VCardVersion;

    invoke-virtual {v5}, Lezvcard/VCardVersion;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_98

    .line 515
    :goto_15
    if-eqz v1, :cond_20

    iget-object v2, p0, Lezvcard/io/text/VCardRawWriter;->problemsListener:Lezvcard/io/text/VCardRawWriter$ProblemsListener;

    if-eqz v2, :cond_20

    .line 516
    iget-object v2, p0, Lezvcard/io/text/VCardRawWriter;->problemsListener:Lezvcard/io/text/VCardRawWriter$ProblemsListener;

    invoke-interface {v2, p3, p2, p1, v0}, Lezvcard/io/text/VCardRawWriter$ProblemsListener;->onParameterValueChanged(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 519
    :cond_20
    return-object v0

    .line 456
    :pswitch_21
    invoke-direct {p0, p1}, Lezvcard/io/text/VCardRawWriter;->removeInvalidParameterValueChars(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 459
    sget-object v4, Lezvcard/io/text/VCardRawWriter;->newlineRegex:Ljava/util/regex/Pattern;

    invoke-virtual {v4, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 462
    if-eq p1, v0, :cond_45

    move v1, v2

    .line 465
    :goto_34
    const-string v2, "\\"

    const-string v3, "\\\\"

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 468
    const-string v2, ";"

    const-string v3, "\\;"

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 470
    goto :goto_15

    :cond_45
    move v1, v3

    .line 462
    goto :goto_34

    .line 474
    :pswitch_47
    invoke-direct {p0, p1}, Lezvcard/io/text/VCardRawWriter;->removeInvalidParameterValueChars(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 476
    iget-boolean v4, p0, Lezvcard/io/text/VCardRawWriter;->caretEncodingEnabled:Z

    if-eqz v4, :cond_59

    .line 477
    if-eq v0, p1, :cond_57

    move v1, v2

    .line 480
    :goto_52
    invoke-direct {p0, v0}, Lezvcard/io/text/VCardRawWriter;->applyCaretEncoding(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_15

    :cond_57
    move v1, v3

    .line 477
    goto :goto_52

    .line 483
    :cond_59
    invoke-virtual {v0, v6, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    .line 486
    sget-object v4, Lezvcard/io/text/VCardRawWriter;->newlineRegex:Ljava/util/regex/Pattern;

    invoke-virtual {v4, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 488
    if-eq v0, p1, :cond_6d

    move v1, v2

    .line 491
    :goto_6c
    goto :goto_15

    :cond_6d
    move v1, v3

    .line 488
    goto :goto_6c

    .line 495
    :pswitch_6f
    invoke-direct {p0, p1}, Lezvcard/io/text/VCardRawWriter;->removeInvalidParameterValueChars(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 497
    iget-boolean v4, p0, Lezvcard/io/text/VCardRawWriter;->caretEncodingEnabled:Z

    if-eqz v4, :cond_81

    .line 498
    if-eq v0, p1, :cond_7f

    move v1, v2

    .line 501
    :goto_7a
    invoke-direct {p0, v0}, Lezvcard/io/text/VCardRawWriter;->applyCaretEncoding(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_15

    :cond_7f
    move v1, v3

    .line 498
    goto :goto_7a

    .line 504
    :cond_81
    invoke-virtual {v0, v6, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    .line 506
    if-eq v0, p1, :cond_95

    move v1, v2

    .line 509
    :goto_88
    sget-object v2, Lezvcard/io/text/VCardRawWriter;->newlineRegex:Ljava/util/regex/Pattern;

    invoke-virtual {v2, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    const-string v3, "\\\\\\n"

    invoke-virtual {v2, v3}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_15

    :cond_95
    move v1, v3

    .line 506
    goto :goto_88

    .line 453
    nop

    :pswitch_data_98
    .packed-switch 0x1
        :pswitch_21
        :pswitch_47
        :pswitch_6f
    .end packed-switch
.end method

.method private sanitizeValue(Lezvcard/parameter/VCardParameters;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "parameters"    # Lezvcard/parameter/VCardParameters;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 426
    if-nez p2, :cond_5

    .line 427
    const-string p2, ""

    .line 436
    .end local p2    # "value":Ljava/lang/String;
    :goto_4
    return-object p2

    .line 430
    .restart local p2    # "value":Ljava/lang/String;
    :cond_5
    iget-object v0, p0, Lezvcard/io/text/VCardRawWriter;->version:Lezvcard/VCardVersion;

    sget-object v1, Lezvcard/VCardVersion;->V2_1:Lezvcard/VCardVersion;

    if-ne v0, v1, :cond_17

    invoke-direct {p0, p2}, Lezvcard/io/text/VCardRawWriter;->containsNewlines(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 432
    sget-object v0, Lezvcard/parameter/Encoding;->QUOTED_PRINTABLE:Lezvcard/parameter/Encoding;

    invoke-virtual {p1, v0}, Lezvcard/parameter/VCardParameters;->setEncoding(Lezvcard/parameter/Encoding;)V

    goto :goto_4

    .line 436
    :cond_17
    invoke-direct {p0, p2}, Lezvcard/io/text/VCardRawWriter;->escapeNewlines(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_4
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 608
    iget-object v0, p0, Lezvcard/io/text/VCardRawWriter;->writer:Lezvcard/io/text/FoldedLineWriter;

    invoke-virtual {v0}, Lezvcard/io/text/FoldedLineWriter;->close()V

    .line 609
    return-void
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 600
    iget-object v0, p0, Lezvcard/io/text/VCardRawWriter;->writer:Lezvcard/io/text/FoldedLineWriter;

    invoke-virtual {v0}, Lezvcard/io/text/FoldedLineWriter;->flush()V

    .line 601
    return-void
.end method

.method public getFoldedLineWriter()Lezvcard/io/text/FoldedLineWriter;
    .registers 2

    .prologue
    .line 132
    iget-object v0, p0, Lezvcard/io/text/VCardRawWriter;->writer:Lezvcard/io/text/FoldedLineWriter;

    return-object v0
.end method

.method public getProblemsListener()Lezvcard/io/text/VCardRawWriter$ProblemsListener;
    .registers 2

    .prologue
    .line 264
    iget-object v0, p0, Lezvcard/io/text/VCardRawWriter;->problemsListener:Lezvcard/io/text/VCardRawWriter$ProblemsListener;

    return-object v0
.end method

.method public getVersion()Lezvcard/VCardVersion;
    .registers 2

    .prologue
    .line 248
    iget-object v0, p0, Lezvcard/io/text/VCardRawWriter;->version:Lezvcard/VCardVersion;

    return-object v0
.end method

.method public isCaretEncodingEnabled()Z
    .registers 2

    .prologue
    .line 186
    iget-boolean v0, p0, Lezvcard/io/text/VCardRawWriter;->caretEncodingEnabled:Z

    return v0
.end method

.method public setCaretEncodingEnabled(Z)V
    .registers 2
    .param p1, "enable"    # Z

    .prologue
    .line 240
    iput-boolean p1, p0, Lezvcard/io/text/VCardRawWriter;->caretEncodingEnabled:Z

    .line 241
    return-void
.end method

.method public setProblemsListener(Lezvcard/io/text/VCardRawWriter$ProblemsListener;)V
    .registers 2
    .param p1, "problemsListener"    # Lezvcard/io/text/VCardRawWriter$ProblemsListener;

    .prologue
    .line 272
    iput-object p1, p0, Lezvcard/io/text/VCardRawWriter;->problemsListener:Lezvcard/io/text/VCardRawWriter$ProblemsListener;

    .line 273
    return-void
.end method

.method public setVersion(Lezvcard/VCardVersion;)V
    .registers 2
    .param p1, "version"    # Lezvcard/VCardVersion;

    .prologue
    .line 256
    iput-object p1, p0, Lezvcard/io/text/VCardRawWriter;->version:Lezvcard/VCardVersion;

    .line 257
    return-void
.end method

.method public writeBeginComponent(Ljava/lang/String;)V
    .registers 3
    .param p1, "componentName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 282
    const-string v0, "BEGIN"

    invoke-virtual {p0, v0, p1}, Lezvcard/io/text/VCardRawWriter;->writeProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    return-void
.end method

.method public writeEndComponent(Ljava/lang/String;)V
    .registers 3
    .param p1, "componentName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 292
    const-string v0, "END"

    invoke-virtual {p0, v0, p1}, Lezvcard/io/text/VCardRawWriter;->writeProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    return-void
.end method

.method public writeProperty(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 313
    const/4 v0, 0x0

    new-instance v1, Lezvcard/parameter/VCardParameters;

    invoke-direct {v1}, Lezvcard/parameter/VCardParameters;-><init>()V

    invoke-virtual {p0, v0, p1, v1, p2}, Lezvcard/io/text/VCardRawWriter;->writeProperty(Ljava/lang/String;Ljava/lang/String;Lezvcard/parameter/VCardParameters;Ljava/lang/String;)V

    .line 314
    return-void
.end method

.method public writeProperty(Ljava/lang/String;Ljava/lang/String;Lezvcard/parameter/VCardParameters;Ljava/lang/String;)V
    .registers 23
    .param p1, "group"    # Ljava/lang/String;
    .param p2, "propertyName"    # Ljava/lang/String;
    .param p3, "parameters"    # Lezvcard/parameter/VCardParameters;
    .param p4, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 329
    if-eqz p1, :cond_2d

    sget-object v15, Lezvcard/io/text/VCardRawWriter;->propertyNameRegex:Ljava/util/regex/Pattern;

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v15

    invoke-virtual {v15}, Ljava/util/regex/Matcher;->matches()Z

    move-result v15

    if-nez v15, :cond_2d

    .line 330
    new-instance v15, Ljava/lang/IllegalArgumentException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Group contains invalid characters.  Valid characters are letters, numbers, and hyphens: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 334
    :cond_2d
    sget-object v15, Lezvcard/io/text/VCardRawWriter;->propertyNameRegex:Ljava/util/regex/Pattern;

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v15

    invoke-virtual {v15}, Ljava/util/regex/Matcher;->matches()Z

    move-result v15

    if-nez v15, :cond_58

    .line 335
    new-instance v15, Ljava/lang/IllegalArgumentException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Property name contains invalid characters.  Valid characters are letters, numbers, and hyphens: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 338
    :cond_58
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2}, Lezvcard/io/text/VCardRawWriter;->sanitizeValue(Lezvcard/parameter/VCardParameters;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    .line 342
    invoke-virtual/range {p3 .. p3}, Lezvcard/parameter/VCardParameters;->getEncoding()Lezvcard/parameter/Encoding;

    move-result-object v15

    sget-object v16, Lezvcard/parameter/Encoding;->QUOTED_PRINTABLE:Lezvcard/parameter/Encoding;

    move-object/from16 v0, v16

    if-ne v15, v0, :cond_100

    const/4 v13, 0x1

    .line 343
    .local v13, "quotedPrintable":Z
    :goto_6d
    const/4 v3, 0x0

    .line 344
    .local v3, "charset":Ljava/nio/charset/Charset;
    if-eqz v13, :cond_85

    .line 345
    invoke-virtual/range {p3 .. p3}, Lezvcard/parameter/VCardParameters;->getCharset()Ljava/lang/String;

    move-result-object v4

    .line 346
    .local v4, "charsetParam":Ljava/lang/String;
    if-nez v4, :cond_103

    .line 347
    const-string v15, "UTF-8"

    invoke-static {v15}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v3

    .line 355
    :goto_7c
    invoke-virtual {v3}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p3

    invoke-virtual {v0, v15}, Lezvcard/parameter/VCardParameters;->setCharset(Ljava/lang/String;)V

    .line 359
    .end local v4    # "charsetParam":Ljava/lang/String;
    :cond_85
    if-eqz p1, :cond_99

    .line 360
    move-object/from16 v0, p0

    iget-object v15, v0, Lezvcard/io/text/VCardRawWriter;->writer:Lezvcard/io/text/FoldedLineWriter;

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Lezvcard/io/text/FoldedLineWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 361
    move-object/from16 v0, p0

    iget-object v15, v0, Lezvcard/io/text/VCardRawWriter;->writer:Lezvcard/io/text/FoldedLineWriter;

    const/16 v16, 0x2e

    invoke-virtual/range {v15 .. v16}, Lezvcard/io/text/FoldedLineWriter;->append(C)Ljava/io/Writer;

    .line 365
    :cond_99
    move-object/from16 v0, p0

    iget-object v15, v0, Lezvcard/io/text/VCardRawWriter;->writer:Lezvcard/io/text/FoldedLineWriter;

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Lezvcard/io/text/FoldedLineWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 368
    invoke-virtual/range {p3 .. p3}, Lezvcard/parameter/VCardParameters;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_a6
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_190

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map$Entry;

    .line 369
    .local v9, "parameter":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 370
    .local v10, "parameterName":Ljava/lang/String;
    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 371
    .local v12, "parameterValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v12}, Ljava/util/List;->isEmpty()Z

    move-result v15

    if-nez v15, :cond_a6

    .line 375
    move-object/from16 v0, p0

    iget-object v15, v0, Lezvcard/io/text/VCardRawWriter;->version:Lezvcard/VCardVersion;

    sget-object v16, Lezvcard/VCardVersion;->V2_1:Lezvcard/VCardVersion;

    move-object/from16 v0, v16

    if-ne v15, v0, :cond_12a

    .line 376
    const-string v15, "TYPE"

    invoke-virtual {v15, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    .line 377
    .local v8, "isTypeParameter":Z
    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :goto_d8
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_a6

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 378
    .local v11, "parameterValue":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v11, v10, v1}, Lezvcard/io/text/VCardRawWriter;->sanitizeParameterValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 380
    if-eqz v8, :cond_112

    .line 382
    move-object/from16 v0, p0

    iget-object v15, v0, Lezvcard/io/text/VCardRawWriter;->writer:Lezvcard/io/text/FoldedLineWriter;

    const/16 v16, 0x3b

    invoke-virtual/range {v15 .. v16}, Lezvcard/io/text/FoldedLineWriter;->append(C)Ljava/io/Writer;

    move-result-object v15

    invoke-virtual {v11}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    goto :goto_d8

    .line 342
    .end local v3    # "charset":Ljava/nio/charset/Charset;
    .end local v7    # "i$":Ljava/util/Iterator;
    .end local v8    # "isTypeParameter":Z
    .end local v9    # "parameter":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v10    # "parameterName":Ljava/lang/String;
    .end local v11    # "parameterValue":Ljava/lang/String;
    .end local v12    # "parameterValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v13    # "quotedPrintable":Z
    :cond_100
    const/4 v13, 0x0

    goto/16 :goto_6d

    .line 350
    .restart local v3    # "charset":Ljava/nio/charset/Charset;
    .restart local v4    # "charsetParam":Ljava/lang/String;
    .restart local v13    # "quotedPrintable":Z
    :cond_103
    :try_start_103
    invoke-static {v4}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;
    :try_end_106
    .catch Ljava/lang/Throwable; {:try_start_103 .. :try_end_106} :catch_109

    move-result-object v3

    goto/16 :goto_7c

    .line 351
    :catch_109
    move-exception v14

    .line 352
    .local v14, "t":Ljava/lang/Throwable;
    const-string v15, "UTF-8"

    invoke-static {v15}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v3

    goto/16 :goto_7c

    .line 385
    .end local v4    # "charsetParam":Ljava/lang/String;
    .end local v14    # "t":Ljava/lang/Throwable;
    .restart local v7    # "i$":Ljava/util/Iterator;
    .restart local v8    # "isTypeParameter":Z
    .restart local v9    # "parameter":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .restart local v10    # "parameterName":Ljava/lang/String;
    .restart local v11    # "parameterValue":Ljava/lang/String;
    .restart local v12    # "parameterValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_112
    move-object/from16 v0, p0

    iget-object v15, v0, Lezvcard/io/text/VCardRawWriter;->writer:Lezvcard/io/text/FoldedLineWriter;

    const/16 v16, 0x3b

    invoke-virtual/range {v15 .. v16}, Lezvcard/io/text/FoldedLineWriter;->append(C)Ljava/io/Writer;

    move-result-object v15

    invoke-virtual {v15, v10}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v15

    const/16 v16, 0x3d

    invoke-virtual/range {v15 .. v16}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v15

    invoke-virtual {v15, v11}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    goto :goto_d8

    .line 392
    .end local v7    # "i$":Ljava/util/Iterator;
    .end local v8    # "isTypeParameter":Z
    .end local v11    # "parameterValue":Ljava/lang/String;
    :cond_12a
    const/4 v5, 0x1

    .line 393
    .local v5, "first":Z
    move-object/from16 v0, p0

    iget-object v15, v0, Lezvcard/io/text/VCardRawWriter;->writer:Lezvcard/io/text/FoldedLineWriter;

    const/16 v16, 0x3b

    invoke-virtual/range {v15 .. v16}, Lezvcard/io/text/FoldedLineWriter;->append(C)Ljava/io/Writer;

    move-result-object v15

    invoke-virtual {v15, v10}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v15

    const/16 v16, 0x3d

    invoke-virtual/range {v15 .. v16}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    .line 394
    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .restart local v7    # "i$":Ljava/util/Iterator;
    :goto_142
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_a6

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 395
    .restart local v11    # "parameterValue":Ljava/lang/String;
    if-nez v5, :cond_159

    .line 396
    move-object/from16 v0, p0

    iget-object v15, v0, Lezvcard/io/text/VCardRawWriter;->writer:Lezvcard/io/text/FoldedLineWriter;

    const/16 v16, 0x2c

    invoke-virtual/range {v15 .. v16}, Lezvcard/io/text/FoldedLineWriter;->append(C)Ljava/io/Writer;

    .line 399
    :cond_159
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v11, v10, v1}, Lezvcard/io/text/VCardRawWriter;->sanitizeParameterValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 402
    sget-object v15, Lezvcard/io/text/VCardRawWriter;->quoteMeRegex:Ljava/util/regex/Pattern;

    invoke-virtual {v15, v11}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v15

    invoke-virtual {v15}, Ljava/util/regex/Matcher;->matches()Z

    move-result v15

    if-eqz v15, :cond_188

    .line 403
    move-object/from16 v0, p0

    iget-object v15, v0, Lezvcard/io/text/VCardRawWriter;->writer:Lezvcard/io/text/FoldedLineWriter;

    const/16 v16, 0x22

    invoke-virtual/range {v15 .. v16}, Lezvcard/io/text/FoldedLineWriter;->append(C)Ljava/io/Writer;

    .line 404
    move-object/from16 v0, p0

    iget-object v15, v0, Lezvcard/io/text/VCardRawWriter;->writer:Lezvcard/io/text/FoldedLineWriter;

    invoke-virtual {v15, v11}, Lezvcard/io/text/FoldedLineWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 405
    move-object/from16 v0, p0

    iget-object v15, v0, Lezvcard/io/text/VCardRawWriter;->writer:Lezvcard/io/text/FoldedLineWriter;

    const/16 v16, 0x22

    invoke-virtual/range {v15 .. v16}, Lezvcard/io/text/FoldedLineWriter;->append(C)Ljava/io/Writer;

    .line 410
    :goto_186
    const/4 v5, 0x0

    .line 411
    goto :goto_142

    .line 407
    :cond_188
    move-object/from16 v0, p0

    iget-object v15, v0, Lezvcard/io/text/VCardRawWriter;->writer:Lezvcard/io/text/FoldedLineWriter;

    invoke-virtual {v15, v11}, Lezvcard/io/text/FoldedLineWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    goto :goto_186

    .line 414
    .end local v5    # "first":Z
    .end local v7    # "i$":Ljava/util/Iterator;
    .end local v9    # "parameter":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v10    # "parameterName":Ljava/lang/String;
    .end local v11    # "parameterValue":Ljava/lang/String;
    .end local v12    # "parameterValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_190
    move-object/from16 v0, p0

    iget-object v15, v0, Lezvcard/io/text/VCardRawWriter;->writer:Lezvcard/io/text/FoldedLineWriter;

    const/16 v16, 0x3a

    invoke-virtual/range {v15 .. v16}, Lezvcard/io/text/FoldedLineWriter;->append(C)Ljava/io/Writer;

    .line 415
    move-object/from16 v0, p0

    iget-object v15, v0, Lezvcard/io/text/VCardRawWriter;->writer:Lezvcard/io/text/FoldedLineWriter;

    move-object/from16 v0, p4

    invoke-virtual {v15, v0, v13, v3}, Lezvcard/io/text/FoldedLineWriter;->append(Ljava/lang/CharSequence;ZLjava/nio/charset/Charset;)Lezvcard/io/text/FoldedLineWriter;

    .line 416
    move-object/from16 v0, p0

    iget-object v15, v0, Lezvcard/io/text/VCardRawWriter;->writer:Lezvcard/io/text/FoldedLineWriter;

    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/text/VCardRawWriter;->writer:Lezvcard/io/text/FoldedLineWriter;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lezvcard/io/text/FoldedLineWriter;->getNewline()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Lezvcard/io/text/FoldedLineWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 417
    return-void
.end method

.method public writeVersion()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 301
    const-string v0, "VERSION"

    iget-object v1, p0, Lezvcard/io/text/VCardRawWriter;->version:Lezvcard/VCardVersion;

    invoke-virtual {v1}, Lezvcard/VCardVersion;->getVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lezvcard/io/text/VCardRawWriter;->writeProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 302
    return-void
.end method

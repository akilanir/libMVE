.class public Lch/qos/logback/core/pattern/parser/OptionTokenizer;
.super Ljava/lang/Object;


# static fields
.field private static final EXPECTING_STATE:I = 0x0

.field private static final QUOTED_COLLECTING_STATE:I = 0x2

.field private static final RAW_COLLECTING_STATE:I = 0x1


# instance fields
.field final escapeUtil:Lch/qos/logback/core/pattern/util/IEscapeUtil;

.field final pattern:Ljava/lang/String;

.field final patternLength:I

.field quoteChar:C

.field state:I

.field final tokenStream:Lch/qos/logback/core/pattern/parser/TokenStream;


# direct methods
.method constructor <init>(Lch/qos/logback/core/pattern/parser/TokenStream;)V
    .registers 3

    new-instance v0, Lch/qos/logback/core/pattern/util/AsIsEscapeUtil;

    invoke-direct {v0}, Lch/qos/logback/core/pattern/util/AsIsEscapeUtil;-><init>()V

    invoke-direct {p0, p1, v0}, Lch/qos/logback/core/pattern/parser/OptionTokenizer;-><init>(Lch/qos/logback/core/pattern/parser/TokenStream;Lch/qos/logback/core/pattern/util/IEscapeUtil;)V

    return-void
.end method

.method constructor <init>(Lch/qos/logback/core/pattern/parser/TokenStream;Lch/qos/logback/core/pattern/util/IEscapeUtil;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->state:I

    iput-object p1, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->tokenStream:Lch/qos/logback/core/pattern/parser/TokenStream;

    iget-object v0, p1, Lch/qos/logback/core/pattern/parser/TokenStream;->pattern:Ljava/lang/String;

    iput-object v0, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->pattern:Ljava/lang/String;

    iget v0, p1, Lch/qos/logback/core/pattern/parser/TokenStream;->patternLength:I

    iput v0, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->patternLength:I

    iput-object p2, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->escapeUtil:Lch/qos/logback/core/pattern/util/IEscapeUtil;

    return-void
.end method


# virtual methods
.method emitOptionToken(Ljava/util/List;Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/pattern/parser/Token;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    new-instance v0, Lch/qos/logback/core/pattern/parser/Token;

    const/16 v1, 0x3ee

    invoke-direct {v0, v1, p2}, Lch/qos/logback/core/pattern/parser/Token;-><init>(ILjava/lang/Object;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->tokenStream:Lch/qos/logback/core/pattern/parser/TokenStream;

    sget-object v1, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->LITERAL_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    iput-object v1, v0, Lch/qos/logback/core/pattern/parser/TokenStream;->state:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    return-void
.end method

.method escape(Ljava/lang/String;Ljava/lang/StringBuffer;)V
    .registers 7

    iget-object v0, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->tokenStream:Lch/qos/logback/core/pattern/parser/TokenStream;

    iget v0, v0, Lch/qos/logback/core/pattern/parser/TokenStream;->pointer:I

    iget v1, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->patternLength:I

    if-ge v0, v1, :cond_1f

    iget-object v0, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->pattern:Ljava/lang/String;

    iget-object v1, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->tokenStream:Lch/qos/logback/core/pattern/parser/TokenStream;

    iget v2, v1, Lch/qos/logback/core/pattern/parser/TokenStream;->pointer:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v1, Lch/qos/logback/core/pattern/parser/TokenStream;->pointer:I

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    iget-object v1, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->escapeUtil:Lch/qos/logback/core/pattern/util/IEscapeUtil;

    iget-object v2, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->tokenStream:Lch/qos/logback/core/pattern/parser/TokenStream;

    iget v2, v2, Lch/qos/logback/core/pattern/parser/TokenStream;->pointer:I

    invoke-interface {v1, p1, p2, v0, v2}, Lch/qos/logback/core/pattern/util/IEscapeUtil;->escape(Ljava/lang/String;Ljava/lang/StringBuffer;CI)V

    :cond_1f
    return-void
.end method

.method tokenize(CLjava/util/List;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(C",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/pattern/parser/Token;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/spi/ScanException;
        }
    .end annotation

    const/4 v5, 0x1

    const/4 v4, 0x0

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    :goto_c
    iget-object v2, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->tokenStream:Lch/qos/logback/core/pattern/parser/TokenStream;

    iget v2, v2, Lch/qos/logback/core/pattern/parser/TokenStream;->pointer:I

    iget v3, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->patternLength:I

    if-ge v2, v3, :cond_89

    iget v2, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->state:I

    packed-switch v2, :pswitch_data_b8

    :goto_19
    :sswitch_19
    iget-object v2, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->pattern:Ljava/lang/String;

    iget-object v3, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->tokenStream:Lch/qos/logback/core/pattern/parser/TokenStream;

    iget v3, v3, Lch/qos/logback/core/pattern/parser/TokenStream;->pointer:I

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result p1

    iget-object v2, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->tokenStream:Lch/qos/logback/core/pattern/parser/TokenStream;

    iget v3, v2, Lch/qos/logback/core/pattern/parser/TokenStream;->pointer:I

    add-int/lit8 v3, v3, 0x1

    iput v3, v2, Lch/qos/logback/core/pattern/parser/TokenStream;->pointer:I

    goto :goto_c

    :pswitch_2c
    sparse-switch p1, :sswitch_data_c2

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    iput v5, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->state:I

    goto :goto_19

    :sswitch_35
    const/4 v2, 0x2

    iput v2, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->state:I

    iput-char p1, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->quoteChar:C

    goto :goto_19

    :sswitch_3b
    invoke-virtual {p0, p2, v1}, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->emitOptionToken(Ljava/util/List;Ljava/util/List;)V

    :goto_3e
    return-void

    :pswitch_3f
    sparse-switch p1, :sswitch_data_e4

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_19

    :sswitch_46
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->setLength(I)V

    iput v4, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->state:I

    goto :goto_19

    :sswitch_57
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p2, v1}, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->emitOptionToken(Ljava/util/List;Ljava/util/List;)V

    goto :goto_3e

    :pswitch_66
    iget-char v2, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->quoteChar:C

    if-ne p1, v2, :cond_77

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->setLength(I)V

    iput v4, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->state:I

    goto :goto_19

    :cond_77
    const/16 v2, 0x5c

    if-ne p1, v2, :cond_85

    iget-char v2, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->quoteChar:C

    invoke-static {v2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v0}, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->escape(Ljava/lang/String;Ljava/lang/StringBuffer;)V

    goto :goto_19

    :cond_85
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_19

    :cond_89
    const/16 v2, 0x7d

    if-ne p1, v2, :cond_b0

    iget v2, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->state:I

    if-nez v2, :cond_95

    invoke-virtual {p0, p2, v1}, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->emitOptionToken(Ljava/util/List;Ljava/util/List;)V

    goto :goto_3e

    :cond_95
    iget v2, p0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->state:I

    if-ne v2, v5, :cond_a8

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p2, v1}, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->emitOptionToken(Ljava/util/List;Ljava/util/List;)V

    goto :goto_3e

    :cond_a8
    new-instance v0, Lch/qos/logback/core/spi/ScanException;

    const-string v1, "Unexpected end of pattern string in OptionTokenizer"

    invoke-direct {v0, v1}, Lch/qos/logback/core/spi/ScanException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_b0
    new-instance v0, Lch/qos/logback/core/spi/ScanException;

    const-string v1, "Unexpected end of pattern string in OptionTokenizer"

    invoke-direct {v0, v1}, Lch/qos/logback/core/spi/ScanException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_data_b8
    .packed-switch 0x0
        :pswitch_2c
        :pswitch_3f
        :pswitch_66
    .end packed-switch

    :sswitch_data_c2
    .sparse-switch
        0x9 -> :sswitch_19
        0xa -> :sswitch_19
        0xd -> :sswitch_19
        0x20 -> :sswitch_19
        0x22 -> :sswitch_35
        0x27 -> :sswitch_35
        0x2c -> :sswitch_19
        0x7d -> :sswitch_3b
    .end sparse-switch

    :sswitch_data_e4
    .sparse-switch
        0x2c -> :sswitch_46
        0x7d -> :sswitch_57
    .end sparse-switch
.end method

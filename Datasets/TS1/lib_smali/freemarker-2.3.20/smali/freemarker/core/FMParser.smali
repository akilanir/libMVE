.class public Lfreemarker/core/FMParser;
.super Ljava/lang/Object;
.source "FMParser.java"

# interfaces
.implements Lfreemarker/core/FMParserConstants;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/FMParser$1;,
        Lfreemarker/core/FMParser$JJCalls;,
        Lfreemarker/core/FMParser$LookaheadSuccess;
    }
.end annotation


# static fields
.field private static jj_la1_0:[I

.field private static jj_la1_1:[I

.field private static jj_la1_2:[I

.field private static jj_la1_3:[I

.field private static jj_la1_4:[I


# instance fields
.field private contentNesting:I

.field private escapes:Ljava/util/LinkedList;

.field private inFunction:Z

.field private inMacro:Z

.field private incompatibleImprovements:I

.field private final jj_2_rtns:[Lfreemarker/core/FMParser$JJCalls;

.field private jj_endpos:I

.field private jj_expentries:Ljava/util/Vector;

.field private jj_expentry:[I

.field private jj_gc:I

.field private jj_gen:I

.field jj_input_stream:Lfreemarker/core/SimpleCharStream;

.field private jj_kind:I

.field private jj_la:I

.field private final jj_la1:[I

.field private jj_lastpos:Lfreemarker/core/Token;

.field private jj_lasttokens:[I

.field private final jj_ls:Lfreemarker/core/FMParser$LookaheadSuccess;

.field public jj_nt:Lfreemarker/core/Token;

.field private jj_ntk:I

.field private jj_rescan:Z

.field private jj_scanpos:Lfreemarker/core/Token;

.field private jj_semLA:Z

.field public lookingAhead:Z

.field private loopNesting:I

.field private stripText:Z

.field private stripWhitespace:Z

.field private switchNesting:I

.field private template:Lfreemarker/template/Template;

.field public token:Lfreemarker/core/Token;

.field public token_source:Lfreemarker/core/FMParserTokenManager;


# direct methods
.method static constructor <clinit>()V
    .registers 0

    .prologue
    .line 4439
    invoke-static {}, Lfreemarker/core/FMParser;->jj_la1_0()V

    .line 4440
    invoke-static {}, Lfreemarker/core/FMParser;->jj_la1_1()V

    .line 4441
    invoke-static {}, Lfreemarker/core/FMParser;->jj_la1_2()V

    .line 4442
    invoke-static {}, Lfreemarker/core/FMParser;->jj_la1_3()V

    .line 4443
    invoke-static {}, Lfreemarker/core/FMParser;->jj_la1_4()V

    .line 4444
    return-void
.end method

.method public constructor <init>(Lfreemarker/core/FMParserTokenManager;)V
    .registers 8
    .param p1, "tm"    # Lfreemarker/core/FMParserTokenManager;

    .prologue
    const/16 v5, 0x53

    const/4 v4, -0x1

    const/4 v3, 0x0

    .line 4504
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lfreemarker/core/FMParser;->escapes:Ljava/util/LinkedList;

    .line 4429
    iput-boolean v3, p0, Lfreemarker/core/FMParser;->lookingAhead:Z

    .line 4432
    new-array v1, v5, [I

    iput-object v1, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    .line 4460
    const/16 v1, 0x11

    new-array v1, v1, [Lfreemarker/core/FMParser$JJCalls;

    iput-object v1, p0, Lfreemarker/core/FMParser;->jj_2_rtns:[Lfreemarker/core/FMParser$JJCalls;

    .line 4461
    iput-boolean v3, p0, Lfreemarker/core/FMParser;->jj_rescan:Z

    .line 4462
    iput v3, p0, Lfreemarker/core/FMParser;->jj_gc:I

    .line 4547
    new-instance v1, Lfreemarker/core/FMParser$LookaheadSuccess;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lfreemarker/core/FMParser$LookaheadSuccess;-><init>(Lfreemarker/core/FMParser$1;)V

    iput-object v1, p0, Lfreemarker/core/FMParser;->jj_ls:Lfreemarker/core/FMParser$LookaheadSuccess;

    .line 4593
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    iput-object v1, p0, Lfreemarker/core/FMParser;->jj_expentries:Ljava/util/Vector;

    .line 4595
    iput v4, p0, Lfreemarker/core/FMParser;->jj_kind:I

    .line 4596
    const/16 v1, 0x64

    new-array v1, v1, [I

    iput-object v1, p0, Lfreemarker/core/FMParser;->jj_lasttokens:[I

    .line 4505
    iput-object p1, p0, Lfreemarker/core/FMParser;->token_source:Lfreemarker/core/FMParserTokenManager;

    .line 4506
    new-instance v1, Lfreemarker/core/Token;

    invoke-direct {v1}, Lfreemarker/core/Token;-><init>()V

    iput-object v1, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    .line 4507
    iput v4, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    .line 4508
    iput v3, p0, Lfreemarker/core/FMParser;->jj_gen:I

    .line 4509
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_43
    if-ge v0, v5, :cond_4c

    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    aput v4, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_43

    .line 4510
    :cond_4c
    const/4 v0, 0x0

    :goto_4d
    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_2_rtns:[Lfreemarker/core/FMParser$JJCalls;

    array-length v1, v1

    if-ge v0, v1, :cond_5e

    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_2_rtns:[Lfreemarker/core/FMParser$JJCalls;

    new-instance v2, Lfreemarker/core/FMParser$JJCalls;

    invoke-direct {v2}, Lfreemarker/core/FMParser$JJCalls;-><init>()V

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_4d

    .line 4511
    :cond_5e
    return-void
.end method

.method public constructor <init>(Lfreemarker/template/Template;Ljava/io/Reader;ZZ)V
    .registers 6
    .param p1, "template"    # Lfreemarker/template/Template;
    .param p2, "reader"    # Ljava/io/Reader;
    .param p3, "strictEscapeSyntax"    # Z
    .param p4, "stripWhitespace"    # Z

    .prologue
    .line 44
    invoke-direct {p0, p2}, Lfreemarker/core/FMParser;-><init>(Ljava/io/Reader;)V

    .line 45
    invoke-virtual {p0, p1}, Lfreemarker/core/FMParser;->setTemplate(Lfreemarker/template/Template;)V

    .line 46
    iget-object v0, p0, Lfreemarker/core/FMParser;->token_source:Lfreemarker/core/FMParserTokenManager;

    invoke-virtual {v0, p0}, Lfreemarker/core/FMParserTokenManager;->setParser(Lfreemarker/core/FMParser;)V

    .line 47
    iget-object v0, p0, Lfreemarker/core/FMParser;->token_source:Lfreemarker/core/FMParserTokenManager;

    iput-boolean p3, v0, Lfreemarker/core/FMParserTokenManager;->strictEscapeSyntax:Z

    .line 48
    iput-boolean p4, p0, Lfreemarker/core/FMParser;->stripWhitespace:Z

    .line 49
    return-void
.end method

.method public constructor <init>(Lfreemarker/template/Template;Ljava/io/Reader;ZZI)V
    .registers 13
    .param p1, "template"    # Lfreemarker/template/Template;
    .param p2, "reader"    # Ljava/io/Reader;
    .param p3, "strictEscapeSyntax"    # Z
    .param p4, "stripWhitespace"    # Z
    .param p5, "tagSyntax"    # I

    .prologue
    .line 52
    sget v6, Lfreemarker/template/Configuration;->PARSED_DEFAULT_INCOMPATIBLE_ENHANCEMENTS:I

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v6}, Lfreemarker/core/FMParser;-><init>(Lfreemarker/template/Template;Ljava/io/Reader;ZZII)V

    .line 53
    return-void
.end method

.method public constructor <init>(Lfreemarker/template/Template;Ljava/io/Reader;ZZII)V
    .registers 9
    .param p1, "template"    # Lfreemarker/template/Template;
    .param p2, "reader"    # Ljava/io/Reader;
    .param p3, "strictEscapeSyntax"    # Z
    .param p4, "stripWhitespace"    # Z
    .param p5, "tagSyntax"    # I
    .param p6, "incompatibleImprovements"    # I

    .prologue
    const/4 v1, 0x1

    .line 56
    invoke-direct {p0, p1, p2, p3, p4}, Lfreemarker/core/FMParser;-><init>(Lfreemarker/template/Template;Ljava/io/Reader;ZZ)V

    .line 57
    packed-switch p5, :pswitch_data_26

    .line 67
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Illegal argument for tagSyntax"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 59
    :pswitch_f
    iget-object v0, p0, Lfreemarker/core/FMParser;->token_source:Lfreemarker/core/FMParserTokenManager;

    iput-boolean v1, v0, Lfreemarker/core/FMParserTokenManager;->autodetectTagSyntax:Z

    .line 69
    :goto_13
    iget-object v0, p0, Lfreemarker/core/FMParser;->token_source:Lfreemarker/core/FMParserTokenManager;

    iput p6, v0, Lfreemarker/core/FMParserTokenManager;->incompatibleImprovements:I

    .line 70
    iput p6, p0, Lfreemarker/core/FMParser;->incompatibleImprovements:I

    .line 71
    return-void

    .line 62
    :pswitch_1a
    iget-object v0, p0, Lfreemarker/core/FMParser;->token_source:Lfreemarker/core/FMParserTokenManager;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lfreemarker/core/FMParserTokenManager;->squBracTagSyntax:Z

    goto :goto_13

    .line 65
    :pswitch_20
    iget-object v0, p0, Lfreemarker/core/FMParser;->token_source:Lfreemarker/core/FMParserTokenManager;

    iput-boolean v1, v0, Lfreemarker/core/FMParserTokenManager;->squBracTagSyntax:Z

    goto :goto_13

    .line 57
    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_f
        :pswitch_1a
        :pswitch_20
    .end packed-switch
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 9
    .param p1, "stream"    # Ljava/io/InputStream;

    .prologue
    const/16 v6, 0x53

    const/4 v5, 0x1

    const/4 v4, -0x1

    const/4 v3, 0x0

    .line 4464
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lfreemarker/core/FMParser;->escapes:Ljava/util/LinkedList;

    .line 4429
    iput-boolean v3, p0, Lfreemarker/core/FMParser;->lookingAhead:Z

    .line 4432
    new-array v1, v6, [I

    iput-object v1, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    .line 4460
    const/16 v1, 0x11

    new-array v1, v1, [Lfreemarker/core/FMParser$JJCalls;

    iput-object v1, p0, Lfreemarker/core/FMParser;->jj_2_rtns:[Lfreemarker/core/FMParser$JJCalls;

    .line 4461
    iput-boolean v3, p0, Lfreemarker/core/FMParser;->jj_rescan:Z

    .line 4462
    iput v3, p0, Lfreemarker/core/FMParser;->jj_gc:I

    .line 4547
    new-instance v1, Lfreemarker/core/FMParser$LookaheadSuccess;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lfreemarker/core/FMParser$LookaheadSuccess;-><init>(Lfreemarker/core/FMParser$1;)V

    iput-object v1, p0, Lfreemarker/core/FMParser;->jj_ls:Lfreemarker/core/FMParser$LookaheadSuccess;

    .line 4593
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    iput-object v1, p0, Lfreemarker/core/FMParser;->jj_expentries:Ljava/util/Vector;

    .line 4595
    iput v4, p0, Lfreemarker/core/FMParser;->jj_kind:I

    .line 4596
    const/16 v1, 0x64

    new-array v1, v1, [I

    iput-object v1, p0, Lfreemarker/core/FMParser;->jj_lasttokens:[I

    .line 4465
    new-instance v1, Lfreemarker/core/SimpleCharStream;

    invoke-direct {v1, p1, v5, v5}, Lfreemarker/core/SimpleCharStream;-><init>(Ljava/io/InputStream;II)V

    iput-object v1, p0, Lfreemarker/core/FMParser;->jj_input_stream:Lfreemarker/core/SimpleCharStream;

    .line 4466
    new-instance v1, Lfreemarker/core/FMParserTokenManager;

    iget-object v2, p0, Lfreemarker/core/FMParser;->jj_input_stream:Lfreemarker/core/SimpleCharStream;

    invoke-direct {v1, v2}, Lfreemarker/core/FMParserTokenManager;-><init>(Lfreemarker/core/SimpleCharStream;)V

    iput-object v1, p0, Lfreemarker/core/FMParser;->token_source:Lfreemarker/core/FMParserTokenManager;

    .line 4467
    new-instance v1, Lfreemarker/core/Token;

    invoke-direct {v1}, Lfreemarker/core/Token;-><init>()V

    iput-object v1, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    .line 4468
    iput v4, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    .line 4469
    iput v3, p0, Lfreemarker/core/FMParser;->jj_gen:I

    .line 4470
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_52
    if-ge v0, v6, :cond_5b

    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    aput v4, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_52

    .line 4471
    :cond_5b
    const/4 v0, 0x0

    :goto_5c
    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_2_rtns:[Lfreemarker/core/FMParser$JJCalls;

    array-length v1, v1

    if-ge v0, v1, :cond_6d

    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_2_rtns:[Lfreemarker/core/FMParser$JJCalls;

    new-instance v2, Lfreemarker/core/FMParser$JJCalls;

    invoke-direct {v2}, Lfreemarker/core/FMParser$JJCalls;-><init>()V

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_5c

    .line 4472
    :cond_6d
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .registers 9
    .param p1, "stream"    # Ljava/io/Reader;

    .prologue
    const/16 v6, 0x53

    const/4 v5, 0x1

    const/4 v4, -0x1

    const/4 v3, 0x0

    .line 4484
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lfreemarker/core/FMParser;->escapes:Ljava/util/LinkedList;

    .line 4429
    iput-boolean v3, p0, Lfreemarker/core/FMParser;->lookingAhead:Z

    .line 4432
    new-array v1, v6, [I

    iput-object v1, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    .line 4460
    const/16 v1, 0x11

    new-array v1, v1, [Lfreemarker/core/FMParser$JJCalls;

    iput-object v1, p0, Lfreemarker/core/FMParser;->jj_2_rtns:[Lfreemarker/core/FMParser$JJCalls;

    .line 4461
    iput-boolean v3, p0, Lfreemarker/core/FMParser;->jj_rescan:Z

    .line 4462
    iput v3, p0, Lfreemarker/core/FMParser;->jj_gc:I

    .line 4547
    new-instance v1, Lfreemarker/core/FMParser$LookaheadSuccess;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lfreemarker/core/FMParser$LookaheadSuccess;-><init>(Lfreemarker/core/FMParser$1;)V

    iput-object v1, p0, Lfreemarker/core/FMParser;->jj_ls:Lfreemarker/core/FMParser$LookaheadSuccess;

    .line 4593
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    iput-object v1, p0, Lfreemarker/core/FMParser;->jj_expentries:Ljava/util/Vector;

    .line 4595
    iput v4, p0, Lfreemarker/core/FMParser;->jj_kind:I

    .line 4596
    const/16 v1, 0x64

    new-array v1, v1, [I

    iput-object v1, p0, Lfreemarker/core/FMParser;->jj_lasttokens:[I

    .line 4485
    new-instance v1, Lfreemarker/core/SimpleCharStream;

    invoke-direct {v1, p1, v5, v5}, Lfreemarker/core/SimpleCharStream;-><init>(Ljava/io/Reader;II)V

    iput-object v1, p0, Lfreemarker/core/FMParser;->jj_input_stream:Lfreemarker/core/SimpleCharStream;

    .line 4486
    new-instance v1, Lfreemarker/core/FMParserTokenManager;

    iget-object v2, p0, Lfreemarker/core/FMParser;->jj_input_stream:Lfreemarker/core/SimpleCharStream;

    invoke-direct {v1, v2}, Lfreemarker/core/FMParserTokenManager;-><init>(Lfreemarker/core/SimpleCharStream;)V

    iput-object v1, p0, Lfreemarker/core/FMParser;->token_source:Lfreemarker/core/FMParserTokenManager;

    .line 4487
    new-instance v1, Lfreemarker/core/Token;

    invoke-direct {v1}, Lfreemarker/core/Token;-><init>()V

    iput-object v1, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    .line 4488
    iput v4, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    .line 4489
    iput v3, p0, Lfreemarker/core/FMParser;->jj_gen:I

    .line 4490
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_52
    if-ge v0, v6, :cond_5b

    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    aput v4, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_52

    .line 4491
    :cond_5b
    const/4 v0, 0x0

    :goto_5c
    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_2_rtns:[Lfreemarker/core/FMParser$JJCalls;

    array-length v1, v1

    if-ge v0, v1, :cond_6d

    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_2_rtns:[Lfreemarker/core/FMParser$JJCalls;

    new-instance v2, Lfreemarker/core/FMParser$JJCalls;

    invoke-direct {v2}, Lfreemarker/core/FMParser$JJCalls;-><init>()V

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_5c

    .line 4492
    :cond_6d
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 5
    .param p1, "template"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 74
    const/4 v0, 0x0

    new-instance v1, Ljava/io/StringReader;

    invoke-direct {v1, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, v1, v2, v2}, Lfreemarker/core/FMParser;-><init>(Lfreemarker/template/Template;Ljava/io/Reader;ZZ)V

    .line 75
    return-void
.end method

.method private booleanLiteralOnly(Lfreemarker/core/Expression;)V
    .registers 3
    .param p1, "exp"    # Lfreemarker/core/Expression;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 184
    const-string v0, "boolean (true/false)"

    invoke-direct {p0, p1, v0}, Lfreemarker/core/FMParser;->notStringLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 185
    const-string v0, "boolean (true/false)"

    invoke-direct {p0, p1, v0}, Lfreemarker/core/FMParser;->notListLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 186
    const-string v0, "boolean (true/false)"

    invoke-direct {p0, p1, v0}, Lfreemarker/core/FMParser;->notHashLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 187
    const-string v0, "boolean (true/false)"

    invoke-direct {p0, p1, v0}, Lfreemarker/core/FMParser;->notNumberLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 188
    return-void
.end method

.method public static createExpressionParser(Ljava/lang/String;)Lfreemarker/core/FMParser;
    .registers 7
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    .line 29
    new-instance v1, Lfreemarker/core/SimpleCharStream;

    new-instance v3, Ljava/io/StringReader;

    invoke-direct {v3, p0}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    invoke-direct {v1, v3, v5, v5, v4}, Lfreemarker/core/SimpleCharStream;-><init>(Ljava/io/Reader;III)V

    .line 30
    .local v1, "scs":Lfreemarker/core/SimpleCharStream;
    new-instance v2, Lfreemarker/core/FMParserTokenManager;

    invoke-direct {v2, v1}, Lfreemarker/core/FMParserTokenManager;-><init>(Lfreemarker/core/SimpleCharStream;)V

    .line 31
    .local v2, "token_source":Lfreemarker/core/FMParserTokenManager;
    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Lfreemarker/core/FMParserTokenManager;->SwitchTo(I)V

    .line 32
    new-instance v0, Lfreemarker/core/FMParser;

    invoke-direct {v0, v2}, Lfreemarker/core/FMParser;-><init>(Lfreemarker/core/FMParserTokenManager;)V

    .line 33
    .local v0, "parser":Lfreemarker/core/FMParser;
    invoke-virtual {v2, v0}, Lfreemarker/core/FMParserTokenManager;->setParser(Lfreemarker/core/FMParser;)V

    .line 34
    return-object v0
.end method

.method private escapedExpression(Lfreemarker/core/Expression;)Lfreemarker/core/Expression;
    .registers 3
    .param p1, "exp"    # Lfreemarker/core/Expression;

    .prologue
    .line 191
    iget-object v0, p0, Lfreemarker/core/FMParser;->escapes:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_14

    .line 192
    iget-object v0, p0, Lfreemarker/core/FMParser;->escapes:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/core/EscapeBlock;

    invoke-virtual {v0, p1}, Lfreemarker/core/EscapeBlock;->doEscape(Lfreemarker/core/Expression;)Lfreemarker/core/Expression;

    move-result-object p1

    .line 194
    .end local p1    # "exp":Lfreemarker/core/Expression;
    :cond_14
    return-object p1
.end method

.method private getBoolean(Lfreemarker/core/Expression;)Z
    .registers 8
    .param p1, "exp"    # Lfreemarker/core/Expression;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 199
    const/4 v2, 0x0

    .line 201
    .local v2, "tm":Lfreemarker/template/TemplateModel;
    const/4 v3, 0x0

    :try_start_2
    invoke-virtual {p1, v3}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_5} :catch_13

    move-result-object v2

    .line 209
    instance-of v3, v2, Lfreemarker/template/TemplateBooleanModel;

    if-eqz v3, :cond_3a

    .line 211
    :try_start_a
    move-object v0, v2

    check-cast v0, Lfreemarker/template/TemplateBooleanModel;

    move-object v3, v0

    invoke-interface {v3}, Lfreemarker/template/TemplateBooleanModel;->getAsBoolean()Z
    :try_end_11
    .catch Lfreemarker/template/TemplateModelException; {:try_start_a .. :try_end_11} :catch_39

    move-result v3

    .line 217
    .end local v2    # "tm":Lfreemarker/template/TemplateModel;
    :goto_12
    return v3

    .line 202
    .restart local v2    # "tm":Lfreemarker/template/TemplateModel;
    :catch_13
    move-exception v1

    .line 203
    .local v1, "e":Ljava/lang/Exception;
    new-instance v3, Lfreemarker/core/ParseException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\nCould not evaluate expression: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, p1, v1}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/core/TemplateObject;Ljava/lang/Throwable;)V

    throw v3

    .line 212
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_39
    move-exception v3

    .line 215
    :cond_3a
    instance-of v3, v2, Lfreemarker/template/TemplateScalarModel;

    if-eqz v3, :cond_6f

    .line 217
    :try_start_3e
    check-cast v2, Lfreemarker/template/TemplateScalarModel;

    .end local v2    # "tm":Lfreemarker/template/TemplateModel;
    invoke-interface {v2}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lfreemarker/template/utility/StringUtil;->getYesNo(Ljava/lang/String;)Z
    :try_end_47
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_47} :catch_49

    move-result v3

    goto :goto_12

    .line 218
    :catch_49
    move-exception v1

    .line 219
    .restart local v1    # "e":Ljava/lang/Exception;
    new-instance v3, Lfreemarker/core/ParseException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\nExpecting boolean (true/false), found: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, p1}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/core/TemplateObject;)V

    throw v3

    .line 224
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v2    # "tm":Lfreemarker/template/TemplateModel;
    :cond_6f
    new-instance v3, Lfreemarker/core/ParseException;

    const-string v4, "Expecting boolean (true/false) parameter"

    invoke-direct {v3, v4, p1}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/core/TemplateObject;)V

    throw v3
.end method

.method private final jj_2_1(I)Z
    .registers 6
    .param p1, "xla"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 2941
    iput p1, p0, Lfreemarker/core/FMParser;->jj_la:I

    iget-object v3, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    iput-object v3, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iput-object v3, p0, Lfreemarker/core/FMParser;->jj_lastpos:Lfreemarker/core/Token;

    .line 2942
    :try_start_a
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_1()Z
    :try_end_d
    .catch Lfreemarker/core/FMParser$LookaheadSuccess; {:try_start_a .. :try_end_d} :catch_16
    .catchall {:try_start_a .. :try_end_d} :catchall_1b

    move-result v3

    if-nez v3, :cond_14

    .line 2944
    :goto_10
    invoke-direct {p0, v2, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    :goto_13
    return v1

    :cond_14
    move v1, v2

    .line 2942
    goto :goto_10

    .line 2943
    :catch_16
    move-exception v0

    .line 2944
    .local v0, "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    invoke-direct {p0, v2, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    goto :goto_13

    .end local v0    # "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    :catchall_1b
    move-exception v1

    invoke-direct {p0, v2, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    throw v1
.end method

.method private final jj_2_10(I)Z
    .registers 6
    .param p1, "xla"    # I

    .prologue
    const/4 v1, 0x1

    const/16 v3, 0x9

    .line 3004
    iput p1, p0, Lfreemarker/core/FMParser;->jj_la:I

    iget-object v2, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_lastpos:Lfreemarker/core/Token;

    .line 3005
    :try_start_b
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_10()Z
    :try_end_e
    .catch Lfreemarker/core/FMParser$LookaheadSuccess; {:try_start_b .. :try_end_e} :catch_17
    .catchall {:try_start_b .. :try_end_e} :catchall_1c

    move-result v2

    if-nez v2, :cond_15

    .line 3007
    :goto_11
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    :goto_14
    return v1

    .line 3005
    :cond_15
    const/4 v1, 0x0

    goto :goto_11

    .line 3006
    :catch_17
    move-exception v0

    .line 3007
    .local v0, "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    goto :goto_14

    .end local v0    # "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    :catchall_1c
    move-exception v1

    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    throw v1
.end method

.method private final jj_2_11(I)Z
    .registers 6
    .param p1, "xla"    # I

    .prologue
    const/4 v1, 0x1

    const/16 v3, 0xa

    .line 3011
    iput p1, p0, Lfreemarker/core/FMParser;->jj_la:I

    iget-object v2, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_lastpos:Lfreemarker/core/Token;

    .line 3012
    :try_start_b
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_11()Z
    :try_end_e
    .catch Lfreemarker/core/FMParser$LookaheadSuccess; {:try_start_b .. :try_end_e} :catch_17
    .catchall {:try_start_b .. :try_end_e} :catchall_1c

    move-result v2

    if-nez v2, :cond_15

    .line 3014
    :goto_11
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    :goto_14
    return v1

    .line 3012
    :cond_15
    const/4 v1, 0x0

    goto :goto_11

    .line 3013
    :catch_17
    move-exception v0

    .line 3014
    .local v0, "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    goto :goto_14

    .end local v0    # "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    :catchall_1c
    move-exception v1

    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    throw v1
.end method

.method private final jj_2_12(I)Z
    .registers 6
    .param p1, "xla"    # I

    .prologue
    const/4 v1, 0x1

    const/16 v3, 0xb

    .line 3018
    iput p1, p0, Lfreemarker/core/FMParser;->jj_la:I

    iget-object v2, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_lastpos:Lfreemarker/core/Token;

    .line 3019
    :try_start_b
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_12()Z
    :try_end_e
    .catch Lfreemarker/core/FMParser$LookaheadSuccess; {:try_start_b .. :try_end_e} :catch_17
    .catchall {:try_start_b .. :try_end_e} :catchall_1c

    move-result v2

    if-nez v2, :cond_15

    .line 3021
    :goto_11
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    :goto_14
    return v1

    .line 3019
    :cond_15
    const/4 v1, 0x0

    goto :goto_11

    .line 3020
    :catch_17
    move-exception v0

    .line 3021
    .local v0, "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    goto :goto_14

    .end local v0    # "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    :catchall_1c
    move-exception v1

    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    throw v1
.end method

.method private final jj_2_13(I)Z
    .registers 6
    .param p1, "xla"    # I

    .prologue
    const/4 v1, 0x1

    const/16 v3, 0xc

    .line 3025
    iput p1, p0, Lfreemarker/core/FMParser;->jj_la:I

    iget-object v2, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_lastpos:Lfreemarker/core/Token;

    .line 3026
    :try_start_b
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_13()Z
    :try_end_e
    .catch Lfreemarker/core/FMParser$LookaheadSuccess; {:try_start_b .. :try_end_e} :catch_17
    .catchall {:try_start_b .. :try_end_e} :catchall_1c

    move-result v2

    if-nez v2, :cond_15

    .line 3028
    :goto_11
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    :goto_14
    return v1

    .line 3026
    :cond_15
    const/4 v1, 0x0

    goto :goto_11

    .line 3027
    :catch_17
    move-exception v0

    .line 3028
    .local v0, "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    goto :goto_14

    .end local v0    # "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    :catchall_1c
    move-exception v1

    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    throw v1
.end method

.method private final jj_2_14(I)Z
    .registers 6
    .param p1, "xla"    # I

    .prologue
    const/4 v1, 0x1

    const/16 v3, 0xd

    .line 3032
    iput p1, p0, Lfreemarker/core/FMParser;->jj_la:I

    iget-object v2, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_lastpos:Lfreemarker/core/Token;

    .line 3033
    :try_start_b
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_14()Z
    :try_end_e
    .catch Lfreemarker/core/FMParser$LookaheadSuccess; {:try_start_b .. :try_end_e} :catch_17
    .catchall {:try_start_b .. :try_end_e} :catchall_1c

    move-result v2

    if-nez v2, :cond_15

    .line 3035
    :goto_11
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    :goto_14
    return v1

    .line 3033
    :cond_15
    const/4 v1, 0x0

    goto :goto_11

    .line 3034
    :catch_17
    move-exception v0

    .line 3035
    .local v0, "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    goto :goto_14

    .end local v0    # "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    :catchall_1c
    move-exception v1

    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    throw v1
.end method

.method private final jj_2_15(I)Z
    .registers 6
    .param p1, "xla"    # I

    .prologue
    const/4 v1, 0x1

    const/16 v3, 0xe

    .line 3039
    iput p1, p0, Lfreemarker/core/FMParser;->jj_la:I

    iget-object v2, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_lastpos:Lfreemarker/core/Token;

    .line 3040
    :try_start_b
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_15()Z
    :try_end_e
    .catch Lfreemarker/core/FMParser$LookaheadSuccess; {:try_start_b .. :try_end_e} :catch_17
    .catchall {:try_start_b .. :try_end_e} :catchall_1c

    move-result v2

    if-nez v2, :cond_15

    .line 3042
    :goto_11
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    :goto_14
    return v1

    .line 3040
    :cond_15
    const/4 v1, 0x0

    goto :goto_11

    .line 3041
    :catch_17
    move-exception v0

    .line 3042
    .local v0, "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    goto :goto_14

    .end local v0    # "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    :catchall_1c
    move-exception v1

    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    throw v1
.end method

.method private final jj_2_16(I)Z
    .registers 6
    .param p1, "xla"    # I

    .prologue
    const/4 v1, 0x1

    const/16 v3, 0xf

    .line 3046
    iput p1, p0, Lfreemarker/core/FMParser;->jj_la:I

    iget-object v2, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_lastpos:Lfreemarker/core/Token;

    .line 3047
    :try_start_b
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_16()Z
    :try_end_e
    .catch Lfreemarker/core/FMParser$LookaheadSuccess; {:try_start_b .. :try_end_e} :catch_17
    .catchall {:try_start_b .. :try_end_e} :catchall_1c

    move-result v2

    if-nez v2, :cond_15

    .line 3049
    :goto_11
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    :goto_14
    return v1

    .line 3047
    :cond_15
    const/4 v1, 0x0

    goto :goto_11

    .line 3048
    :catch_17
    move-exception v0

    .line 3049
    .local v0, "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    goto :goto_14

    .end local v0    # "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    :catchall_1c
    move-exception v1

    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    throw v1
.end method

.method private final jj_2_17(I)Z
    .registers 6
    .param p1, "xla"    # I

    .prologue
    const/4 v1, 0x1

    const/16 v3, 0x10

    .line 3053
    iput p1, p0, Lfreemarker/core/FMParser;->jj_la:I

    iget-object v2, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_lastpos:Lfreemarker/core/Token;

    .line 3054
    :try_start_b
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_17()Z
    :try_end_e
    .catch Lfreemarker/core/FMParser$LookaheadSuccess; {:try_start_b .. :try_end_e} :catch_17
    .catchall {:try_start_b .. :try_end_e} :catchall_1c

    move-result v2

    if-nez v2, :cond_15

    .line 3056
    :goto_11
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    :goto_14
    return v1

    .line 3054
    :cond_15
    const/4 v1, 0x0

    goto :goto_11

    .line 3055
    :catch_17
    move-exception v0

    .line 3056
    .local v0, "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    goto :goto_14

    .end local v0    # "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    :catchall_1c
    move-exception v1

    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    throw v1
.end method

.method private final jj_2_2(I)Z
    .registers 5
    .param p1, "xla"    # I

    .prologue
    const/4 v2, 0x1

    .line 2948
    iput p1, p0, Lfreemarker/core/FMParser;->jj_la:I

    iget-object v1, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    iput-object v1, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iput-object v1, p0, Lfreemarker/core/FMParser;->jj_lastpos:Lfreemarker/core/Token;

    .line 2949
    :try_start_9
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_2()Z
    :try_end_c
    .catch Lfreemarker/core/FMParser$LookaheadSuccess; {:try_start_9 .. :try_end_c} :catch_16
    .catchall {:try_start_9 .. :try_end_c} :catchall_1c

    move-result v1

    if-nez v1, :cond_14

    move v1, v2

    .line 2951
    :goto_10
    invoke-direct {p0, v2, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    :goto_13
    return v1

    .line 2949
    :cond_14
    const/4 v1, 0x0

    goto :goto_10

    .line 2950
    :catch_16
    move-exception v0

    .line 2951
    .local v0, "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    invoke-direct {p0, v2, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    move v1, v2

    goto :goto_13

    .end local v0    # "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    :catchall_1c
    move-exception v1

    invoke-direct {p0, v2, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    throw v1
.end method

.method private final jj_2_3(I)Z
    .registers 6
    .param p1, "xla"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v3, 0x2

    .line 2955
    iput p1, p0, Lfreemarker/core/FMParser;->jj_la:I

    iget-object v2, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_lastpos:Lfreemarker/core/Token;

    .line 2956
    :try_start_a
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_3()Z
    :try_end_d
    .catch Lfreemarker/core/FMParser$LookaheadSuccess; {:try_start_a .. :try_end_d} :catch_16
    .catchall {:try_start_a .. :try_end_d} :catchall_1b

    move-result v2

    if-nez v2, :cond_14

    .line 2958
    :goto_10
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    :goto_13
    return v1

    .line 2956
    :cond_14
    const/4 v1, 0x0

    goto :goto_10

    .line 2957
    :catch_16
    move-exception v0

    .line 2958
    .local v0, "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    goto :goto_13

    .end local v0    # "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    :catchall_1b
    move-exception v1

    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    throw v1
.end method

.method private final jj_2_4(I)Z
    .registers 6
    .param p1, "xla"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v3, 0x3

    .line 2962
    iput p1, p0, Lfreemarker/core/FMParser;->jj_la:I

    iget-object v2, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_lastpos:Lfreemarker/core/Token;

    .line 2963
    :try_start_a
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_4()Z
    :try_end_d
    .catch Lfreemarker/core/FMParser$LookaheadSuccess; {:try_start_a .. :try_end_d} :catch_16
    .catchall {:try_start_a .. :try_end_d} :catchall_1b

    move-result v2

    if-nez v2, :cond_14

    .line 2965
    :goto_10
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    :goto_13
    return v1

    .line 2963
    :cond_14
    const/4 v1, 0x0

    goto :goto_10

    .line 2964
    :catch_16
    move-exception v0

    .line 2965
    .local v0, "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    goto :goto_13

    .end local v0    # "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    :catchall_1b
    move-exception v1

    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    throw v1
.end method

.method private final jj_2_5(I)Z
    .registers 6
    .param p1, "xla"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v3, 0x4

    .line 2969
    iput p1, p0, Lfreemarker/core/FMParser;->jj_la:I

    iget-object v2, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_lastpos:Lfreemarker/core/Token;

    .line 2970
    :try_start_a
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_5()Z
    :try_end_d
    .catch Lfreemarker/core/FMParser$LookaheadSuccess; {:try_start_a .. :try_end_d} :catch_16
    .catchall {:try_start_a .. :try_end_d} :catchall_1b

    move-result v2

    if-nez v2, :cond_14

    .line 2972
    :goto_10
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    :goto_13
    return v1

    .line 2970
    :cond_14
    const/4 v1, 0x0

    goto :goto_10

    .line 2971
    :catch_16
    move-exception v0

    .line 2972
    .local v0, "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    goto :goto_13

    .end local v0    # "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    :catchall_1b
    move-exception v1

    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    throw v1
.end method

.method private final jj_2_6(I)Z
    .registers 6
    .param p1, "xla"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v3, 0x5

    .line 2976
    iput p1, p0, Lfreemarker/core/FMParser;->jj_la:I

    iget-object v2, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_lastpos:Lfreemarker/core/Token;

    .line 2977
    :try_start_a
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_6()Z
    :try_end_d
    .catch Lfreemarker/core/FMParser$LookaheadSuccess; {:try_start_a .. :try_end_d} :catch_16
    .catchall {:try_start_a .. :try_end_d} :catchall_1b

    move-result v2

    if-nez v2, :cond_14

    .line 2979
    :goto_10
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    :goto_13
    return v1

    .line 2977
    :cond_14
    const/4 v1, 0x0

    goto :goto_10

    .line 2978
    :catch_16
    move-exception v0

    .line 2979
    .local v0, "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    goto :goto_13

    .end local v0    # "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    :catchall_1b
    move-exception v1

    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    throw v1
.end method

.method private final jj_2_7(I)Z
    .registers 6
    .param p1, "xla"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v3, 0x6

    .line 2983
    iput p1, p0, Lfreemarker/core/FMParser;->jj_la:I

    iget-object v2, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_lastpos:Lfreemarker/core/Token;

    .line 2984
    :try_start_a
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_7()Z
    :try_end_d
    .catch Lfreemarker/core/FMParser$LookaheadSuccess; {:try_start_a .. :try_end_d} :catch_16
    .catchall {:try_start_a .. :try_end_d} :catchall_1b

    move-result v2

    if-nez v2, :cond_14

    .line 2986
    :goto_10
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    :goto_13
    return v1

    .line 2984
    :cond_14
    const/4 v1, 0x0

    goto :goto_10

    .line 2985
    :catch_16
    move-exception v0

    .line 2986
    .local v0, "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    goto :goto_13

    .end local v0    # "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    :catchall_1b
    move-exception v1

    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    throw v1
.end method

.method private final jj_2_8(I)Z
    .registers 6
    .param p1, "xla"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v3, 0x7

    .line 2990
    iput p1, p0, Lfreemarker/core/FMParser;->jj_la:I

    iget-object v2, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_lastpos:Lfreemarker/core/Token;

    .line 2991
    :try_start_a
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_8()Z
    :try_end_d
    .catch Lfreemarker/core/FMParser$LookaheadSuccess; {:try_start_a .. :try_end_d} :catch_16
    .catchall {:try_start_a .. :try_end_d} :catchall_1b

    move-result v2

    if-nez v2, :cond_14

    .line 2993
    :goto_10
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    :goto_13
    return v1

    .line 2991
    :cond_14
    const/4 v1, 0x0

    goto :goto_10

    .line 2992
    :catch_16
    move-exception v0

    .line 2993
    .local v0, "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    goto :goto_13

    .end local v0    # "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    :catchall_1b
    move-exception v1

    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    throw v1
.end method

.method private final jj_2_9(I)Z
    .registers 6
    .param p1, "xla"    # I

    .prologue
    const/4 v1, 0x1

    const/16 v3, 0x8

    .line 2997
    iput p1, p0, Lfreemarker/core/FMParser;->jj_la:I

    iget-object v2, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_lastpos:Lfreemarker/core/Token;

    .line 2998
    :try_start_b
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_9()Z
    :try_end_e
    .catch Lfreemarker/core/FMParser$LookaheadSuccess; {:try_start_b .. :try_end_e} :catch_17
    .catchall {:try_start_b .. :try_end_e} :catchall_1c

    move-result v2

    if-nez v2, :cond_15

    .line 3000
    :goto_11
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    :goto_14
    return v1

    .line 2998
    :cond_15
    const/4 v1, 0x0

    goto :goto_11

    .line 2999
    :catch_17
    move-exception v0

    .line 3000
    .local v0, "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    goto :goto_14

    .end local v0    # "ls":Lfreemarker/core/FMParser$LookaheadSuccess;
    :catchall_1c
    move-exception v1

    invoke-direct {p0, v3, p1}, Lfreemarker/core/FMParser;->jj_save(II)V

    throw v1
.end method

.method private final jj_3R_100()Z
    .registers 2

    .prologue
    .line 4279
    const/16 v0, 0x1a

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 4280
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_101()Z
    .registers 2

    .prologue
    .line 4097
    const/16 v0, 0x2d

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 4098
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_102()Z
    .registers 3

    .prologue
    .line 3980
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3981
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_123()Z

    move-result v1

    if-eqz v1, :cond_12

    .line 3982
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3983
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_124()Z

    move-result v1

    if-eqz v1, :cond_12

    const/4 v1, 0x1

    .line 3985
    :goto_11
    return v1

    :cond_12
    const/4 v1, 0x0

    goto :goto_11
.end method

.method private final jj_3R_103()Z
    .registers 3

    .prologue
    .line 3828
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3829
    .local v0, "xsp":Lfreemarker/core/Token;
    const/16 v1, 0x2f

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 3830
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3831
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_125()Z

    move-result v1

    if-eqz v1, :cond_14

    const/4 v1, 0x1

    .line 3833
    :goto_13
    return v1

    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method

.method private final jj_3R_104()Z
    .registers 2

    .prologue
    .line 3680
    const/16 v0, 0x30

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3681
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_105()Z
    .registers 3

    .prologue
    .line 3617
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3618
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_126()Z

    move-result v1

    if-eqz v1, :cond_22

    .line 3619
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3620
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_127()Z

    move-result v1

    if-eqz v1, :cond_22

    .line 3621
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3622
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_128()Z

    move-result v1

    if-eqz v1, :cond_22

    .line 3623
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3624
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_129()Z

    move-result v1

    if-eqz v1, :cond_22

    const/4 v1, 0x1

    .line 3628
    :goto_21
    return v1

    :cond_22
    const/4 v1, 0x0

    goto :goto_21
.end method

.method private final jj_3R_106()Z
    .registers 3

    .prologue
    .line 3757
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3758
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_130()Z

    move-result v1

    if-eqz v1, :cond_12

    .line 3759
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3760
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_131()Z

    move-result v1

    if-eqz v1, :cond_12

    const/4 v1, 0x1

    .line 3762
    :goto_11
    return v1

    :cond_12
    const/4 v1, 0x0

    goto :goto_11
.end method

.method private final jj_3R_107()Z
    .registers 2

    .prologue
    .line 3112
    const/16 v0, 0x3b

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3113
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_108()Z
    .registers 2

    .prologue
    .line 4383
    const/16 v0, 0x3d

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 4384
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_109()Z
    .registers 2

    .prologue
    .line 4378
    const/16 v0, 0x16

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 4379
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_110()Z
    .registers 3

    .prologue
    .line 4317
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4318
    .local v0, "xsp":Lfreemarker/core/Token;
    const/16 v1, 0x38

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 4319
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4320
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_132()Z

    move-result v1

    if-eqz v1, :cond_14

    const/4 v1, 0x1

    .line 4322
    :goto_13
    return v1

    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method

.method private final jj_3R_111()Z
    .registers 2

    .prologue
    .line 4253
    const/16 v0, 0x3a

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 4254
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_112()Z
    .registers 2

    .prologue
    .line 3253
    const/4 v0, 0x6

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_9

    const/4 v0, 0x1

    .line 3254
    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method private final jj_3R_113()Z
    .registers 2

    .prologue
    .line 3325
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_133()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3326
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_114()Z
    .registers 2

    .prologue
    .line 3320
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_134()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3321
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_115()Z
    .registers 2

    .prologue
    .line 3315
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_135()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3316
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_116()Z
    .registers 2

    .prologue
    .line 4349
    const/16 v0, 0x64

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 4350
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_117()Z
    .registers 2

    .prologue
    .line 4344
    const/16 v0, 0x67

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 4345
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_118()Z
    .registers 2

    .prologue
    .line 4339
    const/16 v0, 0x68

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 4340
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_119()Z
    .registers 2

    .prologue
    .line 3456
    const/16 v0, 0xe

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3457
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_120()Z
    .registers 2

    .prologue
    .line 3441
    const/16 v0, 0xf

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3442
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_121()Z
    .registers 2

    .prologue
    .line 3431
    const/16 v0, 0x10

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3432
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_122()Z
    .registers 2

    .prologue
    .line 4388
    const/16 v0, 0x13

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 4389
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_123()Z
    .registers 2

    .prologue
    .line 3964
    const/16 v0, 0x2e

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3965
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_124()Z
    .registers 2

    .prologue
    .line 3944
    const/16 v0, 0x18

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3945
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_125()Z
    .registers 2

    .prologue
    .line 3817
    const/16 v0, 0x17

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3818
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_126()Z
    .registers 2

    .prologue
    .line 3611
    const/16 v0, 0x31

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3612
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_127()Z
    .registers 2

    .prologue
    .line 3601
    const/16 v0, 0x32

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3602
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_128()Z
    .registers 2

    .prologue
    .line 3591
    const/16 v0, 0x33

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3592
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_129()Z
    .registers 2

    .prologue
    .line 3581
    const/16 v0, 0x34

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3582
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_130()Z
    .registers 2

    .prologue
    .line 3727
    const/16 v0, 0x36

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3728
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_131()Z
    .registers 2

    .prologue
    .line 3722
    const/16 v0, 0x37

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3723
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_132()Z
    .registers 2

    .prologue
    .line 4292
    const/16 v0, 0x39

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 4293
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_133()Z
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 3189
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3190
    .local v0, "xsp":Lfreemarker/core/Token;
    const/16 v2, 0x62

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v2

    if-eqz v2, :cond_14

    .line 3191
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3192
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_136()Z

    move-result v2

    if-eqz v2, :cond_14

    .line 3195
    :cond_13
    :goto_13
    return v1

    .line 3194
    :cond_14
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_135()Z

    move-result v2

    if-nez v2, :cond_13

    .line 3195
    const/4 v1, 0x0

    goto :goto_13
.end method

.method private final jj_3R_134()Z
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 3233
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_137()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 3239
    :cond_7
    :goto_7
    return v1

    .line 3235
    :cond_8
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3236
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_137()Z

    move-result v2

    if-eqz v2, :cond_8

    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3238
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_135()Z

    move-result v2

    if-nez v2, :cond_7

    .line 3239
    const/4 v1, 0x0

    goto :goto_7
.end method

.method private final jj_3R_135()Z
    .registers 3

    .prologue
    .line 3535
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3536
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_138()Z

    move-result v1

    if-eqz v1, :cond_42

    .line 3537
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3538
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_139()Z

    move-result v1

    if-eqz v1, :cond_42

    .line 3539
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3540
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_140()Z

    move-result v1

    if-eqz v1, :cond_42

    .line 3541
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3542
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_141()Z

    move-result v1

    if-eqz v1, :cond_42

    .line 3543
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3544
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_142()Z

    move-result v1

    if-eqz v1, :cond_42

    .line 3545
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3546
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_143()Z

    move-result v1

    if-eqz v1, :cond_42

    .line 3547
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3548
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_144()Z

    move-result v1

    if-eqz v1, :cond_42

    .line 3549
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3550
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_145()Z

    move-result v1

    if-eqz v1, :cond_42

    const/4 v1, 0x1

    .line 3562
    :goto_41
    return v1

    .line 3559
    :cond_42
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3560
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_146()Z

    move-result v1

    if-eqz v1, :cond_42

    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3562
    const/4 v1, 0x0

    goto :goto_41
.end method

.method private final jj_3R_136()Z
    .registers 2

    .prologue
    .line 3178
    const/16 v0, 0x63

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3179
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_137()Z
    .registers 2

    .prologue
    .line 3214
    const/16 v0, 0x6b

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3215
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_138()Z
    .registers 2

    .prologue
    .line 3522
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_147()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3523
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_139()Z
    .registers 2

    .prologue
    .line 3517
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_148()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3518
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_140()Z
    .registers 2

    .prologue
    .line 3502
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_149()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3503
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_141()Z
    .registers 2

    .prologue
    .line 3497
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_150()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3498
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_142()Z
    .registers 2

    .prologue
    .line 3492
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_151()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3493
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_143()Z
    .registers 2

    .prologue
    .line 3479
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_152()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3480
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_144()Z
    .registers 2

    .prologue
    .line 3461
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_153()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3462
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_145()Z
    .registers 2

    .prologue
    .line 3451
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_154()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3452
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_146()Z
    .registers 2

    .prologue
    .line 3436
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_155()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3437
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_147()Z
    .registers 3

    .prologue
    .line 3567
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3568
    .local v0, "xsp":Lfreemarker/core/Token;
    const/16 v1, 0x55

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 3569
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3570
    const/16 v1, 0x56

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_16

    const/4 v1, 0x1

    .line 3572
    :goto_15
    return v1

    :cond_16
    const/4 v1, 0x0

    goto :goto_15
.end method

.method private final jj_3R_148()Z
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 3858
    const/16 v2, 0x73

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 3863
    :cond_9
    :goto_9
    return v1

    .line 3860
    :cond_a
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3861
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_156()Z

    move-result v2

    if-eqz v2, :cond_14

    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3862
    :cond_14
    const/16 v2, 0x74

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v2

    if-nez v2, :cond_9

    .line 3863
    const/4 v1, 0x0

    goto :goto_9
.end method

.method private final jj_3R_149()Z
    .registers 3

    .prologue
    .line 4141
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4142
    .local v0, "xsp":Lfreemarker/core/Token;
    const/16 v1, 0x51

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 4143
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4144
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_157()Z

    move-result v1

    if-eqz v1, :cond_14

    const/4 v1, 0x1

    .line 4146
    :goto_13
    return v1

    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method

.method private final jj_3R_150()Z
    .registers 3

    .prologue
    .line 3955
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3956
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_158()Z

    move-result v1

    if-eqz v1, :cond_12

    .line 3957
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3958
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_159()Z

    move-result v1

    if-eqz v1, :cond_12

    const/4 v1, 0x1

    .line 3960
    :goto_11
    return v1

    :cond_12
    const/4 v1, 0x0

    goto :goto_11
.end method

.method private final jj_3R_151()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 3648
    const/16 v1, 0x6f

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 3651
    :cond_9
    :goto_9
    return v0

    .line 3649
    :cond_a
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_160()Z

    move-result v1

    if-nez v1, :cond_9

    .line 3650
    const/16 v1, 0x70

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-nez v1, :cond_9

    .line 3651
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_152()Z
    .registers 2

    .prologue
    .line 3446
    const/16 v0, 0x78

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3447
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_153()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 3389
    const/16 v1, 0x71

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 3392
    :cond_9
    :goto_9
    return v0

    .line 3390
    :cond_a
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_23()Z

    move-result v1

    if-nez v1, :cond_9

    .line 3391
    const/16 v1, 0x72

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-nez v1, :cond_9

    .line 3392
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_154()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 3378
    const/16 v1, 0x57

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 3380
    :cond_9
    :goto_9
    return v0

    .line 3379
    :cond_a
    const/16 v1, 0x78

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-nez v1, :cond_9

    .line 3380
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_155()Z
    .registers 3

    .prologue
    .line 3294
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3295
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_161()Z

    move-result v1

    if-eqz v1, :cond_32

    .line 3296
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3297
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_162()Z

    move-result v1

    if-eqz v1, :cond_32

    .line 3298
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3299
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_163()Z

    move-result v1

    if-eqz v1, :cond_32

    .line 3300
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3301
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_164()Z

    move-result v1

    if-eqz v1, :cond_32

    .line 3302
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3303
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_165()Z

    move-result v1

    if-eqz v1, :cond_32

    .line 3304
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3305
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_166()Z

    move-result v1

    if-eqz v1, :cond_32

    const/4 v1, 0x1

    .line 3311
    :goto_31
    return v1

    :cond_32
    const/4 v1, 0x0

    goto :goto_31
.end method

.method private final jj_3R_156()Z
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 3837
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_23()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 3849
    :cond_7
    :goto_7
    return v1

    .line 3839
    :cond_8
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3840
    .local v0, "xsp":Lfreemarker/core/Token;
    const/16 v2, 0x6c

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 3841
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3842
    const/16 v2, 0x6e

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v2

    if-nez v2, :cond_7

    .line 3844
    :cond_1c
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_23()Z

    move-result v2

    if-nez v2, :cond_7

    .line 3846
    :cond_22
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3847
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_167()Z

    move-result v1

    if-eqz v1, :cond_22

    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3849
    const/4 v1, 0x0

    goto :goto_7
.end method

.method private final jj_3R_157()Z
    .registers 2

    .prologue
    .line 4120
    const/16 v0, 0x52

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 4121
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_158()Z
    .registers 2

    .prologue
    .line 3929
    const/16 v0, 0x53

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3930
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_159()Z
    .registers 2

    .prologue
    .line 3919
    const/16 v0, 0x54

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3920
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_160()Z
    .registers 3

    .prologue
    .line 3528
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3529
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_168()Z

    move-result v1

    if-eqz v1, :cond_a

    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3530
    :cond_a
    const/4 v1, 0x0

    return v1
.end method

.method private final jj_3R_161()Z
    .registers 2

    .prologue
    .line 3288
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_169()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3289
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_162()Z
    .registers 2

    .prologue
    .line 3283
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_170()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3284
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_163()Z
    .registers 2

    .prologue
    .line 3278
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_171()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3279
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_164()Z
    .registers 2

    .prologue
    .line 3273
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_172()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3274
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_165()Z
    .registers 2

    .prologue
    .line 3268
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_173()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3269
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_166()Z
    .registers 2

    .prologue
    .line 3263
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_174()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3264
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_167()Z
    .registers 5

    .prologue
    const/16 v3, 0x6c

    const/4 v1, 0x1

    .line 3781
    invoke-direct {p0, v3}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 3790
    :cond_9
    :goto_9
    return v1

    .line 3782
    :cond_a
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_23()Z

    move-result v2

    if-nez v2, :cond_9

    .line 3784
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3785
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0, v3}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v2

    if-eqz v2, :cond_22

    .line 3786
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3787
    const/16 v2, 0x6e

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v2

    if-nez v2, :cond_9

    .line 3789
    :cond_22
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_23()Z

    move-result v2

    if-nez v2, :cond_9

    .line 3790
    const/4 v1, 0x0

    goto :goto_9
.end method

.method private final jj_3R_168()Z
    .registers 3

    .prologue
    .line 3507
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_23()Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x1

    .line 3513
    :goto_7
    return v1

    .line 3510
    :cond_8
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3511
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_175()Z

    move-result v1

    if-eqz v1, :cond_8

    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3513
    const/4 v1, 0x0

    goto :goto_7
.end method

.method private final jj_3R_169()Z
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 3070
    const/16 v2, 0x57

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 3083
    :cond_9
    :goto_9
    return v1

    .line 3072
    :cond_a
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3073
    .local v0, "xsp":Lfreemarker/core/Token;
    const/16 v2, 0x78

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v2

    if-eqz v2, :cond_30

    .line 3074
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3075
    const/16 v2, 0x64

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v2

    if-eqz v2, :cond_30

    .line 3076
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3077
    const/16 v2, 0x65

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v2

    if-eqz v2, :cond_30

    .line 3078
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3079
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_176()Z

    move-result v2

    if-nez v2, :cond_9

    .line 3083
    :cond_30
    const/4 v1, 0x0

    goto :goto_9
.end method

.method private final jj_3R_170()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 4309
    const/16 v1, 0x6f

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 4312
    :cond_9
    :goto_9
    return v0

    .line 4310
    :cond_a
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_23()Z

    move-result v1

    if-nez v1, :cond_9

    .line 4311
    const/16 v1, 0x70

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-nez v1, :cond_9

    .line 4312
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_171()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 4258
    const/16 v1, 0x71

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 4261
    :cond_9
    :goto_9
    return v0

    .line 4259
    :cond_a
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_160()Z

    move-result v1

    if-nez v1, :cond_9

    .line 4260
    const/16 v1, 0x72

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-nez v1, :cond_9

    .line 4261
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_172()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 3138
    const/16 v1, 0x59

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 3140
    :cond_9
    :goto_9
    return v0

    .line 3139
    :cond_a
    const/16 v1, 0x78

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-nez v1, :cond_9

    .line 3140
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_173()Z
    .registers 3

    .prologue
    .line 3244
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3245
    .local v0, "xsp":Lfreemarker/core/Token;
    const/16 v1, 0x81

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 3246
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3247
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_177()Z

    move-result v1

    if-eqz v1, :cond_14

    const/4 v1, 0x1

    .line 3249
    :goto_13
    return v1

    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method

.method private final jj_3R_174()Z
    .registers 2

    .prologue
    .line 3183
    const/16 v0, 0x5a

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3184
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_175()Z
    .registers 3

    .prologue
    .line 3485
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3486
    .local v0, "xsp":Lfreemarker/core/Token;
    const/16 v1, 0x6c

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_c

    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3487
    :cond_c
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_23()Z

    move-result v1

    if-eqz v1, :cond_14

    const/4 v1, 0x1

    .line 3488
    :goto_13
    return v1

    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method

.method private final jj_3R_176()Z
    .registers 3

    .prologue
    .line 4394
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4395
    .local v0, "xsp":Lfreemarker/core/Token;
    const/16 v1, 0x5e

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_5c

    .line 4396
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4397
    const/16 v1, 0x5f

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_5c

    .line 4398
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4399
    const/16 v1, 0x60

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_5c

    .line 4400
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4401
    const/16 v1, 0x61

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_5c

    .line 4402
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4403
    const/16 v1, 0x53

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_5c

    .line 4404
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4405
    const/16 v1, 0x54

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_5c

    .line 4406
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4407
    const/16 v1, 0x75

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_5c

    .line 4408
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4409
    const/16 v1, 0x76

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_5c

    .line 4410
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4411
    const/16 v1, 0x77

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_5c

    const/4 v1, 0x1

    .line 4420
    :goto_5b
    return v1

    :cond_5c
    const/4 v1, 0x0

    goto :goto_5b
.end method

.method private final jj_3R_177()Z
    .registers 3

    .prologue
    .line 3219
    const/16 v1, 0x6b

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_a

    const/4 v1, 0x1

    .line 3223
    :goto_9
    return v1

    .line 3221
    :cond_a
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3222
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_178()Z

    move-result v1

    if-eqz v1, :cond_14

    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3223
    :cond_14
    const/4 v1, 0x0

    goto :goto_9
.end method

.method private final jj_3R_178()Z
    .registers 2

    .prologue
    .line 3204
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_23()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3205
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_23()Z
    .registers 2

    .prologue
    .line 3655
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_25()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3656
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_24()Z
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 3166
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3167
    .local v0, "xsp":Lfreemarker/core/Token;
    const/16 v2, 0x44

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v2

    if-eqz v2, :cond_d

    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3168
    :cond_d
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3169
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_26()Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 3170
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3171
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_27()Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 3174
    :cond_1d
    :goto_1d
    return v1

    .line 3173
    :cond_1e
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_28()Z

    move-result v2

    if-nez v2, :cond_1d

    .line 3174
    const/4 v1, 0x0

    goto :goto_1d
.end method

.method private final jj_3R_25()Z
    .registers 3

    .prologue
    .line 3696
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_29()Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x1

    .line 3702
    :goto_7
    return v1

    .line 3699
    :cond_8
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3700
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_30()Z

    move-result v1

    if-eqz v1, :cond_8

    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3702
    const/4 v1, 0x0

    goto :goto_7
.end method

.method private final jj_3R_26()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 3159
    const/16 v1, 0xd

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 3161
    :cond_9
    :goto_9
    return v0

    .line 3160
    :cond_a
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_23()Z

    move-result v1

    if-nez v1, :cond_9

    .line 3161
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_27()Z
    .registers 2

    .prologue
    .line 3149
    const/16 v0, 0x35

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3150
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_28()Z
    .registers 3

    .prologue
    .line 3372
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3373
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_31()Z

    move-result v1

    if-eqz v1, :cond_a

    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3374
    :cond_a
    const/4 v1, 0x0

    return v1
.end method

.method private final jj_3R_29()Z
    .registers 3

    .prologue
    .line 3766
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_32()Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x1

    .line 3772
    :goto_7
    return v1

    .line 3769
    :cond_8
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3770
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_33()Z

    move-result v1

    if-eqz v1, :cond_8

    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3772
    const/4 v1, 0x0

    goto :goto_7
.end method

.method private final jj_3R_30()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 3690
    const/16 v1, 0x6a

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 3692
    :cond_9
    :goto_9
    return v0

    .line 3691
    :cond_a
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_29()Z

    move-result v1

    if-nez v1, :cond_9

    .line 3692
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_31()Z
    .registers 2

    .prologue
    .line 3361
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_34()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3362
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_32()Z
    .registers 3

    .prologue
    .line 4284
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_35()Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x1

    .line 4288
    :goto_7
    return v1

    .line 4286
    :cond_8
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4287
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_36()Z

    move-result v1

    if-eqz v1, :cond_12

    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4288
    :cond_12
    const/4 v1, 0x0

    goto :goto_7
.end method

.method private final jj_3R_33()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 3737
    const/16 v1, 0x69

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 3739
    :cond_9
    :goto_9
    return v0

    .line 3738
    :cond_a
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_32()Z

    move-result v1

    if-nez v1, :cond_9

    .line 3739
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_34()Z
    .registers 3

    .prologue
    .line 3661
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_37()Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x1

    .line 3666
    :goto_7
    return v1

    .line 3663
    :cond_8
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3664
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_37()Z

    move-result v1

    if-eqz v1, :cond_8

    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3666
    const/4 v1, 0x0

    goto :goto_7
.end method

.method private final jj_3R_35()Z
    .registers 3

    .prologue
    .line 4107
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_38()Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x1

    .line 4111
    :goto_7
    return v1

    .line 4109
    :cond_8
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4110
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_39()Z

    move-result v1

    if-eqz v1, :cond_12

    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4111
    :cond_12
    const/4 v1, 0x0

    goto :goto_7
.end method

.method private final jj_3R_36()Z
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 4266
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4267
    .local v0, "xsp":Lfreemarker/core/Token;
    const/16 v2, 0x5d

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v2

    if-eqz v2, :cond_20

    .line 4268
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4269
    const/16 v2, 0x5b

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v2

    if-eqz v2, :cond_20

    .line 4270
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4271
    const/16 v2, 0x5c

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v2

    if-eqz v2, :cond_20

    .line 4275
    :cond_1f
    :goto_1f
    return v1

    .line 4274
    :cond_20
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_35()Z

    move-result v2

    if-nez v2, :cond_1f

    .line 4275
    const/4 v1, 0x0

    goto :goto_1f
.end method

.method private final jj_3R_37()Z
    .registers 3

    .prologue
    .line 3633
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3634
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_40()Z

    move-result v1

    if-eqz v1, :cond_22

    .line 3635
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3636
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_41()Z

    move-result v1

    if-eqz v1, :cond_22

    .line 3637
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3638
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_42()Z

    move-result v1

    if-eqz v1, :cond_22

    .line 3639
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3640
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_43()Z

    move-result v1

    if-eqz v1, :cond_22

    const/4 v1, 0x1

    .line 3644
    :goto_21
    return v1

    :cond_22
    const/4 v1, 0x0

    goto :goto_21
.end method

.method private final jj_3R_38()Z
    .registers 3

    .prologue
    .line 3906
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_44()Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x1

    .line 3910
    :goto_7
    return v1

    .line 3908
    :cond_8
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3909
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_45()Z

    move-result v1

    if-eqz v1, :cond_12

    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3910
    :cond_12
    const/4 v1, 0x0

    goto :goto_7
.end method

.method private final jj_3R_39()Z
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 4070
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4071
    .local v0, "xsp":Lfreemarker/core/Token;
    const/16 v2, 0x7f

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v2

    if-eqz v2, :cond_3e

    .line 4072
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4073
    const/16 v2, 0x61

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v2

    if-eqz v2, :cond_3e

    .line 4074
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4075
    const/16 v2, 0x7e

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v2

    if-eqz v2, :cond_3e

    .line 4076
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4077
    const/16 v2, 0x60

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v2

    if-eqz v2, :cond_3e

    .line 4078
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4079
    const/16 v2, 0x5f

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v2

    if-eqz v2, :cond_3e

    .line 4080
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4081
    const/16 v2, 0x5e

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v2

    if-eqz v2, :cond_3e

    .line 4088
    :cond_3d
    :goto_3d
    return v1

    .line 4087
    :cond_3e
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_38()Z

    move-result v2

    if-nez v2, :cond_3d

    .line 4088
    const/4 v1, 0x0

    goto :goto_3d
.end method

.method private final jj_3R_40()Z
    .registers 2

    .prologue
    .line 3606
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_46()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3607
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_41()Z
    .registers 2

    .prologue
    .line 3596
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_47()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3597
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_42()Z
    .registers 2

    .prologue
    .line 3586
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_48()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3587
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_43()Z
    .registers 2

    .prologue
    .line 3576
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_49()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3577
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_44()Z
    .registers 3

    .prologue
    .line 3128
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_50()Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x1

    .line 3134
    :goto_7
    return v1

    .line 3131
    :cond_8
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3132
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_51()Z

    move-result v1

    if-eqz v1, :cond_8

    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3134
    const/4 v1, 0x0

    goto :goto_7
.end method

.method private final jj_3R_45()Z
    .registers 3

    .prologue
    .line 3882
    const/16 v1, 0x58

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_a

    const/4 v1, 0x1

    .line 3886
    :goto_9
    return v1

    .line 3884
    :cond_a
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3885
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_52()Z

    move-result v1

    if-eqz v1, :cond_14

    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3886
    :cond_14
    const/4 v1, 0x0

    goto :goto_9
.end method

.method private final jj_3R_46()Z
    .registers 3

    .prologue
    .line 3808
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_53()Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x1

    .line 3813
    :goto_7
    return v1

    .line 3810
    :cond_8
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3811
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_53()Z

    move-result v1

    if-eqz v1, :cond_8

    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3813
    const/4 v1, 0x0

    goto :goto_7
.end method

.method private final jj_3R_47()Z
    .registers 2

    .prologue
    .line 3712
    const/16 v0, 0x47

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3713
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_48()Z
    .registers 2

    .prologue
    .line 3675
    const/16 v0, 0x48

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3676
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_49()Z
    .registers 3

    .prologue
    .line 4156
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4157
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_54()Z

    move-result v1

    if-eqz v1, :cond_da

    .line 4158
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4159
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_55()Z

    move-result v1

    if-eqz v1, :cond_da

    .line 4160
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4161
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_56()Z

    move-result v1

    if-eqz v1, :cond_da

    .line 4162
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4163
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_57()Z

    move-result v1

    if-eqz v1, :cond_da

    .line 4164
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4165
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_58()Z

    move-result v1

    if-eqz v1, :cond_da

    .line 4166
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4167
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_59()Z

    move-result v1

    if-eqz v1, :cond_da

    .line 4168
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4169
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_60()Z

    move-result v1

    if-eqz v1, :cond_da

    .line 4170
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4171
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_61()Z

    move-result v1

    if-eqz v1, :cond_da

    .line 4172
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4173
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_62()Z

    move-result v1

    if-eqz v1, :cond_da

    .line 4174
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4175
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_63()Z

    move-result v1

    if-eqz v1, :cond_da

    .line 4176
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4177
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_64()Z

    move-result v1

    if-eqz v1, :cond_da

    .line 4178
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4179
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_65()Z

    move-result v1

    if-eqz v1, :cond_da

    .line 4180
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4181
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_66()Z

    move-result v1

    if-eqz v1, :cond_da

    .line 4182
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4183
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_67()Z

    move-result v1

    if-eqz v1, :cond_da

    .line 4184
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4185
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_68()Z

    move-result v1

    if-eqz v1, :cond_da

    .line 4186
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4187
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_69()Z

    move-result v1

    if-eqz v1, :cond_da

    .line 4188
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4189
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_70()Z

    move-result v1

    if-eqz v1, :cond_da

    .line 4190
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4191
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_71()Z

    move-result v1

    if-eqz v1, :cond_da

    .line 4192
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4193
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_72()Z

    move-result v1

    if-eqz v1, :cond_da

    .line 4194
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4195
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_73()Z

    move-result v1

    if-eqz v1, :cond_da

    .line 4196
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4197
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_74()Z

    move-result v1

    if-eqz v1, :cond_da

    .line 4198
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4199
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_75()Z

    move-result v1

    if-eqz v1, :cond_da

    .line 4200
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4201
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_76()Z

    move-result v1

    if-eqz v1, :cond_da

    .line 4202
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4203
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_77()Z

    move-result v1

    if-eqz v1, :cond_da

    .line 4204
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4205
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_78()Z

    move-result v1

    if-eqz v1, :cond_da

    .line 4206
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4207
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_79()Z

    move-result v1

    if-eqz v1, :cond_da

    .line 4208
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4209
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_80()Z

    move-result v1

    if-eqz v1, :cond_da

    const/4 v1, 0x1

    .line 4236
    :goto_d9
    return v1

    :cond_da
    const/4 v1, 0x0

    goto :goto_d9
.end method

.method private final jj_3R_50()Z
    .registers 3

    .prologue
    .line 4368
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_81()Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x1

    .line 4374
    :goto_7
    return v1

    .line 4371
    :cond_8
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4372
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_82()Z

    move-result v1

    if-eqz v1, :cond_8

    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4374
    const/4 v1, 0x0

    goto :goto_7
.end method

.method private final jj_3R_51()Z
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 3118
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3119
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_83()Z

    move-result v2

    if-eqz v2, :cond_12

    .line 3120
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3121
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_84()Z

    move-result v2

    if-eqz v2, :cond_12

    .line 3124
    :cond_11
    :goto_11
    return v1

    .line 3123
    :cond_12
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_50()Z

    move-result v2

    if-nez v2, :cond_11

    .line 3124
    const/4 v1, 0x0

    goto :goto_11
.end method

.method private final jj_3R_52()Z
    .registers 2

    .prologue
    .line 3867
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_44()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3868
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_53()Z
    .registers 3

    .prologue
    .line 3795
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3796
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_85()Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 3797
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3798
    const/16 v1, 0x45

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 3799
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3800
    const/16 v1, 0x46

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_1e

    const/4 v1, 0x1

    .line 3803
    :goto_1d
    return v1

    :cond_1e
    const/4 v1, 0x0

    goto :goto_1d
.end method

.method private final jj_3R_54()Z
    .registers 2

    .prologue
    .line 4150
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_86()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 4151
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_55()Z
    .registers 2

    .prologue
    .line 4135
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_87()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 4136
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_56()Z
    .registers 2

    .prologue
    .line 4130
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_88()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 4131
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_57()Z
    .registers 2

    .prologue
    .line 4115
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_89()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 4116
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_58()Z
    .registers 2

    .prologue
    .line 4102
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_90()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 4103
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_59()Z
    .registers 2

    .prologue
    .line 4092
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_91()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 4093
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_60()Z
    .registers 2

    .prologue
    .line 4064
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_92()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 4065
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_61()Z
    .registers 2

    .prologue
    .line 4059
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_93()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 4060
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_62()Z
    .registers 2

    .prologue
    .line 4054
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_94()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 4055
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_63()Z
    .registers 2

    .prologue
    .line 4049
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_95()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 4050
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_64()Z
    .registers 2

    .prologue
    .line 4044
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_96()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 4045
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_65()Z
    .registers 2

    .prologue
    .line 4014
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_97()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 4015
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_66()Z
    .registers 2

    .prologue
    .line 4009
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_98()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 4010
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_67()Z
    .registers 2

    .prologue
    .line 3999
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_99()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 4000
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_68()Z
    .registers 2

    .prologue
    .line 3994
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_100()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3995
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_69()Z
    .registers 2

    .prologue
    .line 3989
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_101()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3990
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_70()Z
    .registers 2

    .prologue
    .line 3974
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_102()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3975
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_71()Z
    .registers 2

    .prologue
    .line 3969
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_103()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3970
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_72()Z
    .registers 2

    .prologue
    .line 3949
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_104()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3950
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_73()Z
    .registers 2

    .prologue
    .line 3939
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_105()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3940
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_74()Z
    .registers 2

    .prologue
    .line 3934
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_106()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3935
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_75()Z
    .registers 2

    .prologue
    .line 3924
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_107()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3925
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_76()Z
    .registers 2

    .prologue
    .line 3914
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_108()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3915
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_77()Z
    .registers 2

    .prologue
    .line 3901
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_109()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3902
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_78()Z
    .registers 2

    .prologue
    .line 3890
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_110()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3891
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_79()Z
    .registers 2

    .prologue
    .line 3877
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_111()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3878
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_80()Z
    .registers 2

    .prologue
    .line 3872
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_112()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3873
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3R_81()Z
    .registers 3

    .prologue
    .line 3336
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3337
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_113()Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 3338
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3339
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_114()Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 3340
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3341
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_115()Z

    move-result v1

    if-eqz v1, :cond_1a

    const/4 v1, 0x1

    .line 3344
    :goto_19
    return v1

    :cond_1a
    const/4 v1, 0x0

    goto :goto_19
.end method

.method private final jj_3R_82()Z
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 4355
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4356
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_116()Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 4357
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4358
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_117()Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 4359
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4360
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_118()Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 4364
    :cond_19
    :goto_19
    return v1

    .line 4363
    :cond_1a
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_81()Z

    move-result v2

    if-nez v2, :cond_19

    .line 4364
    const/4 v1, 0x0

    goto :goto_19
.end method

.method private final jj_3R_83()Z
    .registers 2

    .prologue
    .line 3107
    const/16 v0, 0x62

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3108
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_84()Z
    .registers 2

    .prologue
    .line 3102
    const/16 v0, 0x63

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3103
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_85()Z
    .registers 2

    .prologue
    .line 3776
    const/16 v0, 0x44

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3777
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_86()Z
    .registers 2

    .prologue
    .line 3366
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3367
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_87()Z
    .registers 2

    .prologue
    .line 3154
    const/16 v0, 0xa

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3155
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_88()Z
    .registers 2

    .prologue
    .line 3087
    const/16 v0, 0xb

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3088
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_89()Z
    .registers 3

    .prologue
    .line 3467
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3468
    .local v0, "xsp":Lfreemarker/core/Token;
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_119()Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 3469
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3470
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_120()Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 3471
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3472
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_121()Z

    move-result v1

    if-eqz v1, :cond_1a

    const/4 v1, 0x1

    .line 3475
    :goto_19
    return v1

    :cond_1a
    const/4 v1, 0x0

    goto :goto_19
.end method

.method private final jj_3R_90()Z
    .registers 2

    .prologue
    .line 3209
    const/16 v0, 0x11

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3210
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_91()Z
    .registers 2

    .prologue
    .line 3144
    const/16 v0, 0x12

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3145
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_92()Z
    .registers 3

    .prologue
    .line 3061
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3062
    .local v0, "xsp":Lfreemarker/core/Token;
    const/16 v1, 0x14

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 3063
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3064
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_122()Z

    move-result v1

    if-eqz v1, :cond_14

    const/4 v1, 0x1

    .line 3066
    :goto_13
    return v1

    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method

.method private final jj_3R_93()Z
    .registers 2

    .prologue
    .line 4125
    const/16 v0, 0x1b

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 4126
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_94()Z
    .registers 2

    .prologue
    .line 4004
    const/16 v0, 0x3f

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 4005
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_95()Z
    .registers 2

    .prologue
    .line 3732
    const/16 v0, 0x19

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3733
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_96()Z
    .registers 3

    .prologue
    .line 3422
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3423
    .local v0, "xsp":Lfreemarker/core/Token;
    const/16 v1, 0x1c

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 3424
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3425
    const/16 v1, 0x1d

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_16

    const/4 v1, 0x1

    .line 3427
    :goto_15
    return v1

    :cond_16
    const/4 v1, 0x0

    goto :goto_15
.end method

.method private final jj_3R_97()Z
    .registers 2

    .prologue
    .line 3384
    const/16 v0, 0x1e

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3385
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_98()Z
    .registers 2

    .prologue
    .line 3330
    const/16 v0, 0x15

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3331
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3R_99()Z
    .registers 2

    .prologue
    .line 3258
    const/16 v0, 0xc

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3259
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3_1()Z
    .registers 3

    .prologue
    .line 3397
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3398
    .local v0, "xsp":Lfreemarker/core/Token;
    const/16 v1, 0x57

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_48

    .line 3399
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3400
    const/16 v1, 0x6f

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_48

    .line 3401
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3402
    const/16 v1, 0x71

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_48

    .line 3403
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3404
    const/16 v1, 0x59

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_48

    .line 3405
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3406
    const/16 v1, 0x6b

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_48

    .line 3407
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3408
    const/16 v1, 0x81

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_48

    .line 3409
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3410
    const/16 v1, 0x5a

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_48

    const/4 v1, 0x1

    .line 3417
    :goto_47
    return v1

    :cond_48
    const/4 v1, 0x0

    goto :goto_47
.end method

.method private final jj_3_10()Z
    .registers 2

    .prologue
    .line 3199
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_23()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3200
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3_11()Z
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 3349
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3350
    .local v0, "xsp":Lfreemarker/core/Token;
    const/16 v2, 0x6c

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v2

    if-eqz v2, :cond_d

    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3351
    :cond_d
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3352
    const/16 v2, 0x78

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v2

    if-eqz v2, :cond_22

    .line 3353
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3354
    const/16 v2, 0x51

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v2

    if-eqz v2, :cond_22

    .line 3357
    :cond_21
    :goto_21
    return v1

    .line 3356
    :cond_22
    const/16 v2, 0x5b

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v2

    if-nez v2, :cond_21

    .line 3357
    const/4 v1, 0x0

    goto :goto_21
.end method

.method private final jj_3_12()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 3895
    const/16 v1, 0x78

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 3897
    :cond_9
    :goto_9
    return v0

    .line 3896
    :cond_a
    const/16 v1, 0x5b

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-nez v1, :cond_9

    .line 3897
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3_13()Z
    .registers 2

    .prologue
    .line 3685
    const/16 v0, 0x71

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3686
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3_14()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 3706
    const/16 v1, 0x78

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 3708
    :cond_9
    :goto_9
    return v0

    .line 3707
    :cond_a
    const/16 v1, 0x5b

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-nez v1, :cond_9

    .line 3708
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3_15()Z
    .registers 2

    .prologue
    .line 3227
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_24()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3228
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3_16()Z
    .registers 3

    .prologue
    .line 3744
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3745
    .local v0, "xsp":Lfreemarker/core/Token;
    const/16 v1, 0x44

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_20

    .line 3746
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3747
    const/16 v1, 0x45

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_20

    .line 3748
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3749
    const/16 v1, 0x46

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_20

    const/4 v1, 0x1

    .line 3752
    :goto_1f
    return v1

    :cond_20
    const/4 v1, 0x0

    goto :goto_1f
.end method

.method private final jj_3_17()Z
    .registers 3

    .prologue
    .line 4298
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4299
    .local v0, "xsp":Lfreemarker/core/Token;
    const/16 v1, 0x44

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_c

    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4300
    :cond_c
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4301
    const/16 v1, 0x42

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 4302
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4303
    const/16 v1, 0x41

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_22

    const/4 v1, 0x1

    .line 4305
    :goto_21
    return v1

    :cond_22
    const/4 v1, 0x0

    goto :goto_21
.end method

.method private final jj_3_2()Z
    .registers 3

    .prologue
    .line 3093
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3094
    .local v0, "xsp":Lfreemarker/core/Token;
    const/16 v1, 0x62

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 3095
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 3096
    const/16 v1, 0x63

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_16

    const/4 v1, 0x1

    .line 3098
    :goto_15
    return v1

    :cond_16
    const/4 v1, 0x0

    goto :goto_15
.end method

.method private final jj_3_3()Z
    .registers 3

    .prologue
    .line 4327
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4328
    .local v0, "xsp":Lfreemarker/core/Token;
    const/16 v1, 0x64

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_20

    .line 4329
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4330
    const/16 v1, 0x67

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_20

    .line 4331
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4332
    const/16 v1, 0x68

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_20

    const/4 v1, 0x1

    .line 4335
    :goto_1f
    return v1

    :cond_20
    const/4 v1, 0x0

    goto :goto_1f
.end method

.method private final jj_3_4()Z
    .registers 3

    .prologue
    .line 4241
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4242
    .local v0, "xsp":Lfreemarker/core/Token;
    const/16 v1, 0x5d

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_20

    .line 4243
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4244
    const/16 v1, 0x5b

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_20

    .line 4245
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4246
    const/16 v1, 0x5c

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_20

    const/4 v1, 0x1

    .line 4249
    :goto_1f
    return v1

    :cond_20
    const/4 v1, 0x0

    goto :goto_1f
.end method

.method private final jj_3_5()Z
    .registers 4

    .prologue
    const/16 v2, 0x5f

    .line 4020
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4021
    .local v0, "xsp":Lfreemarker/core/Token;
    const/16 v1, 0x7f

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_46

    .line 4022
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4023
    const/16 v1, 0x61

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_46

    .line 4024
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4025
    const/16 v1, 0x7e

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_46

    .line 4026
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4027
    const/16 v1, 0x60

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_46

    .line 4028
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4029
    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_46

    .line 4030
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4031
    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_46

    .line 4032
    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4033
    const/16 v1, 0x5e

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v1

    if-eqz v1, :cond_46

    const/4 v1, 0x1

    .line 4040
    :goto_45
    return v1

    :cond_46
    const/4 v1, 0x0

    goto :goto_45
.end method

.method private final jj_3_6()Z
    .registers 2

    .prologue
    .line 3822
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3R_23()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    .line 3823
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private final jj_3_7()Z
    .registers 2

    .prologue
    .line 3853
    const/16 v0, 0x58

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3854
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3_8()Z
    .registers 2

    .prologue
    .line 3717
    const/16 v0, 0x69

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3718
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private final jj_3_9()Z
    .registers 2

    .prologue
    .line 3670
    const/16 v0, 0x6a

    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->jj_scan_token(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 3671
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private jj_add_error_token(II)V
    .registers 10
    .param p1, "kind"    # I
    .param p2, "pos"    # I

    .prologue
    .line 4600
    const/16 v4, 0x64

    if-lt p2, v4, :cond_5

    .line 4625
    :cond_4
    :goto_4
    return-void

    .line 4601
    :cond_5
    iget v4, p0, Lfreemarker/core/FMParser;->jj_endpos:I

    add-int/lit8 v4, v4, 0x1

    if-ne p2, v4, :cond_16

    .line 4602
    iget-object v4, p0, Lfreemarker/core/FMParser;->jj_lasttokens:[I

    iget v5, p0, Lfreemarker/core/FMParser;->jj_endpos:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lfreemarker/core/FMParser;->jj_endpos:I

    aput p1, v4, v5

    goto :goto_4

    .line 4603
    :cond_16
    iget v4, p0, Lfreemarker/core/FMParser;->jj_endpos:I

    if-eqz v4, :cond_4

    .line 4604
    iget v4, p0, Lfreemarker/core/FMParser;->jj_endpos:I

    new-array v4, v4, [I

    iput-object v4, p0, Lfreemarker/core/FMParser;->jj_expentry:[I

    .line 4605
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_21
    iget v4, p0, Lfreemarker/core/FMParser;->jj_endpos:I

    if-ge v2, v4, :cond_30

    .line 4606
    iget-object v4, p0, Lfreemarker/core/FMParser;->jj_expentry:[I

    iget-object v5, p0, Lfreemarker/core/FMParser;->jj_lasttokens:[I

    aget v5, v5, v2

    aput v5, v4, v2

    .line 4605
    add-int/lit8 v2, v2, 0x1

    goto :goto_21

    .line 4608
    :cond_30
    const/4 v1, 0x0

    .line 4609
    .local v1, "exists":Z
    iget-object v4, p0, Lfreemarker/core/FMParser;->jj_expentries:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;
    :cond_37
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_5e

    .line 4610
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [I

    move-object v3, v4

    check-cast v3, [I

    .line 4611
    .local v3, "oldentry":[I
    array-length v4, v3

    iget-object v5, p0, Lfreemarker/core/FMParser;->jj_expentry:[I

    array-length v5, v5

    if-ne v4, v5, :cond_37

    .line 4612
    const/4 v1, 0x1

    .line 4613
    const/4 v2, 0x0

    :goto_4e
    iget-object v4, p0, Lfreemarker/core/FMParser;->jj_expentry:[I

    array-length v4, v4

    if-ge v2, v4, :cond_5c

    .line 4614
    aget v4, v3, v2

    iget-object v5, p0, Lfreemarker/core/FMParser;->jj_expentry:[I

    aget v5, v5, v2

    if-eq v4, v5, :cond_72

    .line 4615
    const/4 v1, 0x0

    .line 4619
    :cond_5c
    if-eqz v1, :cond_37

    .line 4622
    .end local v3    # "oldentry":[I
    :cond_5e
    if-nez v1, :cond_67

    iget-object v4, p0, Lfreemarker/core/FMParser;->jj_expentries:Ljava/util/Vector;

    iget-object v5, p0, Lfreemarker/core/FMParser;->jj_expentry:[I

    invoke-virtual {v4, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 4623
    :cond_67
    if-eqz p2, :cond_4

    iget-object v4, p0, Lfreemarker/core/FMParser;->jj_lasttokens:[I

    iput p2, p0, Lfreemarker/core/FMParser;->jj_endpos:I

    add-int/lit8 v5, p2, -0x1

    aput p1, v4, v5

    goto :goto_4

    .line 4613
    .restart local v3    # "oldentry":[I
    :cond_72
    add-int/lit8 v2, v2, 0x1

    goto :goto_4e
.end method

.method private final jj_consume_token(I)Lfreemarker/core/Token;
    .registers 7
    .param p1, "kind"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 4524
    iget-object v2, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    .local v2, "oldToken":Lfreemarker/core/Token;
    iget-object v3, v2, Lfreemarker/core/Token;->next:Lfreemarker/core/Token;

    if-eqz v3, :cond_40

    iget-object v3, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    iget-object v3, v3, Lfreemarker/core/Token;->next:Lfreemarker/core/Token;

    iput-object v3, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    .line 4526
    :goto_c
    const/4 v3, -0x1

    iput v3, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    .line 4527
    iget-object v3, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    iget v3, v3, Lfreemarker/core/Token;->kind:I

    if-ne v3, p1, :cond_53

    .line 4528
    iget v3, p0, Lfreemarker/core/FMParser;->jj_gen:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lfreemarker/core/FMParser;->jj_gen:I

    .line 4529
    iget v3, p0, Lfreemarker/core/FMParser;->jj_gc:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lfreemarker/core/FMParser;->jj_gc:I

    const/16 v4, 0x64

    if-le v3, v4, :cond_50

    .line 4530
    const/4 v3, 0x0

    iput v3, p0, Lfreemarker/core/FMParser;->jj_gc:I

    .line 4531
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_29
    iget-object v3, p0, Lfreemarker/core/FMParser;->jj_2_rtns:[Lfreemarker/core/FMParser$JJCalls;

    array-length v3, v3

    if-ge v1, v3, :cond_50

    .line 4532
    iget-object v3, p0, Lfreemarker/core/FMParser;->jj_2_rtns:[Lfreemarker/core/FMParser$JJCalls;

    aget-object v0, v3, v1

    .line 4533
    .local v0, "c":Lfreemarker/core/FMParser$JJCalls;
    :goto_32
    if-eqz v0, :cond_4d

    .line 4534
    iget v3, v0, Lfreemarker/core/FMParser$JJCalls;->gen:I

    iget v4, p0, Lfreemarker/core/FMParser;->jj_gen:I

    if-ge v3, v4, :cond_3d

    const/4 v3, 0x0

    iput-object v3, v0, Lfreemarker/core/FMParser$JJCalls;->first:Lfreemarker/core/Token;

    .line 4535
    :cond_3d
    iget-object v0, v0, Lfreemarker/core/FMParser$JJCalls;->next:Lfreemarker/core/FMParser$JJCalls;

    goto :goto_32

    .line 4525
    .end local v0    # "c":Lfreemarker/core/FMParser$JJCalls;
    .end local v1    # "i":I
    :cond_40
    iget-object v3, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    iget-object v4, p0, Lfreemarker/core/FMParser;->token_source:Lfreemarker/core/FMParserTokenManager;

    invoke-virtual {v4}, Lfreemarker/core/FMParserTokenManager;->getNextToken()Lfreemarker/core/Token;

    move-result-object v4

    iput-object v4, v3, Lfreemarker/core/Token;->next:Lfreemarker/core/Token;

    iput-object v4, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    goto :goto_c

    .line 4531
    .restart local v0    # "c":Lfreemarker/core/FMParser$JJCalls;
    .restart local v1    # "i":I
    :cond_4d
    add-int/lit8 v1, v1, 0x1

    goto :goto_29

    .line 4539
    .end local v0    # "c":Lfreemarker/core/FMParser$JJCalls;
    .end local v1    # "i":I
    :cond_50
    iget-object v3, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    return-object v3

    .line 4541
    :cond_53
    iput-object v2, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    .line 4542
    iput p1, p0, Lfreemarker/core/FMParser;->jj_kind:I

    .line 4543
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->generateParseException()Lfreemarker/core/ParseException;

    move-result-object v3

    throw v3
.end method

.method private static jj_la1_0()V
    .registers 1

    .prologue
    .line 4446
    const/16 v0, 0x53

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Lfreemarker/core/FMParser;->jj_la1_0:[I

    .line 4447
    return-void

    .line 4446
    :array_a
    .array-data 4
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
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x200
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x1000000
        0x800000
        0x0
        0x0
        0x1c000
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x180000
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
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x30000000
        0x0
        0x0
        0x0
        0x0
        0x0
        0x2000
        0x0
        0x7fffdd40
        0x0
        0x0
        0x0
        0x7fffdd40
        0x7fffdd40
        0x0
        0x0
        0x7fffdd40
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method private static jj_la1_1()V
    .registers 1

    .prologue
    .line 4449
    const/16 v0, 0x53

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Lfreemarker/core/FMParser;->jj_la1_1:[I

    .line 4450
    return-void

    .line 4449
    :array_a
    .array-data 4
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
        0x1000
        0x6
        0x0
        0x0
        0x0
        0x3000000
        0x4000
        0x8000
        0xc00000
        0x1e0000
        0x0
        0x0
        0x0
        0x0
        0x70
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
        0x180
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
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x200000
        0x0
        -0x50202000
        0x0
        0x0
        0x0
        -0x50202000
        -0x50202000
        0x0
        0x0
        -0x50202000
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method private static jj_la1_2()V
    .registers 1

    .prologue
    .line 4452
    const/16 v0, 0x53

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Lfreemarker/core/FMParser;->jj_la1_2:[I

    .line 4453
    return-void

    .line 4452
    :array_a
    .array-data 4
        0xfe0000
        0xfe0000
        0x0
        0x0
        0x0
        0x0
        0x38000000
        -0x40000000    # -2.0f
        0x600000
        0x60000
        0x6800000
        0x0
        -0x3fe80000    # -2.375f
        -0x3fe80000    # -2.375f
        0x60000
        0x180000
        0x0
        0x0
        0x0
        0xfe0000
        0x0
        0x0
        0x0
        0x0
        0x0
        0xfe0000
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
        0x8000000
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x8000000
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
        0x0
        0xfe0000
        0x0
        0xfe0000
        0x0
        0x0
        0x0
        0x0
        0x10
        0x10
        0x0
        0x0
        0x0
        0x70
        0x0
        0x0
        0x1f0
        0x1f0
        0x1f0
        0x1f0
        0x1f0
        0x10
        0x0
        0x6
        0x0
        0x0
    .end array-data
.end method

.method private static jj_la1_3()V
    .registers 1

    .prologue
    .line 4455
    const/16 v0, 0x53

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Lfreemarker/core/FMParser;->jj_la1_3:[I

    .line 4456
    return-void

    .line 4455
    :array_a
    .array-data 4
        0x10a8000
        0x10a880c
        0x800
        0xc
        0xc
        0x190
        0x0
        -0x3ffffffd    # -2.0000007f
        0x0
        0x1000000
        0x28800
        0x800
        0xe00003
        0x1e00033
        0x0
        0x0
        0x5000
        0x1000
        0x5000
        0x10a880c
        0x2000
        0x0
        0x0
        0x0
        0x800000
        0x10a880c
        0x800000
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x1000
        0x200000
        0x200000
        0x0
        0x10200000
        0x2000
        0x1000000
        0x0
        0x20000
        0x1000000
        0x40
        0x0
        0x1000
        0x40000
        0x0
        0x0
        0x0
        0x1000
        0x0
        0x0
        0x1000000
        0x2000
        0x30000000
        0x40000
        0x1000000
        0x10a980c
        0x1000
        0x10a880c
        0x0
        0x2000
        0x1000000
        0x30000000
        0x0
        0x0
        0x0
        0x30000000
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
        0x1000000
        0x0
        0x1000
        0x1000000
    .end array-data
.end method

.method private static jj_la1_4()V
    .registers 1

    .prologue
    .line 4458
    const/16 v0, 0x53

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Lfreemarker/core/FMParser;->jj_la1_4:[I

    .line 4459
    return-void

    .line 4458
    :array_a
    .array-data 4
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
        0x2
        0x2
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
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
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
        0x0
        0x0
        0x0
        0x0
        0x0
        0x3c
        0x3c
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
    .end array-data
.end method

.method private final jj_ntk()I
    .registers 3

    .prologue
    .line 4587
    iget-object v0, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    iget-object v0, v0, Lfreemarker/core/Token;->next:Lfreemarker/core/Token;

    iput-object v0, p0, Lfreemarker/core/FMParser;->jj_nt:Lfreemarker/core/Token;

    if-nez v0, :cond_17

    .line 4588
    iget-object v0, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    iget-object v1, p0, Lfreemarker/core/FMParser;->token_source:Lfreemarker/core/FMParserTokenManager;

    invoke-virtual {v1}, Lfreemarker/core/FMParserTokenManager;->getNextToken()Lfreemarker/core/Token;

    move-result-object v1

    iput-object v1, v0, Lfreemarker/core/Token;->next:Lfreemarker/core/Token;

    iget v0, v1, Lfreemarker/core/Token;->kind:I

    iput v0, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    .line 4590
    :goto_16
    return v0

    :cond_17
    iget-object v0, p0, Lfreemarker/core/FMParser;->jj_nt:Lfreemarker/core/Token;

    iget v0, v0, Lfreemarker/core/Token;->kind:I

    iput v0, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_16
.end method

.method private final jj_rescan_token()V
    .registers 5

    .prologue
    .line 4682
    const/4 v2, 0x1

    iput-boolean v2, p0, Lfreemarker/core/FMParser;->jj_rescan:Z

    .line 4683
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    const/16 v2, 0x11

    if-ge v0, v2, :cond_6a

    .line 4684
    iget-object v2, p0, Lfreemarker/core/FMParser;->jj_2_rtns:[Lfreemarker/core/FMParser$JJCalls;

    aget-object v1, v2, v0

    .line 4686
    .local v1, "p":Lfreemarker/core/FMParser$JJCalls;
    :cond_c
    iget v2, v1, Lfreemarker/core/FMParser$JJCalls;->gen:I

    iget v3, p0, Lfreemarker/core/FMParser;->jj_gen:I

    if-le v2, v3, :cond_1f

    .line 4687
    iget v2, v1, Lfreemarker/core/FMParser$JJCalls;->arg:I

    iput v2, p0, Lfreemarker/core/FMParser;->jj_la:I

    iget-object v2, v1, Lfreemarker/core/FMParser$JJCalls;->first:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_lastpos:Lfreemarker/core/Token;

    .line 4688
    packed-switch v0, :pswitch_data_6e

    .line 4708
    :cond_1f
    :goto_1f
    iget-object v1, v1, Lfreemarker/core/FMParser$JJCalls;->next:Lfreemarker/core/FMParser$JJCalls;

    .line 4709
    if-nez v1, :cond_c

    .line 4683
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 4689
    :pswitch_26
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_1()Z

    goto :goto_1f

    .line 4690
    :pswitch_2a
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_2()Z

    goto :goto_1f

    .line 4691
    :pswitch_2e
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_3()Z

    goto :goto_1f

    .line 4692
    :pswitch_32
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_4()Z

    goto :goto_1f

    .line 4693
    :pswitch_36
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_5()Z

    goto :goto_1f

    .line 4694
    :pswitch_3a
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_6()Z

    goto :goto_1f

    .line 4695
    :pswitch_3e
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_7()Z

    goto :goto_1f

    .line 4696
    :pswitch_42
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_8()Z

    goto :goto_1f

    .line 4697
    :pswitch_46
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_9()Z

    goto :goto_1f

    .line 4698
    :pswitch_4a
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_10()Z

    goto :goto_1f

    .line 4699
    :pswitch_4e
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_11()Z

    goto :goto_1f

    .line 4700
    :pswitch_52
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_12()Z

    goto :goto_1f

    .line 4701
    :pswitch_56
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_13()Z

    goto :goto_1f

    .line 4702
    :pswitch_5a
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_14()Z

    goto :goto_1f

    .line 4703
    :pswitch_5e
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_15()Z

    goto :goto_1f

    .line 4704
    :pswitch_62
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_16()Z

    goto :goto_1f

    .line 4705
    :pswitch_66
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_3_17()Z

    goto :goto_1f

    .line 4711
    .end local v1    # "p":Lfreemarker/core/FMParser$JJCalls;
    :cond_6a
    const/4 v2, 0x0

    iput-boolean v2, p0, Lfreemarker/core/FMParser;->jj_rescan:Z

    .line 4712
    return-void

    .line 4688
    :pswitch_data_6e
    .packed-switch 0x0
        :pswitch_26
        :pswitch_2a
        :pswitch_2e
        :pswitch_32
        :pswitch_36
        :pswitch_3a
        :pswitch_3e
        :pswitch_42
        :pswitch_46
        :pswitch_4a
        :pswitch_4e
        :pswitch_52
        :pswitch_56
        :pswitch_5a
        :pswitch_5e
        :pswitch_62
        :pswitch_66
    .end packed-switch
.end method

.method private final jj_save(II)V
    .registers 7
    .param p1, "index"    # I
    .param p2, "xla"    # I

    .prologue
    .line 4715
    iget-object v2, p0, Lfreemarker/core/FMParser;->jj_2_rtns:[Lfreemarker/core/FMParser$JJCalls;

    aget-object v0, v2, p1

    .line 4716
    .local v0, "p":Lfreemarker/core/FMParser$JJCalls;
    :goto_4
    iget v2, v0, Lfreemarker/core/FMParser$JJCalls;->gen:I

    iget v3, p0, Lfreemarker/core/FMParser;->jj_gen:I

    if-le v2, v3, :cond_16

    .line 4717
    iget-object v2, v0, Lfreemarker/core/FMParser$JJCalls;->next:Lfreemarker/core/FMParser$JJCalls;

    if-nez v2, :cond_25

    new-instance v1, Lfreemarker/core/FMParser$JJCalls;

    invoke-direct {v1}, Lfreemarker/core/FMParser$JJCalls;-><init>()V

    iput-object v1, v0, Lfreemarker/core/FMParser$JJCalls;->next:Lfreemarker/core/FMParser$JJCalls;

    .end local v0    # "p":Lfreemarker/core/FMParser$JJCalls;
    .local v1, "p":Lfreemarker/core/FMParser$JJCalls;
    move-object v0, v1

    .line 4720
    .end local v1    # "p":Lfreemarker/core/FMParser$JJCalls;
    .restart local v0    # "p":Lfreemarker/core/FMParser$JJCalls;
    :cond_16
    iget v2, p0, Lfreemarker/core/FMParser;->jj_gen:I

    add-int/2addr v2, p2

    iget v3, p0, Lfreemarker/core/FMParser;->jj_la:I

    sub-int/2addr v2, v3

    iput v2, v0, Lfreemarker/core/FMParser$JJCalls;->gen:I

    iget-object v2, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    iput-object v2, v0, Lfreemarker/core/FMParser$JJCalls;->first:Lfreemarker/core/Token;

    iput p2, v0, Lfreemarker/core/FMParser$JJCalls;->arg:I

    .line 4721
    return-void

    .line 4718
    :cond_25
    iget-object v0, v0, Lfreemarker/core/FMParser$JJCalls;->next:Lfreemarker/core/FMParser$JJCalls;

    goto :goto_4
.end method

.method private final jj_scan_token(I)Z
    .registers 6
    .param p1, "kind"    # I

    .prologue
    .line 4549
    iget-object v2, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iget-object v3, p0, Lfreemarker/core/FMParser;->jj_lastpos:Lfreemarker/core/Token;

    if-ne v2, v3, :cond_3b

    .line 4550
    iget v2, p0, Lfreemarker/core/FMParser;->jj_la:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lfreemarker/core/FMParser;->jj_la:I

    .line 4551
    iget-object v2, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iget-object v2, v2, Lfreemarker/core/Token;->next:Lfreemarker/core/Token;

    if-nez v2, :cond_32

    .line 4552
    iget-object v2, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iget-object v3, p0, Lfreemarker/core/FMParser;->token_source:Lfreemarker/core/FMParserTokenManager;

    invoke-virtual {v3}, Lfreemarker/core/FMParserTokenManager;->getNextToken()Lfreemarker/core/Token;

    move-result-object v3

    iput-object v3, v2, Lfreemarker/core/Token;->next:Lfreemarker/core/Token;

    iput-object v3, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iput-object v3, p0, Lfreemarker/core/FMParser;->jj_lastpos:Lfreemarker/core/Token;

    .line 4559
    :goto_20
    iget-boolean v2, p0, Lfreemarker/core/FMParser;->jj_rescan:Z

    if-eqz v2, :cond_47

    .line 4560
    const/4 v0, 0x0

    .local v0, "i":I
    iget-object v1, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    .line 4561
    .local v1, "tok":Lfreemarker/core/Token;
    :goto_27
    if-eqz v1, :cond_42

    iget-object v2, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    if-eq v1, v2, :cond_42

    add-int/lit8 v0, v0, 0x1

    iget-object v1, v1, Lfreemarker/core/Token;->next:Lfreemarker/core/Token;

    goto :goto_27

    .line 4554
    .end local v0    # "i":I
    .end local v1    # "tok":Lfreemarker/core/Token;
    :cond_32
    iget-object v2, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iget-object v2, v2, Lfreemarker/core/Token;->next:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_lastpos:Lfreemarker/core/Token;

    goto :goto_20

    .line 4557
    :cond_3b
    iget-object v2, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iget-object v2, v2, Lfreemarker/core/Token;->next:Lfreemarker/core/Token;

    iput-object v2, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    goto :goto_20

    .line 4562
    .restart local v0    # "i":I
    .restart local v1    # "tok":Lfreemarker/core/Token;
    :cond_42
    if-eqz v1, :cond_47

    invoke-direct {p0, p1, v0}, Lfreemarker/core/FMParser;->jj_add_error_token(II)V

    .line 4564
    .end local v0    # "i":I
    .end local v1    # "tok":Lfreemarker/core/Token;
    :cond_47
    iget-object v2, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iget v2, v2, Lfreemarker/core/Token;->kind:I

    if-eq v2, p1, :cond_4f

    const/4 v2, 0x1

    .line 4566
    :goto_4e
    return v2

    .line 4565
    :cond_4f
    iget v2, p0, Lfreemarker/core/FMParser;->jj_la:I

    if-nez v2, :cond_5c

    iget-object v2, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    iget-object v3, p0, Lfreemarker/core/FMParser;->jj_lastpos:Lfreemarker/core/Token;

    if-ne v2, v3, :cond_5c

    iget-object v2, p0, Lfreemarker/core/FMParser;->jj_ls:Lfreemarker/core/FMParser$LookaheadSuccess;

    throw v2

    .line 4566
    :cond_5c
    const/4 v2, 0x0

    goto :goto_4e
.end method

.method private notBooleanLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V
    .registers 6
    .param p1, "exp"    # Lfreemarker/core/Expression;
    .param p2, "expected"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 126
    instance-of v0, p1, Lfreemarker/core/BooleanLiteral;

    if-eqz v0, :cond_2b

    .line 127
    new-instance v0, Lfreemarker/core/ParseException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Found: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ". Expecting "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/core/TemplateObject;)V

    throw v0

    .line 129
    :cond_2b
    return-void
.end method

.method private notHashLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V
    .registers 6
    .param p1, "exp"    # Lfreemarker/core/Expression;
    .param p2, "expected"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 136
    instance-of v0, p1, Lfreemarker/core/HashLiteral;

    if-eqz v0, :cond_2b

    .line 137
    new-instance v0, Lfreemarker/core/ParseException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Found hash literal: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ". Expecting "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/core/TemplateObject;)V

    throw v0

    .line 141
    :cond_2b
    return-void
.end method

.method private notListLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V
    .registers 6
    .param p1, "exp"    # Lfreemarker/core/Expression;
    .param p2, "expected"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 151
    instance-of v0, p1, Lfreemarker/core/ListLiteral;

    if-eqz v0, :cond_2b

    .line 152
    new-instance v0, Lfreemarker/core/ParseException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Found list literal: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ". Expecting "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/core/TemplateObject;)V

    throw v0

    .line 156
    :cond_2b
    return-void
.end method

.method private notNumberLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V
    .registers 6
    .param p1, "exp"    # Lfreemarker/core/Expression;
    .param p2, "expected"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 114
    instance-of v0, p1, Lfreemarker/core/NumberLiteral;

    if-eqz v0, :cond_2b

    .line 115
    new-instance v0, Lfreemarker/core/ParseException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Found number literal: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ". Expecting "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/core/TemplateObject;)V

    throw v0

    .line 119
    :cond_2b
    return-void
.end method

.method private notStringLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V
    .registers 6
    .param p1, "exp"    # Lfreemarker/core/Expression;
    .param p2, "expected"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 102
    instance-of v0, p1, Lfreemarker/core/StringLiteral;

    if-eqz v0, :cond_27

    .line 103
    new-instance v0, Lfreemarker/core/ParseException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Found string literal: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ". Expecting: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/core/TemplateObject;)V

    throw v0

    .line 107
    :cond_27
    return-void
.end method

.method private numberLiteralOnly(Lfreemarker/core/Expression;)V
    .registers 3
    .param p1, "exp"    # Lfreemarker/core/Expression;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 162
    const-string v0, "number"

    invoke-direct {p0, p1, v0}, Lfreemarker/core/FMParser;->notStringLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 163
    const-string v0, "number"

    invoke-direct {p0, p1, v0}, Lfreemarker/core/FMParser;->notListLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 164
    const-string v0, "number"

    invoke-direct {p0, p1, v0}, Lfreemarker/core/FMParser;->notHashLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 165
    const-string v0, "number"

    invoke-direct {p0, p1, v0}, Lfreemarker/core/FMParser;->notBooleanLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 166
    return-void
.end method

.method private stringLiteralOnly(Lfreemarker/core/Expression;)V
    .registers 3
    .param p1, "exp"    # Lfreemarker/core/Expression;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 173
    const-string v0, "string"

    invoke-direct {p0, p1, v0}, Lfreemarker/core/FMParser;->notNumberLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 174
    const-string v0, "string"

    invoke-direct {p0, p1, v0}, Lfreemarker/core/FMParser;->notListLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 175
    const-string v0, "string"

    invoke-direct {p0, p1, v0}, Lfreemarker/core/FMParser;->notHashLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 176
    const-string v0, "string"

    invoke-direct {p0, p1, v0}, Lfreemarker/core/FMParser;->notBooleanLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 177
    return-void
.end method


# virtual methods
.method public final AddSubExpression(Lfreemarker/core/Expression;)Lfreemarker/core/Expression;
    .registers 7
    .param p1, "exp"    # Lfreemarker/core/Expression;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v4, -0x1

    .line 731
    const/4 v0, 0x0

    .line 732
    .local v0, "result":Lfreemarker/core/Expression;
    iget v1, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v1, v4, :cond_1e

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v1

    :goto_a
    sparse-switch v1, :sswitch_data_40

    .line 753
    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v2, 0xa

    iget v3, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v3, v1, v2

    .line 754
    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 755
    new-instance v1, Lfreemarker/core/ParseException;

    invoke-direct {v1}, Lfreemarker/core/ParseException;-><init>()V

    throw v1

    .line 732
    :cond_1e
    iget v1, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_a

    .line 734
    :sswitch_21
    invoke-virtual {p0, p1}, Lfreemarker/core/FMParser;->DotVariable(Lfreemarker/core/Expression;)Lfreemarker/core/Expression;

    move-result-object v0

    .line 757
    :goto_25
    return-object v0

    .line 737
    :sswitch_26
    invoke-virtual {p0, p1}, Lfreemarker/core/FMParser;->DynamicKey(Lfreemarker/core/Expression;)Lfreemarker/core/Expression;

    move-result-object v0

    .line 738
    goto :goto_25

    .line 740
    :sswitch_2b
    invoke-virtual {p0, p1}, Lfreemarker/core/FMParser;->MethodArgs(Lfreemarker/core/Expression;)Lfreemarker/core/MethodCall;

    move-result-object v0

    .line 741
    goto :goto_25

    .line 743
    :sswitch_30
    invoke-virtual {p0, p1}, Lfreemarker/core/FMParser;->BuiltIn(Lfreemarker/core/Expression;)Lfreemarker/core/Expression;

    move-result-object v0

    .line 744
    goto :goto_25

    .line 747
    :sswitch_35
    invoke-virtual {p0, p1}, Lfreemarker/core/FMParser;->DefaultTo(Lfreemarker/core/Expression;)Lfreemarker/core/Expression;

    move-result-object v0

    .line 748
    goto :goto_25

    .line 750
    :sswitch_3a
    invoke-virtual {p0, p1}, Lfreemarker/core/FMParser;->Exists(Lfreemarker/core/Expression;)Lfreemarker/core/Expression;

    move-result-object v0

    .line 751
    goto :goto_25

    .line 732
    nop

    :sswitch_data_40
    .sparse-switch
        0x57 -> :sswitch_21
        0x59 -> :sswitch_30
        0x5a -> :sswitch_3a
        0x6b -> :sswitch_35
        0x6f -> :sswitch_26
        0x71 -> :sswitch_2b
        0x81 -> :sswitch_35
    .end sparse-switch
.end method

.method public final AdditiveExpression()Lfreemarker/core/Expression;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v7, -0x1

    .line 402
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->MultiplicativeExpression()Lfreemarker/core/Expression;

    move-result-object v0

    .line 403
    .local v0, "lhs":Lfreemarker/core/Expression;
    move-object v2, v0

    .line 406
    .local v2, "result":Lfreemarker/core/Expression;
    :goto_6
    const v4, 0x7fffffff

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_2_2(I)Z

    move-result v4

    if-eqz v4, :cond_59

    .line 411
    iget v4, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v4, v7, :cond_2a

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v4

    :goto_17
    packed-switch v4, :pswitch_data_5a

    .line 421
    iget-object v4, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/4 v5, 0x4

    iget v6, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v6, v4, v5

    .line 422
    invoke-direct {p0, v7}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 423
    new-instance v4, Lfreemarker/core/ParseException;

    invoke-direct {v4}, Lfreemarker/core/ParseException;-><init>()V

    throw v4

    .line 411
    :cond_2a
    iget v4, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_17

    .line 413
    :pswitch_2d
    const/16 v4, 0x62

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 414
    const/4 v1, 0x1

    .line 425
    .local v1, "plus":Z
    :goto_33
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->MultiplicativeExpression()Lfreemarker/core/Expression;

    move-result-object v3

    .line 426
    .local v3, "rhs":Lfreemarker/core/Expression;
    if-eqz v1, :cond_4c

    .line 429
    new-instance v2, Lfreemarker/core/AddConcatExpression;

    .end local v2    # "result":Lfreemarker/core/Expression;
    invoke-direct {v2, v0, v3}, Lfreemarker/core/AddConcatExpression;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V

    .line 438
    .restart local v2    # "result":Lfreemarker/core/Expression;
    :goto_3e
    iget-object v4, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v2, v4, v0, v3}, Lfreemarker/core/Expression;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/TemplateObject;Lfreemarker/core/TemplateObject;)V

    .line 439
    move-object v0, v2

    goto :goto_6

    .line 417
    .end local v1    # "plus":Z
    .end local v3    # "rhs":Lfreemarker/core/Expression;
    :pswitch_45
    const/16 v4, 0x63

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 418
    const/4 v1, 0x0

    .line 419
    .restart local v1    # "plus":Z
    goto :goto_33

    .line 432
    .restart local v3    # "rhs":Lfreemarker/core/Expression;
    :cond_4c
    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->numberLiteralOnly(Lfreemarker/core/Expression;)V

    .line 433
    invoke-direct {p0, v3}, Lfreemarker/core/FMParser;->numberLiteralOnly(Lfreemarker/core/Expression;)V

    .line 434
    new-instance v2, Lfreemarker/core/ArithmeticExpression;

    .end local v2    # "result":Lfreemarker/core/Expression;
    const/4 v4, 0x0

    invoke-direct {v2, v0, v3, v4}, Lfreemarker/core/ArithmeticExpression;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;I)V

    .restart local v2    # "result":Lfreemarker/core/Expression;
    goto :goto_3e

    .line 441
    .end local v1    # "plus":Z
    .end local v3    # "rhs":Lfreemarker/core/Expression;
    :cond_59
    return-object v2

    .line 411
    :pswitch_data_5a
    .packed-switch 0x62
        :pswitch_2d
        :pswitch_45
    .end packed-switch
.end method

.method public final AndExpression()Lfreemarker/core/Expression;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 602
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->EqualityExpression()Lfreemarker/core/Expression;

    move-result-object v0

    .line 603
    .local v0, "lhs":Lfreemarker/core/Expression;
    move-object v1, v0

    .line 606
    .local v1, "result":Lfreemarker/core/Expression;
    :goto_5
    const v3, 0x7fffffff

    invoke-direct {p0, v3}, Lfreemarker/core/FMParser;->jj_2_8(I)Z

    move-result v3

    if-eqz v3, :cond_29

    .line 611
    const/16 v3, 0x69

    invoke-direct {p0, v3}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 612
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->EqualityExpression()Lfreemarker/core/Expression;

    move-result-object v2

    .line 613
    .local v2, "rhs":Lfreemarker/core/Expression;
    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->booleanLiteralOnly(Lfreemarker/core/Expression;)V

    .line 614
    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->booleanLiteralOnly(Lfreemarker/core/Expression;)V

    .line 615
    new-instance v1, Lfreemarker/core/AndExpression;

    .end local v1    # "result":Lfreemarker/core/Expression;
    invoke-direct {v1, v0, v2}, Lfreemarker/core/AndExpression;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V

    .line 616
    .restart local v1    # "result":Lfreemarker/core/Expression;
    iget-object v3, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v1, v3, v0, v2}, Lfreemarker/core/Expression;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/TemplateObject;Lfreemarker/core/TemplateObject;)V

    .line 617
    move-object v0, v1

    goto :goto_5

    .line 619
    .end local v2    # "rhs":Lfreemarker/core/Expression;
    :cond_29
    return-object v1
.end method

.method public final Assign()Lfreemarker/core/TemplateElement;
    .registers 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 1533
    const/4 v11, 0x0

    .line 1534
    .local v11, "id":Lfreemarker/core/Token;
    const/4 v13, 0x0

    .line 1536
    .local v13, "nsExp":Lfreemarker/core/Expression;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 1539
    .local v5, "assignments":Ljava/util/ArrayList;
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v17, v0

    const/16 v18, -0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_3b

    invoke-direct/range {p0 .. p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v17

    :goto_19
    packed-switch v17, :pswitch_data_31a

    .line 1557
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->jj_la1:[I

    move-object/from16 v17, v0

    const/16 v18, 0x20

    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_gen:I

    move/from16 v19, v0

    aput v19, v17, v18

    .line 1558
    const/16 v17, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1559
    new-instance v17, Lfreemarker/core/ParseException;

    invoke-direct/range {v17 .. v17}, Lfreemarker/core/ParseException;-><init>()V

    throw v17

    .line 1539
    :cond_3b
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v17, v0

    goto :goto_19

    .line 1541
    :pswitch_42
    const/16 v17, 0xe

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v15

    .line 1542
    .local v15, "start":Lfreemarker/core/Token;
    const/4 v14, 0x1

    .line 1561
    .local v14, "scope":I
    :cond_4d
    :goto_4d
    invoke-virtual/range {p0 .. p0}, Lfreemarker/core/FMParser;->IdentifierOrStringLiteral()Lfreemarker/core/Expression;

    move-result-object v12

    .line 1562
    .local v12, "nameExp":Lfreemarker/core/Expression;
    instance-of v0, v12, Lfreemarker/core/StringLiteral;

    move/from16 v17, v0

    if-eqz v17, :cond_cf

    move-object/from16 v17, v12

    check-cast v17, Lfreemarker/core/StringLiteral;

    invoke-virtual/range {v17 .. v17}, Lfreemarker/core/StringLiteral;->getAsString()Ljava/lang/String;

    move-result-object v16

    .line 1563
    .local v16, "varName":Ljava/lang/String;
    :goto_5f
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v17, v0

    const/16 v18, -0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_d4

    invoke-direct/range {p0 .. p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v17

    :goto_71
    sparse-switch v17, :sswitch_data_324

    .line 1649
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->jj_la1:[I

    move-object/from16 v17, v0

    const/16 v18, 0x25

    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_gen:I

    move/from16 v19, v0

    aput v19, v17, v18

    .line 1650
    const/16 v17, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1651
    new-instance v17, Lfreemarker/core/ParseException;

    invoke-direct/range {v17 .. v17}, Lfreemarker/core/ParseException;-><init>()V

    throw v17

    .line 1545
    .end local v12    # "nameExp":Lfreemarker/core/Expression;
    .end local v14    # "scope":I
    .end local v15    # "start":Lfreemarker/core/Token;
    .end local v16    # "varName":Ljava/lang/String;
    :pswitch_93
    const/16 v17, 0xf

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v15

    .line 1546
    .restart local v15    # "start":Lfreemarker/core/Token;
    const/4 v14, 0x3

    .line 1547
    .restart local v14    # "scope":I
    goto :goto_4d

    .line 1549
    .end local v14    # "scope":I
    .end local v15    # "start":Lfreemarker/core/Token;
    :pswitch_9f
    const/16 v17, 0x10

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v15

    .line 1550
    .restart local v15    # "start":Lfreemarker/core/Token;
    const/4 v14, 0x2

    .line 1551
    .restart local v14    # "scope":I
    const/4 v14, 0x2

    .line 1552
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lfreemarker/core/FMParser;->inMacro:Z

    move/from16 v17, v0

    if-nez v17, :cond_4d

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lfreemarker/core/FMParser;->inFunction:Z

    move/from16 v17, v0

    if-nez v17, :cond_4d

    .line 1553
    new-instance v17, Lfreemarker/core/ParseException;

    const-string v18, "Local variable assigned outside a macro."

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    move-object/from16 v19, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2, v15}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v17

    .line 1562
    .restart local v12    # "nameExp":Lfreemarker/core/Expression;
    :cond_cf
    invoke-virtual {v12}, Lfreemarker/core/Expression;->toString()Ljava/lang/String;

    move-result-object v16

    goto :goto_5f

    .line 1563
    .restart local v16    # "varName":Ljava/lang/String;
    :cond_d4
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v17, v0

    goto :goto_71

    .line 1565
    :sswitch_db
    const/16 v17, 0x5b

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1566
    invoke-virtual/range {p0 .. p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v9

    .line 1567
    .local v9, "exp":Lfreemarker/core/Expression;
    new-instance v4, Lfreemarker/core/Assignment;

    move-object/from16 v0, v16

    invoke-direct {v4, v0, v9, v14}, Lfreemarker/core/Assignment;-><init>(Ljava/lang/String;Lfreemarker/core/Expression;I)V

    .line 1568
    .local v4, "ass":Lfreemarker/core/Assignment;
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v4, v0, v12, v9}, Lfreemarker/core/Assignment;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/TemplateObject;Lfreemarker/core/TemplateObject;)V

    .line 1569
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1572
    :goto_fd
    const v17, 0x7fffffff

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_2_11(I)Z

    move-result v17

    if-eqz v17, :cond_17a

    .line 1577
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v17, v0

    const/16 v18, -0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_164

    invoke-direct/range {p0 .. p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v17

    :goto_11c
    packed-switch v17, :pswitch_data_332

    .line 1582
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->jj_la1:[I

    move-object/from16 v17, v0

    const/16 v18, 0x21

    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_gen:I

    move/from16 v19, v0

    aput v19, v17, v18

    .line 1585
    :goto_12f
    invoke-virtual/range {p0 .. p0}, Lfreemarker/core/FMParser;->IdentifierOrStringLiteral()Lfreemarker/core/Expression;

    move-result-object v12

    .line 1586
    instance-of v0, v12, Lfreemarker/core/StringLiteral;

    move/from16 v17, v0

    if-eqz v17, :cond_175

    move-object/from16 v17, v12

    check-cast v17, Lfreemarker/core/StringLiteral;

    invoke-virtual/range {v17 .. v17}, Lfreemarker/core/StringLiteral;->getAsString()Ljava/lang/String;

    move-result-object v16

    .line 1587
    :goto_141
    const/16 v17, 0x5b

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1588
    invoke-virtual/range {p0 .. p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v9

    .line 1589
    new-instance v4, Lfreemarker/core/Assignment;

    .end local v4    # "ass":Lfreemarker/core/Assignment;
    move-object/from16 v0, v16

    invoke-direct {v4, v0, v9, v14}, Lfreemarker/core/Assignment;-><init>(Ljava/lang/String;Lfreemarker/core/Expression;I)V

    .line 1590
    .restart local v4    # "ass":Lfreemarker/core/Assignment;
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v4, v0, v12, v9}, Lfreemarker/core/Assignment;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/TemplateObject;Lfreemarker/core/TemplateObject;)V

    .line 1591
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_fd

    .line 1577
    :cond_164
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v17, v0

    goto :goto_11c

    .line 1579
    :pswitch_16b
    const/16 v17, 0x6c

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    goto :goto_12f

    .line 1586
    :cond_175
    invoke-virtual {v12}, Lfreemarker/core/Expression;->toString()Ljava/lang/String;

    move-result-object v16

    goto :goto_141

    .line 1593
    :cond_17a
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v17, v0

    const/16 v18, -0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_1bf

    invoke-direct/range {p0 .. p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v17

    :goto_18c
    packed-switch v17, :pswitch_data_338

    .line 1600
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->jj_la1:[I

    move-object/from16 v17, v0

    const/16 v18, 0x22

    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_gen:I

    move/from16 v19, v0

    aput v19, v17, v18

    .line 1603
    :cond_19f
    invoke-virtual/range {p0 .. p0}, Lfreemarker/core/FMParser;->LooseDirectiveEnd()Lfreemarker/core/Token;

    move-result-object v8

    .line 1604
    .local v8, "end":Lfreemarker/core/Token;
    new-instance v3, Lfreemarker/core/AssignmentInstruction;

    invoke-direct {v3, v14}, Lfreemarker/core/AssignmentInstruction;-><init>(I)V

    .line 1605
    .local v3, "ai":Lfreemarker/core/AssignmentInstruction;
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_1a9
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v17

    move/from16 v0, v17

    if-ge v10, v0, :cond_1ee

    .line 1606
    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lfreemarker/core/Assignment;

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Lfreemarker/core/AssignmentInstruction;->addAssignment(Lfreemarker/core/Assignment;)V

    .line 1605
    add-int/lit8 v10, v10, 0x1

    goto :goto_1a9

    .line 1593
    .end local v3    # "ai":Lfreemarker/core/AssignmentInstruction;
    .end local v8    # "end":Lfreemarker/core/Token;
    .end local v10    # "i":I
    :cond_1bf
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v17, v0

    goto :goto_18c

    .line 1595
    :pswitch_1c6
    const/16 v17, 0x75

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v11

    .line 1596
    invoke-virtual/range {p0 .. p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v13

    .line 1597
    const/16 v17, 0x1

    move/from16 v0, v17

    if-eq v14, v0, :cond_19f

    new-instance v17, Lfreemarker/core/ParseException;

    const-string v18, "Cannot assign to namespace here."

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    move-object/from16 v19, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2, v11}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v17

    .line 1608
    .restart local v3    # "ai":Lfreemarker/core/AssignmentInstruction;
    .restart local v8    # "end":Lfreemarker/core/Token;
    .restart local v10    # "i":I
    :cond_1ee
    invoke-virtual {v3, v13}, Lfreemarker/core/AssignmentInstruction;->setNamespaceExp(Lfreemarker/core/Expression;)V

    .line 1609
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v3, v0, v15, v8}, Lfreemarker/core/AssignmentInstruction;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 1646
    .end local v3    # "ai":Lfreemarker/core/AssignmentInstruction;
    .end local v4    # "ass":Lfreemarker/core/Assignment;
    .end local v9    # "exp":Lfreemarker/core/Expression;
    .end local v10    # "i":I
    :goto_1fc
    return-object v3

    .line 1614
    .end local v8    # "end":Lfreemarker/core/Token;
    :sswitch_1fd
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v17, v0

    const/16 v18, -0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_263

    invoke-direct/range {p0 .. p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v17

    :goto_20f
    packed-switch v17, :pswitch_data_33e

    .line 1621
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->jj_la1:[I

    move-object/from16 v17, v0

    const/16 v18, 0x23

    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_gen:I

    move/from16 v19, v0

    aput v19, v17, v18

    .line 1624
    :cond_222
    const/16 v17, 0x7c

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1625
    invoke-virtual/range {p0 .. p0}, Lfreemarker/core/FMParser;->OptionalBlock()Lfreemarker/core/TemplateElement;

    move-result-object v7

    .line 1626
    .local v7, "block":Lfreemarker/core/TemplateElement;
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v17, v0

    const/16 v18, -0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_292

    invoke-direct/range {p0 .. p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v17

    :goto_241
    packed-switch v17, :pswitch_data_344

    .line 1640
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->jj_la1:[I

    move-object/from16 v17, v0

    const/16 v18, 0x24

    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_gen:I

    move/from16 v19, v0

    aput v19, v17, v18

    .line 1641
    const/16 v17, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1642
    new-instance v17, Lfreemarker/core/ParseException;

    invoke-direct/range {v17 .. v17}, Lfreemarker/core/ParseException;-><init>()V

    throw v17

    .line 1614
    .end local v7    # "block":Lfreemarker/core/TemplateElement;
    :cond_263
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v17, v0

    goto :goto_20f

    .line 1616
    :pswitch_26a
    const/16 v17, 0x75

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v11

    .line 1617
    invoke-virtual/range {p0 .. p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v13

    .line 1618
    const/16 v17, 0x1

    move/from16 v0, v17

    if-eq v14, v0, :cond_222

    new-instance v17, Lfreemarker/core/ParseException;

    const-string v18, "Cannot assign to namespace here."

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    move-object/from16 v19, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2, v11}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v17

    .line 1626
    .restart local v7    # "block":Lfreemarker/core/TemplateElement;
    :cond_292
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v17, v0

    goto :goto_241

    .line 1628
    :pswitch_299
    const/16 v17, 0x24

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v8

    .line 1629
    .restart local v8    # "end":Lfreemarker/core/Token;
    const/16 v17, 0x2

    move/from16 v0, v17

    if-eq v14, v0, :cond_305

    new-instance v17, Lfreemarker/core/ParseException;

    const-string v18, "Mismatched assignment tags."

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    move-object/from16 v19, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2, v8}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v17

    .line 1632
    .end local v8    # "end":Lfreemarker/core/Token;
    :pswitch_2bd
    const/16 v17, 0x26

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v8

    .line 1633
    .restart local v8    # "end":Lfreemarker/core/Token;
    const/16 v17, 0x1

    move/from16 v0, v17

    if-eq v14, v0, :cond_305

    new-instance v17, Lfreemarker/core/ParseException;

    const-string v18, "Mismatched assignment tags."

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    move-object/from16 v19, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2, v8}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v17

    .line 1636
    .end local v8    # "end":Lfreemarker/core/Token;
    :pswitch_2e1
    const/16 v17, 0x25

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v8

    .line 1637
    .restart local v8    # "end":Lfreemarker/core/Token;
    const/16 v17, 0x3

    move/from16 v0, v17

    if-eq v14, v0, :cond_305

    new-instance v17, Lfreemarker/core/ParseException;

    const-string v18, "Mismatched assignment tags"

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    move-object/from16 v19, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2, v8}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v17

    .line 1644
    :cond_305
    new-instance v6, Lfreemarker/core/BlockAssignment;

    move-object/from16 v0, v16

    invoke-direct {v6, v7, v0, v14, v13}, Lfreemarker/core/BlockAssignment;-><init>(Lfreemarker/core/TemplateElement;Ljava/lang/String;ILfreemarker/core/Expression;)V

    .line 1645
    .local v6, "ba":Lfreemarker/core/BlockAssignment;
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v6, v0, v15, v8}, Lfreemarker/core/BlockAssignment;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    move-object v3, v6

    .line 1646
    goto/16 :goto_1fc

    .line 1539
    :pswitch_data_31a
    .packed-switch 0xe
        :pswitch_42
        :pswitch_93
        :pswitch_9f
    .end packed-switch

    .line 1563
    :sswitch_data_324
    .sparse-switch
        0x5b -> :sswitch_db
        0x75 -> :sswitch_1fd
        0x7c -> :sswitch_1fd
    .end sparse-switch

    .line 1577
    :pswitch_data_332
    .packed-switch 0x6c
        :pswitch_16b
    .end packed-switch

    .line 1593
    :pswitch_data_338
    .packed-switch 0x75
        :pswitch_1c6
    .end packed-switch

    .line 1614
    :pswitch_data_33e
    .packed-switch 0x75
        :pswitch_26a
    .end packed-switch

    .line 1626
    :pswitch_data_344
    .packed-switch 0x24
        :pswitch_299
        :pswitch_2e1
        :pswitch_2bd
    .end packed-switch
.end method

.method public final Attempt()Lfreemarker/core/AttemptBlock;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v8, -0x1

    .line 1218
    const/4 v5, 0x6

    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v4

    .line 1219
    .local v4, "start":Lfreemarker/core/Token;
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->OptionalBlock()Lfreemarker/core/TemplateElement;

    move-result-object v0

    .line 1220
    .local v0, "block":Lfreemarker/core/TemplateElement;
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Recover()Lfreemarker/core/RecoveryBlock;

    move-result-object v2

    .line 1221
    .local v2, "recoveryBlock":Lfreemarker/core/RecoveryBlock;
    iget v5, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v5, v8, :cond_2a

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v5

    :goto_16
    packed-switch v5, :pswitch_data_46

    .line 1229
    iget-object v5, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v6, 0x17

    iget v7, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v7, v5, v6

    .line 1230
    invoke-direct {p0, v8}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1231
    new-instance v5, Lfreemarker/core/ParseException;

    invoke-direct {v5}, Lfreemarker/core/ParseException;-><init>()V

    throw v5

    .line 1221
    :cond_2a
    iget v5, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_16

    .line 1223
    :pswitch_2d
    const/16 v5, 0x21

    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 1233
    .local v1, "end":Lfreemarker/core/Token;
    :goto_33
    new-instance v3, Lfreemarker/core/AttemptBlock;

    invoke-direct {v3, v0, v2}, Lfreemarker/core/AttemptBlock;-><init>(Lfreemarker/core/TemplateElement;Lfreemarker/core/RecoveryBlock;)V

    .line 1234
    .local v3, "result":Lfreemarker/core/AttemptBlock;
    iget-object v5, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v3, v5, v4, v1}, Lfreemarker/core/AttemptBlock;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 1235
    return-object v3

    .line 1226
    .end local v1    # "end":Lfreemarker/core/Token;
    .end local v3    # "result":Lfreemarker/core/AttemptBlock;
    :pswitch_3e
    const/16 v5, 0x22

    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 1227
    .restart local v1    # "end":Lfreemarker/core/Token;
    goto :goto_33

    .line 1221
    nop

    :pswitch_data_46
    .packed-switch 0x21
        :pswitch_2d
        :pswitch_3e
    .end packed-switch
.end method

.method public final BooleanLiteral()Lfreemarker/core/Expression;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v5, -0x1

    .line 970
    iget v2, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v2, v5, :cond_1d

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v2

    :goto_9
    packed-switch v2, :pswitch_data_40

    .line 980
    iget-object v2, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v3, 0xf

    iget v4, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v4, v2, v3

    .line 981
    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 982
    new-instance v2, Lfreemarker/core/ParseException;

    invoke-direct {v2}, Lfreemarker/core/ParseException;-><init>()V

    throw v2

    .line 970
    :cond_1d
    iget v2, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_9

    .line 972
    :pswitch_20
    const/16 v2, 0x53

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 973
    .local v1, "t":Lfreemarker/core/Token;
    new-instance v0, Lfreemarker/core/BooleanLiteral;

    const/4 v2, 0x0

    invoke-direct {v0, v2}, Lfreemarker/core/BooleanLiteral;-><init>(Z)V

    .line 984
    .local v0, "result":Lfreemarker/core/Expression;
    :goto_2c
    iget-object v2, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v0, v2, v1, v1}, Lfreemarker/core/Expression;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 985
    return-object v0

    .line 976
    .end local v0    # "result":Lfreemarker/core/Expression;
    .end local v1    # "t":Lfreemarker/core/Token;
    :pswitch_32
    const/16 v2, 0x54

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 977
    .restart local v1    # "t":Lfreemarker/core/Token;
    new-instance v0, Lfreemarker/core/BooleanLiteral;

    const/4 v2, 0x1

    invoke-direct {v0, v2}, Lfreemarker/core/BooleanLiteral;-><init>(Z)V

    .line 978
    .restart local v0    # "result":Lfreemarker/core/Expression;
    goto :goto_2c

    .line 970
    nop

    :pswitch_data_40
    .packed-switch 0x53
        :pswitch_20
        :pswitch_32
    .end packed-switch
.end method

.method public final Break()Lfreemarker/core/BreakInstruction;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 1385
    const/16 v2, 0x2d

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 1386
    .local v1, "start":Lfreemarker/core/Token;
    iget v2, p0, Lfreemarker/core/FMParser;->loopNesting:I

    if-ge v2, v3, :cond_2c

    iget v2, p0, Lfreemarker/core/FMParser;->switchNesting:I

    if-ge v2, v3, :cond_2c

    .line 1388
    new-instance v2, Lfreemarker/core/ParseException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v4, v1, Lfreemarker/core/Token;->image:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " occurred outside a loop or a switch block."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-direct {v2, v3, v4, v1}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v2

    .line 1390
    :cond_2c
    new-instance v0, Lfreemarker/core/BreakInstruction;

    invoke-direct {v0}, Lfreemarker/core/BreakInstruction;-><init>()V

    .line 1391
    .local v0, "result":Lfreemarker/core/BreakInstruction;
    iget-object v2, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v0, v2, v1, v1}, Lfreemarker/core/BreakInstruction;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 1392
    return-object v0
.end method

.method public final BuiltIn(Lfreemarker/core/Expression;)Lfreemarker/core/Expression;
    .registers 7
    .param p1, "exp"    # Lfreemarker/core/Expression;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 802
    const/4 v2, 0x0

    .line 803
    .local v2, "t":Lfreemarker/core/Token;
    const/16 v3, 0x59

    invoke-direct {p0, v3}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 804
    const/16 v3, 0x78

    invoke-direct {p0, v3}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v2

    .line 805
    const/4 v1, 0x0

    .line 807
    .local v1, "result":Lfreemarker/core/BuiltIn;
    :try_start_d
    iget v3, p0, Lfreemarker/core/FMParser;->incompatibleImprovements:I

    iget-object v4, v2, Lfreemarker/core/Token;->image:Ljava/lang/String;

    invoke-static {v3, p1, v4}, Lfreemarker/core/BuiltIn;->newBuiltIn(ILfreemarker/core/Expression;Ljava/lang/String;)Lfreemarker/core/BuiltIn;
    :try_end_14
    .catch Lfreemarker/core/ParseException; {:try_start_d .. :try_end_14} :catch_1b

    move-result-object v1

    .line 813
    iget-object v3, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v1, v3, p1, v2}, Lfreemarker/core/BuiltIn;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/TemplateObject;Lfreemarker/core/Token;)V

    .line 814
    return-object v1

    .line 808
    :catch_1b
    move-exception v0

    .line 809
    .local v0, "pe":Lfreemarker/core/ParseException;
    iget v3, v2, Lfreemarker/core/Token;->beginLine:I

    iput v3, v0, Lfreemarker/core/ParseException;->lineNumber:I

    .line 810
    iget v3, v2, Lfreemarker/core/Token;->beginColumn:I

    iput v3, v0, Lfreemarker/core/ParseException;->columnNumber:I

    .line 811
    throw v0
.end method

.method public final BuiltinVariable()Lfreemarker/core/BuiltinVariable;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 710
    const/16 v4, 0x57

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v0

    .line 711
    .local v0, "dot":Lfreemarker/core/Token;
    const/16 v4, 0x78

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 712
    .local v1, "name":Lfreemarker/core/Token;
    const/4 v3, 0x0

    .line 714
    .local v3, "result":Lfreemarker/core/BuiltinVariable;
    :try_start_d
    new-instance v3, Lfreemarker/core/BuiltinVariable;

    .end local v3    # "result":Lfreemarker/core/BuiltinVariable;
    iget-object v4, v1, Lfreemarker/core/Token;->image:Ljava/lang/String;

    invoke-direct {v3, v4}, Lfreemarker/core/BuiltinVariable;-><init>(Ljava/lang/String;)V
    :try_end_14
    .catch Lfreemarker/core/ParseException; {:try_start_d .. :try_end_14} :catch_1a

    .line 720
    .restart local v3    # "result":Lfreemarker/core/BuiltinVariable;
    iget-object v4, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v3, v4, v0, v1}, Lfreemarker/core/BuiltinVariable;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 721
    return-object v3

    .line 715
    .end local v3    # "result":Lfreemarker/core/BuiltinVariable;
    :catch_1a
    move-exception v2

    .line 716
    .local v2, "pe":Lfreemarker/core/ParseException;
    iget v4, v0, Lfreemarker/core/Token;->beginLine:I

    iput v4, v2, Lfreemarker/core/ParseException;->lineNumber:I

    .line 717
    iget v4, v0, Lfreemarker/core/Token;->beginColumn:I

    iput v4, v2, Lfreemarker/core/ParseException;->columnNumber:I

    .line 718
    throw v2
.end method

.method public final Call()Lfreemarker/core/TemplateElement;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const v8, 0x7fffffff

    const/4 v10, 0x0

    .line 1980
    const/4 v3, 0x0

    .line 1981
    .local v3, "namedArgs":Ljava/util/HashMap;
    const/4 v4, 0x0

    .line 1982
    .local v4, "positionalArgs":Ljava/util/ArrayList;
    const/4 v2, 0x0

    .line 1983
    .local v2, "macroName":Ljava/lang/String;
    const/16 v7, 0x19

    invoke-direct {p0, v7}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v6

    .line 1984
    .local v6, "start":Lfreemarker/core/Token;
    const/16 v7, 0x78

    invoke-direct {p0, v7}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 1985
    .local v1, "id":Lfreemarker/core/Token;
    iget-object v2, v1, Lfreemarker/core/Token;->image:Ljava/lang/String;

    .line 1986
    invoke-direct {p0, v8}, Lfreemarker/core/FMParser;->jj_2_14(I)Z

    move-result v7

    if-eqz v7, :cond_39

    .line 1987
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->NamedArgs()Ljava/util/HashMap;

    move-result-object v3

    .line 2004
    :goto_1f
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->LooseDirectiveEnd()Lfreemarker/core/Token;

    move-result-object v0

    .line 2005
    .local v0, "end":Lfreemarker/core/Token;
    const/4 v5, 0x0

    .line 2006
    .local v5, "result":Lfreemarker/core/UnifiedCall;
    if-eqz v4, :cond_66

    .line 2007
    new-instance v5, Lfreemarker/core/UnifiedCall;

    .end local v5    # "result":Lfreemarker/core/UnifiedCall;
    new-instance v7, Lfreemarker/core/Identifier;

    invoke-direct {v7, v2}, Lfreemarker/core/Identifier;-><init>(Ljava/lang/String;)V

    invoke-direct {v5, v7, v4, v10, v10}, Lfreemarker/core/UnifiedCall;-><init>(Lfreemarker/core/Expression;Ljava/util/List;Lfreemarker/core/TemplateElement;Ljava/util/List;)V

    .line 2012
    .restart local v5    # "result":Lfreemarker/core/UnifiedCall;
    :goto_30
    const/4 v7, 0x1

    iput-boolean v7, v5, Lfreemarker/core/UnifiedCall;->legacySyntax:Z

    .line 2013
    iget-object v7, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v5, v7, v6, v0}, Lfreemarker/core/UnifiedCall;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 2014
    return-object v5

    .line 1989
    .end local v0    # "end":Lfreemarker/core/Token;
    .end local v5    # "result":Lfreemarker/core/UnifiedCall;
    :cond_39
    invoke-direct {p0, v8}, Lfreemarker/core/FMParser;->jj_2_13(I)Z

    move-result v7

    if-eqz v7, :cond_44

    .line 1990
    const/16 v7, 0x71

    invoke-direct {p0, v7}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1994
    :cond_44
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->PositionalArgs()Ljava/util/ArrayList;

    move-result-object v4

    .line 1995
    iget v7, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    const/4 v8, -0x1

    if-ne v7, v8, :cond_5d

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v7

    :goto_51
    packed-switch v7, :pswitch_data_72

    .line 2000
    iget-object v7, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v8, 0x38

    iget v9, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v9, v7, v8

    goto :goto_1f

    .line 1995
    :cond_5d
    iget v7, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_51

    .line 1997
    :pswitch_60
    const/16 v7, 0x72

    invoke-direct {p0, v7}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    goto :goto_1f

    .line 2010
    .restart local v0    # "end":Lfreemarker/core/Token;
    .restart local v5    # "result":Lfreemarker/core/UnifiedCall;
    :cond_66
    new-instance v5, Lfreemarker/core/UnifiedCall;

    .end local v5    # "result":Lfreemarker/core/UnifiedCall;
    new-instance v7, Lfreemarker/core/Identifier;

    invoke-direct {v7, v2}, Lfreemarker/core/Identifier;-><init>(Ljava/lang/String;)V

    invoke-direct {v5, v7, v3, v10, v10}, Lfreemarker/core/UnifiedCall;-><init>(Lfreemarker/core/Expression;Ljava/util/Map;Lfreemarker/core/TemplateElement;Ljava/util/List;)V

    .restart local v5    # "result":Lfreemarker/core/UnifiedCall;
    goto :goto_30

    .line 1995
    nop

    :pswitch_data_72
    .packed-switch 0x72
        :pswitch_60
    .end packed-switch
.end method

.method public final Case()Lfreemarker/core/Case;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v7, -0x1

    .line 2238
    iget v4, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v4, v7, :cond_30

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v4

    :goto_9
    packed-switch v4, :pswitch_data_62

    .line 2243
    iget-object v4, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v5, 0x42

    iget v6, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v6, v4, v5

    .line 2246
    :goto_14
    iget v4, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v4, v7, :cond_39

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v4

    :goto_1c
    sparse-switch v4, :sswitch_data_68

    .line 2257
    iget-object v4, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v5, 0x43

    iget v6, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v6, v4, v5

    .line 2258
    invoke-direct {p0, v7}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 2259
    new-instance v4, Lfreemarker/core/ParseException;

    invoke-direct {v4}, Lfreemarker/core/ParseException;-><init>()V

    throw v4

    .line 2238
    :cond_30
    iget v4, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_9

    .line 2240
    :pswitch_33
    const/16 v4, 0x44

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    goto :goto_14

    .line 2246
    :cond_39
    iget v4, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_1c

    .line 2248
    :sswitch_3c
    const/16 v4, 0xd

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 2249
    .local v3, "start":Lfreemarker/core/Token;
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v1

    .line 2250
    .local v1, "exp":Lfreemarker/core/Expression;
    const/16 v4, 0x7c

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 2261
    :goto_4b
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->OptionalBlock()Lfreemarker/core/TemplateElement;

    move-result-object v0

    .line 2262
    .local v0, "block":Lfreemarker/core/TemplateElement;
    new-instance v2, Lfreemarker/core/Case;

    invoke-direct {v2, v1, v0}, Lfreemarker/core/Case;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/TemplateElement;)V

    .line 2263
    .local v2, "result":Lfreemarker/core/Case;
    iget-object v4, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v2, v4, v3, v0}, Lfreemarker/core/Case;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/TemplateObject;)V

    .line 2264
    return-object v2

    .line 2253
    .end local v0    # "block":Lfreemarker/core/TemplateElement;
    .end local v1    # "exp":Lfreemarker/core/Expression;
    .end local v2    # "result":Lfreemarker/core/Case;
    .end local v3    # "start":Lfreemarker/core/Token;
    :sswitch_5a
    const/16 v4, 0x35

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 2254
    .restart local v3    # "start":Lfreemarker/core/Token;
    const/4 v1, 0x0

    .line 2255
    .restart local v1    # "exp":Lfreemarker/core/Expression;
    goto :goto_4b

    .line 2238
    :pswitch_data_62
    .packed-switch 0x44
        :pswitch_33
    .end packed-switch

    .line 2246
    :sswitch_data_68
    .sparse-switch
        0xd -> :sswitch_3c
        0x35 -> :sswitch_5a
    .end sparse-switch
.end method

.method public final Comment()Lfreemarker/core/Comment;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v7, -0x1

    .line 2110
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 2111
    .local v0, "buf":Ljava/lang/StringBuffer;
    iget v4, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v4, v7, :cond_22

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v4

    :goto_e
    packed-switch v4, :pswitch_data_46

    .line 2119
    iget-object v4, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v5, 0x3d

    iget v6, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v6, v4, v5

    .line 2120
    invoke-direct {p0, v7}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 2121
    new-instance v4, Lfreemarker/core/ParseException;

    invoke-direct {v4}, Lfreemarker/core/ParseException;-><init>()V

    throw v4

    .line 2111
    :cond_22
    iget v4, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_e

    .line 2113
    :pswitch_25
    const/16 v4, 0x1c

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 2123
    .local v3, "start":Lfreemarker/core/Token;
    :goto_2b
    invoke-virtual {p0, v0}, Lfreemarker/core/FMParser;->UnparsedContent(Ljava/lang/StringBuffer;)Lfreemarker/core/Token;

    move-result-object v1

    .line 2124
    .local v1, "end":Lfreemarker/core/Token;
    new-instance v2, Lfreemarker/core/Comment;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Lfreemarker/core/Comment;-><init>(Ljava/lang/String;)V

    .line 2125
    .local v2, "result":Lfreemarker/core/Comment;
    iget-object v4, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v2, v4, v3, v1}, Lfreemarker/core/Comment;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 2126
    return-object v2

    .line 2116
    .end local v1    # "end":Lfreemarker/core/Token;
    .end local v2    # "result":Lfreemarker/core/Comment;
    .end local v3    # "start":Lfreemarker/core/Token;
    :pswitch_3e
    const/16 v4, 0x1d

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 2117
    .restart local v3    # "start":Lfreemarker/core/Token;
    goto :goto_2b

    .line 2111
    nop

    :pswitch_data_46
    .packed-switch 0x1c
        :pswitch_25
        :pswitch_3e
    .end packed-switch
.end method

.method public final Compress()Lfreemarker/core/CompressedBlock;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 1855
    const/16 v4, 0x1b

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 1856
    .local v3, "start":Lfreemarker/core/Token;
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->OptionalBlock()Lfreemarker/core/TemplateElement;

    move-result-object v0

    .line 1857
    .local v0, "block":Lfreemarker/core/TemplateElement;
    const/16 v4, 0x29

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v2

    .line 1858
    .local v2, "end":Lfreemarker/core/Token;
    new-instance v1, Lfreemarker/core/CompressedBlock;

    invoke-direct {v1, v0}, Lfreemarker/core/CompressedBlock;-><init>(Lfreemarker/core/TemplateElement;)V

    .line 1859
    .local v1, "cb":Lfreemarker/core/CompressedBlock;
    iget-object v4, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v1, v4, v3, v2}, Lfreemarker/core/CompressedBlock;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 1860
    return-object v1
.end method

.method public final Content()Lfreemarker/core/TemplateElement;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v6, -0x1

    .line 2538
    new-instance v2, Lfreemarker/core/MixedContent;

    invoke-direct {v2}, Lfreemarker/core/MixedContent;-><init>()V

    .line 2539
    .local v2, "nodes":Lfreemarker/core/MixedContent;
    const/4 v0, 0x0

    .line 2540
    .local v0, "begin":Lfreemarker/core/TemplateElement;
    iget v3, p0, Lfreemarker/core/FMParser;->contentNesting:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lfreemarker/core/FMParser;->contentNesting:I

    .line 2543
    :pswitch_d
    iget v3, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v3, v6, :cond_29

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v3

    :goto_15
    packed-switch v3, :pswitch_data_68

    .line 2596
    :pswitch_18
    iget-object v3, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v4, 0x49

    iget v5, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v5, v3, v4

    .line 2597
    invoke-direct {p0, v6}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 2598
    new-instance v3, Lfreemarker/core/ParseException;

    invoke-direct {v3}, Lfreemarker/core/ParseException;-><init>()V

    throw v3

    .line 2543
    :cond_29
    iget v3, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_15

    .line 2547
    :pswitch_2c
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->PCData()Lfreemarker/core/TextBlock;

    move-result-object v1

    .line 2600
    .local v1, "elem":Lfreemarker/core/TemplateElement;
    :goto_30
    if-nez v0, :cond_33

    .line 2601
    move-object v0, v1

    .line 2603
    :cond_33
    invoke-virtual {v2, v1}, Lfreemarker/core/MixedContent;->addElement(Lfreemarker/core/TemplateElement;)V

    .line 2604
    iget v3, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v3, v6, :cond_64

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v3

    :goto_3e
    packed-switch v3, :pswitch_data_f2

    .line 2651
    :pswitch_41
    iget-object v3, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v4, 0x4a

    iget v5, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v5, v3, v4

    .line 2655
    iget v3, p0, Lfreemarker/core/FMParser;->contentNesting:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lfreemarker/core/FMParser;->contentNesting:I

    .line 2656
    iget-object v3, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v2, v3, v0, v1}, Lfreemarker/core/MixedContent;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/TemplateObject;Lfreemarker/core/TemplateObject;)V

    .line 2657
    return-object v2

    .line 2550
    .end local v1    # "elem":Lfreemarker/core/TemplateElement;
    :pswitch_55
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->StringOutput()Lfreemarker/core/DollarVariable;

    move-result-object v1

    .line 2551
    .restart local v1    # "elem":Lfreemarker/core/TemplateElement;
    goto :goto_30

    .line 2553
    .end local v1    # "elem":Lfreemarker/core/TemplateElement;
    :pswitch_5a
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->NumericalOutput()Lfreemarker/core/NumericalOutput;

    move-result-object v1

    .line 2554
    .restart local v1    # "elem":Lfreemarker/core/TemplateElement;
    goto :goto_30

    .line 2593
    .end local v1    # "elem":Lfreemarker/core/TemplateElement;
    :pswitch_5f
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->FreemarkerDirective()Lfreemarker/core/TemplateElement;

    move-result-object v1

    .line 2594
    .restart local v1    # "elem":Lfreemarker/core/TemplateElement;
    goto :goto_30

    .line 2604
    :cond_64
    iget v3, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_3e

    .line 2543
    nop

    :pswitch_data_68
    .packed-switch 0x6
        :pswitch_5f
        :pswitch_18
        :pswitch_5f
        :pswitch_18
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_18
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_18
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_18
        :pswitch_5f
        :pswitch_18
        :pswitch_5f
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_2c
        :pswitch_2c
        :pswitch_2c
        :pswitch_55
        :pswitch_5a
    .end packed-switch

    .line 2604
    :pswitch_data_f2
    .packed-switch 0x6
        :pswitch_d
        :pswitch_41
        :pswitch_d
        :pswitch_41
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_41
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_41
        :pswitch_41
        :pswitch_41
        :pswitch_41
        :pswitch_41
        :pswitch_41
        :pswitch_41
        :pswitch_41
        :pswitch_41
        :pswitch_41
        :pswitch_41
        :pswitch_41
        :pswitch_41
        :pswitch_41
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_41
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_41
        :pswitch_d
        :pswitch_41
        :pswitch_d
        :pswitch_41
        :pswitch_41
        :pswitch_41
        :pswitch_41
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
    .end packed-switch
.end method

.method public final DefaultTo(Lfreemarker/core/Expression;)Lfreemarker/core/Expression;
    .registers 9
    .param p1, "exp"    # Lfreemarker/core/Expression;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v6, -0x1

    .line 762
    const/4 v1, 0x0

    .line 764
    .local v1, "rhs":Lfreemarker/core/Expression;
    iget v3, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v3, v6, :cond_1e

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v3

    :goto_a
    sparse-switch v3, :sswitch_data_4e

    .line 777
    iget-object v3, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v4, 0xb

    iget v5, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v5, v3, v4

    .line 778
    invoke-direct {p0, v6}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 779
    new-instance v3, Lfreemarker/core/ParseException;

    invoke-direct {v3}, Lfreemarker/core/ParseException;-><init>()V

    throw v3

    .line 764
    :cond_1e
    iget v3, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_a

    .line 766
    :sswitch_21
    const/16 v3, 0x81

    invoke-direct {p0, v3}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v2

    .line 781
    .local v2, "t":Lfreemarker/core/Token;
    :cond_27
    :goto_27
    new-instance v0, Lfreemarker/core/DefaultToExpression;

    invoke-direct {v0, p1, v1}, Lfreemarker/core/DefaultToExpression;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V

    .line 782
    .local v0, "result":Lfreemarker/core/DefaultToExpression;
    if-nez v1, :cond_48

    .line 783
    iget-object v3, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v0, v3, p1, v2}, Lfreemarker/core/DefaultToExpression;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/TemplateObject;Lfreemarker/core/Token;)V

    .line 788
    :goto_33
    return-object v0

    .line 769
    .end local v0    # "result":Lfreemarker/core/DefaultToExpression;
    .end local v2    # "t":Lfreemarker/core/Token;
    :sswitch_34
    const/16 v3, 0x6b

    invoke-direct {p0, v3}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v2

    .line 770
    .restart local v2    # "t":Lfreemarker/core/Token;
    const v3, 0x7fffffff

    invoke-direct {p0, v3}, Lfreemarker/core/FMParser;->jj_2_10(I)Z

    move-result v3

    if-eqz v3, :cond_27

    .line 771
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v1

    goto :goto_27

    .line 786
    .restart local v0    # "result":Lfreemarker/core/DefaultToExpression;
    :cond_48
    iget-object v3, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v0, v3, p1, v1}, Lfreemarker/core/DefaultToExpression;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/TemplateObject;Lfreemarker/core/TemplateObject;)V

    goto :goto_33

    .line 764
    :sswitch_data_4e
    .sparse-switch
        0x6b -> :sswitch_34
        0x81 -> :sswitch_21
    .end sparse-switch
.end method

.method public final DotVariable(Lfreemarker/core/Expression;)Lfreemarker/core/Expression;
    .registers 8
    .param p1, "exp"    # Lfreemarker/core/Expression;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v5, -0x1

    .line 823
    const/16 v2, 0x57

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 824
    iget v2, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v2, v5, :cond_22

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v2

    :goto_e
    sparse-switch v2, :sswitch_data_dc

    .line 881
    iget-object v2, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v3, 0xd

    iget v4, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v4, v2, v3

    .line 882
    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 883
    new-instance v2, Lfreemarker/core/ParseException;

    invoke-direct {v2}, Lfreemarker/core/ParseException;-><init>()V

    throw v2

    .line 824
    :cond_22
    iget v2, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_e

    .line 826
    :sswitch_25
    const/16 v2, 0x78

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 885
    .local v1, "t":Lfreemarker/core/Token;
    :cond_2b
    :goto_2b
    const-string v2, "hash"

    invoke-direct {p0, p1, v2}, Lfreemarker/core/FMParser;->notListLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 886
    const-string v2, "hash"

    invoke-direct {p0, p1, v2}, Lfreemarker/core/FMParser;->notStringLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 887
    const-string v2, "hash"

    invoke-direct {p0, p1, v2}, Lfreemarker/core/FMParser;->notBooleanLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 888
    new-instance v0, Lfreemarker/core/Dot;

    iget-object v2, v1, Lfreemarker/core/Token;->image:Ljava/lang/String;

    invoke-direct {v0, p1, v2}, Lfreemarker/core/Dot;-><init>(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 889
    .local v0, "dot":Lfreemarker/core/Dot;
    iget-object v2, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v0, v2, p1, v1}, Lfreemarker/core/Dot;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/TemplateObject;Lfreemarker/core/Token;)V

    .line 890
    return-object v0

    .line 829
    .end local v0    # "dot":Lfreemarker/core/Dot;
    .end local v1    # "t":Lfreemarker/core/Token;
    :sswitch_47
    const/16 v2, 0x64

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 830
    .restart local v1    # "t":Lfreemarker/core/Token;
    goto :goto_2b

    .line 832
    .end local v1    # "t":Lfreemarker/core/Token;
    :sswitch_4e
    const/16 v2, 0x65

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 833
    .restart local v1    # "t":Lfreemarker/core/Token;
    goto :goto_2b

    .line 843
    .end local v1    # "t":Lfreemarker/core/Token;
    :sswitch_55
    iget v2, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v2, v5, :cond_71

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v2

    :goto_5d
    sparse-switch v2, :sswitch_data_10e

    .line 872
    iget-object v2, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v3, 0xc

    iget v4, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v4, v2, v3

    .line 873
    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 874
    new-instance v2, Lfreemarker/core/ParseException;

    invoke-direct {v2}, Lfreemarker/core/ParseException;-><init>()V

    throw v2

    .line 843
    :cond_71
    iget v2, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_5d

    .line 845
    :sswitch_74
    const/16 v2, 0x5e

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 876
    .restart local v1    # "t":Lfreemarker/core/Token;
    :goto_7a
    iget-object v2, v1, Lfreemarker/core/Token;->image:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isLetter(C)Z

    move-result v2

    if-nez v2, :cond_2b

    .line 877
    new-instance v2, Lfreemarker/core/ParseException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v4, v1, Lfreemarker/core/Token;->image:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " is not a valid identifier."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-direct {v2, v3, v4, v1}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v2

    .line 848
    .end local v1    # "t":Lfreemarker/core/Token;
    :sswitch_a4
    const/16 v2, 0x5f

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 849
    .restart local v1    # "t":Lfreemarker/core/Token;
    goto :goto_7a

    .line 851
    .end local v1    # "t":Lfreemarker/core/Token;
    :sswitch_ab
    const/16 v2, 0x60

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 852
    .restart local v1    # "t":Lfreemarker/core/Token;
    goto :goto_7a

    .line 854
    .end local v1    # "t":Lfreemarker/core/Token;
    :sswitch_b2
    const/16 v2, 0x61

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 855
    .restart local v1    # "t":Lfreemarker/core/Token;
    goto :goto_7a

    .line 857
    .end local v1    # "t":Lfreemarker/core/Token;
    :sswitch_b9
    const/16 v2, 0x53

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 858
    .restart local v1    # "t":Lfreemarker/core/Token;
    goto :goto_7a

    .line 860
    .end local v1    # "t":Lfreemarker/core/Token;
    :sswitch_c0
    const/16 v2, 0x54

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 861
    .restart local v1    # "t":Lfreemarker/core/Token;
    goto :goto_7a

    .line 863
    .end local v1    # "t":Lfreemarker/core/Token;
    :sswitch_c7
    const/16 v2, 0x75

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 864
    .restart local v1    # "t":Lfreemarker/core/Token;
    goto :goto_7a

    .line 866
    .end local v1    # "t":Lfreemarker/core/Token;
    :sswitch_ce
    const/16 v2, 0x76

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 867
    .restart local v1    # "t":Lfreemarker/core/Token;
    goto :goto_7a

    .line 869
    .end local v1    # "t":Lfreemarker/core/Token;
    :sswitch_d5
    const/16 v2, 0x77

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 870
    .restart local v1    # "t":Lfreemarker/core/Token;
    goto :goto_7a

    .line 824
    :sswitch_data_dc
    .sparse-switch
        0x53 -> :sswitch_55
        0x54 -> :sswitch_55
        0x5e -> :sswitch_55
        0x5f -> :sswitch_55
        0x60 -> :sswitch_55
        0x61 -> :sswitch_55
        0x64 -> :sswitch_47
        0x65 -> :sswitch_4e
        0x75 -> :sswitch_55
        0x76 -> :sswitch_55
        0x77 -> :sswitch_55
        0x78 -> :sswitch_25
    .end sparse-switch

    .line 843
    :sswitch_data_10e
    .sparse-switch
        0x53 -> :sswitch_b9
        0x54 -> :sswitch_c0
        0x5e -> :sswitch_74
        0x5f -> :sswitch_a4
        0x60 -> :sswitch_ab
        0x61 -> :sswitch_b2
        0x75 -> :sswitch_c7
        0x76 -> :sswitch_ce
        0x77 -> :sswitch_d5
    .end sparse-switch
.end method

.method public final DynamicKey(Lfreemarker/core/Expression;)Lfreemarker/core/Expression;
    .registers 6
    .param p1, "exp"    # Lfreemarker/core/Expression;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 901
    const/16 v3, 0x6f

    invoke-direct {p0, v3}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 902
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v0

    .line 903
    .local v0, "arg":Lfreemarker/core/Expression;
    const/16 v3, 0x70

    invoke-direct {p0, v3}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v2

    .line 904
    .local v2, "t":Lfreemarker/core/Token;
    const-string v3, "list or hash"

    invoke-direct {p0, p1, v3}, Lfreemarker/core/FMParser;->notBooleanLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 905
    const-string v3, "list or hash"

    invoke-direct {p0, p1, v3}, Lfreemarker/core/FMParser;->notNumberLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 906
    new-instance v1, Lfreemarker/core/DynamicKeyName;

    invoke-direct {v1, p1, v0}, Lfreemarker/core/DynamicKeyName;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V

    .line 907
    .local v1, "dkn":Lfreemarker/core/DynamicKeyName;
    iget-object v3, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v1, v3, p1, v2}, Lfreemarker/core/DynamicKeyName;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/TemplateObject;Lfreemarker/core/Token;)V

    .line 908
    return-object v1
.end method

.method public final EqualityExpression()Lfreemarker/core/Expression;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v7, -0x1

    .line 493
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->RelationalExpression()Lfreemarker/core/Expression;

    move-result-object v0

    .line 494
    .local v0, "lhs":Lfreemarker/core/Expression;
    move-object v1, v0

    .line 495
    .local v1, "result":Lfreemarker/core/Expression;
    const v4, 0x7fffffff

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_2_4(I)Z

    move-result v4

    if-eqz v4, :cond_57

    .line 496
    iget v4, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v4, v7, :cond_2a

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v4

    :goto_17
    packed-switch v4, :pswitch_data_66

    .line 507
    iget-object v4, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/4 v5, 0x6

    iget v6, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v6, v4, v5

    .line 508
    invoke-direct {p0, v7}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 509
    new-instance v4, Lfreemarker/core/ParseException;

    invoke-direct {v4}, Lfreemarker/core/ParseException;-><init>()V

    throw v4

    .line 496
    :cond_2a
    iget v4, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_17

    .line 498
    :pswitch_2d
    const/16 v4, 0x5d

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 511
    .local v3, "t":Lfreemarker/core/Token;
    :goto_33
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->RelationalExpression()Lfreemarker/core/Expression;

    move-result-object v2

    .line 512
    .local v2, "rhs":Lfreemarker/core/Expression;
    const-string v4, "scalar"

    invoke-direct {p0, v0, v4}, Lfreemarker/core/FMParser;->notHashLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 513
    const-string v4, "scalar"

    invoke-direct {p0, v2, v4}, Lfreemarker/core/FMParser;->notHashLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 514
    const-string v4, "scalar"

    invoke-direct {p0, v0, v4}, Lfreemarker/core/FMParser;->notListLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 515
    const-string v4, "scalar"

    invoke-direct {p0, v2, v4}, Lfreemarker/core/FMParser;->notListLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 516
    new-instance v1, Lfreemarker/core/ComparisonExpression;

    .end local v1    # "result":Lfreemarker/core/Expression;
    iget-object v4, v3, Lfreemarker/core/Token;->image:Ljava/lang/String;

    invoke-direct {v1, v0, v2, v4}, Lfreemarker/core/ComparisonExpression;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 517
    .restart local v1    # "result":Lfreemarker/core/Expression;
    iget-object v4, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v1, v4, v0, v2}, Lfreemarker/core/Expression;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/TemplateObject;Lfreemarker/core/TemplateObject;)V

    .line 521
    .end local v2    # "rhs":Lfreemarker/core/Expression;
    .end local v3    # "t":Lfreemarker/core/Token;
    :cond_57
    return-object v1

    .line 501
    :pswitch_58
    const/16 v4, 0x5b

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 502
    .restart local v3    # "t":Lfreemarker/core/Token;
    goto :goto_33

    .line 504
    .end local v3    # "t":Lfreemarker/core/Token;
    :pswitch_5f
    const/16 v4, 0x5c

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 505
    .restart local v3    # "t":Lfreemarker/core/Token;
    goto :goto_33

    .line 496
    :pswitch_data_66
    .packed-switch 0x5b
        :pswitch_58
        :pswitch_5f
        :pswitch_2d
    .end packed-switch
.end method

.method public final Escape()Lfreemarker/core/EscapeBlock;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 2272
    const/16 v6, 0x3b

    invoke-direct {p0, v6}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v4

    .line 2273
    .local v4, "start":Lfreemarker/core/Token;
    const/16 v6, 0x78

    invoke-direct {p0, v6}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v5

    .line 2274
    .local v5, "variable":Lfreemarker/core/Token;
    const/16 v6, 0x76

    invoke-direct {p0, v6}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 2275
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v2

    .line 2276
    .local v2, "escapeExpr":Lfreemarker/core/Expression;
    const/16 v6, 0x7c

    invoke-direct {p0, v6}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 2277
    new-instance v3, Lfreemarker/core/EscapeBlock;

    iget-object v6, v5, Lfreemarker/core/Token;->image:Ljava/lang/String;

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->escapedExpression(Lfreemarker/core/Expression;)Lfreemarker/core/Expression;

    move-result-object v7

    invoke-direct {v3, v6, v2, v7}, Lfreemarker/core/EscapeBlock;-><init>(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V

    .line 2278
    .local v3, "result":Lfreemarker/core/EscapeBlock;
    iget-object v6, p0, Lfreemarker/core/FMParser;->escapes:Ljava/util/LinkedList;

    invoke-virtual {v6, v3}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 2279
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->OptionalBlock()Lfreemarker/core/TemplateElement;

    move-result-object v0

    .line 2280
    .local v0, "content":Lfreemarker/core/TemplateElement;
    invoke-virtual {v3, v0}, Lfreemarker/core/EscapeBlock;->setContent(Lfreemarker/core/TemplateElement;)V

    .line 2281
    iget-object v6, p0, Lfreemarker/core/FMParser;->escapes:Ljava/util/LinkedList;

    invoke-virtual {v6}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 2282
    const/16 v6, 0x3c

    invoke-direct {p0, v6}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 2283
    .local v1, "end":Lfreemarker/core/Token;
    iget-object v6, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v3, v6, v4, v1}, Lfreemarker/core/EscapeBlock;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 2284
    return-object v3
.end method

.method public final Exists(Lfreemarker/core/Expression;)Lfreemarker/core/Expression;
    .registers 5
    .param p1, "exp"    # Lfreemarker/core/Expression;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 794
    const/16 v2, 0x5a

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 795
    .local v1, "t":Lfreemarker/core/Token;
    new-instance v0, Lfreemarker/core/ExistsExpression;

    invoke-direct {v0, p1}, Lfreemarker/core/ExistsExpression;-><init>(Lfreemarker/core/Expression;)V

    .line 796
    .local v0, "result":Lfreemarker/core/ExistsExpression;
    iget-object v2, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v0, v2, p1, v1}, Lfreemarker/core/ExistsExpression;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/TemplateObject;Lfreemarker/core/Token;)V

    .line 797
    return-object v0
.end method

.method public final Expression()Lfreemarker/core/Expression;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 238
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->OrExpression()Lfreemarker/core/Expression;

    move-result-object v0

    .line 239
    .local v0, "exp":Lfreemarker/core/Expression;
    return-object v0
.end method

.method public final FallBack()Lfreemarker/core/FallbackInstruction;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 1370
    const/16 v2, 0x3a

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 1371
    .local v1, "tok":Lfreemarker/core/Token;
    iget-boolean v2, p0, Lfreemarker/core/FMParser;->inMacro:Z

    if-nez v2, :cond_14

    .line 1372
    new-instance v2, Lfreemarker/core/ParseException;

    const-string v3, "Cannot fall back outside a macro."

    iget-object v4, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-direct {v2, v3, v4, v1}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v2

    .line 1374
    :cond_14
    new-instance v0, Lfreemarker/core/FallbackInstruction;

    invoke-direct {v0}, Lfreemarker/core/FallbackInstruction;-><init>()V

    .line 1375
    .local v0, "result":Lfreemarker/core/FallbackInstruction;
    iget-object v2, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v0, v2, v1, v1}, Lfreemarker/core/FallbackInstruction;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 1376
    return-object v0
.end method

.method public final Flush()Lfreemarker/core/TemplateElement;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 1493
    const/16 v2, 0x30

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 1494
    .local v1, "t":Lfreemarker/core/Token;
    new-instance v0, Lfreemarker/core/FlushInstruction;

    invoke-direct {v0}, Lfreemarker/core/FlushInstruction;-><init>()V

    .line 1495
    .local v0, "result":Lfreemarker/core/FlushInstruction;
    iget-object v2, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v0, v2, v1, v1}, Lfreemarker/core/FlushInstruction;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 1496
    return-object v0
.end method

.method public final ForEach()Lfreemarker/core/IteratorBlock;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 1276
    const/16 v6, 0xb

    invoke-direct {p0, v6}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v5

    .line 1277
    .local v5, "start":Lfreemarker/core/Token;
    iget v6, p0, Lfreemarker/core/FMParser;->loopNesting:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lfreemarker/core/FMParser;->loopNesting:I

    .line 1278
    const/16 v6, 0x78

    invoke-direct {p0, v6}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 1279
    .local v3, "index":Lfreemarker/core/Token;
    const/16 v6, 0x75

    invoke-direct {p0, v6}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1280
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v2

    .line 1281
    .local v2, "exp":Lfreemarker/core/Expression;
    const/16 v6, 0x7c

    invoke-direct {p0, v6}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1282
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->OptionalBlock()Lfreemarker/core/TemplateElement;

    move-result-object v0

    .line 1283
    .local v0, "block":Lfreemarker/core/TemplateElement;
    const/16 v6, 0x23

    invoke-direct {p0, v6}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 1284
    .local v1, "end":Lfreemarker/core/Token;
    iget v6, p0, Lfreemarker/core/FMParser;->loopNesting:I

    add-int/lit8 v6, v6, -0x1

    iput v6, p0, Lfreemarker/core/FMParser;->loopNesting:I

    .line 1285
    new-instance v4, Lfreemarker/core/IteratorBlock;

    iget-object v6, v3, Lfreemarker/core/Token;->image:Ljava/lang/String;

    const/4 v7, 0x1

    invoke-direct {v4, v2, v6, v0, v7}, Lfreemarker/core/IteratorBlock;-><init>(Lfreemarker/core/Expression;Ljava/lang/String;Lfreemarker/core/TemplateElement;Z)V

    .line 1289
    .local v4, "result":Lfreemarker/core/IteratorBlock;
    iget-object v6, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v4, v6, v5, v1}, Lfreemarker/core/IteratorBlock;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 1290
    return-object v4
.end method

.method public final FreeMarkerText()Lfreemarker/core/TemplateElement;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v6, -0x1

    .line 2666
    new-instance v2, Lfreemarker/core/MixedContent;

    invoke-direct {v2}, Lfreemarker/core/MixedContent;-><init>()V

    .line 2667
    .local v2, "nodes":Lfreemarker/core/MixedContent;
    const/4 v0, 0x0

    .line 2670
    .local v0, "begin":Lfreemarker/core/TemplateElement;
    :pswitch_7
    iget v3, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v3, v6, :cond_23

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v3

    :goto_f
    packed-switch v3, :pswitch_data_56

    .line 2683
    iget-object v3, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v4, 0x4b

    iget v5, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v5, v3, v4

    .line 2684
    invoke-direct {p0, v6}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 2685
    new-instance v3, Lfreemarker/core/ParseException;

    invoke-direct {v3}, Lfreemarker/core/ParseException;-><init>()V

    throw v3

    .line 2670
    :cond_23
    iget v3, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_f

    .line 2674
    :pswitch_26
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->PCData()Lfreemarker/core/TextBlock;

    move-result-object v1

    .line 2687
    .local v1, "elem":Lfreemarker/core/TemplateElement;
    :goto_2a
    if-nez v0, :cond_2d

    .line 2688
    move-object v0, v1

    .line 2690
    :cond_2d
    invoke-virtual {v2, v1}, Lfreemarker/core/MixedContent;->addElement(Lfreemarker/core/TemplateElement;)V

    .line 2691
    iget v3, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v3, v6, :cond_53

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v3

    :goto_38
    packed-switch v3, :pswitch_data_64

    .line 2700
    iget-object v3, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v4, 0x4c

    iget v5, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v5, v3, v4

    .line 2704
    iget-object v3, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v2, v3, v0, v1}, Lfreemarker/core/MixedContent;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/TemplateObject;Lfreemarker/core/TemplateObject;)V

    .line 2705
    return-object v2

    .line 2677
    .end local v1    # "elem":Lfreemarker/core/TemplateElement;
    :pswitch_49
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->StringOutput()Lfreemarker/core/DollarVariable;

    move-result-object v1

    .line 2678
    .restart local v1    # "elem":Lfreemarker/core/TemplateElement;
    goto :goto_2a

    .line 2680
    .end local v1    # "elem":Lfreemarker/core/TemplateElement;
    :pswitch_4e
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->NumericalOutput()Lfreemarker/core/NumericalOutput;

    move-result-object v1

    .line 2681
    .restart local v1    # "elem":Lfreemarker/core/TemplateElement;
    goto :goto_2a

    .line 2691
    :cond_53
    iget v3, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_38

    .line 2670
    :pswitch_data_56
    .packed-switch 0x44
        :pswitch_26
        :pswitch_26
        :pswitch_26
        :pswitch_49
        :pswitch_4e
    .end packed-switch

    .line 2691
    :pswitch_data_64
    .packed-switch 0x44
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
    .end packed-switch
.end method

.method public final FreemarkerDirective()Lfreemarker/core/TemplateElement;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v4, -0x1

    .line 2345
    iget v1, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v1, v4, :cond_1d

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v1

    :goto_9
    packed-switch v1, :pswitch_data_a8

    .line 2439
    :pswitch_c
    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v2, 0x45

    iget v3, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v3, v1, v2

    .line 2440
    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 2441
    new-instance v1, Lfreemarker/core/ParseException;

    invoke-direct {v1}, Lfreemarker/core/ParseException;-><init>()V

    throw v1

    .line 2345
    :cond_1d
    iget v1, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_9

    .line 2347
    :pswitch_20
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->If()Lfreemarker/core/TemplateElement;

    move-result-object v0

    .line 2443
    .local v0, "tp":Lfreemarker/core/TemplateElement;
    :goto_24
    return-object v0

    .line 2350
    .end local v0    # "tp":Lfreemarker/core/TemplateElement;
    :pswitch_25
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->List()Lfreemarker/core/IteratorBlock;

    move-result-object v0

    .line 2351
    .restart local v0    # "tp":Lfreemarker/core/TemplateElement;
    goto :goto_24

    .line 2353
    .end local v0    # "tp":Lfreemarker/core/TemplateElement;
    :pswitch_2a
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->ForEach()Lfreemarker/core/IteratorBlock;

    move-result-object v0

    .line 2354
    .restart local v0    # "tp":Lfreemarker/core/TemplateElement;
    goto :goto_24

    .line 2358
    .end local v0    # "tp":Lfreemarker/core/TemplateElement;
    :pswitch_2f
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Assign()Lfreemarker/core/TemplateElement;

    move-result-object v0

    .line 2359
    .restart local v0    # "tp":Lfreemarker/core/TemplateElement;
    goto :goto_24

    .line 2361
    .end local v0    # "tp":Lfreemarker/core/TemplateElement;
    :pswitch_34
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Include()Lfreemarker/core/Include;

    move-result-object v0

    .line 2362
    .restart local v0    # "tp":Lfreemarker/core/TemplateElement;
    goto :goto_24

    .line 2364
    .end local v0    # "tp":Lfreemarker/core/TemplateElement;
    :pswitch_39
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Import()Lfreemarker/core/LibraryLoad;

    move-result-object v0

    .line 2365
    .restart local v0    # "tp":Lfreemarker/core/TemplateElement;
    goto :goto_24

    .line 2368
    .end local v0    # "tp":Lfreemarker/core/TemplateElement;
    :pswitch_3e
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Macro()Lfreemarker/core/Macro;

    move-result-object v0

    .line 2369
    .restart local v0    # "tp":Lfreemarker/core/TemplateElement;
    goto :goto_24

    .line 2371
    .end local v0    # "tp":Lfreemarker/core/TemplateElement;
    :pswitch_43
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Compress()Lfreemarker/core/CompressedBlock;

    move-result-object v0

    .line 2372
    .restart local v0    # "tp":Lfreemarker/core/TemplateElement;
    goto :goto_24

    .line 2374
    .end local v0    # "tp":Lfreemarker/core/TemplateElement;
    :pswitch_48
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->UnifiedMacroTransform()Lfreemarker/core/TemplateElement;

    move-result-object v0

    .line 2375
    .restart local v0    # "tp":Lfreemarker/core/TemplateElement;
    goto :goto_24

    .line 2377
    .end local v0    # "tp":Lfreemarker/core/TemplateElement;
    :pswitch_4d
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Call()Lfreemarker/core/TemplateElement;

    move-result-object v0

    .line 2378
    .restart local v0    # "tp":Lfreemarker/core/TemplateElement;
    goto :goto_24

    .line 2381
    .end local v0    # "tp":Lfreemarker/core/TemplateElement;
    :pswitch_52
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Comment()Lfreemarker/core/Comment;

    move-result-object v0

    .line 2382
    .restart local v0    # "tp":Lfreemarker/core/TemplateElement;
    goto :goto_24

    .line 2384
    .end local v0    # "tp":Lfreemarker/core/TemplateElement;
    :pswitch_57
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->NoParse()Lfreemarker/core/TextBlock;

    move-result-object v0

    .line 2385
    .restart local v0    # "tp":Lfreemarker/core/TemplateElement;
    goto :goto_24

    .line 2387
    .end local v0    # "tp":Lfreemarker/core/TemplateElement;
    :pswitch_5c
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Transform()Lfreemarker/core/TransformBlock;

    move-result-object v0

    .line 2388
    .restart local v0    # "tp":Lfreemarker/core/TemplateElement;
    goto :goto_24

    .line 2390
    .end local v0    # "tp":Lfreemarker/core/TemplateElement;
    :pswitch_61
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Switch()Lfreemarker/core/SwitchBlock;

    move-result-object v0

    .line 2391
    .restart local v0    # "tp":Lfreemarker/core/TemplateElement;
    goto :goto_24

    .line 2393
    .end local v0    # "tp":Lfreemarker/core/TemplateElement;
    :pswitch_66
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Setting()Lfreemarker/core/PropertySetting;

    move-result-object v0

    .line 2394
    .restart local v0    # "tp":Lfreemarker/core/TemplateElement;
    goto :goto_24

    .line 2396
    .end local v0    # "tp":Lfreemarker/core/TemplateElement;
    :pswitch_6b
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Break()Lfreemarker/core/BreakInstruction;

    move-result-object v0

    .line 2397
    .restart local v0    # "tp":Lfreemarker/core/TemplateElement;
    goto :goto_24

    .line 2400
    .end local v0    # "tp":Lfreemarker/core/TemplateElement;
    :pswitch_70
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Return()Lfreemarker/core/ReturnInstruction;

    move-result-object v0

    .line 2401
    .restart local v0    # "tp":Lfreemarker/core/TemplateElement;
    goto :goto_24

    .line 2404
    .end local v0    # "tp":Lfreemarker/core/TemplateElement;
    :pswitch_75
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Stop()Lfreemarker/core/StopInstruction;

    move-result-object v0

    .line 2405
    .restart local v0    # "tp":Lfreemarker/core/TemplateElement;
    goto :goto_24

    .line 2407
    .end local v0    # "tp":Lfreemarker/core/TemplateElement;
    :pswitch_7a
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Flush()Lfreemarker/core/TemplateElement;

    move-result-object v0

    .line 2408
    .restart local v0    # "tp":Lfreemarker/core/TemplateElement;
    goto :goto_24

    .line 2413
    .end local v0    # "tp":Lfreemarker/core/TemplateElement;
    :pswitch_7f
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Trim()Lfreemarker/core/TemplateElement;

    move-result-object v0

    .line 2414
    .restart local v0    # "tp":Lfreemarker/core/TemplateElement;
    goto :goto_24

    .line 2417
    .end local v0    # "tp":Lfreemarker/core/TemplateElement;
    :pswitch_84
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Nested()Lfreemarker/core/TemplateElement;

    move-result-object v0

    .line 2418
    .restart local v0    # "tp":Lfreemarker/core/TemplateElement;
    goto :goto_24

    .line 2420
    .end local v0    # "tp":Lfreemarker/core/TemplateElement;
    :pswitch_89
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Escape()Lfreemarker/core/EscapeBlock;

    move-result-object v0

    .line 2421
    .restart local v0    # "tp":Lfreemarker/core/TemplateElement;
    goto :goto_24

    .line 2423
    .end local v0    # "tp":Lfreemarker/core/TemplateElement;
    :pswitch_8e
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->NoEscape()Lfreemarker/core/NoEscapeBlock;

    move-result-object v0

    .line 2424
    .restart local v0    # "tp":Lfreemarker/core/TemplateElement;
    goto :goto_24

    .line 2426
    .end local v0    # "tp":Lfreemarker/core/TemplateElement;
    :pswitch_93
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Visit()Lfreemarker/core/VisitNode;

    move-result-object v0

    .line 2427
    .restart local v0    # "tp":Lfreemarker/core/TemplateElement;
    goto :goto_24

    .line 2430
    .end local v0    # "tp":Lfreemarker/core/TemplateElement;
    :pswitch_98
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Recurse()Lfreemarker/core/RecurseNode;

    move-result-object v0

    .line 2431
    .restart local v0    # "tp":Lfreemarker/core/TemplateElement;
    goto :goto_24

    .line 2433
    .end local v0    # "tp":Lfreemarker/core/TemplateElement;
    :pswitch_9d
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->FallBack()Lfreemarker/core/FallbackInstruction;

    move-result-object v0

    .line 2434
    .restart local v0    # "tp":Lfreemarker/core/TemplateElement;
    goto :goto_24

    .line 2436
    .end local v0    # "tp":Lfreemarker/core/TemplateElement;
    :pswitch_a2
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Attempt()Lfreemarker/core/AttemptBlock;

    move-result-object v0

    .line 2437
    .restart local v0    # "tp":Lfreemarker/core/TemplateElement;
    goto/16 :goto_24

    .line 2345
    :pswitch_data_a8
    .packed-switch 0x6
        :pswitch_a2
        :pswitch_c
        :pswitch_20
        :pswitch_c
        :pswitch_25
        :pswitch_2a
        :pswitch_61
        :pswitch_c
        :pswitch_2f
        :pswitch_2f
        :pswitch_2f
        :pswitch_34
        :pswitch_39
        :pswitch_3e
        :pswitch_3e
        :pswitch_5c
        :pswitch_93
        :pswitch_75
        :pswitch_70
        :pswitch_4d
        :pswitch_66
        :pswitch_43
        :pswitch_52
        :pswitch_52
        :pswitch_57
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_6b
        :pswitch_70
        :pswitch_75
        :pswitch_7a
        :pswitch_7f
        :pswitch_7f
        :pswitch_7f
        :pswitch_7f
        :pswitch_c
        :pswitch_84
        :pswitch_84
        :pswitch_98
        :pswitch_98
        :pswitch_9d
        :pswitch_89
        :pswitch_c
        :pswitch_8e
        :pswitch_c
        :pswitch_48
    .end packed-switch
.end method

.method public final HashLiteral()Lfreemarker/core/HashLiteral;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x6e

    const/16 v8, 0x6c

    const/4 v10, -0x1

    .line 992
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 993
    .local v3, "keys":Ljava/util/ArrayList;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 994
    .local v6, "values":Ljava/util/ArrayList;
    const/16 v7, 0x73

    invoke-direct {p0, v7}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v0

    .line 995
    .local v0, "begin":Lfreemarker/core/Token;
    iget v7, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v7, v10, :cond_39

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v7

    :goto_1d
    sparse-switch v7, :sswitch_data_c6

    .line 1058
    iget-object v7, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v8, 0x13

    iget v9, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v9, v7, v8

    .line 1061
    :goto_28
    const/16 v7, 0x74

    invoke-direct {p0, v7}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 1062
    .local v1, "end":Lfreemarker/core/Token;
    new-instance v4, Lfreemarker/core/HashLiteral;

    invoke-direct {v4, v3, v6}, Lfreemarker/core/HashLiteral;-><init>(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 1063
    .local v4, "result":Lfreemarker/core/HashLiteral;
    iget-object v7, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v4, v7, v0, v1}, Lfreemarker/core/HashLiteral;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 1064
    return-object v4

    .line 995
    .end local v1    # "end":Lfreemarker/core/Token;
    .end local v4    # "result":Lfreemarker/core/HashLiteral;
    :cond_39
    iget v7, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_1d

    .line 1010
    :sswitch_3c
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v2

    .line 1011
    .local v2, "key":Lfreemarker/core/Expression;
    iget v7, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v7, v10, :cond_5c

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v7

    :goto_48
    packed-switch v7, :pswitch_data_100

    .line 1019
    :pswitch_4b
    iget-object v7, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v8, 0x10

    iget v9, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v9, v7, v8

    .line 1020
    invoke-direct {p0, v10}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1021
    new-instance v7, Lfreemarker/core/ParseException;

    invoke-direct {v7}, Lfreemarker/core/ParseException;-><init>()V

    throw v7

    .line 1011
    :cond_5c
    iget v7, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_48

    .line 1013
    :pswitch_5f
    invoke-direct {p0, v8}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1023
    :goto_62
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v5

    .line 1024
    .local v5, "value":Lfreemarker/core/Expression;
    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->stringLiteralOnly(Lfreemarker/core/Expression;)V

    .line 1025
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1026
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1029
    :goto_6f
    iget v7, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v7, v10, :cond_87

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v7

    :goto_77
    packed-switch v7, :pswitch_data_10a

    .line 1034
    iget-object v7, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v8, 0x11

    iget v9, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v9, v7, v8

    goto :goto_28

    .line 1016
    .end local v5    # "value":Lfreemarker/core/Expression;
    :pswitch_83
    invoke-direct {p0, v9}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    goto :goto_62

    .line 1029
    .restart local v5    # "value":Lfreemarker/core/Expression;
    :cond_87
    iget v7, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_77

    .line 1037
    :pswitch_8a
    invoke-direct {p0, v8}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1038
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v2

    .line 1039
    iget v7, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v7, v10, :cond_ad

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v7

    :goto_99
    packed-switch v7, :pswitch_data_110

    .line 1047
    :pswitch_9c
    iget-object v7, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v8, 0x12

    iget v9, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v9, v7, v8

    .line 1048
    invoke-direct {p0, v10}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1049
    new-instance v7, Lfreemarker/core/ParseException;

    invoke-direct {v7}, Lfreemarker/core/ParseException;-><init>()V

    throw v7

    .line 1039
    :cond_ad
    iget v7, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_99

    .line 1041
    :pswitch_b0
    invoke-direct {p0, v8}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1051
    :goto_b3
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v5

    .line 1052
    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->stringLiteralOnly(Lfreemarker/core/Expression;)V

    .line 1053
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1054
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6f

    .line 1044
    :pswitch_c1
    invoke-direct {p0, v9}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    goto :goto_b3

    .line 995
    nop

    :sswitch_data_c6
    .sparse-switch
        0x51 -> :sswitch_3c
        0x52 -> :sswitch_3c
        0x53 -> :sswitch_3c
        0x54 -> :sswitch_3c
        0x55 -> :sswitch_3c
        0x56 -> :sswitch_3c
        0x57 -> :sswitch_3c
        0x62 -> :sswitch_3c
        0x63 -> :sswitch_3c
        0x6b -> :sswitch_3c
        0x6f -> :sswitch_3c
        0x71 -> :sswitch_3c
        0x73 -> :sswitch_3c
        0x78 -> :sswitch_3c
    .end sparse-switch

    .line 1011
    :pswitch_data_100
    .packed-switch 0x6c
        :pswitch_5f
        :pswitch_4b
        :pswitch_83
    .end packed-switch

    .line 1029
    :pswitch_data_10a
    .packed-switch 0x6c
        :pswitch_8a
    .end packed-switch

    .line 1039
    :pswitch_data_110
    .packed-switch 0x6c
        :pswitch_b0
        :pswitch_9c
        :pswitch_c1
    .end packed-switch
.end method

.method public final HeaderElement()V
    .registers 24
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 2773
    const/4 v8, 0x0

    .line 2774
    .local v8, "exp":Lfreemarker/core/Expression;
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v20, v0

    const/16 v21, -0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_5a

    invoke-direct/range {p0 .. p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v20

    :goto_13
    packed-switch v20, :pswitch_data_2a2

    .line 2779
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->jj_la1:[I

    move-object/from16 v20, v0

    const/16 v21, 0x4e

    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_gen:I

    move/from16 v22, v0

    aput v22, v20, v21

    .line 2782
    :goto_26
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v20, v0

    const/16 v21, -0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_6b

    invoke-direct/range {p0 .. p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v20

    :goto_38
    packed-switch v20, :pswitch_data_2a8

    .line 2885
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->jj_la1:[I

    move-object/from16 v20, v0

    const/16 v21, 0x50

    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_gen:I

    move/from16 v22, v0

    aput v22, v20, v21

    .line 2886
    const/16 v20, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 2887
    new-instance v20, Lfreemarker/core/ParseException;

    invoke-direct/range {v20 .. v20}, Lfreemarker/core/ParseException;-><init>()V

    throw v20

    .line 2774
    :cond_5a
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v20, v0

    goto :goto_13

    .line 2776
    :pswitch_61
    const/16 v20, 0x44

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    goto :goto_26

    .line 2782
    :cond_6b
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v20, v0

    goto :goto_38

    .line 2784
    :pswitch_72
    const/16 v20, 0x42

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 2889
    :goto_7b
    return-void

    .line 2787
    :pswitch_7c
    const/16 v20, 0x41

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 2790
    :cond_85
    :goto_85
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v20, v0

    const/16 v21, -0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_ae

    invoke-direct/range {p0 .. p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v20

    :goto_97
    packed-switch v20, :pswitch_data_2b0

    .line 2795
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->jj_la1:[I

    move-object/from16 v20, v0

    const/16 v21, 0x4f

    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_gen:I

    move/from16 v22, v0

    aput v22, v20, v21

    .line 2882
    invoke-virtual/range {p0 .. p0}, Lfreemarker/core/FMParser;->LooseDirectiveEnd()Lfreemarker/core/Token;

    goto :goto_7b

    .line 2790
    :cond_ae
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v20, v0

    goto :goto_97

    .line 2798
    :pswitch_b5
    const/16 v20, 0x78

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v11

    .line 2799
    .local v11, "key":Lfreemarker/core/Token;
    const/16 v20, 0x5b

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 2800
    invoke-virtual/range {p0 .. p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v8

    .line 2801
    iget-object v13, v11, Lfreemarker/core/Token;->image:Ljava/lang/String;

    .line 2802
    .local v13, "ks":Ljava/lang/String;
    const/16 v17, 0x0

    .line 2804
    .local v17, "value":Lfreemarker/template/TemplateModel;
    const/16 v20, 0x0

    :try_start_d2
    move-object/from16 v0, v20

    invoke-virtual {v8, v0}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    :try_end_d7
    .catch Ljava/lang/Exception; {:try_start_d2 .. :try_end_d7} :catch_10b

    move-result-object v17

    .line 2813
    const/16 v19, 0x0

    .line 2814
    .local v19, "vs":Ljava/lang/String;
    move-object/from16 v0, v17

    instance-of v0, v0, Lfreemarker/template/TemplateScalarModel;

    move/from16 v20, v0

    if-eqz v20, :cond_eb

    .line 2816
    :try_start_e2
    move-object v0, v8

    check-cast v0, Lfreemarker/template/TemplateScalarModel;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;
    :try_end_ea
    .catch Lfreemarker/template/TemplateModelException; {:try_start_e2 .. :try_end_ea} :catch_29f

    move-result-object v19

    .line 2819
    :cond_eb
    :goto_eb
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    move-object/from16 v20, v0

    if-eqz v20, :cond_85

    .line 2820
    const-string v20, "encoding"

    move-object/from16 v0, v20

    invoke-virtual {v13, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_15f

    .line 2821
    if-nez v19, :cond_141

    .line 2822
    new-instance v20, Lfreemarker/core/ParseException;

    const-string v21, "Expecting an encoding string."

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v8}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/core/TemplateObject;)V

    throw v20

    .line 2805
    .end local v19    # "vs":Ljava/lang/String;
    :catch_10b
    move-exception v6

    .line 2806
    .local v6, "e":Ljava/lang/Exception;
    new-instance v20, Lfreemarker/core/ParseException;

    new-instance v21, Ljava/lang/StringBuffer;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuffer;-><init>()V

    const-string v22, "Could not evaluate expression: "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v21

    invoke-virtual {v8}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v21

    const-string v22, " "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v21

    const-string v22, "\nUnderlying cause: "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v21

    invoke-virtual {v6}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v8, v6}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/core/TemplateObject;Ljava/lang/Throwable;)V

    throw v20

    .line 2824
    .end local v6    # "e":Ljava/lang/Exception;
    .restart local v19    # "vs":Ljava/lang/String;
    :cond_141
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lfreemarker/template/Template;->getEncoding()Ljava/lang/String;

    move-result-object v7

    .line 2825
    .local v7, "encoding":Ljava/lang/String;
    if-eqz v7, :cond_85

    move-object/from16 v0, v19

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-nez v20, :cond_85

    .line 2826
    new-instance v20, Lfreemarker/template/Template$WrongEncodingException;

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lfreemarker/template/Template$WrongEncodingException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 2829
    .end local v7    # "encoding":Ljava/lang/String;
    :cond_15f
    const-string v20, "STRIP_WHITESPACE"

    move-object/from16 v0, v20

    invoke-virtual {v13, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_177

    .line 2830
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lfreemarker/core/FMParser;->getBoolean(Lfreemarker/core/Expression;)Z

    move-result v20

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lfreemarker/core/FMParser;->stripWhitespace:Z

    goto/16 :goto_85

    .line 2832
    :cond_177
    const-string v20, "STRIP_TEXT"

    move-object/from16 v0, v20

    invoke-virtual {v13, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_18f

    .line 2833
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lfreemarker/core/FMParser;->getBoolean(Lfreemarker/core/Expression;)Z

    move-result v20

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lfreemarker/core/FMParser;->stripText:Z

    goto/16 :goto_85

    .line 2835
    :cond_18f
    const-string v20, "STRICT_SYNTAX"

    move-object/from16 v0, v20

    invoke-virtual {v13, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_1ad

    .line 2836
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->token_source:Lfreemarker/core/FMParserTokenManager;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lfreemarker/core/FMParser;->getBoolean(Lfreemarker/core/Expression;)Z

    move-result v21

    move/from16 v0, v21

    move-object/from16 v1, v20

    iput-boolean v0, v1, Lfreemarker/core/FMParserTokenManager;->strictEscapeSyntax:Z

    goto/16 :goto_85

    .line 2838
    :cond_1ad
    const-string v20, "ns_prefixes"

    move-object/from16 v0, v20

    invoke-virtual {v13, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_225

    .line 2839
    move-object/from16 v0, v17

    instance-of v0, v0, Lfreemarker/template/TemplateHashModelEx;

    move/from16 v20, v0

    if-nez v20, :cond_1cb

    .line 2840
    new-instance v20, Lfreemarker/core/ParseException;

    const-string v21, "Expecting a hash of prefixes to namespace URI\'s."

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v8}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/core/TemplateObject;)V

    throw v20

    :cond_1cb
    move-object/from16 v16, v17

    .line 2842
    check-cast v16, Lfreemarker/template/TemplateHashModelEx;

    .line 2844
    .local v16, "prefixMap":Lfreemarker/template/TemplateHashModelEx;
    :try_start_1cf
    invoke-interface/range {v16 .. v16}, Lfreemarker/template/TemplateHashModelEx;->keys()Lfreemarker/template/TemplateCollectionModel;

    move-result-object v12

    .line 2845
    .local v12, "keys":Lfreemarker/template/TemplateCollectionModel;
    invoke-interface {v12}, Lfreemarker/template/TemplateCollectionModel;->iterator()Lfreemarker/template/TemplateModelIterator;

    move-result-object v10

    .local v10, "it":Lfreemarker/template/TemplateModelIterator;
    :goto_1d7
    invoke-interface {v10}, Lfreemarker/template/TemplateModelIterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_85

    .line 2846
    invoke-interface {v10}, Lfreemarker/template/TemplateModelIterator;->next()Lfreemarker/template/TemplateModel;

    move-result-object v20

    check-cast v20, Lfreemarker/template/TemplateScalarModel;

    invoke-interface/range {v20 .. v20}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v15

    .line 2847
    .local v15, "prefix":Ljava/lang/String;
    move-object/from16 v0, v16

    invoke-interface {v0, v15}, Lfreemarker/template/TemplateHashModelEx;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v18

    .line 2848
    .local v18, "valueModel":Lfreemarker/template/TemplateModel;
    move-object/from16 v0, v18

    instance-of v0, v0, Lfreemarker/template/TemplateScalarModel;

    move/from16 v20, v0

    if-nez v20, :cond_204

    .line 2849
    new-instance v20, Lfreemarker/core/ParseException;

    const-string v21, "Non-string value in prefix to namespace hash."

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v8}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/core/TemplateObject;)V

    throw v20

    .line 2858
    .end local v10    # "it":Lfreemarker/template/TemplateModelIterator;
    .end local v12    # "keys":Lfreemarker/template/TemplateCollectionModel;
    .end local v15    # "prefix":Ljava/lang/String;
    .end local v18    # "valueModel":Lfreemarker/template/TemplateModel;
    :catch_201
    move-exception v20

    goto/16 :goto_85

    .line 2851
    .restart local v10    # "it":Lfreemarker/template/TemplateModelIterator;
    .restart local v12    # "keys":Lfreemarker/template/TemplateCollectionModel;
    .restart local v15    # "prefix":Ljava/lang/String;
    .restart local v18    # "valueModel":Lfreemarker/template/TemplateModel;
    :cond_204
    check-cast v18, Lfreemarker/template/TemplateScalarModel;

    .end local v18    # "valueModel":Lfreemarker/template/TemplateModel;
    invoke-interface/range {v18 .. v18}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;
    :try_end_209
    .catch Lfreemarker/template/TemplateModelException; {:try_start_1cf .. :try_end_209} :catch_201

    move-result-object v14

    .line 2853
    .local v14, "nsURI":Ljava/lang/String;
    :try_start_20a
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v15, v14}, Lfreemarker/template/Template;->addPrefixNSMapping(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_215
    .catch Ljava/lang/IllegalArgumentException; {:try_start_20a .. :try_end_215} :catch_216
    .catch Lfreemarker/template/TemplateModelException; {:try_start_20a .. :try_end_215} :catch_201

    goto :goto_1d7

    .line 2854
    :catch_216
    move-exception v9

    .line 2855
    .local v9, "iae":Ljava/lang/IllegalArgumentException;
    :try_start_217
    new-instance v20, Lfreemarker/core/ParseException;

    invoke-virtual {v9}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v8}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/core/TemplateObject;)V

    throw v20
    :try_end_225
    .catch Lfreemarker/template/TemplateModelException; {:try_start_217 .. :try_end_225} :catch_201

    .line 2861
    .end local v9    # "iae":Ljava/lang/IllegalArgumentException;
    .end local v10    # "it":Lfreemarker/template/TemplateModelIterator;
    .end local v12    # "keys":Lfreemarker/template/TemplateCollectionModel;
    .end local v14    # "nsURI":Ljava/lang/String;
    .end local v15    # "prefix":Ljava/lang/String;
    .end local v16    # "prefixMap":Lfreemarker/template/TemplateHashModelEx;
    :cond_225
    const-string v20, "attributes"

    move-object/from16 v0, v20

    invoke-virtual {v13, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_276

    .line 2862
    move-object/from16 v0, v17

    instance-of v0, v0, Lfreemarker/template/TemplateHashModelEx;

    move/from16 v20, v0

    if-nez v20, :cond_243

    .line 2863
    new-instance v20, Lfreemarker/core/ParseException;

    const-string v21, "Expecting a hash of attribute names to values."

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v8}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/core/TemplateObject;)V

    throw v20

    :cond_243
    move-object/from16 v5, v17

    .line 2865
    check-cast v5, Lfreemarker/template/TemplateHashModelEx;

    .line 2867
    .local v5, "attributeMap":Lfreemarker/template/TemplateHashModelEx;
    :try_start_247
    invoke-interface {v5}, Lfreemarker/template/TemplateHashModelEx;->keys()Lfreemarker/template/TemplateCollectionModel;

    move-result-object v12

    .line 2868
    .restart local v12    # "keys":Lfreemarker/template/TemplateCollectionModel;
    invoke-interface {v12}, Lfreemarker/template/TemplateCollectionModel;->iterator()Lfreemarker/template/TemplateModelIterator;

    move-result-object v10

    .restart local v10    # "it":Lfreemarker/template/TemplateModelIterator;
    :goto_24f
    invoke-interface {v10}, Lfreemarker/template/TemplateModelIterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_85

    .line 2869
    invoke-interface {v10}, Lfreemarker/template/TemplateModelIterator;->next()Lfreemarker/template/TemplateModel;

    move-result-object v20

    check-cast v20, Lfreemarker/template/TemplateScalarModel;

    invoke-interface/range {v20 .. v20}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v3

    .line 2870
    .local v3, "attName":Ljava/lang/String;
    invoke-interface {v5, v3}, Lfreemarker/template/TemplateHashModelEx;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lfreemarker/template/utility/DeepUnwrap;->unwrap(Lfreemarker/template/TemplateModel;)Ljava/lang/Object;

    move-result-object v4

    .line 2871
    .local v4, "attValue":Ljava/lang/Object;
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v3, v4}, Lfreemarker/template/Template;->setCustomAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_272
    .catch Lfreemarker/template/TemplateModelException; {:try_start_247 .. :try_end_272} :catch_273

    goto :goto_24f

    .line 2873
    .end local v3    # "attName":Ljava/lang/String;
    .end local v4    # "attValue":Ljava/lang/Object;
    .end local v10    # "it":Lfreemarker/template/TemplateModelIterator;
    .end local v12    # "keys":Lfreemarker/template/TemplateCollectionModel;
    :catch_273
    move-exception v20

    goto/16 :goto_85

    .line 2877
    .end local v5    # "attributeMap":Lfreemarker/template/TemplateHashModelEx;
    :cond_276
    new-instance v20, Lfreemarker/core/ParseException;

    new-instance v21, Ljava/lang/StringBuffer;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuffer;-><init>()V

    const-string v22, "Unknown FTL header parameter: "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v21

    iget-object v0, v11, Lfreemarker/core/Token;->image:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    move-object/from16 v22, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2, v11}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v20

    .line 2817
    :catch_29f
    move-exception v20

    goto/16 :goto_eb

    .line 2774
    :pswitch_data_2a2
    .packed-switch 0x44
        :pswitch_61
    .end packed-switch

    .line 2782
    :pswitch_data_2a8
    .packed-switch 0x41
        :pswitch_7c
        :pswitch_72
    .end packed-switch

    .line 2790
    :pswitch_data_2b0
    .packed-switch 0x78
        :pswitch_b5
    .end packed-switch
.end method

.method public final Identifier()Lfreemarker/core/Identifier;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 682
    const/16 v2, 0x78

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 683
    .local v1, "t":Lfreemarker/core/Token;
    new-instance v0, Lfreemarker/core/Identifier;

    iget-object v2, v1, Lfreemarker/core/Token;->image:Ljava/lang/String;

    invoke-direct {v0, v2}, Lfreemarker/core/Identifier;-><init>(Ljava/lang/String;)V

    .line 684
    .local v0, "id":Lfreemarker/core/Identifier;
    iget-object v2, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v0, v2, v1, v1}, Lfreemarker/core/Identifier;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 685
    return-object v0
.end method

.method public final IdentifierOrStringLiteral()Lfreemarker/core/Expression;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v4, -0x1

    .line 691
    iget v1, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v1, v4, :cond_1d

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v1

    :goto_9
    sparse-switch v1, :sswitch_data_2c

    .line 700
    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v2, 0x9

    iget v3, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v3, v1, v2

    .line 701
    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 702
    new-instance v1, Lfreemarker/core/ParseException;

    invoke-direct {v1}, Lfreemarker/core/ParseException;-><init>()V

    throw v1

    .line 691
    :cond_1d
    iget v1, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_9

    .line 693
    :sswitch_20
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Identifier()Lfreemarker/core/Identifier;

    move-result-object v0

    .line 704
    .local v0, "exp":Lfreemarker/core/Expression;
    :goto_24
    return-object v0

    .line 697
    .end local v0    # "exp":Lfreemarker/core/Expression;
    :sswitch_25
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lfreemarker/core/FMParser;->StringLiteral(Z)Lfreemarker/core/StringLiteral;

    move-result-object v0

    .line 698
    .restart local v0    # "exp":Lfreemarker/core/Expression;
    goto :goto_24

    .line 691
    nop

    :sswitch_data_2c
    .sparse-switch
        0x51 -> :sswitch_25
        0x52 -> :sswitch_25
        0x78 -> :sswitch_20
    .end sparse-switch
.end method

.method public final If()Lfreemarker/core/TemplateElement;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v10, -0x1

    .line 1171
    const/16 v7, 0x8

    invoke-direct {p0, v7}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v5

    .line 1172
    .local v5, "start":Lfreemarker/core/Token;
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v2

    .line 1173
    .local v2, "condition":Lfreemarker/core/Expression;
    const/16 v7, 0x7c

    invoke-direct {p0, v7}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1174
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->OptionalBlock()Lfreemarker/core/TemplateElement;

    move-result-object v0

    .line 1175
    .local v0, "block":Lfreemarker/core/TemplateElement;
    new-instance v1, Lfreemarker/core/ConditionalBlock;

    const/4 v7, 0x0

    invoke-direct {v1, v2, v0, v7}, Lfreemarker/core/ConditionalBlock;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/TemplateElement;I)V

    .line 1176
    .local v1, "cblock":Lfreemarker/core/ConditionalBlock;
    iget-object v7, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v1, v7, v5, v0}, Lfreemarker/core/ConditionalBlock;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/TemplateObject;)V

    .line 1177
    new-instance v4, Lfreemarker/core/IfBlock;

    invoke-direct {v4, v1}, Lfreemarker/core/IfBlock;-><init>(Lfreemarker/core/ConditionalBlock;)V

    .line 1180
    .local v4, "ifBlock":Lfreemarker/core/IfBlock;
    :goto_24
    iget v7, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v7, v10, :cond_56

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v7

    :goto_2c
    packed-switch v7, :pswitch_data_96

    .line 1185
    iget-object v7, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v8, 0x15

    iget v9, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v9, v7, v8

    .line 1196
    iget v7, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v7, v10, :cond_79

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v7

    :goto_3f
    packed-switch v7, :pswitch_data_9c

    .line 1205
    iget-object v7, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v8, 0x16

    iget v9, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v9, v7, v8

    .line 1208
    :goto_4a
    const/16 v7, 0x1f

    invoke-direct {p0, v7}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 1209
    .local v3, "end":Lfreemarker/core/Token;
    iget-object v7, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v4, v7, v5, v3}, Lfreemarker/core/IfBlock;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 1210
    return-object v4

    .line 1180
    .end local v3    # "end":Lfreemarker/core/Token;
    :cond_56
    iget v7, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_2c

    .line 1188
    :pswitch_59
    const/16 v7, 0x9

    invoke-direct {p0, v7}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v6

    .line 1189
    .local v6, "t":Lfreemarker/core/Token;
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v2

    .line 1190
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->LooseDirectiveEnd()Lfreemarker/core/Token;

    .line 1191
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->OptionalBlock()Lfreemarker/core/TemplateElement;

    move-result-object v0

    .line 1192
    new-instance v1, Lfreemarker/core/ConditionalBlock;

    .end local v1    # "cblock":Lfreemarker/core/ConditionalBlock;
    const/4 v7, 0x2

    invoke-direct {v1, v2, v0, v7}, Lfreemarker/core/ConditionalBlock;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/TemplateElement;I)V

    .line 1193
    .restart local v1    # "cblock":Lfreemarker/core/ConditionalBlock;
    iget-object v7, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v1, v7, v6, v0}, Lfreemarker/core/ConditionalBlock;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/TemplateObject;)V

    .line 1194
    invoke-virtual {v4, v1}, Lfreemarker/core/IfBlock;->addBlock(Lfreemarker/core/ConditionalBlock;)V

    goto :goto_24

    .line 1196
    .end local v6    # "t":Lfreemarker/core/Token;
    :cond_79
    iget v7, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_3f

    .line 1198
    :pswitch_7c
    const/16 v7, 0x2c

    invoke-direct {p0, v7}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v6

    .line 1199
    .restart local v6    # "t":Lfreemarker/core/Token;
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->OptionalBlock()Lfreemarker/core/TemplateElement;

    move-result-object v0

    .line 1200
    new-instance v1, Lfreemarker/core/ConditionalBlock;

    .end local v1    # "cblock":Lfreemarker/core/ConditionalBlock;
    const/4 v7, 0x0

    const/4 v8, 0x1

    invoke-direct {v1, v7, v0, v8}, Lfreemarker/core/ConditionalBlock;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/TemplateElement;I)V

    .line 1201
    .restart local v1    # "cblock":Lfreemarker/core/ConditionalBlock;
    iget-object v7, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v1, v7, v6, v0}, Lfreemarker/core/ConditionalBlock;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/TemplateObject;)V

    .line 1202
    invoke-virtual {v4, v1}, Lfreemarker/core/IfBlock;->addBlock(Lfreemarker/core/ConditionalBlock;)V

    goto :goto_4a

    .line 1180
    :pswitch_data_96
    .packed-switch 0x9
        :pswitch_59
    .end packed-switch

    .line 1196
    :pswitch_data_9c
    .packed-switch 0x2c
        :pswitch_7c
    .end packed-switch
.end method

.method public final Import()Lfreemarker/core/LibraryLoad;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 1704
    const/16 v5, 0x12

    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v4

    .line 1705
    .local v4, "start":Lfreemarker/core/Token;
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v1

    .line 1706
    .local v1, "nameExp":Lfreemarker/core/Expression;
    const/16 v5, 0x76

    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1707
    const/16 v5, 0x78

    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v2

    .line 1708
    .local v2, "ns":Lfreemarker/core/Token;
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->LooseDirectiveEnd()Lfreemarker/core/Token;

    move-result-object v0

    .line 1709
    .local v0, "end":Lfreemarker/core/Token;
    new-instance v3, Lfreemarker/core/LibraryLoad;

    iget-object v5, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    iget-object v6, v2, Lfreemarker/core/Token;->image:Ljava/lang/String;

    invoke-direct {v3, v5, v1, v6}, Lfreemarker/core/LibraryLoad;-><init>(Lfreemarker/template/Template;Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 1710
    .local v3, "result":Lfreemarker/core/LibraryLoad;
    iget-object v5, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v3, v5, v4, v0}, Lfreemarker/core/LibraryLoad;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 1711
    iget-object v5, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v5, v3}, Lfreemarker/template/Template;->addImport(Lfreemarker/core/LibraryLoad;)V

    .line 1712
    return-object v3
.end method

.method public final Include()Lfreemarker/core/Include;
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v12, -0x1

    .line 1659
    const/4 v6, 0x0

    .local v6, "parseExp":Lfreemarker/core/Expression;
    const/4 v2, 0x0

    .line 1660
    .local v2, "encodingExp":Lfreemarker/core/Expression;
    const/16 v9, 0x11

    invoke-direct {p0, v9}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v8

    .line 1661
    .local v8, "start":Lfreemarker/core/Token;
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v5

    .line 1662
    .local v5, "nameExp":Lfreemarker/core/Expression;
    iget v9, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v9, v12, :cond_44

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v9

    :goto_15
    packed-switch v9, :pswitch_data_80

    .line 1667
    iget-object v9, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v10, 0x26

    iget v11, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v11, v9, v10

    .line 1672
    :goto_20
    iget v9, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v9, v12, :cond_4d

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v9

    :goto_28
    packed-switch v9, :pswitch_data_86

    .line 1677
    iget-object v9, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v10, 0x27

    iget v11, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v11, v9, v10

    .line 1694
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->LooseDirectiveEnd()Lfreemarker/core/Token;

    move-result-object v3

    .line 1695
    .local v3, "end":Lfreemarker/core/Token;
    new-instance v7, Lfreemarker/core/Include;

    iget-object v9, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-direct {v7, v9, v5, v2, v6}, Lfreemarker/core/Include;-><init>(Lfreemarker/template/Template;Lfreemarker/core/Expression;Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V

    .line 1696
    .local v7, "result":Lfreemarker/core/Include;
    iget-object v9, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v7, v9, v8, v3}, Lfreemarker/core/Include;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 1697
    return-object v7

    .line 1662
    .end local v3    # "end":Lfreemarker/core/Token;
    .end local v7    # "result":Lfreemarker/core/Include;
    :cond_44
    iget v9, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_15

    .line 1664
    :pswitch_47
    const/16 v9, 0x6d

    invoke-direct {p0, v9}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    goto :goto_20

    .line 1672
    :cond_4d
    iget v9, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_28

    .line 1680
    :pswitch_50
    const/16 v9, 0x78

    invoke-direct {p0, v9}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v0

    .line 1681
    .local v0, "att":Lfreemarker/core/Token;
    const/16 v9, 0x5b

    invoke-direct {p0, v9}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1682
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v4

    .line 1683
    .local v4, "exp":Lfreemarker/core/Expression;
    iget-object v1, v0, Lfreemarker/core/Token;->image:Ljava/lang/String;

    .line 1684
    .local v1, "attString":Ljava/lang/String;
    const-string v9, "parse"

    invoke-virtual {v1, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_6b

    .line 1685
    move-object v6, v4

    goto :goto_20

    .line 1687
    :cond_6b
    const-string v9, "encoding"

    invoke-virtual {v1, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_75

    .line 1688
    move-object v2, v4

    goto :goto_20

    .line 1691
    :cond_75
    new-instance v9, Lfreemarker/core/ParseException;

    const-string v10, "Expecting parse= or encoding= to be specified."

    iget-object v11, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-direct {v9, v10, v11, v0}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v9

    .line 1662
    nop

    :pswitch_data_80
    .packed-switch 0x6d
        :pswitch_47
    .end packed-switch

    .line 1672
    :pswitch_data_86
    .packed-switch 0x78
        :pswitch_50
    .end packed-switch
.end method

.method public final List()Lfreemarker/core/IteratorBlock;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 1254
    const/16 v6, 0xa

    invoke-direct {p0, v6}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v5

    .line 1255
    .local v5, "start":Lfreemarker/core/Token;
    iget v6, p0, Lfreemarker/core/FMParser;->loopNesting:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lfreemarker/core/FMParser;->loopNesting:I

    .line 1256
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v2

    .line 1257
    .local v2, "exp":Lfreemarker/core/Expression;
    const/16 v6, 0x76

    invoke-direct {p0, v6}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1258
    const/16 v6, 0x78

    invoke-direct {p0, v6}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 1259
    .local v3, "index":Lfreemarker/core/Token;
    const/16 v6, 0x7c

    invoke-direct {p0, v6}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1260
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->OptionalBlock()Lfreemarker/core/TemplateElement;

    move-result-object v0

    .line 1261
    .local v0, "block":Lfreemarker/core/TemplateElement;
    const/16 v6, 0x20

    invoke-direct {p0, v6}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 1262
    .local v1, "end":Lfreemarker/core/Token;
    iget v6, p0, Lfreemarker/core/FMParser;->loopNesting:I

    add-int/lit8 v6, v6, -0x1

    iput v6, p0, Lfreemarker/core/FMParser;->loopNesting:I

    .line 1263
    new-instance v4, Lfreemarker/core/IteratorBlock;

    iget-object v6, v3, Lfreemarker/core/Token;->image:Ljava/lang/String;

    const/4 v7, 0x0

    invoke-direct {v4, v2, v6, v0, v7}, Lfreemarker/core/IteratorBlock;-><init>(Lfreemarker/core/Expression;Ljava/lang/String;Lfreemarker/core/TemplateElement;Z)V

    .line 1267
    .local v4, "result":Lfreemarker/core/IteratorBlock;
    iget-object v6, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v4, v6, v5, v1}, Lfreemarker/core/IteratorBlock;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 1268
    return-object v4
.end method

.method public final ListLiteral()Lfreemarker/core/ListLiteral;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 647
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 649
    .local v3, "values":Ljava/util/ArrayList;
    const/16 v4, 0x6f

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v0

    .line 650
    .local v0, "begin":Lfreemarker/core/Token;
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->PositionalArgs()Ljava/util/ArrayList;

    move-result-object v3

    .line 651
    const/16 v4, 0x70

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 652
    .local v1, "end":Lfreemarker/core/Token;
    new-instance v2, Lfreemarker/core/ListLiteral;

    invoke-direct {v2, v3}, Lfreemarker/core/ListLiteral;-><init>(Ljava/util/ArrayList;)V

    .line 653
    .local v2, "result":Lfreemarker/core/ListLiteral;
    iget-object v4, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v2, v4, v0, v1}, Lfreemarker/core/ListLiteral;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 654
    return-object v2
.end method

.method public final LooseDirectiveEnd()Lfreemarker/core/Token;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v4, -0x1

    .line 2310
    iget v1, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v1, v4, :cond_1d

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v1

    :goto_9
    packed-switch v1, :pswitch_data_2e

    .line 2318
    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v2, 0x44

    iget v3, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v3, v1, v2

    .line 2319
    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 2320
    new-instance v1, Lfreemarker/core/ParseException;

    invoke-direct {v1}, Lfreemarker/core/ParseException;-><init>()V

    throw v1

    .line 2310
    :cond_1d
    iget v1, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_9

    .line 2312
    :pswitch_20
    const/16 v1, 0x7c

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v0

    .line 2322
    .local v0, "t":Lfreemarker/core/Token;
    :goto_26
    return-object v0

    .line 2315
    .end local v0    # "t":Lfreemarker/core/Token;
    :pswitch_27
    const/16 v1, 0x7d

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v0

    .line 2316
    .restart local v0    # "t":Lfreemarker/core/Token;
    goto :goto_26

    .line 2310
    :pswitch_data_2e
    .packed-switch 0x7c
        :pswitch_20
        :pswitch_27
    .end packed-switch
.end method

.method public final Macro()Lfreemarker/core/Macro;
    .registers 23
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 1720
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 1721
    .local v5, "argNames":Ljava/util/ArrayList;
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 1722
    .local v6, "args":Ljava/util/HashMap;
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 1723
    .local v9, "defNames":Ljava/util/ArrayList;
    const/4 v10, 0x0

    .line 1725
    .local v10, "defValue":Lfreemarker/core/Expression;
    const/4 v14, 0x0

    .local v14, "isFunction":Z
    const/4 v12, 0x0

    .line 1726
    .local v12, "hasDefaults":Z
    const/4 v13, 0x0

    .line 1727
    .local v13, "isCatchAll":Z
    const/4 v8, 0x0

    .line 1728
    .local v8, "catchAll":Ljava/lang/String;
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v19, v0

    const/16 v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_48

    invoke-direct/range {p0 .. p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v19

    :goto_26
    packed-switch v19, :pswitch_data_336

    .line 1737
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->jj_la1:[I

    move-object/from16 v19, v0

    const/16 v20, 0x28

    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_gen:I

    move/from16 v21, v0

    aput v21, v19, v20

    .line 1738
    const/16 v19, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1739
    new-instance v19, Lfreemarker/core/ParseException;

    invoke-direct/range {v19 .. v19}, Lfreemarker/core/ParseException;-><init>()V

    throw v19

    .line 1728
    :cond_48
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v19, v0

    goto :goto_26

    .line 1730
    :pswitch_4f
    const/16 v19, 0x14

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v18

    .line 1741
    .local v18, "start":Lfreemarker/core/Token;
    :goto_59
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lfreemarker/core/FMParser;->inMacro:Z

    move/from16 v19, v0

    if-nez v19, :cond_69

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lfreemarker/core/FMParser;->inFunction:Z

    move/from16 v19, v0

    if-eqz v19, :cond_8b

    .line 1742
    :cond_69
    new-instance v19, Lfreemarker/core/ParseException;

    const-string v20, "Macros cannot be nested."

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    move-object/from16 v21, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    move-object/from16 v3, v18

    invoke-direct {v0, v1, v2, v3}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v19

    .line 1733
    .end local v18    # "start":Lfreemarker/core/Token;
    :pswitch_7f
    const/16 v19, 0x13

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v18

    .line 1734
    .restart local v18    # "start":Lfreemarker/core/Token;
    const/4 v14, 0x1

    .line 1735
    goto :goto_59

    .line 1744
    :cond_8b
    if-eqz v14, :cond_157

    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lfreemarker/core/FMParser;->inFunction:Z

    .line 1745
    :goto_95
    invoke-virtual/range {p0 .. p0}, Lfreemarker/core/FMParser;->IdentifierOrStringLiteral()Lfreemarker/core/Expression;

    move-result-object v16

    .line 1746
    .local v16, "nameExp":Lfreemarker/core/Expression;
    move-object/from16 v0, v16

    instance-of v0, v0, Lfreemarker/core/StringLiteral;

    move/from16 v19, v0

    if-eqz v19, :cond_161

    check-cast v16, Lfreemarker/core/StringLiteral;

    .end local v16    # "nameExp":Lfreemarker/core/Expression;
    invoke-virtual/range {v16 .. v16}, Lfreemarker/core/StringLiteral;->getAsString()Ljava/lang/String;

    move-result-object v15

    .line 1747
    .local v15, "name":Ljava/lang/String;
    :goto_a7
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v19, v0

    const/16 v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_167

    invoke-direct/range {p0 .. p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v19

    :goto_b9
    packed-switch v19, :pswitch_data_33e

    .line 1752
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->jj_la1:[I

    move-object/from16 v19, v0

    const/16 v20, 0x29

    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_gen:I

    move/from16 v21, v0

    aput v21, v19, v20

    .line 1757
    :goto_cc
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v19, v0

    const/16 v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_17a

    invoke-direct/range {p0 .. p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v19

    :goto_de
    packed-switch v19, :pswitch_data_344

    .line 1762
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->jj_la1:[I

    move-object/from16 v19, v0

    const/16 v20, 0x2a

    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_gen:I

    move/from16 v21, v0

    aput v21, v19, v20

    .line 1818
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v19, v0

    const/16 v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_29c

    invoke-direct/range {p0 .. p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v19

    :goto_103
    packed-switch v19, :pswitch_data_34a

    .line 1823
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->jj_la1:[I

    move-object/from16 v19, v0

    const/16 v20, 0x2e

    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_gen:I

    move/from16 v21, v0

    aput v21, v19, v20

    .line 1826
    :goto_116
    const/16 v19, 0x7c

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1827
    invoke-virtual/range {p0 .. p0}, Lfreemarker/core/FMParser;->OptionalBlock()Lfreemarker/core/TemplateElement;

    move-result-object v7

    .line 1828
    .local v7, "block":Lfreemarker/core/TemplateElement;
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v19, v0

    const/16 v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_2af

    invoke-direct/range {p0 .. p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v19

    :goto_135
    packed-switch v19, :pswitch_data_350

    .line 1838
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->jj_la1:[I

    move-object/from16 v19, v0

    const/16 v20, 0x2f

    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_gen:I

    move/from16 v21, v0

    aput v21, v19, v20

    .line 1839
    const/16 v19, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1840
    new-instance v19, Lfreemarker/core/ParseException;

    invoke-direct/range {v19 .. v19}, Lfreemarker/core/ParseException;-><init>()V

    throw v19

    .line 1744
    .end local v7    # "block":Lfreemarker/core/TemplateElement;
    .end local v15    # "name":Ljava/lang/String;
    :cond_157
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lfreemarker/core/FMParser;->inMacro:Z

    goto/16 :goto_95

    .line 1746
    .restart local v16    # "nameExp":Lfreemarker/core/Expression;
    :cond_161
    invoke-virtual/range {v16 .. v16}, Lfreemarker/core/Expression;->toString()Ljava/lang/String;

    move-result-object v15

    goto/16 :goto_a7

    .line 1747
    .end local v16    # "nameExp":Lfreemarker/core/Expression;
    .restart local v15    # "name":Ljava/lang/String;
    :cond_167
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v19, v0

    goto/16 :goto_b9

    .line 1749
    :pswitch_16f
    const/16 v19, 0x71

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    goto/16 :goto_cc

    .line 1757
    :cond_17a
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v19, v0

    goto/16 :goto_de

    .line 1765
    :pswitch_182
    const/16 v19, 0x78

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v4

    .line 1766
    .local v4, "arg":Lfreemarker/core/Token;
    const/4 v10, 0x0

    .line 1767
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v19, v0

    const/16 v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_212

    invoke-direct/range {p0 .. p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v19

    :goto_19f
    packed-switch v19, :pswitch_data_358

    .line 1773
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->jj_la1:[I

    move-object/from16 v19, v0

    const/16 v20, 0x2b

    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_gen:I

    move/from16 v21, v0

    aput v21, v19, v20

    .line 1776
    :goto_1b2
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v19, v0

    const/16 v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_224

    invoke-direct/range {p0 .. p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v19

    :goto_1c4
    packed-switch v19, :pswitch_data_35e

    .line 1784
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->jj_la1:[I

    move-object/from16 v19, v0

    const/16 v20, 0x2c

    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_gen:I

    move/from16 v21, v0

    aput v21, v19, v20

    .line 1787
    :goto_1d7
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v19, v0

    const/16 v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_243

    invoke-direct/range {p0 .. p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v19

    :goto_1e9
    packed-switch v19, :pswitch_data_364

    .line 1792
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->jj_la1:[I

    move-object/from16 v19, v0

    const/16 v20, 0x2d

    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_gen:I

    move/from16 v21, v0

    aput v21, v19, v20

    .line 1795
    :goto_1fc
    if-eqz v8, :cond_254

    .line 1796
    new-instance v19, Lfreemarker/core/ParseException;

    const-string v20, "There may only be one \"catch-all\" parameter in a macro declaration, and it must be the last parameter."

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    move-object/from16 v21, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2, v4}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v19

    .line 1767
    :cond_212
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v19, v0

    goto :goto_19f

    .line 1769
    :pswitch_219
    const/16 v19, 0x66

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1770
    const/4 v13, 0x1

    .line 1771
    goto :goto_1b2

    .line 1776
    :cond_224
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v19, v0

    goto :goto_1c4

    .line 1778
    :pswitch_22b
    const/16 v19, 0x5b

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1779
    invoke-virtual/range {p0 .. p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v10

    .line 1780
    iget-object v0, v4, Lfreemarker/core/Token;->image:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1781
    const/4 v12, 0x1

    .line 1782
    goto :goto_1d7

    .line 1787
    :cond_243
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v19, v0

    goto :goto_1e9

    .line 1789
    :pswitch_24a
    const/16 v19, 0x6c

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    goto :goto_1fc

    .line 1800
    :cond_254
    if-eqz v13, :cond_270

    .line 1801
    if-eqz v10, :cond_26c

    .line 1802
    new-instance v19, Lfreemarker/core/ParseException;

    const-string v20, "\"Catch-all\" macro parameter may not have a default value."

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    move-object/from16 v21, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2, v4}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v19

    .line 1806
    :cond_26c
    iget-object v8, v4, Lfreemarker/core/Token;->image:Ljava/lang/String;

    goto/16 :goto_cc

    .line 1808
    :cond_270
    iget-object v0, v4, Lfreemarker/core/Token;->image:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1809
    if-eqz v12, :cond_291

    if-nez v10, :cond_291

    .line 1810
    new-instance v19, Lfreemarker/core/ParseException;

    const-string v20, "In a macro declaration, parameters without a default value must all occur before the parameters with default values."

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    move-object/from16 v21, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2, v4}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v19

    .line 1815
    :cond_291
    iget-object v0, v4, Lfreemarker/core/Token;->image:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v6, v0, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_cc

    .line 1818
    .end local v4    # "arg":Lfreemarker/core/Token;
    :cond_29c
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v19, v0

    goto/16 :goto_103

    .line 1820
    :pswitch_2a4
    const/16 v19, 0x72

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    goto/16 :goto_116

    .line 1828
    .restart local v7    # "block":Lfreemarker/core/TemplateElement;
    :cond_2af
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/core/FMParser;->jj_ntk:I

    move/from16 v19, v0

    goto/16 :goto_135

    .line 1830
    :pswitch_2b7
    const/16 v19, 0x28

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v11

    .line 1831
    .local v11, "end":Lfreemarker/core/Token;
    if-eqz v14, :cond_2fb

    new-instance v19, Lfreemarker/core/ParseException;

    const-string v20, "Expected function end tag here."

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    move-object/from16 v21, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    move-object/from16 v3, v18

    invoke-direct {v0, v1, v2, v3}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v19

    .line 1834
    .end local v11    # "end":Lfreemarker/core/Token;
    :pswitch_2d9
    const/16 v19, 0x27

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v11

    .line 1835
    .restart local v11    # "end":Lfreemarker/core/Token;
    if-nez v14, :cond_2fb

    new-instance v19, Lfreemarker/core/ParseException;

    const-string v20, "Expected macro end tag here."

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    move-object/from16 v21, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    move-object/from16 v3, v18

    invoke-direct {v0, v1, v2, v3}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v19

    .line 1842
    :cond_2fb
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lfreemarker/core/FMParser;->inFunction:Z

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lfreemarker/core/FMParser;->inMacro:Z

    .line 1843
    new-instance v17, Lfreemarker/core/Macro;

    move-object/from16 v0, v17

    invoke-direct {v0, v15, v5, v6, v7}, Lfreemarker/core/Macro;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/util/Map;Lfreemarker/core/TemplateElement;)V

    .line 1844
    .local v17, "result":Lfreemarker/core/Macro;
    move-object/from16 v0, v17

    invoke-virtual {v0, v8}, Lfreemarker/core/Macro;->setCatchAll(Ljava/lang/String;)V

    .line 1845
    move-object/from16 v0, v17

    iput-boolean v14, v0, Lfreemarker/core/Macro;->isFunction:Z

    .line 1846
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    move-object/from16 v19, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2, v11}, Lfreemarker/core/Macro;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 1847
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lfreemarker/template/Template;->addMacro(Lfreemarker/core/Macro;)V

    .line 1848
    return-object v17

    .line 1728
    :pswitch_data_336
    .packed-switch 0x13
        :pswitch_7f
        :pswitch_4f
    .end packed-switch

    .line 1747
    :pswitch_data_33e
    .packed-switch 0x71
        :pswitch_16f
    .end packed-switch

    .line 1757
    :pswitch_data_344
    .packed-switch 0x78
        :pswitch_182
    .end packed-switch

    .line 1818
    :pswitch_data_34a
    .packed-switch 0x72
        :pswitch_2a4
    .end packed-switch

    .line 1828
    :pswitch_data_350
    .packed-switch 0x27
        :pswitch_2d9
        :pswitch_2b7
    .end packed-switch

    .line 1767
    :pswitch_data_358
    .packed-switch 0x66
        :pswitch_219
    .end packed-switch

    .line 1776
    :pswitch_data_35e
    .packed-switch 0x5b
        :pswitch_22b
    .end packed-switch

    .line 1787
    :pswitch_data_364
    .packed-switch 0x6c
        :pswitch_24a
    .end packed-switch
.end method

.method public final MethodArgs(Lfreemarker/core/Expression;)Lfreemarker/core/MethodCall;
    .registers 6
    .param p1, "exp"    # Lfreemarker/core/Expression;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 916
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 918
    .local v0, "args":Ljava/util/ArrayList;
    const/16 v3, 0x71

    invoke-direct {p0, v3}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 919
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->PositionalArgs()Ljava/util/ArrayList;

    move-result-object v0

    .line 920
    const/16 v3, 0x72

    invoke-direct {p0, v3}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 921
    .local v1, "end":Lfreemarker/core/Token;
    invoke-virtual {v0}, Ljava/util/ArrayList;->trimToSize()V

    .line 922
    new-instance v2, Lfreemarker/core/MethodCall;

    invoke-direct {v2, p1, v0}, Lfreemarker/core/MethodCall;-><init>(Lfreemarker/core/Expression;Ljava/util/ArrayList;)V

    .line 923
    .local v2, "result":Lfreemarker/core/MethodCall;
    iget-object v3, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v2, v3, p1, v1}, Lfreemarker/core/MethodCall;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/TemplateObject;Lfreemarker/core/Token;)V

    .line 924
    return-object v2
.end method

.method public final MultiplicativeExpression()Lfreemarker/core/Expression;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v7, -0x1

    .line 451
    const/4 v1, 0x1

    .line 452
    .local v1, "operation":I
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->UnaryExpression()Lfreemarker/core/Expression;

    move-result-object v0

    .line 453
    .local v0, "lhs":Lfreemarker/core/Expression;
    move-object v2, v0

    .line 456
    .local v2, "result":Lfreemarker/core/Expression;
    :goto_7
    const v4, 0x7fffffff

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_2_3(I)Z

    move-result v4

    if-eqz v4, :cond_58

    .line 461
    iget v4, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v4, v7, :cond_2b

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v4

    :goto_18
    packed-switch v4, :pswitch_data_5a

    .line 475
    :pswitch_1b
    iget-object v4, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/4 v5, 0x5

    iget v6, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v6, v4, v5

    .line 476
    invoke-direct {p0, v7}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 477
    new-instance v4, Lfreemarker/core/ParseException;

    invoke-direct {v4}, Lfreemarker/core/ParseException;-><init>()V

    throw v4

    .line 461
    :cond_2b
    iget v4, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_18

    .line 463
    :pswitch_2e
    const/16 v4, 0x64

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 464
    const/4 v1, 0x1

    .line 479
    :goto_34
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->UnaryExpression()Lfreemarker/core/Expression;

    move-result-object v3

    .line 480
    .local v3, "rhs":Lfreemarker/core/Expression;
    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->numberLiteralOnly(Lfreemarker/core/Expression;)V

    .line 481
    invoke-direct {p0, v3}, Lfreemarker/core/FMParser;->numberLiteralOnly(Lfreemarker/core/Expression;)V

    .line 482
    new-instance v2, Lfreemarker/core/ArithmeticExpression;

    .end local v2    # "result":Lfreemarker/core/Expression;
    invoke-direct {v2, v0, v3, v1}, Lfreemarker/core/ArithmeticExpression;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;I)V

    .line 483
    .restart local v2    # "result":Lfreemarker/core/Expression;
    iget-object v4, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v2, v4, v0, v3}, Lfreemarker/core/Expression;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/TemplateObject;Lfreemarker/core/TemplateObject;)V

    .line 484
    move-object v0, v2

    goto :goto_7

    .line 467
    .end local v3    # "rhs":Lfreemarker/core/Expression;
    :pswitch_4a
    const/16 v4, 0x67

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 468
    const/4 v1, 0x2

    .line 469
    goto :goto_34

    .line 471
    :pswitch_51
    const/16 v4, 0x68

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 472
    const/4 v1, 0x3

    .line 473
    goto :goto_34

    .line 486
    :cond_58
    return-object v2

    .line 461
    nop

    :pswitch_data_5a
    .packed-switch 0x64
        :pswitch_2e
        :pswitch_1b
        :pswitch_1b
        :pswitch_4a
        :pswitch_51
    .end packed-switch
.end method

.method public final NamedArgs()Ljava/util/HashMap;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 2019
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 2024
    .local v1, "result":Ljava/util/HashMap;
    :pswitch_5
    const/16 v3, 0x78

    invoke-direct {p0, v3}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v2

    .line 2025
    .local v2, "t":Lfreemarker/core/Token;
    const/16 v3, 0x5b

    invoke-direct {p0, v3}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 2026
    iget-object v3, p0, Lfreemarker/core/FMParser;->token_source:Lfreemarker/core/FMParserTokenManager;

    iget-object v4, p0, Lfreemarker/core/FMParser;->token_source:Lfreemarker/core/FMParserTokenManager;

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Lfreemarker/core/FMParserTokenManager;->SwitchTo(I)V

    .line 2027
    iget-object v3, p0, Lfreemarker/core/FMParser;->token_source:Lfreemarker/core/FMParserTokenManager;

    const/4 v4, 0x1

    iput-boolean v4, v3, Lfreemarker/core/FMParserTokenManager;->inInvocation:Z

    .line 2028
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v0

    .line 2029
    .local v0, "exp":Lfreemarker/core/Expression;
    iget-object v3, v2, Lfreemarker/core/Token;->image:Ljava/lang/String;

    invoke-virtual {v1, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2030
    iget v3, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    const/4 v4, -0x1

    if-ne v3, v4, :cond_40

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v3

    :goto_2f
    packed-switch v3, :pswitch_data_44

    .line 2035
    iget-object v3, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v4, 0x39

    iget v5, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v5, v3, v4

    .line 2039
    iget-object v3, p0, Lfreemarker/core/FMParser;->token_source:Lfreemarker/core/FMParserTokenManager;

    const/4 v4, 0x0

    iput-boolean v4, v3, Lfreemarker/core/FMParserTokenManager;->inInvocation:Z

    .line 2040
    return-object v1

    .line 2030
    :cond_40
    iget v3, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_2f

    nop

    :pswitch_data_44
    .packed-switch 0x78
        :pswitch_5
    .end packed-switch
.end method

.method public final Nested()Lfreemarker/core/TemplateElement;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v7, -0x1

    .line 1465
    const/4 v2, 0x0

    .line 1466
    .local v2, "result":Lfreemarker/core/BodyInstruction;
    iget v4, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v4, v7, :cond_1e

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v4

    :goto_a
    packed-switch v4, :pswitch_data_74

    .line 1480
    iget-object v4, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v5, 0x1e

    iget v6, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v6, v4, v5

    .line 1481
    invoke-direct {p0, v7}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1482
    new-instance v4, Lfreemarker/core/ParseException;

    invoke-direct {v4}, Lfreemarker/core/ParseException;-><init>()V

    throw v4

    .line 1466
    :cond_1e
    iget v4, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_a

    .line 1468
    :pswitch_21
    const/16 v4, 0x36

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 1469
    .local v3, "t":Lfreemarker/core/Token;
    new-instance v2, Lfreemarker/core/BodyInstruction;

    .end local v2    # "result":Lfreemarker/core/BodyInstruction;
    const/4 v4, 0x0

    invoke-direct {v2, v4}, Lfreemarker/core/BodyInstruction;-><init>(Ljava/util/List;)V

    .line 1470
    .restart local v2    # "result":Lfreemarker/core/BodyInstruction;
    iget-object v4, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v2, v4, v3, v3}, Lfreemarker/core/BodyInstruction;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 1484
    :goto_32
    iget-boolean v4, p0, Lfreemarker/core/FMParser;->inMacro:Z

    if-nez v4, :cond_72

    .line 1485
    new-instance v4, Lfreemarker/core/ParseException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Cannot use a "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, v3, Lfreemarker/core/Token;->image:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, " instruction outside a macro."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-direct {v4, v5, v6, v3}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v4

    .line 1473
    .end local v3    # "t":Lfreemarker/core/Token;
    :pswitch_59
    const/16 v4, 0x37

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 1474
    .restart local v3    # "t":Lfreemarker/core/Token;
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->PositionalArgs()Ljava/util/ArrayList;

    move-result-object v0

    .line 1475
    .local v0, "bodyParameters":Ljava/util/ArrayList;
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->LooseDirectiveEnd()Lfreemarker/core/Token;

    move-result-object v1

    .line 1476
    .local v1, "end":Lfreemarker/core/Token;
    new-instance v2, Lfreemarker/core/BodyInstruction;

    .end local v2    # "result":Lfreemarker/core/BodyInstruction;
    invoke-direct {v2, v0}, Lfreemarker/core/BodyInstruction;-><init>(Ljava/util/List;)V

    .line 1477
    .restart local v2    # "result":Lfreemarker/core/BodyInstruction;
    iget-object v4, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v2, v4, v3, v1}, Lfreemarker/core/BodyInstruction;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    goto :goto_32

    .line 1487
    .end local v0    # "bodyParameters":Ljava/util/ArrayList;
    .end local v1    # "end":Lfreemarker/core/Token;
    :cond_72
    return-object v2

    .line 1466
    nop

    :pswitch_data_74
    .packed-switch 0x36
        :pswitch_21
        :pswitch_59
    .end packed-switch
.end method

.method public final NoEscape()Lfreemarker/core/NoEscapeBlock;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 2291
    const/16 v5, 0x3d

    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v4

    .line 2292
    .local v4, "start":Lfreemarker/core/Token;
    iget-object v5, p0, Lfreemarker/core/FMParser;->escapes:Ljava/util/LinkedList;

    invoke-virtual {v5}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_18

    .line 2293
    new-instance v5, Lfreemarker/core/ParseException;

    const-string v6, "noescape with no matching escape encountered."

    iget-object v7, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-direct {v5, v6, v7, v4}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v5

    .line 2295
    :cond_18
    iget-object v5, p0, Lfreemarker/core/FMParser;->escapes:Ljava/util/LinkedList;

    invoke-virtual {v5}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v2

    .line 2296
    .local v2, "escape":Ljava/lang/Object;
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->OptionalBlock()Lfreemarker/core/TemplateElement;

    move-result-object v0

    .line 2297
    .local v0, "content":Lfreemarker/core/TemplateElement;
    const/16 v5, 0x3e

    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 2298
    .local v1, "end":Lfreemarker/core/Token;
    iget-object v5, p0, Lfreemarker/core/FMParser;->escapes:Ljava/util/LinkedList;

    invoke-virtual {v5, v2}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 2299
    new-instance v3, Lfreemarker/core/NoEscapeBlock;

    invoke-direct {v3, v0}, Lfreemarker/core/NoEscapeBlock;-><init>(Lfreemarker/core/TemplateElement;)V

    .line 2300
    .local v3, "result":Lfreemarker/core/NoEscapeBlock;
    iget-object v5, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v3, v5, v4, v1}, Lfreemarker/core/NoEscapeBlock;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 2301
    return-object v3
.end method

.method public final NoParse()Lfreemarker/core/TextBlock;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 2132
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 2133
    .local v0, "buf":Ljava/lang/StringBuffer;
    const/16 v4, 0x1e

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 2134
    .local v3, "start":Lfreemarker/core/Token;
    invoke-virtual {p0, v0}, Lfreemarker/core/FMParser;->UnparsedContent(Ljava/lang/StringBuffer;)Lfreemarker/core/Token;

    move-result-object v1

    .line 2135
    .local v1, "end":Lfreemarker/core/Token;
    new-instance v2, Lfreemarker/core/TextBlock;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-direct {v2, v4, v5}, Lfreemarker/core/TextBlock;-><init>(Ljava/lang/String;Z)V

    .line 2136
    .local v2, "result":Lfreemarker/core/TextBlock;
    iget-object v4, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v2, v4, v3, v1}, Lfreemarker/core/TextBlock;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 2137
    return-object v2
.end method

.method public final NotExpression()Lfreemarker/core/Expression;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 349
    const/4 v3, 0x0

    .line 350
    .local v3, "result":Lfreemarker/core/Expression;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 353
    .local v2, "nots":Ljava/util/ArrayList;
    :pswitch_6
    const/16 v6, 0x6b

    invoke-direct {p0, v6}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v4

    .line 354
    .local v4, "t":Lfreemarker/core/Token;
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 355
    iget v6, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    const/4 v7, -0x1

    if-ne v6, v7, :cond_48

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v6

    :goto_18
    packed-switch v6, :pswitch_data_4c

    .line 360
    iget-object v6, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/4 v7, 0x2

    iget v8, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v8, v6, v7

    .line 364
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->PrimaryExpression()Lfreemarker/core/Expression;

    move-result-object v0

    .line 365
    .local v0, "exp":Lfreemarker/core/Expression;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_27
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v1, v6, :cond_4b

    .line 366
    new-instance v3, Lfreemarker/core/NotExpression;

    .end local v3    # "result":Lfreemarker/core/Expression;
    invoke-direct {v3, v0}, Lfreemarker/core/NotExpression;-><init>(Lfreemarker/core/Expression;)V

    .line 367
    .restart local v3    # "result":Lfreemarker/core/Expression;
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v6

    sub-int/2addr v6, v1

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lfreemarker/core/Token;

    .line 368
    .local v5, "tok":Lfreemarker/core/Token;
    iget-object v6, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v3, v6, v5, v0}, Lfreemarker/core/Expression;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/TemplateObject;)V

    .line 369
    move-object v0, v3

    .line 365
    add-int/lit8 v1, v1, 0x1

    goto :goto_27

    .line 355
    .end local v0    # "exp":Lfreemarker/core/Expression;
    .end local v1    # "i":I
    .end local v5    # "tok":Lfreemarker/core/Token;
    :cond_48
    iget v6, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_18

    .line 371
    .restart local v0    # "exp":Lfreemarker/core/Expression;
    .restart local v1    # "i":I
    :cond_4b
    return-object v3

    .line 355
    :pswitch_data_4c
    .packed-switch 0x6b
        :pswitch_6
    .end packed-switch
.end method

.method public final NumberLiteral()Lfreemarker/core/Expression;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v8, -0x1

    .line 659
    const/4 v0, 0x0

    .line 660
    .local v0, "op":Lfreemarker/core/Token;
    iget v5, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v5, v8, :cond_1e

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v5

    :goto_a
    packed-switch v5, :pswitch_data_4a

    .line 668
    iget-object v5, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v6, 0x8

    iget v7, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v7, v5, v6

    .line 669
    invoke-direct {p0, v8}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 670
    new-instance v5, Lfreemarker/core/ParseException;

    invoke-direct {v5}, Lfreemarker/core/ParseException;-><init>()V

    throw v5

    .line 660
    :cond_1e
    iget v5, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_a

    .line 662
    :pswitch_21
    const/16 v5, 0x55

    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v4

    .line 672
    .local v4, "t":Lfreemarker/core/Token;
    :goto_27
    iget-object v2, v4, Lfreemarker/core/Token;->image:Ljava/lang/String;

    .line 673
    .local v2, "s":Ljava/lang/String;
    new-instance v1, Lfreemarker/core/NumberLiteral;

    iget-object v5, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v5}, Lfreemarker/template/Template;->getArithmeticEngine()Lfreemarker/core/ArithmeticEngine;

    move-result-object v5

    invoke-virtual {v5, v2}, Lfreemarker/core/ArithmeticEngine;->toNumber(Ljava/lang/String;)Ljava/lang/Number;

    move-result-object v5

    invoke-direct {v1, v5}, Lfreemarker/core/NumberLiteral;-><init>(Ljava/lang/Number;)V

    .line 674
    .local v1, "result":Lfreemarker/core/Expression;
    if-eqz v0, :cond_48

    move-object v3, v0

    .line 675
    .local v3, "startToken":Lfreemarker/core/Token;
    :goto_3b
    iget-object v5, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v1, v5, v3, v4}, Lfreemarker/core/Expression;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 676
    return-object v1

    .line 665
    .end local v1    # "result":Lfreemarker/core/Expression;
    .end local v2    # "s":Ljava/lang/String;
    .end local v3    # "startToken":Lfreemarker/core/Token;
    .end local v4    # "t":Lfreemarker/core/Token;
    :pswitch_41
    const/16 v5, 0x56

    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v4

    .line 666
    .restart local v4    # "t":Lfreemarker/core/Token;
    goto :goto_27

    .restart local v1    # "result":Lfreemarker/core/Expression;
    .restart local v2    # "s":Ljava/lang/String;
    :cond_48
    move-object v3, v4

    .line 674
    goto :goto_3b

    .line 660
    :pswitch_data_4a
    .packed-switch 0x55
        :pswitch_21
        :pswitch_41
    .end packed-switch
.end method

.method public final NumericalOutput()Lfreemarker/core/NumericalOutput;
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 1088
    const/4 v4, 0x0

    .line 1089
    .local v4, "fmt":Lfreemarker/core/Token;
    const/16 v11, 0x48

    invoke-direct {p0, v11}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v0

    .line 1090
    .local v0, "begin":Lfreemarker/core/Token;
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v3

    .line 1091
    .local v3, "exp":Lfreemarker/core/Expression;
    invoke-direct {p0, v3}, Lfreemarker/core/FMParser;->numberLiteralOnly(Lfreemarker/core/Expression;)V

    .line 1092
    iget v11, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    const/4 v12, -0x1

    if-ne v11, v12, :cond_71

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v11

    :goto_17
    packed-switch v11, :pswitch_data_128

    .line 1098
    iget-object v11, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v12, 0x14

    iget v13, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v13, v11, v12

    .line 1101
    :goto_22
    const/16 v11, 0x74

    invoke-direct {p0, v11}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v2

    .line 1103
    .local v2, "end":Lfreemarker/core/Token;
    if-eqz v4, :cond_121

    .line 1104
    const/4 v6, -0x1

    .line 1105
    .local v6, "minFrac":I
    const/4 v5, -0x1

    .line 1107
    .local v5, "maxFrac":I
    new-instance v8, Ljava/util/StringTokenizer;

    iget-object v11, v4, Lfreemarker/core/Token;->image:Ljava/lang/String;

    const-string v12, "mM"

    const/4 v13, 0x1

    invoke-direct {v8, v11, v12, v13}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 1108
    .local v8, "st":Ljava/util/StringTokenizer;
    const/16 v10, 0x2d

    .line 1109
    .local v10, "type":C
    :goto_38
    invoke-virtual {v8}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v11

    if-eqz v11, :cond_e2

    .line 1110
    invoke-virtual {v8}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v9

    .line 1112
    .local v9, "token":Ljava/lang/String;
    const/16 v11, 0x2d

    if-eq v10, v11, :cond_c4

    .line 1113
    sparse-switch v10, :sswitch_data_12e

    .line 1123
    :try_start_49
    new-instance v11, Lfreemarker/core/ParseException;

    const-string v12, "Invalid formatting string"

    iget-object v13, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-direct {v11, v12, v13, v4}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v11
    :try_end_53
    .catch Lfreemarker/core/ParseException; {:try_start_49 .. :try_end_53} :catch_53
    .catch Ljava/lang/NumberFormatException; {:try_start_49 .. :try_end_53} :catch_8d

    .line 1134
    :catch_53
    move-exception v1

    .line 1135
    .local v1, "e":Lfreemarker/core/ParseException;
    new-instance v11, Lfreemarker/core/ParseException;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string v13, "Invalid format specifier "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, v4, Lfreemarker/core/Token;->image:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    iget-object v13, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-direct {v11, v12, v13, v4}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v11

    .line 1092
    .end local v1    # "e":Lfreemarker/core/ParseException;
    .end local v2    # "end":Lfreemarker/core/Token;
    .end local v5    # "maxFrac":I
    .end local v6    # "minFrac":I
    .end local v8    # "st":Ljava/util/StringTokenizer;
    .end local v9    # "token":Ljava/lang/String;
    .end local v10    # "type":C
    :cond_71
    iget v11, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_17

    .line 1094
    :pswitch_74
    const/16 v11, 0x6d

    invoke-direct {p0, v11}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1095
    const/16 v11, 0x78

    invoke-direct {p0, v11}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v4

    .line 1096
    goto :goto_22

    .line 1115
    .restart local v2    # "end":Lfreemarker/core/Token;
    .restart local v5    # "maxFrac":I
    .restart local v6    # "minFrac":I
    .restart local v8    # "st":Ljava/util/StringTokenizer;
    .restart local v9    # "token":Ljava/lang/String;
    .restart local v10    # "type":C
    :sswitch_80
    const/4 v11, -0x1

    if-eq v6, v11, :cond_ab

    :try_start_83
    new-instance v11, Lfreemarker/core/ParseException;

    const-string v12, "Invalid formatting string"

    iget-object v13, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-direct {v11, v12, v13, v4}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v11
    :try_end_8d
    .catch Lfreemarker/core/ParseException; {:try_start_83 .. :try_end_8d} :catch_53
    .catch Ljava/lang/NumberFormatException; {:try_start_83 .. :try_end_8d} :catch_8d

    .line 1137
    :catch_8d
    move-exception v1

    .line 1138
    .local v1, "e":Ljava/lang/NumberFormatException;
    new-instance v11, Lfreemarker/core/ParseException;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string v13, "Invalid number in the format specifier "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, v4, Lfreemarker/core/Token;->image:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    iget-object v13, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-direct {v11, v12, v13, v4}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v11

    .line 1116
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    :cond_ab
    :try_start_ab
    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 1125
    :goto_af
    const/16 v10, 0x2d

    goto :goto_38

    .line 1119
    :sswitch_b2
    const/4 v11, -0x1

    if-eq v5, v11, :cond_bf

    new-instance v11, Lfreemarker/core/ParseException;

    const-string v12, "Invalid formatting string"

    iget-object v13, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-direct {v11, v12, v13, v4}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v11

    .line 1120
    :cond_bf
    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 1121
    goto :goto_af

    .line 1126
    :cond_c4
    const-string v11, "m"

    invoke-virtual {v9, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_d0

    .line 1127
    const/16 v10, 0x6d

    goto/16 :goto_38

    .line 1128
    :cond_d0
    const-string v11, "M"

    invoke-virtual {v9, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_dc

    .line 1129
    const/16 v10, 0x4d

    goto/16 :goto_38

    .line 1131
    :cond_dc
    new-instance v11, Lfreemarker/core/ParseException;

    invoke-direct {v11}, Lfreemarker/core/ParseException;-><init>()V

    throw v11
    :try_end_e2
    .catch Lfreemarker/core/ParseException; {:try_start_ab .. :try_end_e2} :catch_53
    .catch Ljava/lang/NumberFormatException; {:try_start_ab .. :try_end_e2} :catch_8d

    .line 1142
    .end local v9    # "token":Ljava/lang/String;
    :cond_e2
    const/4 v11, -0x1

    if-ne v5, v11, :cond_ff

    .line 1143
    const/4 v11, -0x1

    if-ne v6, v11, :cond_f2

    .line 1144
    new-instance v11, Lfreemarker/core/ParseException;

    const-string v12, "Invalid format specification, at least one of m and M must be specified!"

    iget-object v13, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-direct {v11, v12, v13, v4}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v11

    .line 1146
    :cond_f2
    move v5, v6

    .line 1150
    :cond_f3
    :goto_f3
    if-le v6, v5, :cond_104

    .line 1151
    new-instance v11, Lfreemarker/core/ParseException;

    const-string v12, "Invalid format specification, min cannot be greater than max!"

    iget-object v13, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-direct {v11, v12, v13, v4}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v11

    .line 1147
    :cond_ff
    const/4 v11, -0x1

    if-ne v6, v11, :cond_f3

    .line 1148
    const/4 v6, 0x0

    goto :goto_f3

    .line 1153
    :cond_104
    const/16 v11, 0x32

    if-gt v6, v11, :cond_10c

    const/16 v11, 0x32

    if-le v5, v11, :cond_116

    .line 1154
    :cond_10c
    new-instance v11, Lfreemarker/core/ParseException;

    const-string v12, "Cannot specify more than 50 fraction digits"

    iget-object v13, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-direct {v11, v12, v13, v4}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v11

    .line 1156
    :cond_116
    new-instance v7, Lfreemarker/core/NumericalOutput;

    invoke-direct {v7, v3, v6, v5}, Lfreemarker/core/NumericalOutput;-><init>(Lfreemarker/core/Expression;II)V

    .line 1160
    .end local v5    # "maxFrac":I
    .end local v6    # "minFrac":I
    .end local v8    # "st":Ljava/util/StringTokenizer;
    .end local v10    # "type":C
    .local v7, "result":Lfreemarker/core/NumericalOutput;
    :goto_11b
    iget-object v11, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v7, v11, v0, v2}, Lfreemarker/core/NumericalOutput;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 1161
    return-object v7

    .line 1158
    .end local v7    # "result":Lfreemarker/core/NumericalOutput;
    :cond_121
    new-instance v7, Lfreemarker/core/NumericalOutput;

    invoke-direct {v7, v3}, Lfreemarker/core/NumericalOutput;-><init>(Lfreemarker/core/Expression;)V

    .restart local v7    # "result":Lfreemarker/core/NumericalOutput;
    goto :goto_11b

    .line 1092
    nop

    :pswitch_data_128
    .packed-switch 0x6d
        :pswitch_74
    .end packed-switch

    .line 1113
    :sswitch_data_12e
    .sparse-switch
        0x4d -> :sswitch_b2
        0x6d -> :sswitch_80
    .end sparse-switch
.end method

.method public final OptionalBlock()Lfreemarker/core/TemplateElement;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 2715
    sget-object v0, Lfreemarker/core/TextBlock;->EMPTY_BLOCK:Lfreemarker/core/TextBlock;

    .line 2716
    .local v0, "tp":Lfreemarker/core/TemplateElement;
    iget v1, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_17

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v1

    :goto_b
    packed-switch v1, :pswitch_data_20

    .line 2764
    :pswitch_e
    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v2, 0x4d

    iget v3, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v3, v1, v2

    .line 2767
    :goto_16
    return-object v0

    .line 2716
    :cond_17
    iget v1, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_b

    .line 2761
    :pswitch_1a
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Content()Lfreemarker/core/TemplateElement;

    move-result-object v0

    .line 2762
    goto :goto_16

    .line 2716
    nop

    :pswitch_data_20
    .packed-switch 0x6
        :pswitch_1a
        :pswitch_e
        :pswitch_1a
        :pswitch_e
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_e
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_e
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_e
        :pswitch_1a
        :pswitch_e
        :pswitch_1a
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
    .end packed-switch
.end method

.method public final OrExpression()Lfreemarker/core/Expression;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 625
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->AndExpression()Lfreemarker/core/Expression;

    move-result-object v0

    .line 626
    .local v0, "lhs":Lfreemarker/core/Expression;
    move-object v1, v0

    .line 629
    .local v1, "result":Lfreemarker/core/Expression;
    :goto_5
    const v3, 0x7fffffff

    invoke-direct {p0, v3}, Lfreemarker/core/FMParser;->jj_2_9(I)Z

    move-result v3

    if-eqz v3, :cond_29

    .line 634
    const/16 v3, 0x6a

    invoke-direct {p0, v3}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 635
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->AndExpression()Lfreemarker/core/Expression;

    move-result-object v2

    .line 636
    .local v2, "rhs":Lfreemarker/core/Expression;
    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->booleanLiteralOnly(Lfreemarker/core/Expression;)V

    .line 637
    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->booleanLiteralOnly(Lfreemarker/core/Expression;)V

    .line 638
    new-instance v1, Lfreemarker/core/OrExpression;

    .end local v1    # "result":Lfreemarker/core/Expression;
    invoke-direct {v1, v0, v2}, Lfreemarker/core/OrExpression;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V

    .line 639
    .restart local v1    # "result":Lfreemarker/core/Expression;
    iget-object v3, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v1, v3, v0, v2}, Lfreemarker/core/Expression;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/TemplateObject;Lfreemarker/core/TemplateObject;)V

    .line 640
    move-object v0, v1

    goto :goto_5

    .line 642
    .end local v2    # "rhs":Lfreemarker/core/Expression;
    :cond_29
    return-object v1
.end method

.method public final PCData()Lfreemarker/core/TextBlock;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x46

    const/4 v7, -0x1

    .line 2453
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 2454
    .local v0, "buf":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    .local v4, "t":Lfreemarker/core/Token;
    const/4 v3, 0x0

    .local v3, "start":Lfreemarker/core/Token;
    const/4 v1, 0x0

    .line 2457
    .local v1, "prevToken":Lfreemarker/core/Token;
    :cond_b
    iget v5, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v5, v7, :cond_25

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v5

    :goto_13
    packed-switch v5, :pswitch_data_6e

    .line 2469
    iget-object v5, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    iget v6, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v6, v5, v8

    .line 2470
    invoke-direct {p0, v7}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 2471
    new-instance v5, Lfreemarker/core/ParseException;

    invoke-direct {v5}, Lfreemarker/core/ParseException;-><init>()V

    throw v5

    .line 2457
    :cond_25
    iget v5, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_13

    .line 2459
    :pswitch_28
    move-object v1, v4

    .line 2460
    const/16 v5, 0x44

    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v4

    .line 2473
    :goto_2f
    iget-object v5, v4, Lfreemarker/core/Token;->image:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2474
    if-nez v3, :cond_37

    move-object v3, v4

    .line 2475
    :cond_37
    if-eqz v1, :cond_3c

    const/4 v5, 0x0

    iput-object v5, v1, Lfreemarker/core/Token;->next:Lfreemarker/core/Token;

    .line 2476
    :cond_3c
    const v5, 0x7fffffff

    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_2_16(I)Z

    move-result v5

    if-nez v5, :cond_b

    .line 2482
    iget-boolean v5, p0, Lfreemarker/core/FMParser;->stripText:Z

    if-eqz v5, :cond_5d

    iget v5, p0, Lfreemarker/core/FMParser;->contentNesting:I

    const/4 v6, 0x1

    if-ne v5, v6, :cond_5d

    .line 2483
    sget-object v2, Lfreemarker/core/TextBlock;->EMPTY_BLOCK:Lfreemarker/core/TextBlock;

    .line 2487
    :goto_50
    return-object v2

    .line 2463
    :pswitch_51
    const/16 v5, 0x45

    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v4

    .line 2464
    goto :goto_2f

    .line 2466
    :pswitch_58
    invoke-direct {p0, v8}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v4

    .line 2467
    goto :goto_2f

    .line 2485
    :cond_5d
    new-instance v2, Lfreemarker/core/TextBlock;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-direct {v2, v5, v6}, Lfreemarker/core/TextBlock;-><init>(Ljava/lang/String;Z)V

    .line 2486
    .local v2, "result":Lfreemarker/core/TextBlock;
    iget-object v5, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v2, v5, v3, v4}, Lfreemarker/core/TextBlock;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    goto :goto_50

    .line 2457
    nop

    :pswitch_data_6e
    .packed-switch 0x44
        :pswitch_28
        :pswitch_51
        :pswitch_58
    .end packed-switch
.end method

.method public final ParamList()Ljava/util/Map;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v6, -0x1

    .line 2894
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 2897
    .local v2, "result":Ljava/util/Map;
    :pswitch_6
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Identifier()Lfreemarker/core/Identifier;

    move-result-object v1

    .line 2898
    .local v1, "id":Lfreemarker/core/Identifier;
    const/16 v3, 0x5b

    invoke-direct {p0, v3}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 2899
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v0

    .line 2900
    .local v0, "exp":Lfreemarker/core/Expression;
    invoke-virtual {v1}, Lfreemarker/core/Identifier;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2901
    iget v3, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v3, v6, :cond_41

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v3

    :goto_22
    packed-switch v3, :pswitch_data_4e

    .line 2906
    iget-object v3, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v4, 0x51

    iget v5, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v5, v3, v4

    .line 2909
    :goto_2d
    iget v3, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v3, v6, :cond_4a

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v3

    :goto_35
    packed-switch v3, :pswitch_data_54

    .line 2914
    iget-object v3, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v4, 0x52

    iget v5, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v5, v3, v4

    .line 2918
    return-object v2

    .line 2901
    :cond_41
    iget v3, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_22

    .line 2903
    :pswitch_44
    const/16 v3, 0x6c

    invoke-direct {p0, v3}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    goto :goto_2d

    .line 2909
    :cond_4a
    iget v3, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_35

    .line 2901
    nop

    :pswitch_data_4e
    .packed-switch 0x6c
        :pswitch_44
    .end packed-switch

    .line 2909
    :pswitch_data_54
    .packed-switch 0x78
        :pswitch_6
    .end packed-switch
.end method

.method public final Parenthesis()Lfreemarker/core/Expression;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 299
    const/16 v4, 0x71

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 300
    .local v3, "start":Lfreemarker/core/Token;
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v1

    .line 301
    .local v1, "exp":Lfreemarker/core/Expression;
    const/16 v4, 0x72

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v0

    .line 302
    .local v0, "end":Lfreemarker/core/Token;
    new-instance v2, Lfreemarker/core/ParentheticalExpression;

    invoke-direct {v2, v1}, Lfreemarker/core/ParentheticalExpression;-><init>(Lfreemarker/core/Expression;)V

    .line 303
    .local v2, "result":Lfreemarker/core/Expression;
    iget-object v4, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v2, v4, v3, v0}, Lfreemarker/core/Expression;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 304
    return-object v2
.end method

.method public final PositionalArgs()Ljava/util/ArrayList;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v5, -0x1

    .line 2045
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 2047
    .local v1, "result":Ljava/util/ArrayList;
    iget v2, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v2, v5, :cond_1a

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v2

    :goto_e
    sparse-switch v2, :sswitch_data_60

    .line 2101
    iget-object v2, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v3, 0x3c

    iget v4, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v4, v2, v3

    .line 2104
    :goto_19
    return-object v1

    .line 2047
    :cond_1a
    iget v2, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_e

    .line 2062
    :sswitch_1d
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v0

    .line 2063
    .local v0, "arg":Lfreemarker/core/Expression;
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2066
    :goto_24
    iget v2, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v2, v5, :cond_38

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v2

    :goto_2c
    sparse-switch v2, :sswitch_data_9a

    .line 2085
    iget-object v2, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v3, 0x3a

    iget v4, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v4, v2, v3

    goto :goto_19

    .line 2066
    :cond_38
    iget v2, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_2c

    .line 2088
    :sswitch_3b
    iget v2, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v2, v5, :cond_56

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v2

    :goto_43
    packed-switch v2, :pswitch_data_d8

    .line 2093
    iget-object v2, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v3, 0x3b

    iget v4, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v4, v2, v3

    .line 2096
    :goto_4e
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v0

    .line 2097
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_24

    .line 2088
    :cond_56
    iget v2, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_43

    .line 2090
    :pswitch_59
    const/16 v2, 0x6c

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    goto :goto_4e

    .line 2047
    nop

    :sswitch_data_60
    .sparse-switch
        0x51 -> :sswitch_1d
        0x52 -> :sswitch_1d
        0x53 -> :sswitch_1d
        0x54 -> :sswitch_1d
        0x55 -> :sswitch_1d
        0x56 -> :sswitch_1d
        0x57 -> :sswitch_1d
        0x62 -> :sswitch_1d
        0x63 -> :sswitch_1d
        0x6b -> :sswitch_1d
        0x6f -> :sswitch_1d
        0x71 -> :sswitch_1d
        0x73 -> :sswitch_1d
        0x78 -> :sswitch_1d
    .end sparse-switch

    .line 2066
    :sswitch_data_9a
    .sparse-switch
        0x51 -> :sswitch_3b
        0x52 -> :sswitch_3b
        0x53 -> :sswitch_3b
        0x54 -> :sswitch_3b
        0x55 -> :sswitch_3b
        0x56 -> :sswitch_3b
        0x57 -> :sswitch_3b
        0x62 -> :sswitch_3b
        0x63 -> :sswitch_3b
        0x6b -> :sswitch_3b
        0x6c -> :sswitch_3b
        0x6f -> :sswitch_3b
        0x71 -> :sswitch_3b
        0x73 -> :sswitch_3b
        0x78 -> :sswitch_3b
    .end sparse-switch

    .line 2088
    :pswitch_data_d8
    .packed-switch 0x6c
        :pswitch_59
    .end packed-switch
.end method

.method public final PrimaryExpression()Lfreemarker/core/Expression;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v4, -0x1

    .line 250
    iget v1, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v1, v4, :cond_1c

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v1

    :goto_9
    sparse-switch v1, :sswitch_data_56

    .line 279
    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/4 v2, 0x0

    iget v3, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v3, v1, v2

    .line 280
    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 281
    new-instance v1, Lfreemarker/core/ParseException;

    invoke-direct {v1}, Lfreemarker/core/ParseException;-><init>()V

    throw v1

    .line 250
    :cond_1c
    iget v1, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_9

    .line 253
    :sswitch_1f
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->NumberLiteral()Lfreemarker/core/Expression;

    move-result-object v0

    .line 285
    .local v0, "exp":Lfreemarker/core/Expression;
    :goto_23
    const v1, 0x7fffffff

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_2_1(I)Z

    move-result v1

    if-eqz v1, :cond_55

    .line 290
    invoke-virtual {p0, v0}, Lfreemarker/core/FMParser;->AddSubExpression(Lfreemarker/core/Expression;)Lfreemarker/core/Expression;

    move-result-object v0

    goto :goto_23

    .line 256
    .end local v0    # "exp":Lfreemarker/core/Expression;
    :sswitch_31
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->HashLiteral()Lfreemarker/core/HashLiteral;

    move-result-object v0

    .line 257
    .restart local v0    # "exp":Lfreemarker/core/Expression;
    goto :goto_23

    .line 260
    .end local v0    # "exp":Lfreemarker/core/Expression;
    :sswitch_36
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lfreemarker/core/FMParser;->StringLiteral(Z)Lfreemarker/core/StringLiteral;

    move-result-object v0

    .line 261
    .restart local v0    # "exp":Lfreemarker/core/Expression;
    goto :goto_23

    .line 264
    .end local v0    # "exp":Lfreemarker/core/Expression;
    :sswitch_3c
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->BooleanLiteral()Lfreemarker/core/Expression;

    move-result-object v0

    .line 265
    .restart local v0    # "exp":Lfreemarker/core/Expression;
    goto :goto_23

    .line 267
    .end local v0    # "exp":Lfreemarker/core/Expression;
    :sswitch_41
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->ListLiteral()Lfreemarker/core/ListLiteral;

    move-result-object v0

    .line 268
    .restart local v0    # "exp":Lfreemarker/core/Expression;
    goto :goto_23

    .line 270
    .end local v0    # "exp":Lfreemarker/core/Expression;
    :sswitch_46
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Identifier()Lfreemarker/core/Identifier;

    move-result-object v0

    .line 271
    .restart local v0    # "exp":Lfreemarker/core/Expression;
    goto :goto_23

    .line 273
    .end local v0    # "exp":Lfreemarker/core/Expression;
    :sswitch_4b
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Parenthesis()Lfreemarker/core/Expression;

    move-result-object v0

    .line 274
    .restart local v0    # "exp":Lfreemarker/core/Expression;
    goto :goto_23

    .line 276
    .end local v0    # "exp":Lfreemarker/core/Expression;
    :sswitch_50
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->BuiltinVariable()Lfreemarker/core/BuiltinVariable;

    move-result-object v0

    .line 277
    .restart local v0    # "exp":Lfreemarker/core/Expression;
    goto :goto_23

    .line 292
    :cond_55
    return-object v0

    .line 250
    :sswitch_data_56
    .sparse-switch
        0x51 -> :sswitch_36
        0x52 -> :sswitch_36
        0x53 -> :sswitch_3c
        0x54 -> :sswitch_3c
        0x55 -> :sswitch_1f
        0x56 -> :sswitch_1f
        0x57 -> :sswitch_50
        0x6f -> :sswitch_41
        0x71 -> :sswitch_4b
        0x73 -> :sswitch_31
        0x78 -> :sswitch_46
    .end sparse-switch
.end method

.method public final RangeExpression()Lfreemarker/core/Expression;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const v5, 0x7fffffff

    .line 572
    const/4 v3, 0x0

    .line 573
    .local v3, "rhs":Lfreemarker/core/Expression;
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->AdditiveExpression()Lfreemarker/core/Expression;

    move-result-object v0

    .line 574
    .local v0, "lhs":Lfreemarker/core/Expression;
    move-object v2, v0

    .line 575
    .local v2, "result":Lfreemarker/core/Expression;
    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_2_7(I)Z

    move-result v4

    if-eqz v4, :cond_33

    .line 576
    const/16 v4, 0x58

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 577
    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_2_6(I)Z

    move-result v4

    if-eqz v4, :cond_1e

    .line 578
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->AdditiveExpression()Lfreemarker/core/Expression;

    move-result-object v3

    .line 582
    :cond_1e
    invoke-direct {p0, v0}, Lfreemarker/core/FMParser;->numberLiteralOnly(Lfreemarker/core/Expression;)V

    .line 583
    if-eqz v3, :cond_26

    .line 584
    invoke-direct {p0, v3}, Lfreemarker/core/FMParser;->numberLiteralOnly(Lfreemarker/core/Expression;)V

    .line 586
    :cond_26
    new-instance v1, Lfreemarker/core/Range;

    invoke-direct {v1, v0, v3}, Lfreemarker/core/Range;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V

    .line 587
    .local v1, "range":Lfreemarker/core/Range;
    if-eqz v3, :cond_34

    .line 588
    iget-object v4, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v1, v4, v0, v3}, Lfreemarker/core/Range;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/TemplateObject;Lfreemarker/core/TemplateObject;)V

    .line 592
    :goto_32
    move-object v2, v1

    .line 596
    .end local v1    # "range":Lfreemarker/core/Range;
    :cond_33
    return-object v2

    .line 590
    .restart local v1    # "range":Lfreemarker/core/Range;
    :cond_34
    iget-object v4, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v1, v4, v0, v0}, Lfreemarker/core/Range;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/TemplateObject;Lfreemarker/core/TemplateObject;)V

    goto :goto_32
.end method

.method public ReInit(Lfreemarker/core/FMParserTokenManager;)V
    .registers 5
    .param p1, "tm"    # Lfreemarker/core/FMParserTokenManager;

    .prologue
    const/4 v2, -0x1

    .line 4514
    iput-object p1, p0, Lfreemarker/core/FMParser;->token_source:Lfreemarker/core/FMParserTokenManager;

    .line 4515
    new-instance v1, Lfreemarker/core/Token;

    invoke-direct {v1}, Lfreemarker/core/Token;-><init>()V

    iput-object v1, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    .line 4516
    iput v2, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    .line 4517
    const/4 v1, 0x0

    iput v1, p0, Lfreemarker/core/FMParser;->jj_gen:I

    .line 4518
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    const/16 v1, 0x53

    if-ge v0, v1, :cond_1b

    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 4519
    :cond_1b
    const/4 v0, 0x0

    :goto_1c
    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_2_rtns:[Lfreemarker/core/FMParser$JJCalls;

    array-length v1, v1

    if-ge v0, v1, :cond_2d

    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_2_rtns:[Lfreemarker/core/FMParser$JJCalls;

    new-instance v2, Lfreemarker/core/FMParser$JJCalls;

    invoke-direct {v2}, Lfreemarker/core/FMParser$JJCalls;-><init>()V

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1c

    .line 4520
    :cond_2d
    return-void
.end method

.method public ReInit(Ljava/io/InputStream;)V
    .registers 6
    .param p1, "stream"    # Ljava/io/InputStream;

    .prologue
    const/4 v2, 0x1

    const/4 v3, -0x1

    .line 4475
    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_input_stream:Lfreemarker/core/SimpleCharStream;

    invoke-virtual {v1, p1, v2, v2}, Lfreemarker/core/SimpleCharStream;->ReInit(Ljava/io/InputStream;II)V

    .line 4476
    iget-object v1, p0, Lfreemarker/core/FMParser;->token_source:Lfreemarker/core/FMParserTokenManager;

    iget-object v2, p0, Lfreemarker/core/FMParser;->jj_input_stream:Lfreemarker/core/SimpleCharStream;

    invoke-virtual {v1, v2}, Lfreemarker/core/FMParserTokenManager;->ReInit(Lfreemarker/core/SimpleCharStream;)V

    .line 4477
    new-instance v1, Lfreemarker/core/Token;

    invoke-direct {v1}, Lfreemarker/core/Token;-><init>()V

    iput-object v1, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    .line 4478
    iput v3, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    .line 4479
    const/4 v1, 0x0

    iput v1, p0, Lfreemarker/core/FMParser;->jj_gen:I

    .line 4480
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1b
    const/16 v1, 0x53

    if-ge v0, v1, :cond_26

    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    aput v3, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1b

    .line 4481
    :cond_26
    const/4 v0, 0x0

    :goto_27
    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_2_rtns:[Lfreemarker/core/FMParser$JJCalls;

    array-length v1, v1

    if-ge v0, v1, :cond_38

    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_2_rtns:[Lfreemarker/core/FMParser$JJCalls;

    new-instance v2, Lfreemarker/core/FMParser$JJCalls;

    invoke-direct {v2}, Lfreemarker/core/FMParser$JJCalls;-><init>()V

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_27

    .line 4482
    :cond_38
    return-void
.end method

.method public ReInit(Ljava/io/Reader;)V
    .registers 6
    .param p1, "stream"    # Ljava/io/Reader;

    .prologue
    const/4 v2, 0x1

    const/4 v3, -0x1

    .line 4495
    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_input_stream:Lfreemarker/core/SimpleCharStream;

    invoke-virtual {v1, p1, v2, v2}, Lfreemarker/core/SimpleCharStream;->ReInit(Ljava/io/Reader;II)V

    .line 4496
    iget-object v1, p0, Lfreemarker/core/FMParser;->token_source:Lfreemarker/core/FMParserTokenManager;

    iget-object v2, p0, Lfreemarker/core/FMParser;->jj_input_stream:Lfreemarker/core/SimpleCharStream;

    invoke-virtual {v1, v2}, Lfreemarker/core/FMParserTokenManager;->ReInit(Lfreemarker/core/SimpleCharStream;)V

    .line 4497
    new-instance v1, Lfreemarker/core/Token;

    invoke-direct {v1}, Lfreemarker/core/Token;-><init>()V

    iput-object v1, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    .line 4498
    iput v3, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    .line 4499
    const/4 v1, 0x0

    iput v1, p0, Lfreemarker/core/FMParser;->jj_gen:I

    .line 4500
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1b
    const/16 v1, 0x53

    if-ge v0, v1, :cond_26

    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    aput v3, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1b

    .line 4501
    :cond_26
    const/4 v0, 0x0

    :goto_27
    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_2_rtns:[Lfreemarker/core/FMParser$JJCalls;

    array-length v1, v1

    if-ge v0, v1, :cond_38

    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_2_rtns:[Lfreemarker/core/FMParser$JJCalls;

    new-instance v2, Lfreemarker/core/FMParser$JJCalls;

    invoke-direct {v2}, Lfreemarker/core/FMParser$JJCalls;-><init>()V

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_27

    .line 4502
    :cond_38
    return-void
.end method

.method public final Recover()Lfreemarker/core/RecoveryBlock;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 1242
    const/4 v3, 0x7

    invoke-direct {p0, v3}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v2

    .line 1243
    .local v2, "start":Lfreemarker/core/Token;
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->OptionalBlock()Lfreemarker/core/TemplateElement;

    move-result-object v0

    .line 1244
    .local v0, "block":Lfreemarker/core/TemplateElement;
    new-instance v1, Lfreemarker/core/RecoveryBlock;

    invoke-direct {v1, v0}, Lfreemarker/core/RecoveryBlock;-><init>(Lfreemarker/core/TemplateElement;)V

    .line 1245
    .local v1, "result":Lfreemarker/core/RecoveryBlock;
    iget-object v3, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v1, v3, v2, v0}, Lfreemarker/core/RecoveryBlock;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/TemplateObject;)V

    .line 1246
    return-object v1
.end method

.method public final Recurse()Lfreemarker/core/RecurseNode;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v8, -0x1

    .line 1316
    const/4 v0, 0x0

    .line 1317
    .local v0, "end":Lfreemarker/core/Token;
    const/4 v2, 0x0

    .local v2, "node":Lfreemarker/core/Expression;
    const/4 v1, 0x0

    .line 1318
    .local v1, "namespaces":Lfreemarker/core/Expression;
    iget v5, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v5, v8, :cond_20

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v5

    :goto_c
    packed-switch v5, :pswitch_data_7e

    .line 1357
    iget-object v5, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v6, 0x1b

    iget v7, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v7, v5, v6

    .line 1358
    invoke-direct {p0, v8}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1359
    new-instance v5, Lfreemarker/core/ParseException;

    invoke-direct {v5}, Lfreemarker/core/ParseException;-><init>()V

    throw v5

    .line 1318
    :cond_20
    iget v5, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_c

    .line 1320
    :pswitch_23
    const/16 v5, 0x38

    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v4

    .line 1361
    .local v4, "start":Lfreemarker/core/Token;
    :goto_29
    if-nez v0, :cond_2c

    move-object v0, v4

    .line 1362
    :cond_2c
    new-instance v3, Lfreemarker/core/RecurseNode;

    invoke-direct {v3, v2, v1}, Lfreemarker/core/RecurseNode;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V

    .line 1363
    .local v3, "result":Lfreemarker/core/RecurseNode;
    iget-object v5, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v3, v5, v4, v0}, Lfreemarker/core/RecurseNode;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 1364
    return-object v3

    .line 1323
    .end local v3    # "result":Lfreemarker/core/RecurseNode;
    .end local v4    # "start":Lfreemarker/core/Token;
    :pswitch_37
    const/16 v5, 0x39

    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v4

    .line 1324
    .restart local v4    # "start":Lfreemarker/core/Token;
    iget v5, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v5, v8, :cond_68

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v5

    :goto_45
    sparse-switch v5, :sswitch_data_86

    .line 1342
    iget-object v5, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v6, 0x19

    iget v7, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v7, v5, v6

    .line 1345
    :goto_50
    iget v5, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v5, v8, :cond_70

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v5

    :goto_58
    packed-switch v5, :pswitch_data_c0

    .line 1351
    iget-object v5, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v6, 0x1a

    iget v7, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v7, v5, v6

    .line 1354
    :goto_63
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->LooseDirectiveEnd()Lfreemarker/core/Token;

    move-result-object v0

    .line 1355
    goto :goto_29

    .line 1324
    :cond_68
    iget v5, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_45

    .line 1339
    :sswitch_6b
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v2

    .line 1340
    goto :goto_50

    .line 1345
    :cond_70
    iget v5, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_58

    .line 1347
    :pswitch_73
    const/16 v5, 0x77

    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1348
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v1

    .line 1349
    goto :goto_63

    .line 1318
    nop

    :pswitch_data_7e
    .packed-switch 0x38
        :pswitch_23
        :pswitch_37
    .end packed-switch

    .line 1324
    :sswitch_data_86
    .sparse-switch
        0x51 -> :sswitch_6b
        0x52 -> :sswitch_6b
        0x53 -> :sswitch_6b
        0x54 -> :sswitch_6b
        0x55 -> :sswitch_6b
        0x56 -> :sswitch_6b
        0x57 -> :sswitch_6b
        0x62 -> :sswitch_6b
        0x63 -> :sswitch_6b
        0x6b -> :sswitch_6b
        0x6f -> :sswitch_6b
        0x71 -> :sswitch_6b
        0x73 -> :sswitch_6b
        0x78 -> :sswitch_6b
    .end sparse-switch

    .line 1345
    :pswitch_data_c0
    .packed-switch 0x77
        :pswitch_73
    .end packed-switch
.end method

.method public final RelationalExpression()Lfreemarker/core/Expression;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v7, -0x1

    .line 528
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->RangeExpression()Lfreemarker/core/Expression;

    move-result-object v0

    .line 529
    .local v0, "lhs":Lfreemarker/core/Expression;
    move-object v1, v0

    .line 530
    .local v1, "result":Lfreemarker/core/Expression;
    const v4, 0x7fffffff

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_2_5(I)Z

    move-result v4

    if-eqz v4, :cond_61

    .line 531
    iget v4, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v4, v7, :cond_2a

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v4

    :goto_17
    sparse-switch v4, :sswitch_data_86

    .line 551
    iget-object v4, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/4 v5, 0x7

    iget v6, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v6, v4, v5

    .line 552
    invoke-direct {p0, v7}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 553
    new-instance v4, Lfreemarker/core/ParseException;

    invoke-direct {v4}, Lfreemarker/core/ParseException;-><init>()V

    throw v4

    .line 531
    :cond_2a
    iget v4, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_17

    .line 533
    :sswitch_2d
    const/16 v4, 0x7f

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 555
    .local v3, "t":Lfreemarker/core/Token;
    :goto_33
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->RangeExpression()Lfreemarker/core/Expression;

    move-result-object v2

    .line 556
    .local v2, "rhs":Lfreemarker/core/Expression;
    const-string v4, "scalar"

    invoke-direct {p0, v0, v4}, Lfreemarker/core/FMParser;->notHashLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 557
    const-string v4, "scalar"

    invoke-direct {p0, v2, v4}, Lfreemarker/core/FMParser;->notHashLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 558
    const-string v4, "scalar"

    invoke-direct {p0, v0, v4}, Lfreemarker/core/FMParser;->notListLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 559
    const-string v4, "scalar"

    invoke-direct {p0, v2, v4}, Lfreemarker/core/FMParser;->notListLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 560
    const-string v4, "number"

    invoke-direct {p0, v0, v4}, Lfreemarker/core/FMParser;->notStringLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 561
    const-string v4, "number"

    invoke-direct {p0, v2, v4}, Lfreemarker/core/FMParser;->notStringLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 562
    new-instance v1, Lfreemarker/core/ComparisonExpression;

    .end local v1    # "result":Lfreemarker/core/Expression;
    iget-object v4, v3, Lfreemarker/core/Token;->image:Ljava/lang/String;

    invoke-direct {v1, v0, v2, v4}, Lfreemarker/core/ComparisonExpression;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 563
    .restart local v1    # "result":Lfreemarker/core/Expression;
    iget-object v4, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v1, v4, v0, v2}, Lfreemarker/core/Expression;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/TemplateObject;Lfreemarker/core/TemplateObject;)V

    .line 567
    .end local v2    # "rhs":Lfreemarker/core/Expression;
    .end local v3    # "t":Lfreemarker/core/Token;
    :cond_61
    return-object v1

    .line 536
    :sswitch_62
    const/16 v4, 0x61

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 537
    .restart local v3    # "t":Lfreemarker/core/Token;
    goto :goto_33

    .line 539
    .end local v3    # "t":Lfreemarker/core/Token;
    :sswitch_69
    const/16 v4, 0x7e

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 540
    .restart local v3    # "t":Lfreemarker/core/Token;
    goto :goto_33

    .line 542
    .end local v3    # "t":Lfreemarker/core/Token;
    :sswitch_70
    const/16 v4, 0x60

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 543
    .restart local v3    # "t":Lfreemarker/core/Token;
    goto :goto_33

    .line 545
    .end local v3    # "t":Lfreemarker/core/Token;
    :sswitch_77
    const/16 v4, 0x5f

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 546
    .restart local v3    # "t":Lfreemarker/core/Token;
    goto :goto_33

    .line 548
    .end local v3    # "t":Lfreemarker/core/Token;
    :sswitch_7e
    const/16 v4, 0x5e

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 549
    .restart local v3    # "t":Lfreemarker/core/Token;
    goto :goto_33

    .line 531
    nop

    :sswitch_data_86
    .sparse-switch
        0x5e -> :sswitch_7e
        0x5f -> :sswitch_77
        0x60 -> :sswitch_70
        0x61 -> :sswitch_62
        0x7e -> :sswitch_69
        0x7f -> :sswitch_2d
    .end sparse-switch
.end method

.method public final Return()Lfreemarker/core/ReturnInstruction;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v7, -0x1

    .line 1401
    const/4 v0, 0x0

    .line 1402
    .local v0, "end":Lfreemarker/core/Token;
    const/4 v1, 0x0

    .line 1403
    .local v1, "exp":Lfreemarker/core/Expression;
    iget v4, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v4, v7, :cond_1f

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v4

    :goto_b
    sparse-switch v4, :sswitch_data_70

    .line 1414
    iget-object v4, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v5, 0x1c

    iget v6, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v6, v4, v5

    .line 1415
    invoke-direct {p0, v7}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1416
    new-instance v4, Lfreemarker/core/ParseException;

    invoke-direct {v4}, Lfreemarker/core/ParseException;-><init>()V

    throw v4

    .line 1403
    :cond_1f
    iget v4, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_b

    .line 1405
    :sswitch_22
    const/16 v4, 0x2e

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 1406
    .local v3, "start":Lfreemarker/core/Token;
    move-object v0, v3

    .line 1418
    :goto_29
    iget-boolean v4, p0, Lfreemarker/core/FMParser;->inMacro:Z

    if-eqz v4, :cond_48

    .line 1419
    if-eqz v1, :cond_64

    .line 1420
    new-instance v4, Lfreemarker/core/ParseException;

    const-string v5, "A macro cannot return a value"

    iget-object v6, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-direct {v4, v5, v6, v3}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v4

    .line 1409
    .end local v3    # "start":Lfreemarker/core/Token;
    :sswitch_39
    const/16 v4, 0x18

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 1410
    .restart local v3    # "start":Lfreemarker/core/Token;
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v1

    .line 1411
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->LooseDirectiveEnd()Lfreemarker/core/Token;

    move-result-object v0

    .line 1412
    goto :goto_29

    .line 1423
    :cond_48
    iget-boolean v4, p0, Lfreemarker/core/FMParser;->inFunction:Z

    if-eqz v4, :cond_58

    .line 1424
    if-nez v1, :cond_64

    .line 1425
    new-instance v4, Lfreemarker/core/ParseException;

    const-string v5, "A function must return a value"

    iget-object v6, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-direct {v4, v5, v6, v3}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v4

    .line 1429
    :cond_58
    if-nez v1, :cond_64

    .line 1430
    new-instance v4, Lfreemarker/core/ParseException;

    const-string v5, "A return instruction can only occur inside a macro or function"

    iget-object v6, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-direct {v4, v5, v6, v3}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v4

    .line 1433
    :cond_64
    new-instance v2, Lfreemarker/core/ReturnInstruction;

    invoke-direct {v2, v1}, Lfreemarker/core/ReturnInstruction;-><init>(Lfreemarker/core/Expression;)V

    .line 1434
    .local v2, "result":Lfreemarker/core/ReturnInstruction;
    iget-object v4, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v2, v4, v3, v0}, Lfreemarker/core/ReturnInstruction;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 1435
    return-object v2

    .line 1403
    nop

    :sswitch_data_70
    .sparse-switch
        0x18 -> :sswitch_39
        0x2e -> :sswitch_22
    .end sparse-switch
.end method

.method public final Root()Lfreemarker/core/TemplateElement;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 2928
    const v1, 0x7fffffff

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_2_17(I)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 2929
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->HeaderElement()V

    .line 2933
    :cond_c
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->OptionalBlock()Lfreemarker/core/TemplateElement;

    move-result-object v0

    .line 2934
    .local v0, "doc":Lfreemarker/core/TemplateElement;
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 2935
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lfreemarker/core/TemplateElement;->setParentRecursively(Lfreemarker/core/TemplateElement;)V

    .line 2936
    iget-boolean v1, p0, Lfreemarker/core/FMParser;->stripWhitespace:Z

    invoke-virtual {v0, v1}, Lfreemarker/core/TemplateElement;->postParseCleanup(Z)Lfreemarker/core/TemplateElement;

    move-result-object v1

    return-object v1
.end method

.method public final Setting()Lfreemarker/core/PropertySetting;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 2329
    const/16 v5, 0x1a

    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 2330
    .local v3, "start":Lfreemarker/core/Token;
    const/16 v5, 0x78

    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 2331
    .local v1, "key":Lfreemarker/core/Token;
    const/16 v5, 0x5b

    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 2332
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v4

    .line 2333
    .local v4, "value":Lfreemarker/core/Expression;
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->LooseDirectiveEnd()Lfreemarker/core/Token;

    move-result-object v0

    .line 2334
    .local v0, "end":Lfreemarker/core/Token;
    new-instance v2, Lfreemarker/core/PropertySetting;

    iget-object v5, v1, Lfreemarker/core/Token;->image:Ljava/lang/String;

    invoke-direct {v2, v5, v4}, Lfreemarker/core/PropertySetting;-><init>(Ljava/lang/String;Lfreemarker/core/Expression;)V

    .line 2335
    .local v2, "result":Lfreemarker/core/PropertySetting;
    iget-object v5, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v2, v5, v3, v0}, Lfreemarker/core/PropertySetting;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 2336
    return-object v2
.end method

.method public final Stop()Lfreemarker/core/StopInstruction;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v6, -0x1

    .line 1440
    const/4 v2, 0x0

    .line 1441
    .local v2, "start":Lfreemarker/core/Token;
    const/4 v0, 0x0

    .line 1442
    .local v0, "exp":Lfreemarker/core/Expression;
    iget v3, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v3, v6, :cond_1f

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v3

    :goto_b
    sparse-switch v3, :sswitch_data_42

    .line 1452
    iget-object v3, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v4, 0x1d

    iget v5, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v5, v3, v4

    .line 1453
    invoke-direct {p0, v6}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1454
    new-instance v3, Lfreemarker/core/ParseException;

    invoke-direct {v3}, Lfreemarker/core/ParseException;-><init>()V

    throw v3

    .line 1442
    :cond_1f
    iget v3, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_b

    .line 1444
    :sswitch_22
    const/16 v3, 0x2f

    invoke-direct {p0, v3}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v2

    .line 1456
    :goto_28
    new-instance v1, Lfreemarker/core/StopInstruction;

    invoke-direct {v1, v0}, Lfreemarker/core/StopInstruction;-><init>(Lfreemarker/core/Expression;)V

    .line 1457
    .local v1, "result":Lfreemarker/core/StopInstruction;
    iget-object v3, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v1, v3, v2, v2}, Lfreemarker/core/StopInstruction;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 1458
    return-object v1

    .line 1447
    .end local v1    # "result":Lfreemarker/core/StopInstruction;
    :sswitch_33
    const/16 v3, 0x17

    invoke-direct {p0, v3}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v2

    .line 1448
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v0

    .line 1449
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->LooseDirectiveEnd()Lfreemarker/core/Token;

    goto :goto_28

    .line 1442
    nop

    :sswitch_data_42
    .sparse-switch
        0x17 -> :sswitch_33
        0x2f -> :sswitch_22
    .end sparse-switch
.end method

.method public final StringLiteral(Z)Lfreemarker/core/StringLiteral;
    .registers 11
    .param p1, "interpolate"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v8, -0x1

    .line 930
    const/4 v1, 0x0

    .line 931
    .local v1, "raw":Z
    iget v5, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v5, v8, :cond_1f

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v5

    :goto_b
    packed-switch v5, :pswitch_data_78

    .line 940
    iget-object v5, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v6, 0xe

    iget v7, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v7, v5, v6

    .line 941
    invoke-direct {p0, v8}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 942
    new-instance v5, Lfreemarker/core/ParseException;

    invoke-direct {v5}, Lfreemarker/core/ParseException;-><init>()V

    throw v5

    .line 931
    :cond_1f
    iget v5, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_b

    .line 933
    :pswitch_22
    const/16 v5, 0x51

    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v4

    .line 944
    .local v4, "t":Lfreemarker/core/Token;
    :goto_28
    iget-object v3, v4, Lfreemarker/core/Token;->image:Ljava/lang/String;

    .line 946
    .local v3, "s":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v3, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 947
    if-eqz v1, :cond_68

    .line 948
    invoke-virtual {v3, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 957
    :goto_3a
    new-instance v2, Lfreemarker/core/StringLiteral;

    invoke-direct {v2, v3}, Lfreemarker/core/StringLiteral;-><init>(Ljava/lang/String;)V

    .line 958
    .local v2, "result":Lfreemarker/core/StringLiteral;
    iget-object v5, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v2, v5, v4, v4}, Lfreemarker/core/StringLiteral;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 959
    if-eqz p1, :cond_5f

    if-nez v1, :cond_5f

    .line 960
    iget-object v5, v4, Lfreemarker/core/Token;->image:Ljava/lang/String;

    const-string v6, "${"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_5c

    iget-object v5, v4, Lfreemarker/core/Token;->image:Ljava/lang/String;

    const-string v6, "#{"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-ltz v5, :cond_5f

    .line 961
    :cond_5c
    invoke-virtual {v2}, Lfreemarker/core/StringLiteral;->checkInterpolation()V

    .line 963
    :cond_5f
    return-object v2

    .line 936
    .end local v2    # "result":Lfreemarker/core/StringLiteral;
    .end local v3    # "s":Ljava/lang/String;
    .end local v4    # "t":Lfreemarker/core/Token;
    :pswitch_60
    const/16 v5, 0x52

    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v4

    .line 937
    .restart local v4    # "t":Lfreemarker/core/Token;
    const/4 v1, 0x1

    .line 938
    goto :goto_28

    .line 951
    .restart local v3    # "s":Ljava/lang/String;
    :cond_68
    :try_start_68
    invoke-static {v3}, Lfreemarker/template/utility/StringUtil;->FTLStringLiteralDec(Ljava/lang/String;)Ljava/lang/String;
    :try_end_6b
    .catch Lfreemarker/core/ParseException; {:try_start_68 .. :try_end_6b} :catch_6d

    move-result-object v3

    goto :goto_3a

    .line 952
    :catch_6d
    move-exception v0

    .line 953
    .local v0, "pe":Lfreemarker/core/ParseException;
    iget v5, v4, Lfreemarker/core/Token;->beginLine:I

    iput v5, v0, Lfreemarker/core/ParseException;->lineNumber:I

    .line 954
    iget v5, v4, Lfreemarker/core/Token;->beginColumn:I

    iput v5, v0, Lfreemarker/core/ParseException;->columnNumber:I

    .line 955
    throw v0

    .line 931
    nop

    :pswitch_data_78
    .packed-switch 0x51
        :pswitch_22
        :pswitch_60
    .end packed-switch
.end method

.method public final StringOutput()Lfreemarker/core/DollarVariable;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 1075
    const/16 v4, 0x47

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v0

    .line 1076
    .local v0, "begin":Lfreemarker/core/Token;
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v2

    .line 1077
    .local v2, "exp":Lfreemarker/core/Expression;
    const-string v4, "string or something automatically convertible to string (number, date or boolean)"

    invoke-direct {p0, v2, v4}, Lfreemarker/core/FMParser;->notHashLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 1078
    const-string v4, "string or something automatically convertible to string (number, date or boolean)"

    invoke-direct {p0, v2, v4}, Lfreemarker/core/FMParser;->notListLiteral(Lfreemarker/core/Expression;Ljava/lang/String;)V

    .line 1079
    const/16 v4, 0x74

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 1080
    .local v1, "end":Lfreemarker/core/Token;
    new-instance v3, Lfreemarker/core/DollarVariable;

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->escapedExpression(Lfreemarker/core/Expression;)Lfreemarker/core/Expression;

    move-result-object v4

    invoke-direct {v3, v2, v4}, Lfreemarker/core/DollarVariable;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V

    .line 1081
    .local v3, "result":Lfreemarker/core/DollarVariable;
    iget-object v4, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v3, v4, v0, v1}, Lfreemarker/core/DollarVariable;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 1082
    return-object v3
.end method

.method public final Switch()Lfreemarker/core/SwitchBlock;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 2197
    const/4 v1, 0x0

    .line 2198
    .local v1, "defaultFound":Z
    const/16 v6, 0xc

    invoke-direct {p0, v6}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 2199
    .local v3, "start":Lfreemarker/core/Token;
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v5

    .line 2200
    .local v5, "switchExp":Lfreemarker/core/Expression;
    const/16 v6, 0x7c

    invoke-direct {p0, v6}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 2201
    iget v6, p0, Lfreemarker/core/FMParser;->switchNesting:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lfreemarker/core/FMParser;->switchNesting:I

    .line 2202
    new-instance v4, Lfreemarker/core/SwitchBlock;

    invoke-direct {v4, v5}, Lfreemarker/core/SwitchBlock;-><init>(Lfreemarker/core/Expression;)V

    .line 2205
    .local v4, "switchBlock":Lfreemarker/core/SwitchBlock;
    :goto_1b
    const/4 v6, 0x2

    invoke-direct {p0, v6}, Lfreemarker/core/FMParser;->jj_2_15(I)Z

    move-result v6

    if-eqz v6, :cond_3b

    .line 2210
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Case()Lfreemarker/core/Case;

    move-result-object v0

    .line 2211
    .local v0, "caseIns":Lfreemarker/core/Case;
    iget-object v6, v0, Lfreemarker/core/Case;->condition:Lfreemarker/core/Expression;

    if-nez v6, :cond_37

    .line 2212
    if-eqz v1, :cond_36

    .line 2213
    new-instance v6, Lfreemarker/core/ParseException;

    const-string v7, "You can only have one default case in a switch statement"

    iget-object v8, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-direct {v6, v7, v8, v3}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v6

    .line 2215
    :cond_36
    const/4 v1, 0x1

    .line 2217
    :cond_37
    invoke-virtual {v4, v0}, Lfreemarker/core/SwitchBlock;->addCase(Lfreemarker/core/Case;)V

    goto :goto_1b

    .line 2219
    .end local v0    # "caseIns":Lfreemarker/core/Case;
    :cond_3b
    iget v6, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    const/4 v7, -0x1

    if-ne v6, v7, :cond_61

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v6

    :goto_44
    packed-switch v6, :pswitch_data_6a

    .line 2224
    iget-object v6, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v7, 0x41

    iget v8, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v8, v6, v7

    .line 2227
    :goto_4f
    const/16 v6, 0x2b

    invoke-direct {p0, v6}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v2

    .line 2228
    .local v2, "end":Lfreemarker/core/Token;
    iget v6, p0, Lfreemarker/core/FMParser;->switchNesting:I

    add-int/lit8 v6, v6, -0x1

    iput v6, p0, Lfreemarker/core/FMParser;->switchNesting:I

    .line 2229
    iget-object v6, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v4, v6, v3, v2}, Lfreemarker/core/SwitchBlock;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 2230
    return-object v4

    .line 2219
    .end local v2    # "end":Lfreemarker/core/Token;
    :cond_61
    iget v6, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_44

    .line 2221
    :pswitch_64
    const/16 v6, 0x44

    invoke-direct {p0, v6}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    goto :goto_4f

    .line 2219
    :pswitch_data_6a
    .packed-switch 0x44
        :pswitch_64
    .end packed-switch
.end method

.method public final Transform()Lfreemarker/core/TransformBlock;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v11, -0x1

    .line 2144
    const/4 v3, 0x0

    .line 2145
    .local v3, "content":Lfreemarker/core/TemplateElement;
    const/4 v2, 0x0

    .line 2146
    .local v2, "args":Ljava/util/HashMap;
    const/16 v8, 0x15

    invoke-direct {p0, v8}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v7

    .line 2147
    .local v7, "start":Lfreemarker/core/Token;
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v5

    .line 2148
    .local v5, "exp":Lfreemarker/core/Expression;
    iget v8, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v8, v11, :cond_4f

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v8

    :goto_15
    packed-switch v8, :pswitch_data_9c

    .line 2153
    iget-object v8, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v9, 0x3e

    iget v10, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v10, v8, v9

    .line 2158
    :goto_20
    iget v8, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v8, v11, :cond_58

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v8

    :goto_28
    packed-switch v8, :pswitch_data_a2

    .line 2163
    iget-object v8, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v9, 0x3f

    iget v10, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v10, v8, v9

    .line 2172
    iget v8, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v8, v11, :cond_77

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v8

    :goto_3b
    packed-switch v8, :pswitch_data_a8

    .line 2182
    iget-object v8, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v9, 0x40

    iget v10, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v10, v8, v9

    .line 2183
    invoke-direct {p0, v11}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 2184
    new-instance v8, Lfreemarker/core/ParseException;

    invoke-direct {v8}, Lfreemarker/core/ParseException;-><init>()V

    throw v8

    .line 2148
    :cond_4f
    iget v8, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_15

    .line 2150
    :pswitch_52
    const/16 v8, 0x6d

    invoke-direct {p0, v8}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    goto :goto_20

    .line 2158
    :cond_58
    iget v8, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_28

    .line 2166
    :pswitch_5b
    const/16 v8, 0x78

    invoke-direct {p0, v8}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 2167
    .local v1, "argName":Lfreemarker/core/Token;
    const/16 v8, 0x5b

    invoke-direct {p0, v8}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 2168
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v0

    .line 2169
    .local v0, "argExp":Lfreemarker/core/Expression;
    if-nez v2, :cond_71

    new-instance v2, Ljava/util/HashMap;

    .end local v2    # "args":Ljava/util/HashMap;
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 2170
    .restart local v2    # "args":Ljava/util/HashMap;
    :cond_71
    iget-object v8, v1, Lfreemarker/core/Token;->image:Ljava/lang/String;

    invoke-virtual {v2, v8, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_20

    .line 2172
    .end local v0    # "argExp":Lfreemarker/core/Expression;
    .end local v1    # "argName":Lfreemarker/core/Token;
    :cond_77
    iget v8, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_3b

    .line 2174
    :pswitch_7a
    const/16 v8, 0x7d

    invoke-direct {p0, v8}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v4

    .line 2186
    .local v4, "end":Lfreemarker/core/Token;
    :goto_80
    new-instance v6, Lfreemarker/core/TransformBlock;

    invoke-direct {v6, v5, v2, v3}, Lfreemarker/core/TransformBlock;-><init>(Lfreemarker/core/Expression;Ljava/util/Map;Lfreemarker/core/TemplateElement;)V

    .line 2187
    .local v6, "result":Lfreemarker/core/TransformBlock;
    iget-object v8, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v6, v8, v7, v4}, Lfreemarker/core/TransformBlock;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 2188
    return-object v6

    .line 2177
    .end local v4    # "end":Lfreemarker/core/Token;
    .end local v6    # "result":Lfreemarker/core/TransformBlock;
    :pswitch_8b
    const/16 v8, 0x7c

    invoke-direct {p0, v8}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 2178
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->OptionalBlock()Lfreemarker/core/TemplateElement;

    move-result-object v3

    .line 2179
    const/16 v8, 0x2a

    invoke-direct {p0, v8}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v4

    .line 2180
    .restart local v4    # "end":Lfreemarker/core/Token;
    goto :goto_80

    .line 2148
    nop

    :pswitch_data_9c
    .packed-switch 0x6d
        :pswitch_52
    .end packed-switch

    .line 2158
    :pswitch_data_a2
    .packed-switch 0x78
        :pswitch_5b
    .end packed-switch

    .line 2172
    :pswitch_data_a8
    .packed-switch 0x7c
        :pswitch_8b
        :pswitch_7a
    .end packed-switch
.end method

.method public final Trim()Lfreemarker/core/TemplateElement;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v5, -0x1

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1502
    const/4 v0, 0x0

    .line 1503
    .local v0, "result":Lfreemarker/core/TrimInstruction;
    iget v2, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v2, v5, :cond_20

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v2

    :goto_c
    packed-switch v2, :pswitch_data_58

    .line 1521
    iget-object v2, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v3, 0x1f

    iget v4, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v4, v2, v3

    .line 1522
    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1523
    new-instance v2, Lfreemarker/core/ParseException;

    invoke-direct {v2}, Lfreemarker/core/ParseException;-><init>()V

    throw v2

    .line 1503
    :cond_20
    iget v2, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_c

    .line 1505
    :pswitch_23
    const/16 v2, 0x31

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 1506
    .local v1, "t":Lfreemarker/core/Token;
    new-instance v0, Lfreemarker/core/TrimInstruction;

    .end local v0    # "result":Lfreemarker/core/TrimInstruction;
    invoke-direct {v0, v4, v4}, Lfreemarker/core/TrimInstruction;-><init>(ZZ)V

    .line 1525
    .restart local v0    # "result":Lfreemarker/core/TrimInstruction;
    :goto_2e
    iget-object v2, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v0, v2, v1, v1}, Lfreemarker/core/TrimInstruction;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 1526
    return-object v0

    .line 1509
    .end local v1    # "t":Lfreemarker/core/Token;
    :pswitch_34
    const/16 v2, 0x32

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 1510
    .restart local v1    # "t":Lfreemarker/core/Token;
    new-instance v0, Lfreemarker/core/TrimInstruction;

    .end local v0    # "result":Lfreemarker/core/TrimInstruction;
    invoke-direct {v0, v4, v3}, Lfreemarker/core/TrimInstruction;-><init>(ZZ)V

    .line 1511
    .restart local v0    # "result":Lfreemarker/core/TrimInstruction;
    goto :goto_2e

    .line 1513
    .end local v1    # "t":Lfreemarker/core/Token;
    :pswitch_40
    const/16 v2, 0x33

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 1514
    .restart local v1    # "t":Lfreemarker/core/Token;
    new-instance v0, Lfreemarker/core/TrimInstruction;

    .end local v0    # "result":Lfreemarker/core/TrimInstruction;
    invoke-direct {v0, v3, v4}, Lfreemarker/core/TrimInstruction;-><init>(ZZ)V

    .line 1515
    .restart local v0    # "result":Lfreemarker/core/TrimInstruction;
    goto :goto_2e

    .line 1517
    .end local v1    # "t":Lfreemarker/core/Token;
    :pswitch_4c
    const/16 v2, 0x34

    invoke-direct {p0, v2}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v1

    .line 1518
    .restart local v1    # "t":Lfreemarker/core/Token;
    new-instance v0, Lfreemarker/core/TrimInstruction;

    .end local v0    # "result":Lfreemarker/core/TrimInstruction;
    invoke-direct {v0, v3, v3}, Lfreemarker/core/TrimInstruction;-><init>(ZZ)V

    .line 1519
    .restart local v0    # "result":Lfreemarker/core/TrimInstruction;
    goto :goto_2e

    .line 1503
    :pswitch_data_58
    .packed-switch 0x31
        :pswitch_23
        :pswitch_34
        :pswitch_40
        :pswitch_4c
    .end packed-switch
.end method

.method public final UnaryExpression()Lfreemarker/core/Expression;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v7, -0x1

    .line 315
    const/4 v0, 0x0

    .line 316
    .local v0, "haveNot":Z
    const/4 v3, 0x0

    .local v3, "t":Lfreemarker/core/Token;
    const/4 v2, 0x0

    .line 317
    .local v2, "start":Lfreemarker/core/Token;
    iget v4, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v4, v7, :cond_1f

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v4

    :goto_c
    sparse-switch v4, :sswitch_data_32

    .line 339
    iget-object v4, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/4 v5, 0x1

    iget v6, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v6, v4, v5

    .line 340
    invoke-direct {p0, v7}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 341
    new-instance v4, Lfreemarker/core/ParseException;

    invoke-direct {v4}, Lfreemarker/core/ParseException;-><init>()V

    throw v4

    .line 317
    :cond_1f
    iget v4, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_c

    .line 320
    :sswitch_22
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->UnaryPlusMinusExpression()Lfreemarker/core/Expression;

    move-result-object v1

    .line 343
    .local v1, "result":Lfreemarker/core/Expression;
    :goto_26
    return-object v1

    .line 323
    .end local v1    # "result":Lfreemarker/core/Expression;
    :sswitch_27
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->NotExpression()Lfreemarker/core/Expression;

    move-result-object v1

    .line 324
    .restart local v1    # "result":Lfreemarker/core/Expression;
    goto :goto_26

    .line 336
    .end local v1    # "result":Lfreemarker/core/Expression;
    :sswitch_2c
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->PrimaryExpression()Lfreemarker/core/Expression;

    move-result-object v1

    .line 337
    .restart local v1    # "result":Lfreemarker/core/Expression;
    goto :goto_26

    .line 317
    nop

    :sswitch_data_32
    .sparse-switch
        0x51 -> :sswitch_2c
        0x52 -> :sswitch_2c
        0x53 -> :sswitch_2c
        0x54 -> :sswitch_2c
        0x55 -> :sswitch_2c
        0x56 -> :sswitch_2c
        0x57 -> :sswitch_2c
        0x62 -> :sswitch_22
        0x63 -> :sswitch_22
        0x6b -> :sswitch_27
        0x6f -> :sswitch_2c
        0x71 -> :sswitch_2c
        0x73 -> :sswitch_2c
        0x78 -> :sswitch_2c
    .end sparse-switch
.end method

.method public final UnaryPlusMinusExpression()Lfreemarker/core/Expression;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v7, -0x1

    .line 377
    const/4 v1, 0x0

    .line 379
    .local v1, "isMinus":Z
    iget v4, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v4, v7, :cond_1d

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v4

    :goto_a
    packed-switch v4, :pswitch_data_3e

    .line 388
    iget-object v4, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/4 v5, 0x3

    iget v6, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v6, v4, v5

    .line 389
    invoke-direct {p0, v7}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 390
    new-instance v4, Lfreemarker/core/ParseException;

    invoke-direct {v4}, Lfreemarker/core/ParseException;-><init>()V

    throw v4

    .line 379
    :cond_1d
    iget v4, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_a

    .line 381
    :pswitch_20
    const/16 v4, 0x62

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 392
    .local v3, "t":Lfreemarker/core/Token;
    :goto_26
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->PrimaryExpression()Lfreemarker/core/Expression;

    move-result-object v0

    .line 393
    .local v0, "exp":Lfreemarker/core/Expression;
    new-instance v2, Lfreemarker/core/UnaryPlusMinusExpression;

    invoke-direct {v2, v0, v1}, Lfreemarker/core/UnaryPlusMinusExpression;-><init>(Lfreemarker/core/Expression;Z)V

    .line 394
    .local v2, "result":Lfreemarker/core/Expression;
    iget-object v4, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v2, v4, v3, v0}, Lfreemarker/core/Expression;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/TemplateObject;)V

    .line 395
    return-object v2

    .line 384
    .end local v0    # "exp":Lfreemarker/core/Expression;
    .end local v2    # "result":Lfreemarker/core/Expression;
    .end local v3    # "t":Lfreemarker/core/Token;
    :pswitch_35
    const/16 v4, 0x63

    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 385
    .restart local v3    # "t":Lfreemarker/core/Token;
    const/4 v1, 0x1

    .line 386
    goto :goto_26

    .line 379
    nop

    :pswitch_data_3e
    .packed-switch 0x62
        :pswitch_20
        :pswitch_35
    .end packed-switch
.end method

.method public final UnifiedMacroTransform()Lfreemarker/core/TemplateElement;
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 1865
    const/4 v9, 0x0

    .line 1866
    .local v9, "start":Lfreemarker/core/Token;
    const/4 v4, 0x0

    .line 1867
    .local v4, "namedArgs":Ljava/util/HashMap;
    const/4 v6, 0x0

    .local v6, "positionalArgs":Ljava/util/ArrayList;
    const/4 v0, 0x0

    .line 1868
    .local v0, "bodyParameters":Ljava/util/ArrayList;
    const/4 v1, 0x0

    .line 1869
    .local v1, "directiveName":Ljava/lang/String;
    const/4 v5, 0x0

    .line 1871
    .local v5, "nestedBlock":Lfreemarker/core/TemplateElement;
    const/16 v11, 0x3f

    invoke-direct {p0, v11}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v9

    .line 1872
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v3

    .line 1873
    .local v3, "exp":Lfreemarker/core/Expression;
    instance-of v11, v3, Lfreemarker/core/Identifier;

    if-nez v11, :cond_21

    instance-of v11, v3, Lfreemarker/core/Dot;

    if-eqz v11, :cond_25

    move-object v11, v3

    check-cast v11, Lfreemarker/core/Dot;

    invoke-virtual {v11}, Lfreemarker/core/Dot;->onlyHasIdentifiers()Z

    move-result v11

    if-eqz v11, :cond_25

    .line 1874
    :cond_21
    invoke-virtual {v3}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    .line 1876
    :cond_25
    iget v11, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    const/4 v12, -0x1

    if-ne v11, v12, :cond_78

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v11

    :goto_2e
    packed-switch v11, :pswitch_data_1b2

    .line 1881
    iget-object v11, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v12, 0x30

    iget v13, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v13, v11, v12

    .line 1884
    :goto_39
    const v11, 0x7fffffff

    invoke-direct {p0, v11}, Lfreemarker/core/FMParser;->jj_2_12(I)Z

    move-result v11

    if-eqz v11, :cond_81

    .line 1885
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->NamedArgs()Ljava/util/HashMap;

    move-result-object v4

    .line 1889
    :goto_46
    iget v11, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    const/4 v12, -0x1

    if-ne v11, v12, :cond_86

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v11

    :goto_4f
    packed-switch v11, :pswitch_data_1b8

    .line 1944
    iget-object v11, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v12, 0x36

    iget v13, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v13, v11, v12

    .line 1947
    :goto_5a
    iget v11, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    const/4 v12, -0x1

    if-ne v11, v12, :cond_137

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v11

    :goto_63
    packed-switch v11, :pswitch_data_1be

    .line 1967
    iget-object v11, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v12, 0x37

    iget v13, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v13, v11, v12

    .line 1968
    const/4 v11, -0x1

    invoke-direct {p0, v11}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1969
    new-instance v11, Lfreemarker/core/ParseException;

    invoke-direct {v11}, Lfreemarker/core/ParseException;-><init>()V

    throw v11

    .line 1876
    :cond_78
    iget v11, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_2e

    .line 1878
    :pswitch_7b
    const/16 v11, 0x80

    invoke-direct {p0, v11}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    goto :goto_39

    .line 1887
    :cond_81
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->PositionalArgs()Ljava/util/ArrayList;

    move-result-object v6

    goto :goto_46

    .line 1889
    :cond_86
    iget v11, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_4f

    .line 1891
    :pswitch_89
    const/16 v11, 0x6d

    invoke-direct {p0, v11}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1892
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "bodyParameters":Ljava/util/ArrayList;
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1893
    .restart local v0    # "bodyParameters":Ljava/util/ArrayList;
    iget v11, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    const/4 v12, -0x1

    if-ne v11, v12, :cond_a8

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v11

    :goto_9c
    sparse-switch v11, :sswitch_data_1c6

    .line 1939
    iget-object v11, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v12, 0x35

    iget v13, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v13, v11, v12

    goto :goto_5a

    .line 1893
    :cond_a8
    iget v11, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_9c

    .line 1896
    :sswitch_ab
    iget v11, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    const/4 v12, -0x1

    if-ne v11, v12, :cond_e0

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v11

    :goto_b4
    packed-switch v11, :pswitch_data_1d0

    .line 1901
    iget-object v11, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v12, 0x31

    iget v13, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v13, v11, v12

    .line 1904
    :goto_bf
    const/16 v11, 0x78

    invoke-direct {p0, v11}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v10

    .line 1905
    .local v10, "t":Lfreemarker/core/Token;
    iget-object v11, v10, Lfreemarker/core/Token;->image:Ljava/lang/String;

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1908
    :goto_ca
    iget v11, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    const/4 v12, -0x1

    if-ne v11, v12, :cond_e9

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v11

    :goto_d3
    sparse-switch v11, :sswitch_data_1d6

    .line 1914
    iget-object v11, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v12, 0x32

    iget v13, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v13, v11, v12

    goto/16 :goto_5a

    .line 1896
    .end local v10    # "t":Lfreemarker/core/Token;
    :cond_e0
    iget v11, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_b4

    .line 1898
    :pswitch_e3
    const/16 v11, 0x80

    invoke-direct {p0, v11}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    goto :goto_bf

    .line 1908
    .restart local v10    # "t":Lfreemarker/core/Token;
    :cond_e9
    iget v11, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_d3

    .line 1917
    :sswitch_ec
    iget v11, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    const/4 v12, -0x1

    if-ne v11, v12, :cond_125

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v11

    :goto_f5
    packed-switch v11, :pswitch_data_1e0

    .line 1922
    iget-object v11, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v12, 0x33

    iget v13, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v13, v11, v12

    .line 1925
    :goto_100
    const/16 v11, 0x6c

    invoke-direct {p0, v11}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1926
    iget v11, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    const/4 v12, -0x1

    if-ne v11, v12, :cond_12e

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v11

    :goto_10e
    packed-switch v11, :pswitch_data_1e6

    .line 1931
    iget-object v11, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v12, 0x34

    iget v13, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v13, v11, v12

    .line 1934
    :goto_119
    const/16 v11, 0x78

    invoke-direct {p0, v11}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v10

    .line 1935
    iget-object v11, v10, Lfreemarker/core/Token;->image:Ljava/lang/String;

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_ca

    .line 1917
    :cond_125
    iget v11, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_f5

    .line 1919
    :pswitch_128
    const/16 v11, 0x80

    invoke-direct {p0, v11}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    goto :goto_100

    .line 1926
    :cond_12e
    iget v11, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_10e

    .line 1928
    :pswitch_131
    const/16 v11, 0x80

    invoke-direct {p0, v11}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    goto :goto_119

    .line 1947
    .end local v10    # "t":Lfreemarker/core/Token;
    :cond_137
    iget v11, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto/16 :goto_63

    .line 1949
    :pswitch_13b
    const/16 v11, 0x7d

    invoke-direct {p0, v11}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v2

    .line 1971
    .local v2, "end":Lfreemarker/core/Token;
    :cond_141
    if-eqz v6, :cond_1ac

    new-instance v7, Lfreemarker/core/UnifiedCall;

    invoke-direct {v7, v3, v6, v5, v0}, Lfreemarker/core/UnifiedCall;-><init>(Lfreemarker/core/Expression;Ljava/util/List;Lfreemarker/core/TemplateElement;Ljava/util/List;)V

    .line 1973
    .local v7, "result":Lfreemarker/core/TemplateElement;
    :goto_148
    iget-object v11, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v7, v11, v9, v2}, Lfreemarker/core/TemplateElement;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 1974
    return-object v7

    .line 1952
    .end local v2    # "end":Lfreemarker/core/Token;
    .end local v7    # "result":Lfreemarker/core/TemplateElement;
    :pswitch_14e
    const/16 v11, 0x7c

    invoke-direct {p0, v11}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1953
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->OptionalBlock()Lfreemarker/core/TemplateElement;

    move-result-object v5

    .line 1954
    const/16 v11, 0x40

    invoke-direct {p0, v11}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v2

    .line 1955
    .restart local v2    # "end":Lfreemarker/core/Token;
    iget-object v11, v2, Lfreemarker/core/Token;->image:Ljava/lang/String;

    const/4 v12, 0x3

    invoke-virtual {v11, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 1956
    .local v8, "s":Ljava/lang/String;
    const/4 v11, 0x0

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v12

    add-int/lit8 v12, v12, -0x1

    invoke-virtual {v8, v11, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    .line 1957
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v11

    if-lez v11, :cond_141

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_141

    .line 1958
    if-nez v1, :cond_18b

    .line 1959
    new-instance v11, Lfreemarker/core/ParseException;

    const-string v12, "Expecting </@>"

    iget-object v13, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-direct {v11, v12, v13, v2}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v11

    .line 1962
    :cond_18b
    new-instance v11, Lfreemarker/core/ParseException;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string v13, "Expecting </@> or </@"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string v13, ">"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    iget-object v13, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-direct {v11, v12, v13, v2}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Lfreemarker/core/Token;)V

    throw v11

    .line 1971
    .end local v8    # "s":Ljava/lang/String;
    :cond_1ac
    new-instance v7, Lfreemarker/core/UnifiedCall;

    invoke-direct {v7, v3, v4, v5, v0}, Lfreemarker/core/UnifiedCall;-><init>(Lfreemarker/core/Expression;Ljava/util/Map;Lfreemarker/core/TemplateElement;Ljava/util/List;)V

    goto :goto_148

    .line 1876
    :pswitch_data_1b2
    .packed-switch 0x80
        :pswitch_7b
    .end packed-switch

    .line 1889
    :pswitch_data_1b8
    .packed-switch 0x6d
        :pswitch_89
    .end packed-switch

    .line 1947
    :pswitch_data_1be
    .packed-switch 0x7c
        :pswitch_14e
        :pswitch_13b
    .end packed-switch

    .line 1893
    :sswitch_data_1c6
    .sparse-switch
        0x78 -> :sswitch_ab
        0x80 -> :sswitch_ab
    .end sparse-switch

    .line 1896
    :pswitch_data_1d0
    .packed-switch 0x80
        :pswitch_e3
    .end packed-switch

    .line 1908
    :sswitch_data_1d6
    .sparse-switch
        0x6c -> :sswitch_ec
        0x80 -> :sswitch_ec
    .end sparse-switch

    .line 1917
    :pswitch_data_1e0
    .packed-switch 0x80
        :pswitch_128
    .end packed-switch

    .line 1926
    :pswitch_data_1e6
    .packed-switch 0x80
        :pswitch_131
    .end packed-switch
.end method

.method public final UnparsedContent(Ljava/lang/StringBuffer;)Lfreemarker/core/Token;
    .registers 7
    .param p1, "buf"    # Ljava/lang/StringBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v4, -0x1

    .line 2501
    :pswitch_1
    iget v1, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v1, v4, :cond_1d

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v1

    :goto_9
    packed-switch v1, :pswitch_data_66

    .line 2515
    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v2, 0x47

    iget v3, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v3, v1, v2

    .line 2516
    invoke-direct {p0, v4}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 2517
    new-instance v1, Lfreemarker/core/ParseException;

    invoke-direct {v1}, Lfreemarker/core/ParseException;-><init>()V

    throw v1

    .line 2501
    :cond_1d
    iget v1, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_9

    .line 2503
    :pswitch_20
    const/16 v1, 0x84

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v0

    .line 2519
    .local v0, "t":Lfreemarker/core/Token;
    :goto_26
    iget-object v1, v0, Lfreemarker/core/Token;->image:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2520
    iget v1, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    if-ne v1, v4, :cond_62

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v1

    :goto_33
    packed-switch v1, :pswitch_data_72

    .line 2528
    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v2, 0x48

    iget v3, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v3, v1, v2

    .line 2532
    invoke-virtual {p1}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    iget-object v2, v0, Lfreemarker/core/Token;->image:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 2533
    return-object v0

    .line 2506
    .end local v0    # "t":Lfreemarker/core/Token;
    :pswitch_4d
    const/16 v1, 0x83

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v0

    .line 2507
    .restart local v0    # "t":Lfreemarker/core/Token;
    goto :goto_26

    .line 2509
    .end local v0    # "t":Lfreemarker/core/Token;
    :pswitch_54
    const/16 v1, 0x82

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v0

    .line 2510
    .restart local v0    # "t":Lfreemarker/core/Token;
    goto :goto_26

    .line 2512
    .end local v0    # "t":Lfreemarker/core/Token;
    :pswitch_5b
    const/16 v1, 0x85

    invoke-direct {p0, v1}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v0

    .line 2513
    .restart local v0    # "t":Lfreemarker/core/Token;
    goto :goto_26

    .line 2520
    :cond_62
    iget v1, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_33

    .line 2501
    nop

    :pswitch_data_66
    .packed-switch 0x82
        :pswitch_54
        :pswitch_4d
        :pswitch_20
        :pswitch_5b
    .end packed-switch

    .line 2520
    :pswitch_data_72
    .packed-switch 0x82
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public final Visit()Lfreemarker/core/VisitNode;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 1296
    const/4 v1, 0x0

    .line 1297
    .local v1, "namespaces":Lfreemarker/core/Expression;
    const/16 v5, 0x16

    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    move-result-object v3

    .line 1298
    .local v3, "start":Lfreemarker/core/Token;
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v4

    .line 1299
    .local v4, "targetNode":Lfreemarker/core/Expression;
    iget v5, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    const/4 v6, -0x1

    if-ne v5, v6, :cond_2e

    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_ntk()I

    move-result v5

    :goto_14
    packed-switch v5, :pswitch_data_3c

    .line 1305
    iget-object v5, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    const/16 v6, 0x18

    iget v7, p0, Lfreemarker/core/FMParser;->jj_gen:I

    aput v7, v5, v6

    .line 1308
    :goto_1f
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->LooseDirectiveEnd()Lfreemarker/core/Token;

    move-result-object v0

    .line 1309
    .local v0, "end":Lfreemarker/core/Token;
    new-instance v2, Lfreemarker/core/VisitNode;

    invoke-direct {v2, v4, v1}, Lfreemarker/core/VisitNode;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V

    .line 1310
    .local v2, "result":Lfreemarker/core/VisitNode;
    iget-object v5, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    invoke-virtual {v2, v5, v3, v0}, Lfreemarker/core/VisitNode;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V

    .line 1311
    return-object v2

    .line 1299
    .end local v0    # "end":Lfreemarker/core/Token;
    .end local v2    # "result":Lfreemarker/core/VisitNode;
    :cond_2e
    iget v5, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    goto :goto_14

    .line 1301
    :pswitch_31
    const/16 v5, 0x77

    invoke-direct {p0, v5}, Lfreemarker/core/FMParser;->jj_consume_token(I)Lfreemarker/core/Token;

    .line 1302
    invoke-virtual {p0}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;

    move-result-object v1

    .line 1303
    goto :goto_1f

    .line 1299
    nop

    :pswitch_data_3c
    .packed-switch 0x77
        :pswitch_31
    .end packed-switch
.end method

.method public _getLastTagSyntax()I
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lfreemarker/core/FMParser;->token_source:Lfreemarker/core/FMParserTokenManager;

    iget-boolean v0, v0, Lfreemarker/core/FMParserTokenManager;->squBracTagSyntax:Z

    if-eqz v0, :cond_8

    const/4 v0, 0x2

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x1

    goto :goto_7
.end method

.method public final disable_tracing()V
    .registers 1

    .prologue
    .line 4679
    return-void
.end method

.method public final enable_tracing()V
    .registers 1

    .prologue
    .line 4676
    return-void
.end method

.method public generateParseException()Lfreemarker/core/ParseException;
    .registers 10

    .prologue
    const/16 v8, 0x86

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 4628
    iget-object v4, p0, Lfreemarker/core/FMParser;->jj_expentries:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->removeAllElements()V

    .line 4629
    new-array v3, v8, [Z

    .line 4630
    .local v3, "la1tokens":[Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    if-ge v1, v8, :cond_13

    .line 4631
    aput-boolean v7, v3, v1

    .line 4630
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 4633
    :cond_13
    iget v4, p0, Lfreemarker/core/FMParser;->jj_kind:I

    if-ltz v4, :cond_1e

    .line 4634
    iget v4, p0, Lfreemarker/core/FMParser;->jj_kind:I

    aput-boolean v6, v3, v4

    .line 4635
    const/4 v4, -0x1

    iput v4, p0, Lfreemarker/core/FMParser;->jj_kind:I

    .line 4637
    :cond_1e
    const/4 v1, 0x0

    :goto_1f
    const/16 v4, 0x53

    if-ge v1, v4, :cond_75

    .line 4638
    iget-object v4, p0, Lfreemarker/core/FMParser;->jj_la1:[I

    aget v4, v4, v1

    iget v5, p0, Lfreemarker/core/FMParser;->jj_gen:I

    if-ne v4, v5, :cond_72

    .line 4639
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_2c
    const/16 v4, 0x20

    if-ge v2, v4, :cond_72

    .line 4640
    sget-object v4, Lfreemarker/core/FMParser;->jj_la1_0:[I

    aget v4, v4, v1

    shl-int v5, v6, v2

    and-int/2addr v4, v5

    if-eqz v4, :cond_3b

    .line 4641
    aput-boolean v6, v3, v2

    .line 4643
    :cond_3b
    sget-object v4, Lfreemarker/core/FMParser;->jj_la1_1:[I

    aget v4, v4, v1

    shl-int v5, v6, v2

    and-int/2addr v4, v5

    if-eqz v4, :cond_48

    .line 4644
    add-int/lit8 v4, v2, 0x20

    aput-boolean v6, v3, v4

    .line 4646
    :cond_48
    sget-object v4, Lfreemarker/core/FMParser;->jj_la1_2:[I

    aget v4, v4, v1

    shl-int v5, v6, v2

    and-int/2addr v4, v5

    if-eqz v4, :cond_55

    .line 4647
    add-int/lit8 v4, v2, 0x40

    aput-boolean v6, v3, v4

    .line 4649
    :cond_55
    sget-object v4, Lfreemarker/core/FMParser;->jj_la1_3:[I

    aget v4, v4, v1

    shl-int v5, v6, v2

    and-int/2addr v4, v5

    if-eqz v4, :cond_62

    .line 4650
    add-int/lit8 v4, v2, 0x60

    aput-boolean v6, v3, v4

    .line 4652
    :cond_62
    sget-object v4, Lfreemarker/core/FMParser;->jj_la1_4:[I

    aget v4, v4, v1

    shl-int v5, v6, v2

    and-int/2addr v4, v5

    if-eqz v4, :cond_6f

    .line 4653
    add-int/lit16 v4, v2, 0x80

    aput-boolean v6, v3, v4

    .line 4639
    :cond_6f
    add-int/lit8 v2, v2, 0x1

    goto :goto_2c

    .line 4637
    .end local v2    # "j":I
    :cond_72
    add-int/lit8 v1, v1, 0x1

    goto :goto_1f

    .line 4658
    :cond_75
    const/4 v1, 0x0

    :goto_76
    if-ge v1, v8, :cond_8e

    .line 4659
    aget-boolean v4, v3, v1

    if-eqz v4, :cond_8b

    .line 4660
    new-array v4, v6, [I

    iput-object v4, p0, Lfreemarker/core/FMParser;->jj_expentry:[I

    .line 4661
    iget-object v4, p0, Lfreemarker/core/FMParser;->jj_expentry:[I

    aput v1, v4, v7

    .line 4662
    iget-object v4, p0, Lfreemarker/core/FMParser;->jj_expentries:Ljava/util/Vector;

    iget-object v5, p0, Lfreemarker/core/FMParser;->jj_expentry:[I

    invoke-virtual {v4, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 4658
    :cond_8b
    add-int/lit8 v1, v1, 0x1

    goto :goto_76

    .line 4665
    :cond_8e
    iput v7, p0, Lfreemarker/core/FMParser;->jj_endpos:I

    .line 4666
    invoke-direct {p0}, Lfreemarker/core/FMParser;->jj_rescan_token()V

    .line 4667
    invoke-direct {p0, v7, v7}, Lfreemarker/core/FMParser;->jj_add_error_token(II)V

    .line 4668
    iget-object v4, p0, Lfreemarker/core/FMParser;->jj_expentries:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v4

    new-array v0, v4, [[I

    .line 4669
    .local v0, "exptokseq":[[I
    const/4 v1, 0x0

    :goto_9f
    iget-object v4, p0, Lfreemarker/core/FMParser;->jj_expentries:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v4

    if-ge v1, v4, :cond_b6

    .line 4670
    iget-object v4, p0, Lfreemarker/core/FMParser;->jj_expentries:Ljava/util/Vector;

    invoke-virtual {v4, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [I

    check-cast v4, [I

    aput-object v4, v0, v1

    .line 4669
    add-int/lit8 v1, v1, 0x1

    goto :goto_9f

    .line 4672
    :cond_b6
    new-instance v4, Lfreemarker/core/ParseException;

    iget-object v5, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    sget-object v6, Lfreemarker/core/FMParserConstants;->tokenImage:[Ljava/lang/String;

    invoke-direct {v4, v5, v0, v6}, Lfreemarker/core/ParseException;-><init>(Lfreemarker/core/Token;[[I[Ljava/lang/String;)V

    return-object v4
.end method

.method public final getNextToken()Lfreemarker/core/Token;
    .registers 3

    .prologue
    .line 4570
    iget-object v0, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    iget-object v0, v0, Lfreemarker/core/Token;->next:Lfreemarker/core/Token;

    if-eqz v0, :cond_18

    iget-object v0, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    iget-object v0, v0, Lfreemarker/core/Token;->next:Lfreemarker/core/Token;

    iput-object v0, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    .line 4572
    :goto_c
    const/4 v0, -0x1

    iput v0, p0, Lfreemarker/core/FMParser;->jj_ntk:I

    .line 4573
    iget v0, p0, Lfreemarker/core/FMParser;->jj_gen:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lfreemarker/core/FMParser;->jj_gen:I

    .line 4574
    iget-object v0, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    return-object v0

    .line 4571
    :cond_18
    iget-object v0, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    iget-object v1, p0, Lfreemarker/core/FMParser;->token_source:Lfreemarker/core/FMParserTokenManager;

    invoke-virtual {v1}, Lfreemarker/core/FMParserTokenManager;->getNextToken()Lfreemarker/core/Token;

    move-result-object v1

    iput-object v1, v0, Lfreemarker/core/Token;->next:Lfreemarker/core/Token;

    iput-object v1, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    goto :goto_c
.end method

.method getTemplate()Lfreemarker/template/Template;
    .registers 2

    .prologue
    .line 84
    iget-object v0, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    return-object v0
.end method

.method public final getToken(I)Lfreemarker/core/Token;
    .registers 6
    .param p1, "index"    # I

    .prologue
    .line 4578
    iget-boolean v3, p0, Lfreemarker/core/FMParser;->lookingAhead:Z

    if-eqz v3, :cond_14

    iget-object v1, p0, Lfreemarker/core/FMParser;->jj_scanpos:Lfreemarker/core/Token;

    .line 4579
    .local v1, "t":Lfreemarker/core/Token;
    :goto_6
    const/4 v0, 0x0

    .local v0, "i":I
    move-object v2, v1

    .end local v1    # "t":Lfreemarker/core/Token;
    .local v2, "t":Lfreemarker/core/Token;
    :goto_8
    if-ge v0, p1, :cond_20

    .line 4580
    iget-object v3, v2, Lfreemarker/core/Token;->next:Lfreemarker/core/Token;

    if-eqz v3, :cond_17

    iget-object v1, v2, Lfreemarker/core/Token;->next:Lfreemarker/core/Token;

    .line 4579
    .end local v2    # "t":Lfreemarker/core/Token;
    .restart local v1    # "t":Lfreemarker/core/Token;
    :goto_10
    add-int/lit8 v0, v0, 0x1

    move-object v2, v1

    .end local v1    # "t":Lfreemarker/core/Token;
    .restart local v2    # "t":Lfreemarker/core/Token;
    goto :goto_8

    .line 4578
    .end local v0    # "i":I
    .end local v2    # "t":Lfreemarker/core/Token;
    :cond_14
    iget-object v1, p0, Lfreemarker/core/FMParser;->token:Lfreemarker/core/Token;

    goto :goto_6

    .line 4581
    .restart local v0    # "i":I
    .restart local v2    # "t":Lfreemarker/core/Token;
    :cond_17
    iget-object v3, p0, Lfreemarker/core/FMParser;->token_source:Lfreemarker/core/FMParserTokenManager;

    invoke-virtual {v3}, Lfreemarker/core/FMParserTokenManager;->getNextToken()Lfreemarker/core/Token;

    move-result-object v1

    iput-object v1, v2, Lfreemarker/core/Token;->next:Lfreemarker/core/Token;

    .end local v2    # "t":Lfreemarker/core/Token;
    .restart local v1    # "t":Lfreemarker/core/Token;
    goto :goto_10

    .line 4583
    .end local v1    # "t":Lfreemarker/core/Token;
    .restart local v2    # "t":Lfreemarker/core/Token;
    :cond_20
    return-object v2
.end method

.method setTemplate(Lfreemarker/template/Template;)V
    .registers 2
    .param p1, "template"    # Lfreemarker/template/Template;

    .prologue
    .line 79
    iput-object p1, p0, Lfreemarker/core/FMParser;->template:Lfreemarker/template/Template;

    .line 80
    return-void
.end method

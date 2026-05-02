.class final enum Lorg/jsoup/parser/TokeniserState$61;
.super Lorg/jsoup/parser/TokeniserState;
.source "TokeniserState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jsoup/parser/TokeniserState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .registers 4

    .prologue
    .line 1466
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/jsoup/parser/TokeniserState;-><init>(Ljava/lang/String;ILorg/jsoup/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lorg/jsoup/parser/Tokeniser;Lorg/jsoup/parser/CharacterReader;)V
    .registers 6
    .param p1, "t"    # Lorg/jsoup/parser/Tokeniser;
    .param p2, "r"    # Lorg/jsoup/parser/CharacterReader;

    .prologue
    const/4 v2, 0x1

    .line 1468
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->consume()C

    move-result v0

    .line 1469
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_4c

    .line 1500
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 1501
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->doctypePending:Lorg/jsoup/parser/Token$Doctype;

    iput-boolean v2, v1, Lorg/jsoup/parser/Token$Doctype;->forceQuirks:Z

    .line 1502
    invoke-virtual {p1}, Lorg/jsoup/parser/Tokeniser;->emitDoctypePending()V

    .line 1504
    :goto_12
    return-void

    .line 1475
    :sswitch_13
    sget-object v1, Lorg/jsoup/parser/TokeniserState$61;->BeforeDoctypeSystemIdentifier:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_12

    .line 1478
    :sswitch_19
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 1479
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->doctypePending:Lorg/jsoup/parser/Token$Doctype;

    iput-boolean v2, v1, Lorg/jsoup/parser/Token$Doctype;->forceQuirks:Z

    .line 1480
    invoke-virtual {p1}, Lorg/jsoup/parser/Tokeniser;->emitDoctypePending()V

    .line 1481
    sget-object v1, Lorg/jsoup/parser/TokeniserState$61;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_12

    .line 1484
    :sswitch_29
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 1486
    sget-object v1, Lorg/jsoup/parser/TokeniserState$61;->DoctypeSystemIdentifier_doubleQuoted:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_12

    .line 1489
    :sswitch_32
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 1491
    sget-object v1, Lorg/jsoup/parser/TokeniserState$61;->DoctypeSystemIdentifier_singleQuoted:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_12

    .line 1494
    :sswitch_3b
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->eofError(Lorg/jsoup/parser/TokeniserState;)V

    .line 1495
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->doctypePending:Lorg/jsoup/parser/Token$Doctype;

    iput-boolean v2, v1, Lorg/jsoup/parser/Token$Doctype;->forceQuirks:Z

    .line 1496
    invoke-virtual {p1}, Lorg/jsoup/parser/Tokeniser;->emitDoctypePending()V

    .line 1497
    sget-object v1, Lorg/jsoup/parser/TokeniserState$61;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_12

    .line 1469
    nop

    :sswitch_data_4c
    .sparse-switch
        0x9 -> :sswitch_13
        0xa -> :sswitch_13
        0xc -> :sswitch_13
        0xd -> :sswitch_13
        0x20 -> :sswitch_13
        0x22 -> :sswitch_29
        0x27 -> :sswitch_32
        0x3e -> :sswitch_19
        0xffff -> :sswitch_3b
    .end sparse-switch
.end method

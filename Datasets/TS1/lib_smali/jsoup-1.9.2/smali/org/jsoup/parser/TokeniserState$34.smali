.class final enum Lorg/jsoup/parser/TokeniserState$34;
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
    .line 546
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/jsoup/parser/TokeniserState;-><init>(Ljava/lang/String;ILorg/jsoup/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lorg/jsoup/parser/Tokeniser;Lorg/jsoup/parser/CharacterReader;)V
    .registers 5
    .param p1, "t"    # Lorg/jsoup/parser/Tokeniser;
    .param p2, "r"    # Lorg/jsoup/parser/CharacterReader;

    .prologue
    .line 549
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->consume()C

    move-result v0

    .line 550
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_52

    .line 584
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {v1}, Lorg/jsoup/parser/Token$Tag;->newAttribute()V

    .line 585
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->unconsume()V

    .line 586
    sget-object v1, Lorg/jsoup/parser/TokeniserState$34;->AttributeName:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    .line 588
    :goto_14
    :sswitch_14
    return-void

    .line 558
    :sswitch_15
    sget-object v1, Lorg/jsoup/parser/TokeniserState$34;->SelfClosingStartTag:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_14

    .line 561
    :sswitch_1b
    invoke-virtual {p1}, Lorg/jsoup/parser/Tokeniser;->emitTagPending()V

    .line 562
    sget-object v1, Lorg/jsoup/parser/TokeniserState$34;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_14

    .line 565
    :sswitch_24
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 566
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {v1}, Lorg/jsoup/parser/Token$Tag;->newAttribute()V

    .line 567
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->unconsume()V

    .line 568
    sget-object v1, Lorg/jsoup/parser/TokeniserState$34;->AttributeName:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_14

    .line 571
    :sswitch_35
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->eofError(Lorg/jsoup/parser/TokeniserState;)V

    .line 572
    sget-object v1, Lorg/jsoup/parser/TokeniserState$34;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_14

    .line 578
    :sswitch_3e
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 579
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {v1}, Lorg/jsoup/parser/Token$Tag;->newAttribute()V

    .line 580
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {v1, v0}, Lorg/jsoup/parser/Token$Tag;->appendAttributeName(C)V

    .line 581
    sget-object v1, Lorg/jsoup/parser/TokeniserState$34;->AttributeName:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_14

    .line 550
    nop

    :sswitch_data_52
    .sparse-switch
        0x0 -> :sswitch_24
        0x9 -> :sswitch_14
        0xa -> :sswitch_14
        0xc -> :sswitch_14
        0xd -> :sswitch_14
        0x20 -> :sswitch_14
        0x22 -> :sswitch_3e
        0x27 -> :sswitch_3e
        0x2f -> :sswitch_15
        0x3c -> :sswitch_3e
        0x3d -> :sswitch_3e
        0x3e -> :sswitch_1b
        0xffff -> :sswitch_35
    .end sparse-switch
.end method

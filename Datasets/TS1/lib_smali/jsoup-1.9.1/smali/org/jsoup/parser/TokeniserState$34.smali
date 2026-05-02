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
    .line 601
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
    .line 604
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->consume()C

    move-result v0

    .line 605
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_52

    .line 639
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {v1}, Lorg/jsoup/parser/Token$Tag;->newAttribute()V

    .line 640
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->unconsume()V

    .line 641
    sget-object v1, Lorg/jsoup/parser/TokeniserState$34;->AttributeName:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    .line 643
    :goto_14
    :sswitch_14
    return-void

    .line 613
    :sswitch_15
    sget-object v1, Lorg/jsoup/parser/TokeniserState$34;->SelfClosingStartTag:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_14

    .line 616
    :sswitch_1b
    invoke-virtual {p1}, Lorg/jsoup/parser/Tokeniser;->emitTagPending()V

    .line 617
    sget-object v1, Lorg/jsoup/parser/TokeniserState$34;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_14

    .line 620
    :sswitch_24
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 621
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {v1}, Lorg/jsoup/parser/Token$Tag;->newAttribute()V

    .line 622
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->unconsume()V

    .line 623
    sget-object v1, Lorg/jsoup/parser/TokeniserState$34;->AttributeName:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_14

    .line 626
    :sswitch_35
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->eofError(Lorg/jsoup/parser/TokeniserState;)V

    .line 627
    sget-object v1, Lorg/jsoup/parser/TokeniserState$34;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_14

    .line 633
    :sswitch_3e
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 634
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {v1}, Lorg/jsoup/parser/Token$Tag;->newAttribute()V

    .line 635
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {v1, v0}, Lorg/jsoup/parser/Token$Tag;->appendAttributeName(C)V

    .line 636
    sget-object v1, Lorg/jsoup/parser/TokeniserState$34;->AttributeName:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_14

    .line 605
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

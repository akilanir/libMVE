.class final enum Lorg/jsoup/parser/TokeniserState$35;
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
    .line 590
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/jsoup/parser/TokeniserState;-><init>(Ljava/lang/String;ILorg/jsoup/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lorg/jsoup/parser/Tokeniser;Lorg/jsoup/parser/CharacterReader;)V
    .registers 7
    .param p1, "t"    # Lorg/jsoup/parser/Tokeniser;
    .param p2, "r"    # Lorg/jsoup/parser/CharacterReader;

    .prologue
    .line 593
    # getter for: Lorg/jsoup/parser/TokeniserState;->attributeNameCharsSorted:[C
    invoke-static {}, Lorg/jsoup/parser/TokeniserState;->access$700()[C

    move-result-object v2

    invoke-virtual {p2, v2}, Lorg/jsoup/parser/CharacterReader;->consumeToAnySorted([C)Ljava/lang/String;

    move-result-object v1

    .line 594
    .local v1, "name":Ljava/lang/String;
    iget-object v2, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jsoup/parser/Token$Tag;->appendAttributeName(Ljava/lang/String;)V

    .line 596
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->consume()C

    move-result v0

    .line 597
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_52

    .line 630
    :goto_18
    return-void

    .line 603
    :sswitch_19
    sget-object v2, Lorg/jsoup/parser/TokeniserState$35;->AfterAttributeName:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_18

    .line 606
    :sswitch_1f
    sget-object v2, Lorg/jsoup/parser/TokeniserState$35;->SelfClosingStartTag:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_18

    .line 609
    :sswitch_25
    sget-object v2, Lorg/jsoup/parser/TokeniserState$35;->BeforeAttributeValue:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_18

    .line 612
    :sswitch_2b
    invoke-virtual {p1}, Lorg/jsoup/parser/Tokeniser;->emitTagPending()V

    .line 613
    sget-object v2, Lorg/jsoup/parser/TokeniserState$35;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_18

    .line 616
    :sswitch_34
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 617
    iget-object v2, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    const v3, 0xfffd

    invoke-virtual {v2, v3}, Lorg/jsoup/parser/Token$Tag;->appendAttributeName(C)V

    goto :goto_18

    .line 620
    :sswitch_40
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->eofError(Lorg/jsoup/parser/TokeniserState;)V

    .line 621
    sget-object v2, Lorg/jsoup/parser/TokeniserState$35;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_18

    .line 626
    :sswitch_49
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 627
    iget-object v2, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {v2, v0}, Lorg/jsoup/parser/Token$Tag;->appendAttributeName(C)V

    goto :goto_18

    .line 597
    :sswitch_data_52
    .sparse-switch
        0x0 -> :sswitch_34
        0x9 -> :sswitch_19
        0xa -> :sswitch_19
        0xc -> :sswitch_19
        0xd -> :sswitch_19
        0x20 -> :sswitch_19
        0x22 -> :sswitch_49
        0x27 -> :sswitch_49
        0x2f -> :sswitch_1f
        0x3c -> :sswitch_49
        0x3d -> :sswitch_25
        0x3e -> :sswitch_2b
        0xffff -> :sswitch_40
    .end sparse-switch
.end method

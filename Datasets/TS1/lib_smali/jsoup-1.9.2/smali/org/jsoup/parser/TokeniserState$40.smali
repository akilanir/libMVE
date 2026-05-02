.class final enum Lorg/jsoup/parser/TokeniserState$40;
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
    .line 790
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/jsoup/parser/TokeniserState;-><init>(Ljava/lang/String;ILorg/jsoup/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lorg/jsoup/parser/Tokeniser;Lorg/jsoup/parser/CharacterReader;)V
    .registers 8
    .param p1, "t"    # Lorg/jsoup/parser/Tokeniser;
    .param p2, "r"    # Lorg/jsoup/parser/CharacterReader;

    .prologue
    .line 792
    # getter for: Lorg/jsoup/parser/TokeniserState;->attributeValueUnquoted:[C
    invoke-static {}, Lorg/jsoup/parser/TokeniserState;->access$1000()[C

    move-result-object v3

    invoke-virtual {p2, v3}, Lorg/jsoup/parser/CharacterReader;->consumeToAnySorted([C)Ljava/lang/String;

    move-result-object v2

    .line 793
    .local v2, "value":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_13

    .line 794
    iget-object v3, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {v3, v2}, Lorg/jsoup/parser/Token$Tag;->appendAttributeValue(Ljava/lang/String;)V

    .line 796
    :cond_13
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->consume()C

    move-result v0

    .line 797
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_64

    .line 835
    :goto_1a
    return-void

    .line 803
    :sswitch_1b
    sget-object v3, Lorg/jsoup/parser/TokeniserState$40;->BeforeAttributeName:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v3}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_1a

    .line 806
    :sswitch_21
    const/16 v3, 0x3e

    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {p1, v3, v4}, Lorg/jsoup/parser/Tokeniser;->consumeCharacterReference(Ljava/lang/Character;Z)[C

    move-result-object v1

    .line 807
    .local v1, "ref":[C
    if-eqz v1, :cond_34

    .line 808
    iget-object v3, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {v3, v1}, Lorg/jsoup/parser/Token$Tag;->appendAttributeValue([C)V

    goto :goto_1a

    .line 810
    :cond_34
    iget-object v3, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    const/16 v4, 0x26

    invoke-virtual {v3, v4}, Lorg/jsoup/parser/Token$Tag;->appendAttributeValue(C)V

    goto :goto_1a

    .line 813
    .end local v1    # "ref":[C
    :sswitch_3c
    invoke-virtual {p1}, Lorg/jsoup/parser/Tokeniser;->emitTagPending()V

    .line 814
    sget-object v3, Lorg/jsoup/parser/TokeniserState$40;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v3}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_1a

    .line 817
    :sswitch_45
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 818
    iget-object v3, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    const v4, 0xfffd

    invoke-virtual {v3, v4}, Lorg/jsoup/parser/Token$Tag;->appendAttributeValue(C)V

    goto :goto_1a

    .line 821
    :sswitch_51
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->eofError(Lorg/jsoup/parser/TokeniserState;)V

    .line 822
    sget-object v3, Lorg/jsoup/parser/TokeniserState$40;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v3}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_1a

    .line 829
    :sswitch_5a
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 830
    iget-object v3, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {v3, v0}, Lorg/jsoup/parser/Token$Tag;->appendAttributeValue(C)V

    goto :goto_1a

    .line 797
    nop

    :sswitch_data_64
    .sparse-switch
        0x0 -> :sswitch_45
        0x9 -> :sswitch_1b
        0xa -> :sswitch_1b
        0xc -> :sswitch_1b
        0xd -> :sswitch_1b
        0x20 -> :sswitch_1b
        0x22 -> :sswitch_5a
        0x26 -> :sswitch_21
        0x27 -> :sswitch_5a
        0x3c -> :sswitch_5a
        0x3d -> :sswitch_5a
        0x3e -> :sswitch_3c
        0x60 -> :sswitch_5a
        0xffff -> :sswitch_51
    .end sparse-switch
.end method

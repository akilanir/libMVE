.class final enum Lorg/jsoup/parser/TokeniserState$39;
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
    .line 813
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
    .line 815
    # getter for: Lorg/jsoup/parser/TokeniserState;->attributeSingleValueCharsSorted:[C
    invoke-static {}, Lorg/jsoup/parser/TokeniserState;->access$600()[C

    move-result-object v3

    invoke-virtual {p2, v3}, Lorg/jsoup/parser/CharacterReader;->consumeToAny([C)Ljava/lang/String;

    move-result-object v2

    .line 816
    .local v2, "value":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_1b

    .line 817
    iget-object v3, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {v3, v2}, Lorg/jsoup/parser/Token$Tag;->appendAttributeValue(Ljava/lang/String;)V

    .line 821
    :goto_13
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->consume()C

    move-result v0

    .line 822
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_58

    .line 843
    :goto_1a
    return-void

    .line 819
    .end local v0    # "c":C
    :cond_1b
    iget-object v3, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {v3}, Lorg/jsoup/parser/Token$Tag;->setEmptyAttributeValue()V

    goto :goto_13

    .line 824
    .restart local v0    # "c":C
    :sswitch_21
    sget-object v3, Lorg/jsoup/parser/TokeniserState$39;->AfterAttributeValue_quoted:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v3}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_1a

    .line 827
    :sswitch_27
    const/16 v3, 0x27

    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {p1, v3, v4}, Lorg/jsoup/parser/Tokeniser;->consumeCharacterReference(Ljava/lang/Character;Z)[C

    move-result-object v1

    .line 828
    .local v1, "ref":[C
    if-eqz v1, :cond_3a

    .line 829
    iget-object v3, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {v3, v1}, Lorg/jsoup/parser/Token$Tag;->appendAttributeValue([C)V

    goto :goto_1a

    .line 831
    :cond_3a
    iget-object v3, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    const/16 v4, 0x26

    invoke-virtual {v3, v4}, Lorg/jsoup/parser/Token$Tag;->appendAttributeValue(C)V

    goto :goto_1a

    .line 834
    .end local v1    # "ref":[C
    :sswitch_42
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 835
    iget-object v3, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    const v4, 0xfffd

    invoke-virtual {v3, v4}, Lorg/jsoup/parser/Token$Tag;->appendAttributeValue(C)V

    goto :goto_1a

    .line 838
    :sswitch_4e
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->eofError(Lorg/jsoup/parser/TokeniserState;)V

    .line 839
    sget-object v3, Lorg/jsoup/parser/TokeniserState$39;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v3}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_1a

    .line 822
    nop

    :sswitch_data_58
    .sparse-switch
        0x0 -> :sswitch_42
        0x26 -> :sswitch_27
        0x27 -> :sswitch_21
        0xffff -> :sswitch_4e
    .end sparse-switch
.end method

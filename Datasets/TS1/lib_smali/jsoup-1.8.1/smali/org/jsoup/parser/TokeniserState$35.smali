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
    .line 642
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
    .line 645
    const/16 v2, 0xc

    new-array v2, v2, [C

    fill-array-data v2, :array_56

    invoke-virtual {p2, v2}, Lorg/jsoup/parser/CharacterReader;->consumeToAny([C)Ljava/lang/String;

    move-result-object v1

    .line 646
    .local v1, "name":Ljava/lang/String;
    iget-object v2, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jsoup/parser/Token$Tag;->appendAttributeName(Ljava/lang/String;)V

    .line 648
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->consume()C

    move-result v0

    .line 649
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_66

    .line 682
    :goto_1b
    return-void

    .line 655
    :sswitch_1c
    sget-object v2, Lorg/jsoup/parser/TokeniserState$35;->AfterAttributeName:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_1b

    .line 658
    :sswitch_22
    sget-object v2, Lorg/jsoup/parser/TokeniserState$35;->SelfClosingStartTag:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_1b

    .line 661
    :sswitch_28
    sget-object v2, Lorg/jsoup/parser/TokeniserState$35;->BeforeAttributeValue:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_1b

    .line 664
    :sswitch_2e
    invoke-virtual {p1}, Lorg/jsoup/parser/Tokeniser;->emitTagPending()V

    .line 665
    sget-object v2, Lorg/jsoup/parser/TokeniserState$35;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_1b

    .line 668
    :sswitch_37
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 669
    iget-object v2, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    const v3, 0xfffd

    invoke-virtual {v2, v3}, Lorg/jsoup/parser/Token$Tag;->appendAttributeName(C)V

    goto :goto_1b

    .line 672
    :sswitch_43
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->eofError(Lorg/jsoup/parser/TokeniserState;)V

    .line 673
    sget-object v2, Lorg/jsoup/parser/TokeniserState$35;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_1b

    .line 678
    :sswitch_4c
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 679
    iget-object v2, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {v2, v0}, Lorg/jsoup/parser/Token$Tag;->appendAttributeName(C)V

    goto :goto_1b

    .line 645
    nop

    :array_56
    .array-data 2
        0x9s
        0xas
        0xds
        0xcs
        0x20s
        0x2fs
        0x3ds
        0x3es
        0x0s
        0x22s
        0x27s
        0x3cs
    .end array-data

    .line 649
    :sswitch_data_66
    .sparse-switch
        0x0 -> :sswitch_37
        0x9 -> :sswitch_1c
        0xa -> :sswitch_1c
        0xc -> :sswitch_1c
        0xd -> :sswitch_1c
        0x20 -> :sswitch_1c
        0x22 -> :sswitch_4c
        0x27 -> :sswitch_4c
        0x2f -> :sswitch_22
        0x3c -> :sswitch_4c
        0x3d -> :sswitch_28
        0x3e -> :sswitch_2e
        0xffff -> :sswitch_43
    .end sparse-switch
.end method

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
    .line 840
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
    .line 842
    const/16 v3, 0xd

    new-array v3, v3, [C

    fill-array-data v3, :array_66

    invoke-virtual {p2, v3}, Lorg/jsoup/parser/CharacterReader;->consumeToAny([C)Ljava/lang/String;

    move-result-object v2

    .line 843
    .local v2, "value":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_16

    .line 844
    iget-object v3, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {v3, v2}, Lorg/jsoup/parser/Token$Tag;->appendAttributeValue(Ljava/lang/String;)V

    .line 846
    :cond_16
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->consume()C

    move-result v0

    .line 847
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_78

    .line 885
    :goto_1d
    return-void

    .line 853
    :sswitch_1e
    sget-object v3, Lorg/jsoup/parser/TokeniserState$40;->BeforeAttributeName:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v3}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_1d

    .line 856
    :sswitch_24
    const/16 v3, 0x3e

    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {p1, v3, v4}, Lorg/jsoup/parser/Tokeniser;->consumeCharacterReference(Ljava/lang/Character;Z)[C

    move-result-object v1

    .line 857
    .local v1, "ref":[C
    if-eqz v1, :cond_37

    .line 858
    iget-object v3, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {v3, v1}, Lorg/jsoup/parser/Token$Tag;->appendAttributeValue([C)V

    goto :goto_1d

    .line 860
    :cond_37
    iget-object v3, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    const/16 v4, 0x26

    invoke-virtual {v3, v4}, Lorg/jsoup/parser/Token$Tag;->appendAttributeValue(C)V

    goto :goto_1d

    .line 863
    .end local v1    # "ref":[C
    :sswitch_3f
    invoke-virtual {p1}, Lorg/jsoup/parser/Tokeniser;->emitTagPending()V

    .line 864
    sget-object v3, Lorg/jsoup/parser/TokeniserState$40;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v3}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_1d

    .line 867
    :sswitch_48
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 868
    iget-object v3, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    const v4, 0xfffd

    invoke-virtual {v3, v4}, Lorg/jsoup/parser/Token$Tag;->appendAttributeValue(C)V

    goto :goto_1d

    .line 871
    :sswitch_54
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->eofError(Lorg/jsoup/parser/TokeniserState;)V

    .line 872
    sget-object v3, Lorg/jsoup/parser/TokeniserState$40;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v3}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_1d

    .line 879
    :sswitch_5d
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 880
    iget-object v3, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {v3, v0}, Lorg/jsoup/parser/Token$Tag;->appendAttributeValue(C)V

    goto :goto_1d

    .line 842
    :array_66
    .array-data 2
        0x9s
        0xas
        0xds
        0xcs
        0x20s
        0x26s
        0x3es
        0x0s
        0x22s
        0x27s
        0x3cs
        0x3ds
        0x60s
    .end array-data

    .line 847
    nop

    :sswitch_data_78
    .sparse-switch
        0x0 -> :sswitch_48
        0x9 -> :sswitch_1e
        0xa -> :sswitch_1e
        0xc -> :sswitch_1e
        0xd -> :sswitch_1e
        0x20 -> :sswitch_1e
        0x22 -> :sswitch_5d
        0x26 -> :sswitch_24
        0x27 -> :sswitch_5d
        0x3c -> :sswitch_5d
        0x3d -> :sswitch_5d
        0x3e -> :sswitch_3f
        0x60 -> :sswitch_5d
        0xffff -> :sswitch_54
    .end sparse-switch
.end method

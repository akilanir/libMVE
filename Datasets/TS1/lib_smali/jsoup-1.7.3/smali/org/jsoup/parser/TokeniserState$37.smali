.class final enum Lorg/jsoup/parser/TokeniserState$37;
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
    .line 729
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
    .line 731
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->consume()C

    move-result v0

    .line 732
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_5a

    .line 772
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->unconsume()V

    .line 773
    sget-object v1, Lorg/jsoup/parser/TokeniserState$37;->AttributeValue_unquoted:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    .line 775
    :goto_f
    :sswitch_f
    return-void

    .line 741
    :sswitch_10
    sget-object v1, Lorg/jsoup/parser/TokeniserState$37;->AttributeValue_doubleQuoted:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_f

    .line 744
    :sswitch_16
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->unconsume()V

    .line 745
    sget-object v1, Lorg/jsoup/parser/TokeniserState$37;->AttributeValue_unquoted:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_f

    .line 748
    :sswitch_1f
    sget-object v1, Lorg/jsoup/parser/TokeniserState$37;->AttributeValue_singleQuoted:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_f

    .line 751
    :sswitch_25
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 752
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    const v2, 0xfffd

    invoke-virtual {v1, v2}, Lorg/jsoup/parser/Token$Tag;->appendAttributeValue(C)V

    .line 753
    sget-object v1, Lorg/jsoup/parser/TokeniserState$37;->AttributeValue_unquoted:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_f

    .line 756
    :sswitch_36
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->eofError(Lorg/jsoup/parser/TokeniserState;)V

    .line 757
    sget-object v1, Lorg/jsoup/parser/TokeniserState$37;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_f

    .line 760
    :sswitch_3f
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 761
    invoke-virtual {p1}, Lorg/jsoup/parser/Tokeniser;->emitTagPending()V

    .line 762
    sget-object v1, Lorg/jsoup/parser/TokeniserState$37;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_f

    .line 767
    :sswitch_4b
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 768
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {v1, v0}, Lorg/jsoup/parser/Token$Tag;->appendAttributeValue(C)V

    .line 769
    sget-object v1, Lorg/jsoup/parser/TokeniserState$37;->AttributeValue_unquoted:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_f

    .line 732
    nop

    :sswitch_data_5a
    .sparse-switch
        0x0 -> :sswitch_25
        0x9 -> :sswitch_f
        0xa -> :sswitch_f
        0xc -> :sswitch_f
        0xd -> :sswitch_f
        0x20 -> :sswitch_f
        0x22 -> :sswitch_10
        0x26 -> :sswitch_16
        0x27 -> :sswitch_1f
        0x3c -> :sswitch_4b
        0x3d -> :sswitch_4b
        0x3e -> :sswitch_3f
        0x60 -> :sswitch_4b
        0xffff -> :sswitch_36
    .end sparse-switch
.end method

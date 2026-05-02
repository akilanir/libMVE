.class final enum Lorg/jsoup/parser/TokeniserState$10;
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
    .line 141
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
    .line 146
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->consumeTagName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 147
    .local v0, "tagName":Ljava/lang/String;
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {v1, v0}, Lorg/jsoup/parser/Token$Tag;->appendTagName(Ljava/lang/String;)V

    .line 149
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->consume()C

    move-result v1

    sparse-switch v1, :sswitch_data_3e

    .line 172
    :goto_14
    return-void

    .line 155
    :sswitch_15
    sget-object v1, Lorg/jsoup/parser/TokeniserState$10;->BeforeAttributeName:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_14

    .line 158
    :sswitch_1b
    sget-object v1, Lorg/jsoup/parser/TokeniserState$10;->SelfClosingStartTag:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_14

    .line 161
    :sswitch_21
    invoke-virtual {p1}, Lorg/jsoup/parser/Tokeniser;->emitTagPending()V

    .line 162
    sget-object v1, Lorg/jsoup/parser/TokeniserState$10;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_14

    .line 165
    :sswitch_2a
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    # getter for: Lorg/jsoup/parser/TokeniserState;->replacementStr:Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/TokeniserState;->access$300()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/jsoup/parser/Token$Tag;->appendTagName(Ljava/lang/String;)V

    goto :goto_14

    .line 168
    :sswitch_34
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->eofError(Lorg/jsoup/parser/TokeniserState;)V

    .line 169
    sget-object v1, Lorg/jsoup/parser/TokeniserState$10;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_14

    .line 149
    nop

    :sswitch_data_3e
    .sparse-switch
        0x0 -> :sswitch_2a
        0x9 -> :sswitch_15
        0xa -> :sswitch_15
        0xc -> :sswitch_15
        0xd -> :sswitch_15
        0x20 -> :sswitch_15
        0x2f -> :sswitch_1b
        0x3e -> :sswitch_21
        0xffff -> :sswitch_34
    .end sparse-switch
.end method

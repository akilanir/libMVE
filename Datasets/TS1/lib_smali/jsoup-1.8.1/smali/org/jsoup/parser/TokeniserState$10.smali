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
    .line 181
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
    .line 185
    const/16 v1, 0x8

    new-array v1, v1, [C

    fill-array-data v1, :array_44

    invoke-virtual {p2, v1}, Lorg/jsoup/parser/CharacterReader;->consumeToAny([C)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 186
    .local v0, "tagName":Ljava/lang/String;
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {v1, v0}, Lorg/jsoup/parser/Token$Tag;->appendTagName(Ljava/lang/String;)V

    .line 188
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->consume()C

    move-result v1

    sparse-switch v1, :sswitch_data_50

    .line 211
    :goto_1b
    return-void

    .line 194
    :sswitch_1c
    sget-object v1, Lorg/jsoup/parser/TokeniserState$10;->BeforeAttributeName:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_1b

    .line 197
    :sswitch_22
    sget-object v1, Lorg/jsoup/parser/TokeniserState$10;->SelfClosingStartTag:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_1b

    .line 200
    :sswitch_28
    invoke-virtual {p1}, Lorg/jsoup/parser/Tokeniser;->emitTagPending()V

    .line 201
    sget-object v1, Lorg/jsoup/parser/TokeniserState$10;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_1b

    .line 204
    :sswitch_31
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    # getter for: Lorg/jsoup/parser/TokeniserState;->replacementStr:Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/TokeniserState;->access$100()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/jsoup/parser/Token$Tag;->appendTagName(Ljava/lang/String;)V

    goto :goto_1b

    .line 207
    :sswitch_3b
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->eofError(Lorg/jsoup/parser/TokeniserState;)V

    .line 208
    sget-object v1, Lorg/jsoup/parser/TokeniserState$10;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_1b

    .line 185
    :array_44
    .array-data 2
        0x9s
        0xas
        0xds
        0xcs
        0x20s
        0x2fs
        0x3es
        0x0s
    .end array-data

    .line 188
    :sswitch_data_50
    .sparse-switch
        0x0 -> :sswitch_31
        0x9 -> :sswitch_1c
        0xa -> :sswitch_1c
        0xc -> :sswitch_1c
        0xd -> :sswitch_1c
        0x20 -> :sswitch_1c
        0x2f -> :sswitch_22
        0x3e -> :sswitch_28
        0xffff -> :sswitch_3b
    .end sparse-switch
.end method

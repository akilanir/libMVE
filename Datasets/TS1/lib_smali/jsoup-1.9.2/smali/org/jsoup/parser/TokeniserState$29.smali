.class final enum Lorg/jsoup/parser/TokeniserState$29;
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
    .line 446
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
    .line 448
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->current()C

    move-result v0

    .line 449
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_3e

    .line 468
    const/4 v2, 0x3

    new-array v2, v2, [C

    fill-array-data v2, :array_50

    invoke-virtual {p2, v2}, Lorg/jsoup/parser/CharacterReader;->consumeToAny([C)Ljava/lang/String;

    move-result-object v1

    .line 469
    .local v1, "data":Ljava/lang/String;
    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->emit(Ljava/lang/String;)V

    .line 471
    .end local v1    # "data":Ljava/lang/String;
    :goto_14
    return-void

    .line 451
    :sswitch_15
    invoke-virtual {p1, v0}, Lorg/jsoup/parser/Tokeniser;->emit(C)V

    .line 452
    sget-object v2, Lorg/jsoup/parser/TokeniserState$29;->ScriptDataDoubleEscapedDash:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lorg/jsoup/parser/Tokeniser;->advanceTransition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_14

    .line 455
    :sswitch_1e
    invoke-virtual {p1, v0}, Lorg/jsoup/parser/Tokeniser;->emit(C)V

    .line 456
    sget-object v2, Lorg/jsoup/parser/TokeniserState$29;->ScriptDataDoubleEscapedLessthanSign:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lorg/jsoup/parser/Tokeniser;->advanceTransition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_14

    .line 459
    :sswitch_27
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 460
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->advance()V

    .line 461
    const v2, 0xfffd

    invoke-virtual {p1, v2}, Lorg/jsoup/parser/Tokeniser;->emit(C)V

    goto :goto_14

    .line 464
    :sswitch_34
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->eofError(Lorg/jsoup/parser/TokeniserState;)V

    .line 465
    sget-object v2, Lorg/jsoup/parser/TokeniserState$29;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_14

    .line 449
    nop

    :sswitch_data_3e
    .sparse-switch
        0x0 -> :sswitch_27
        0x2d -> :sswitch_15
        0x3c -> :sswitch_1e
        0xffff -> :sswitch_34
    .end sparse-switch

    .line 468
    :array_50
    .array-data 2
        0x2ds
        0x3cs
        0x0s
    .end array-data
.end method

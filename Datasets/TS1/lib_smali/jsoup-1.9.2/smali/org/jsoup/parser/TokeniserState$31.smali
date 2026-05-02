.class final enum Lorg/jsoup/parser/TokeniserState$31;
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
    .line 500
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
    .line 502
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->consume()C

    move-result v0

    .line 503
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_3e

    .line 525
    invoke-virtual {p1, v0}, Lorg/jsoup/parser/Tokeniser;->emit(C)V

    .line 526
    sget-object v1, Lorg/jsoup/parser/TokeniserState$31;->ScriptDataDoubleEscaped:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    .line 528
    :goto_f
    return-void

    .line 505
    :sswitch_10
    invoke-virtual {p1, v0}, Lorg/jsoup/parser/Tokeniser;->emit(C)V

    goto :goto_f

    .line 508
    :sswitch_14
    invoke-virtual {p1, v0}, Lorg/jsoup/parser/Tokeniser;->emit(C)V

    .line 509
    sget-object v1, Lorg/jsoup/parser/TokeniserState$31;->ScriptDataDoubleEscapedLessthanSign:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_f

    .line 512
    :sswitch_1d
    invoke-virtual {p1, v0}, Lorg/jsoup/parser/Tokeniser;->emit(C)V

    .line 513
    sget-object v1, Lorg/jsoup/parser/TokeniserState$31;->ScriptData:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_f

    .line 516
    :sswitch_26
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 517
    const v1, 0xfffd

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->emit(C)V

    .line 518
    sget-object v1, Lorg/jsoup/parser/TokeniserState$31;->ScriptDataDoubleEscaped:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_f

    .line 521
    :sswitch_35
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->eofError(Lorg/jsoup/parser/TokeniserState;)V

    .line 522
    sget-object v1, Lorg/jsoup/parser/TokeniserState$31;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_f

    .line 503
    :sswitch_data_3e
    .sparse-switch
        0x0 -> :sswitch_26
        0x2d -> :sswitch_10
        0x3c -> :sswitch_14
        0x3e -> :sswitch_1d
        0xffff -> :sswitch_35
    .end sparse-switch
.end method

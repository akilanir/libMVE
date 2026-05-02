.class final enum Lorg/jsoup/parser/TokeniserState$23;
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
    .line 400
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
    .line 402
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_f

    .line 403
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->eofError(Lorg/jsoup/parser/TokeniserState;)V

    .line 404
    sget-object v1, Lorg/jsoup/parser/TokeniserState$23;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    .line 426
    :goto_e
    return-void

    .line 408
    :cond_f
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->consume()C

    move-result v0

    .line 409
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_3e

    .line 423
    invoke-virtual {p1, v0}, Lorg/jsoup/parser/Tokeniser;->emit(C)V

    .line 424
    sget-object v1, Lorg/jsoup/parser/TokeniserState$23;->ScriptDataEscaped:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_e

    .line 411
    :sswitch_1f
    invoke-virtual {p1, v0}, Lorg/jsoup/parser/Tokeniser;->emit(C)V

    .line 412
    sget-object v1, Lorg/jsoup/parser/TokeniserState$23;->ScriptDataEscapedDashDash:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_e

    .line 415
    :sswitch_28
    sget-object v1, Lorg/jsoup/parser/TokeniserState$23;->ScriptDataEscapedLessthanSign:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_e

    .line 418
    :sswitch_2e
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 419
    const v1, 0xfffd

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->emit(C)V

    .line 420
    sget-object v1, Lorg/jsoup/parser/TokeniserState$23;->ScriptDataEscaped:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_e

    .line 409
    nop

    :sswitch_data_3e
    .sparse-switch
        0x0 -> :sswitch_2e
        0x2d -> :sswitch_1f
        0x3c -> :sswitch_28
    .end sparse-switch
.end method

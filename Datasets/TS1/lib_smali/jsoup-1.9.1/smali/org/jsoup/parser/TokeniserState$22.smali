.class final enum Lorg/jsoup/parser/TokeniserState$22;
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
    .line 376
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
    .line 378
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_f

    .line 379
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->eofError(Lorg/jsoup/parser/TokeniserState;)V

    .line 380
    sget-object v1, Lorg/jsoup/parser/TokeniserState$22;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    .line 401
    :goto_e
    return-void

    .line 384
    :cond_f
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->current()C

    move-result v1

    sparse-switch v1, :sswitch_data_42

    .line 398
    const/4 v1, 0x3

    new-array v1, v1, [C

    fill-array-data v1, :array_50

    invoke-virtual {p2, v1}, Lorg/jsoup/parser/CharacterReader;->consumeToAny([C)Ljava/lang/String;

    move-result-object v0

    .line 399
    .local v0, "data":Ljava/lang/String;
    invoke-virtual {p1, v0}, Lorg/jsoup/parser/Tokeniser;->emit(Ljava/lang/String;)V

    goto :goto_e

    .line 386
    .end local v0    # "data":Ljava/lang/String;
    :sswitch_24
    const/16 v1, 0x2d

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->emit(C)V

    .line 387
    sget-object v1, Lorg/jsoup/parser/TokeniserState$22;->ScriptDataEscapedDash:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->advanceTransition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_e

    .line 390
    :sswitch_2f
    sget-object v1, Lorg/jsoup/parser/TokeniserState$22;->ScriptDataEscapedLessthanSign:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->advanceTransition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_e

    .line 393
    :sswitch_35
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 394
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->advance()V

    .line 395
    const v1, 0xfffd

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->emit(C)V

    goto :goto_e

    .line 384
    :sswitch_data_42
    .sparse-switch
        0x0 -> :sswitch_35
        0x2d -> :sswitch_24
        0x3c -> :sswitch_2f
    .end sparse-switch

    .line 398
    :array_50
    .array-data 2
        0x2ds
        0x3cs
        0x0s
    .end array-data
.end method

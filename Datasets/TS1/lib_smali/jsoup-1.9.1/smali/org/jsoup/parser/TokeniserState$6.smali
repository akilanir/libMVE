.class final enum Lorg/jsoup/parser/TokeniserState$6;
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
    .line 100
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
    .line 102
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->current()C

    move-result v1

    sparse-switch v1, :sswitch_data_32

    .line 115
    const/4 v1, 0x2

    new-array v1, v1, [C

    fill-array-data v1, :array_40

    invoke-virtual {p2, v1}, Lorg/jsoup/parser/CharacterReader;->consumeToAny([C)Ljava/lang/String;

    move-result-object v0

    .line 116
    .local v0, "data":Ljava/lang/String;
    invoke-virtual {p1, v0}, Lorg/jsoup/parser/Tokeniser;->emit(Ljava/lang/String;)V

    .line 119
    .end local v0    # "data":Ljava/lang/String;
    :goto_14
    return-void

    .line 104
    :sswitch_15
    sget-object v1, Lorg/jsoup/parser/TokeniserState$6;->ScriptDataLessthanSign:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->advanceTransition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_14

    .line 107
    :sswitch_1b
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 108
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->advance()V

    .line 109
    const v1, 0xfffd

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->emit(C)V

    goto :goto_14

    .line 112
    :sswitch_28
    new-instance v1, Lorg/jsoup/parser/Token$EOF;

    invoke-direct {v1}, Lorg/jsoup/parser/Token$EOF;-><init>()V

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->emit(Lorg/jsoup/parser/Token;)V

    goto :goto_14

    .line 102
    nop

    :sswitch_data_32
    .sparse-switch
        0x0 -> :sswitch_1b
        0x3c -> :sswitch_15
        0xffff -> :sswitch_28
    .end sparse-switch

    .line 115
    :array_40
    .array-data 2
        0x3cs
        0x0s
    .end array-data
.end method

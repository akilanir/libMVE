.class final enum Lorg/jsoup/parser/TokeniserState$3;
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
    .line 44
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
    .line 47
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->current()C

    move-result v1

    sparse-switch v1, :sswitch_data_38

    .line 63
    const/4 v1, 0x3

    new-array v1, v1, [C

    fill-array-data v1, :array_4a

    invoke-virtual {p2, v1}, Lorg/jsoup/parser/CharacterReader;->consumeToAny([C)Ljava/lang/String;

    move-result-object v0

    .line 64
    .local v0, "data":Ljava/lang/String;
    invoke-virtual {p1, v0}, Lorg/jsoup/parser/Tokeniser;->emit(Ljava/lang/String;)V

    .line 67
    .end local v0    # "data":Ljava/lang/String;
    :goto_14
    return-void

    .line 49
    :sswitch_15
    sget-object v1, Lorg/jsoup/parser/TokeniserState$3;->CharacterReferenceInRcdata:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->advanceTransition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_14

    .line 52
    :sswitch_1b
    sget-object v1, Lorg/jsoup/parser/TokeniserState$3;->RcdataLessthanSign:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->advanceTransition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_14

    .line 55
    :sswitch_21
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 56
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->advance()V

    .line 57
    const v1, 0xfffd

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->emit(C)V

    goto :goto_14

    .line 60
    :sswitch_2e
    new-instance v1, Lorg/jsoup/parser/Token$EOF;

    invoke-direct {v1}, Lorg/jsoup/parser/Token$EOF;-><init>()V

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->emit(Lorg/jsoup/parser/Token;)V

    goto :goto_14

    .line 47
    nop

    :sswitch_data_38
    .sparse-switch
        0x0 -> :sswitch_21
        0x26 -> :sswitch_15
        0x3c -> :sswitch_1b
        0xffff -> :sswitch_2e
    .end sparse-switch

    .line 63
    :array_4a
    .array-data 2
        0x26s
        0x3cs
        0x0s
    .end array-data
.end method

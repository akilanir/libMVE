.class final enum Lorg/jsoup/parser/TokeniserState$8;
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
    .line 97
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/jsoup/parser/TokeniserState;-><init>(Ljava/lang/String;ILorg/jsoup/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lorg/jsoup/parser/Tokeniser;Lorg/jsoup/parser/CharacterReader;)V
    .registers 4
    .param p1, "t"    # Lorg/jsoup/parser/Tokeniser;
    .param p2, "r"    # Lorg/jsoup/parser/CharacterReader;

    .prologue
    .line 100
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->current()C

    move-result v0

    sparse-switch v0, :sswitch_data_38

    .line 111
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->matchesLetter()Z

    move-result v0

    if-eqz v0, :cond_29

    .line 112
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lorg/jsoup/parser/Tokeniser;->createTagPending(Z)Lorg/jsoup/parser/Token$Tag;

    .line 113
    sget-object v0, Lorg/jsoup/parser/TokeniserState$8;->TagName:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    .line 121
    :goto_16
    return-void

    .line 102
    :sswitch_17
    sget-object v0, Lorg/jsoup/parser/TokeniserState$8;->MarkupDeclarationOpen:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lorg/jsoup/parser/Tokeniser;->advanceTransition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_16

    .line 105
    :sswitch_1d
    sget-object v0, Lorg/jsoup/parser/TokeniserState$8;->EndTagOpen:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lorg/jsoup/parser/Tokeniser;->advanceTransition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_16

    .line 108
    :sswitch_23
    sget-object v0, Lorg/jsoup/parser/TokeniserState$8;->BogusComment:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lorg/jsoup/parser/Tokeniser;->advanceTransition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_16

    .line 115
    :cond_29
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 116
    const/16 v0, 0x3c

    invoke-virtual {p1, v0}, Lorg/jsoup/parser/Tokeniser;->emit(C)V

    .line 117
    sget-object v0, Lorg/jsoup/parser/TokeniserState$8;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_16

    .line 100
    nop

    :sswitch_data_38
    .sparse-switch
        0x21 -> :sswitch_17
        0x2f -> :sswitch_1d
        0x3f -> :sswitch_23
    .end sparse-switch
.end method

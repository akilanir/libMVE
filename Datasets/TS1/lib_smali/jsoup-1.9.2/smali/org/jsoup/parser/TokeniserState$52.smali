.class final enum Lorg/jsoup/parser/TokeniserState$52;
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
    .line 1107
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
    .line 1109
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->matchesLetter()Z

    move-result v1

    if-eqz v1, :cond_f

    .line 1110
    invoke-virtual {p1}, Lorg/jsoup/parser/Tokeniser;->createDoctypePending()V

    .line 1111
    sget-object v1, Lorg/jsoup/parser/TokeniserState$52;->DoctypeName:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    .line 1140
    :goto_e
    :sswitch_e
    return-void

    .line 1114
    :cond_f
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->consume()C

    move-result v0

    .line 1115
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_50

    .line 1136
    invoke-virtual {p1}, Lorg/jsoup/parser/Tokeniser;->createDoctypePending()V

    .line 1137
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->doctypePending:Lorg/jsoup/parser/Token$Doctype;

    iget-object v1, v1, Lorg/jsoup/parser/Token$Doctype;->name:Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1138
    sget-object v1, Lorg/jsoup/parser/TokeniserState$52;->DoctypeName:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_e

    .line 1123
    :sswitch_26
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 1124
    invoke-virtual {p1}, Lorg/jsoup/parser/Tokeniser;->createDoctypePending()V

    .line 1125
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->doctypePending:Lorg/jsoup/parser/Token$Doctype;

    iget-object v1, v1, Lorg/jsoup/parser/Token$Doctype;->name:Ljava/lang/StringBuilder;

    const v2, 0xfffd

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1126
    sget-object v1, Lorg/jsoup/parser/TokeniserState$52;->DoctypeName:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_e

    .line 1129
    :sswitch_3c
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->eofError(Lorg/jsoup/parser/TokeniserState;)V

    .line 1130
    invoke-virtual {p1}, Lorg/jsoup/parser/Tokeniser;->createDoctypePending()V

    .line 1131
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->doctypePending:Lorg/jsoup/parser/Token$Doctype;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lorg/jsoup/parser/Token$Doctype;->forceQuirks:Z

    .line 1132
    invoke-virtual {p1}, Lorg/jsoup/parser/Tokeniser;->emitDoctypePending()V

    .line 1133
    sget-object v1, Lorg/jsoup/parser/TokeniserState$52;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_e

    .line 1115
    :sswitch_data_50
    .sparse-switch
        0x0 -> :sswitch_26
        0x9 -> :sswitch_e
        0xa -> :sswitch_e
        0xc -> :sswitch_e
        0xd -> :sswitch_e
        0x20 -> :sswitch_e
        0xffff -> :sswitch_3c
    .end sparse-switch
.end method

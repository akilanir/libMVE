.class final enum Lorg/jsoup/parser/TokeniserState$53;
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
    .line 1142
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/jsoup/parser/TokeniserState;-><init>(Ljava/lang/String;ILorg/jsoup/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lorg/jsoup/parser/Tokeniser;Lorg/jsoup/parser/CharacterReader;)V
    .registers 7
    .param p1, "t"    # Lorg/jsoup/parser/Tokeniser;
    .param p2, "r"    # Lorg/jsoup/parser/CharacterReader;

    .prologue
    .line 1144
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->matchesLetter()Z

    move-result v2

    if-eqz v2, :cond_16

    .line 1145
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->consumeLetterSequence()Ljava/lang/String;

    move-result-object v1

    .line 1146
    .local v1, "name":Ljava/lang/String;
    iget-object v2, p1, Lorg/jsoup/parser/Tokeniser;->doctypePending:Lorg/jsoup/parser/Token$Doctype;

    iget-object v2, v2, Lorg/jsoup/parser/Token$Doctype;->name:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1175
    .end local v1    # "name":Ljava/lang/String;
    :goto_15
    return-void

    .line 1149
    :cond_16
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->consume()C

    move-result v0

    .line 1150
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_54

    .line 1173
    iget-object v2, p1, Lorg/jsoup/parser/Tokeniser;->doctypePending:Lorg/jsoup/parser/Token$Doctype;

    iget-object v2, v2, Lorg/jsoup/parser/Token$Doctype;->name:Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_15

    .line 1152
    :sswitch_25
    invoke-virtual {p1}, Lorg/jsoup/parser/Tokeniser;->emitDoctypePending()V

    .line 1153
    sget-object v2, Lorg/jsoup/parser/TokeniserState$53;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_15

    .line 1160
    :sswitch_2e
    sget-object v2, Lorg/jsoup/parser/TokeniserState$53;->AfterDoctypeName:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_15

    .line 1163
    :sswitch_34
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 1164
    iget-object v2, p1, Lorg/jsoup/parser/Tokeniser;->doctypePending:Lorg/jsoup/parser/Token$Doctype;

    iget-object v2, v2, Lorg/jsoup/parser/Token$Doctype;->name:Ljava/lang/StringBuilder;

    const v3, 0xfffd

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_15

    .line 1167
    :sswitch_42
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->eofError(Lorg/jsoup/parser/TokeniserState;)V

    .line 1168
    iget-object v2, p1, Lorg/jsoup/parser/Tokeniser;->doctypePending:Lorg/jsoup/parser/Token$Doctype;

    const/4 v3, 0x1

    iput-boolean v3, v2, Lorg/jsoup/parser/Token$Doctype;->forceQuirks:Z

    .line 1169
    invoke-virtual {p1}, Lorg/jsoup/parser/Tokeniser;->emitDoctypePending()V

    .line 1170
    sget-object v2, Lorg/jsoup/parser/TokeniserState$53;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v2}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_15

    .line 1150
    nop

    :sswitch_data_54
    .sparse-switch
        0x0 -> :sswitch_34
        0x9 -> :sswitch_2e
        0xa -> :sswitch_2e
        0xc -> :sswitch_2e
        0xd -> :sswitch_2e
        0x20 -> :sswitch_2e
        0x3e -> :sswitch_25
        0xffff -> :sswitch_42
    .end sparse-switch
.end method

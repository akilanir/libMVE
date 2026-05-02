.class final enum Lorg/jsoup/parser/TokeniserState$48;
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
    .line 1043
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
    const/16 v2, 0x2d

    .line 1045
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->consume()C

    move-result v0

    .line 1046
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_44

    .line 1061
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->commentPending:Lorg/jsoup/parser/Token$Comment;

    iget-object v1, v1, Lorg/jsoup/parser/Token$Comment;->data:Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1062
    sget-object v1, Lorg/jsoup/parser/TokeniserState$48;->Comment:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    .line 1064
    :goto_19
    return-void

    .line 1048
    :sswitch_1a
    sget-object v1, Lorg/jsoup/parser/TokeniserState$48;->CommentEnd:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_19

    .line 1051
    :sswitch_20
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 1052
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->commentPending:Lorg/jsoup/parser/Token$Comment;

    iget-object v1, v1, Lorg/jsoup/parser/Token$Comment;->data:Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const v2, 0xfffd

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1053
    sget-object v1, Lorg/jsoup/parser/TokeniserState$48;->Comment:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_19

    .line 1056
    :sswitch_37
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->eofError(Lorg/jsoup/parser/TokeniserState;)V

    .line 1057
    invoke-virtual {p1}, Lorg/jsoup/parser/Tokeniser;->emitCommentPending()V

    .line 1058
    sget-object v1, Lorg/jsoup/parser/TokeniserState$48;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_19

    .line 1046
    nop

    :sswitch_data_44
    .sparse-switch
        0x0 -> :sswitch_20
        0x2d -> :sswitch_1a
        0xffff -> :sswitch_37
    .end sparse-switch
.end method

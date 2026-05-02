.class final enum Lorg/jsoup/parser/TokeniserState$49;
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
    .line 1066
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
    .line 1068
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->consume()C

    move-result v0

    .line 1069
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_62

    .line 1093
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 1094
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->commentPending:Lorg/jsoup/parser/Token$Comment;

    iget-object v1, v1, Lorg/jsoup/parser/Token$Comment;->data:Ljava/lang/StringBuilder;

    const-string v2, "--"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1095
    sget-object v1, Lorg/jsoup/parser/TokeniserState$49;->Comment:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    .line 1097
    :goto_1c
    return-void

    .line 1071
    :sswitch_1d
    invoke-virtual {p1}, Lorg/jsoup/parser/Tokeniser;->emitCommentPending()V

    .line 1072
    sget-object v1, Lorg/jsoup/parser/TokeniserState$49;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_1c

    .line 1075
    :sswitch_26
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 1076
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->commentPending:Lorg/jsoup/parser/Token$Comment;

    iget-object v1, v1, Lorg/jsoup/parser/Token$Comment;->data:Ljava/lang/StringBuilder;

    const-string v2, "--"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const v2, 0xfffd

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1077
    sget-object v1, Lorg/jsoup/parser/TokeniserState$49;->Comment:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_1c

    .line 1080
    :sswitch_3f
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 1081
    sget-object v1, Lorg/jsoup/parser/TokeniserState$49;->CommentEndBang:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_1c

    .line 1084
    :sswitch_48
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 1085
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->commentPending:Lorg/jsoup/parser/Token$Comment;

    iget-object v1, v1, Lorg/jsoup/parser/Token$Comment;->data:Ljava/lang/StringBuilder;

    const/16 v2, 0x2d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1c

    .line 1088
    :sswitch_55
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->eofError(Lorg/jsoup/parser/TokeniserState;)V

    .line 1089
    invoke-virtual {p1}, Lorg/jsoup/parser/Tokeniser;->emitCommentPending()V

    .line 1090
    sget-object v1, Lorg/jsoup/parser/TokeniserState$49;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_1c

    .line 1069
    nop

    :sswitch_data_62
    .sparse-switch
        0x0 -> :sswitch_26
        0x21 -> :sswitch_3f
        0x2d -> :sswitch_48
        0x3e -> :sswitch_1d
        0xffff -> :sswitch_55
    .end sparse-switch
.end method

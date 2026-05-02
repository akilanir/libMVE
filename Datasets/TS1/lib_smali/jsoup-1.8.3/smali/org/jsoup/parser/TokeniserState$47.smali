.class final enum Lorg/jsoup/parser/TokeniserState$47;
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
    .line 1029
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
    .line 1031
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->current()C

    move-result v0

    .line 1032
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_3c

    .line 1047
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->commentPending:Lorg/jsoup/parser/Token$Comment;

    iget-object v1, v1, Lorg/jsoup/parser/Token$Comment;->data:Ljava/lang/StringBuilder;

    const/4 v2, 0x2

    new-array v2, v2, [C

    fill-array-data v2, :array_4a

    invoke-virtual {p2, v2}, Lorg/jsoup/parser/CharacterReader;->consumeToAny([C)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1049
    :goto_18
    return-void

    .line 1034
    :sswitch_19
    sget-object v1, Lorg/jsoup/parser/TokeniserState$47;->CommentEndDash:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->advanceTransition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_18

    .line 1037
    :sswitch_1f
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->error(Lorg/jsoup/parser/TokeniserState;)V

    .line 1038
    invoke-virtual {p2}, Lorg/jsoup/parser/CharacterReader;->advance()V

    .line 1039
    iget-object v1, p1, Lorg/jsoup/parser/Tokeniser;->commentPending:Lorg/jsoup/parser/Token$Comment;

    iget-object v1, v1, Lorg/jsoup/parser/Token$Comment;->data:Ljava/lang/StringBuilder;

    const v2, 0xfffd

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_18

    .line 1042
    :sswitch_30
    invoke-virtual {p1, p0}, Lorg/jsoup/parser/Tokeniser;->eofError(Lorg/jsoup/parser/TokeniserState;)V

    .line 1043
    invoke-virtual {p1}, Lorg/jsoup/parser/Tokeniser;->emitCommentPending()V

    .line 1044
    sget-object v1, Lorg/jsoup/parser/TokeniserState$47;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_18

    .line 1032
    :sswitch_data_3c
    .sparse-switch
        0x0 -> :sswitch_1f
        0x2d -> :sswitch_19
        0xffff -> :sswitch_30
    .end sparse-switch

    .line 1047
    :array_4a
    .array-data 2
        0x2ds
        0x0s
    .end array-data
.end method

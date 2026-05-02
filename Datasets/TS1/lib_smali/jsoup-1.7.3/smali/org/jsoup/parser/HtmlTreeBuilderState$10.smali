.class final enum Lorg/jsoup/parser/HtmlTreeBuilderState$10;
.super Lorg/jsoup/parser/HtmlTreeBuilderState;
.source "HtmlTreeBuilderState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jsoup/parser/HtmlTreeBuilderState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .registers 4

    .prologue
    .line 898
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/jsoup/parser/HtmlTreeBuilderState;-><init>(Ljava/lang/String;ILorg/jsoup/parser/HtmlTreeBuilderState$1;)V

    return-void
.end method


# virtual methods
.method process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z
    .registers 12
    .param p1, "t"    # Lorg/jsoup/parser/Token;
    .param p2, "tb"    # Lorg/jsoup/parser/HtmlTreeBuilder;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 900
    sget-object v5, Lorg/jsoup/parser/HtmlTreeBuilderState$24;->$SwitchMap$org$jsoup$parser$Token$TokenType:[I

    iget-object v6, p1, Lorg/jsoup/parser/Token;->type:Lorg/jsoup/parser/Token$TokenType;

    invoke-virtual {v6}, Lorg/jsoup/parser/Token$TokenType;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_a2

    .line 911
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getPendingTableCharacters()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_96

    .line 912
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getPendingTableCharacters()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_21
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_93

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/parser/Token$Character;

    .line 913
    .local v1, "character":Lorg/jsoup/parser/Token$Character;
    # invokes: Lorg/jsoup/parser/HtmlTreeBuilderState;->isWhitespace(Lorg/jsoup/parser/Token;)Z
    invoke-static {v1}, Lorg/jsoup/parser/HtmlTreeBuilderState;->access$100(Lorg/jsoup/parser/Token;)Z

    move-result v5

    if-nez v5, :cond_8f

    .line 915
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 916
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v5

    invoke-virtual {v5}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x5

    new-array v6, v6, [Ljava/lang/String;

    const-string v7, "table"

    aput-object v7, v6, v3

    const-string v7, "tbody"

    aput-object v7, v6, v4

    const/4 v7, 0x2

    const-string v8, "tfoot"

    aput-object v8, v6, v7

    const/4 v7, 0x3

    const-string v8, "thead"

    aput-object v8, v6, v7

    const/4 v7, 0x4

    const-string v8, "tr"

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_89

    .line 917
    invoke-virtual {p2, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->setFosterInserts(Z)V

    .line 918
    sget-object v5, Lorg/jsoup/parser/HtmlTreeBuilderState$10;->InBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v1, v5}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilderState;)Z

    .line 919
    invoke-virtual {p2, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->setFosterInserts(Z)V

    goto :goto_21

    .line 902
    .end local v1    # "character":Lorg/jsoup/parser/Token$Character;
    .end local v2    # "i$":Ljava/util/Iterator;
    :pswitch_6a
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asCharacter()Lorg/jsoup/parser/Token$Character;

    move-result-object v0

    .line 903
    .local v0, "c":Lorg/jsoup/parser/Token$Character;
    invoke-virtual {v0}, Lorg/jsoup/parser/Token$Character;->getData()Ljava/lang/String;

    move-result-object v5

    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState;->nullString:Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState;->access$400()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_80

    .line 904
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 931
    .end local v0    # "c":Lorg/jsoup/parser/Token$Character;
    :goto_7f
    return v3

    .line 907
    .restart local v0    # "c":Lorg/jsoup/parser/Token$Character;
    :cond_80
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getPendingTableCharacters()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v3, v4

    .line 931
    goto :goto_7f

    .line 921
    .end local v0    # "c":Lorg/jsoup/parser/Token$Character;
    .restart local v1    # "character":Lorg/jsoup/parser/Token$Character;
    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_89
    sget-object v5, Lorg/jsoup/parser/HtmlTreeBuilderState$10;->InBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v1, v5}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilderState;)Z

    goto :goto_21

    .line 924
    :cond_8f
    invoke-virtual {p2, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$Character;)V

    goto :goto_21

    .line 926
    .end local v1    # "character":Lorg/jsoup/parser/Token$Character;
    :cond_93
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->newPendingTableCharacters()V

    .line 928
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_96
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->originalState()Lorg/jsoup/parser/HtmlTreeBuilderState;

    move-result-object v3

    invoke-virtual {p2, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 929
    invoke-virtual {p2, p1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v3

    goto :goto_7f

    .line 900
    :pswitch_data_a2
    .packed-switch 0x5
        :pswitch_6a
    .end packed-switch
.end method

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
    .line 894
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

    .line 896
    sget-object v5, Lorg/jsoup/parser/HtmlTreeBuilderState$24;->$SwitchMap$org$jsoup$parser$Token$TokenType:[I

    iget-object v6, p1, Lorg/jsoup/parser/Token;->type:Lorg/jsoup/parser/Token$TokenType;

    invoke-virtual {v6}, Lorg/jsoup/parser/Token$TokenType;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_c4

    .line 908
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getPendingTableCharacters()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_b7

    .line 909
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getPendingTableCharacters()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_21
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_b4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 910
    .local v1, "character":Ljava/lang/String;
    # invokes: Lorg/jsoup/parser/HtmlTreeBuilderState;->isWhitespace(Ljava/lang/String;)Z
    invoke-static {v1}, Lorg/jsoup/parser/HtmlTreeBuilderState;->access$2200(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_a6

    .line 912
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 913
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

    if-eqz v5, :cond_96

    .line 914
    invoke-virtual {p2, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->setFosterInserts(Z)V

    .line 915
    new-instance v5, Lorg/jsoup/parser/Token$Character;

    invoke-direct {v5}, Lorg/jsoup/parser/Token$Character;-><init>()V

    invoke-virtual {v5, v1}, Lorg/jsoup/parser/Token$Character;->data(Ljava/lang/String;)Lorg/jsoup/parser/Token$Character;

    move-result-object v5

    sget-object v6, Lorg/jsoup/parser/HtmlTreeBuilderState$10;->InBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v5, v6}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilderState;)Z

    .line 916
    invoke-virtual {p2, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->setFosterInserts(Z)V

    goto :goto_21

    .line 898
    .end local v1    # "character":Ljava/lang/String;
    .end local v2    # "i$":Ljava/util/Iterator;
    :pswitch_73
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asCharacter()Lorg/jsoup/parser/Token$Character;

    move-result-object v0

    .line 899
    .local v0, "c":Lorg/jsoup/parser/Token$Character;
    invoke-virtual {v0}, Lorg/jsoup/parser/Token$Character;->getData()Ljava/lang/String;

    move-result-object v5

    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState;->nullString:Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState;->access$400()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_89

    .line 900
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 928
    .end local v0    # "c":Lorg/jsoup/parser/Token$Character;
    :goto_88
    return v3

    .line 903
    .restart local v0    # "c":Lorg/jsoup/parser/Token$Character;
    :cond_89
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getPendingTableCharacters()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v0}, Lorg/jsoup/parser/Token$Character;->getData()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v3, v4

    .line 928
    goto :goto_88

    .line 918
    .end local v0    # "c":Lorg/jsoup/parser/Token$Character;
    .restart local v1    # "character":Ljava/lang/String;
    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_96
    new-instance v5, Lorg/jsoup/parser/Token$Character;

    invoke-direct {v5}, Lorg/jsoup/parser/Token$Character;-><init>()V

    invoke-virtual {v5, v1}, Lorg/jsoup/parser/Token$Character;->data(Ljava/lang/String;)Lorg/jsoup/parser/Token$Character;

    move-result-object v5

    sget-object v6, Lorg/jsoup/parser/HtmlTreeBuilderState$10;->InBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v5, v6}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilderState;)Z

    goto/16 :goto_21

    .line 921
    :cond_a6
    new-instance v5, Lorg/jsoup/parser/Token$Character;

    invoke-direct {v5}, Lorg/jsoup/parser/Token$Character;-><init>()V

    invoke-virtual {v5, v1}, Lorg/jsoup/parser/Token$Character;->data(Ljava/lang/String;)Lorg/jsoup/parser/Token$Character;

    move-result-object v5

    invoke-virtual {p2, v5}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$Character;)V

    goto/16 :goto_21

    .line 923
    .end local v1    # "character":Ljava/lang/String;
    :cond_b4
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->newPendingTableCharacters()V

    .line 925
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_b7
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->originalState()Lorg/jsoup/parser/HtmlTreeBuilderState;

    move-result-object v3

    invoke-virtual {p2, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 926
    invoke-virtual {p2, p1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v3

    goto :goto_88

    .line 896
    nop

    :pswitch_data_c4
    .packed-switch 0x5
        :pswitch_73
    .end packed-switch
.end method

.class final enum Lorg/jsoup/parser/HtmlTreeBuilderState$19;
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
    .line 1337
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/jsoup/parser/HtmlTreeBuilderState;-><init>(Ljava/lang/String;ILorg/jsoup/parser/HtmlTreeBuilderState$1;)V

    return-void
.end method


# virtual methods
.method process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z
    .registers 9
    .param p1, "t"    # Lorg/jsoup/parser/Token;
    .param p2, "tb"    # Lorg/jsoup/parser/HtmlTreeBuilder;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1339
    # invokes: Lorg/jsoup/parser/HtmlTreeBuilderState;->isWhitespace(Lorg/jsoup/parser/Token;)Z
    invoke-static {p1}, Lorg/jsoup/parser/HtmlTreeBuilderState;->access$100(Lorg/jsoup/parser/Token;)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 1340
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asCharacter()Lorg/jsoup/parser/Token$Character;

    move-result-object v2

    invoke-virtual {p2, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$Character;)V

    :cond_f
    :goto_f
    move v2, v3

    .line 1380
    :goto_10
    return v2

    .line 1341
    :cond_11
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isComment()Z

    move-result v4

    if-eqz v4, :cond_1f

    .line 1342
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asComment()Lorg/jsoup/parser/Token$Comment;

    move-result-object v2

    invoke-virtual {p2, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$Comment;)V

    goto :goto_f

    .line 1343
    :cond_1f
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isDoctype()Z

    move-result v4

    if-eqz v4, :cond_29

    .line 1344
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto :goto_10

    .line 1346
    :cond_29
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isStartTag()Z

    move-result v4

    if-eqz v4, :cond_71

    .line 1347
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asStartTag()Lorg/jsoup/parser/Token$StartTag;

    move-result-object v1

    .line 1348
    .local v1, "start":Lorg/jsoup/parser/Token$StartTag;
    invoke-virtual {v1}, Lorg/jsoup/parser/Token$StartTag;->name()Ljava/lang/String;

    move-result-object v0

    .line 1349
    .local v0, "name":Ljava/lang/String;
    const-string v4, "html"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_46

    .line 1350
    sget-object v2, Lorg/jsoup/parser/HtmlTreeBuilderState$19;->InBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v1, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilderState;)Z

    move-result v2

    goto :goto_10

    .line 1351
    :cond_46
    const-string v4, "frameset"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_52

    .line 1352
    invoke-virtual {p2, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto :goto_f

    .line 1353
    :cond_52
    const-string v4, "frame"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5e

    .line 1354
    invoke-virtual {p2, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertEmpty(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto :goto_f

    .line 1355
    :cond_5e
    const-string v3, "noframes"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6d

    .line 1356
    sget-object v2, Lorg/jsoup/parser/HtmlTreeBuilderState$19;->InHead:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v1, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilderState;)Z

    move-result v2

    goto :goto_10

    .line 1358
    :cond_6d
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto :goto_10

    .line 1361
    .end local v0    # "name":Ljava/lang/String;
    .end local v1    # "start":Lorg/jsoup/parser/Token$StartTag;
    :cond_71
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isEndTag()Z

    move-result v4

    if-eqz v4, :cond_bc

    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asEndTag()Lorg/jsoup/parser/Token$EndTag;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jsoup/parser/Token$EndTag;->name()Ljava/lang/String;

    move-result-object v4

    const-string v5, "frameset"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_bc

    .line 1362
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "html"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9c

    .line 1363
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_10

    .line 1366
    :cond_9c
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->pop()Lorg/jsoup/nodes/Element;

    .line 1367
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->isFragmentParsing()Z

    move-result v2

    if-nez v2, :cond_f

    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v2

    const-string v4, "frameset"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_f

    .line 1368
    sget-object v2, Lorg/jsoup/parser/HtmlTreeBuilderState$19;->AfterFrameset:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_f

    .line 1371
    :cond_bc
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isEOF()Z

    move-result v4

    if-eqz v4, :cond_d8

    .line 1372
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v2

    const-string v4, "html"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_f

    .line 1373
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    move v2, v3

    .line 1374
    goto/16 :goto_10

    .line 1377
    :cond_d8
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_10
.end method

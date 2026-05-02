.class public Lorg/jsoup/examples/HtmlToPlainText;
.super Ljava/lang/Object;
.source "HtmlToPlainText.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jsoup/examples/HtmlToPlainText$1;,
        Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;
    }
.end annotation


# static fields
.field private static final timeout:I = 0x1388

.field private static final userAgent:Ljava/lang/String; = "Mozilla/5.0 (jsoup)"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    return-void
.end method

.method public static varargs main([Ljava/lang/String;)V
    .registers 14
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x2

    const/4 v9, 0x0

    const/4 v10, 0x1

    .line 35
    array-length v8, p0

    if-eq v8, v10, :cond_9

    array-length v8, p0

    if-ne v8, v12, :cond_4f

    :cond_9
    move v8, v10

    :goto_a
    const-string v11, "usage: java -cp jsoup.jar org.jsoup.examples.HtmlToPlainText url [selector]"

    invoke-static {v8, v11}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 36
    aget-object v7, p0, v9

    .line 37
    .local v7, "url":Ljava/lang/String;
    array-length v8, p0

    if-ne v8, v12, :cond_51

    aget-object v6, p0, v10

    .line 40
    .local v6, "selector":Ljava/lang/String;
    :goto_16
    invoke-static {v7}, Lorg/jsoup/Jsoup;->connect(Ljava/lang/String;)Lorg/jsoup/Connection;

    move-result-object v8

    const-string v9, "Mozilla/5.0 (jsoup)"

    invoke-interface {v8, v9}, Lorg/jsoup/Connection;->userAgent(Ljava/lang/String;)Lorg/jsoup/Connection;

    move-result-object v8

    const/16 v9, 0x1388

    invoke-interface {v8, v9}, Lorg/jsoup/Connection;->timeout(I)Lorg/jsoup/Connection;

    move-result-object v8

    invoke-interface {v8}, Lorg/jsoup/Connection;->get()Lorg/jsoup/nodes/Document;

    move-result-object v0

    .line 42
    .local v0, "doc":Lorg/jsoup/nodes/Document;
    new-instance v3, Lorg/jsoup/examples/HtmlToPlainText;

    invoke-direct {v3}, Lorg/jsoup/examples/HtmlToPlainText;-><init>()V

    .line 44
    .local v3, "formatter":Lorg/jsoup/examples/HtmlToPlainText;
    if-eqz v6, :cond_53

    .line 45
    invoke-virtual {v0, v6}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v2

    .line 46
    .local v2, "elements":Lorg/jsoup/select/Elements;
    invoke-virtual {v2}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_39
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_5c

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    .line 47
    .local v1, "element":Lorg/jsoup/nodes/Element;
    invoke-virtual {v3, v1}, Lorg/jsoup/examples/HtmlToPlainText;->getPlainText(Lorg/jsoup/nodes/Element;)Ljava/lang/String;

    move-result-object v5

    .line 48
    .local v5, "plainText":Ljava/lang/String;
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v8, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_39

    .end local v0    # "doc":Lorg/jsoup/nodes/Document;
    .end local v1    # "element":Lorg/jsoup/nodes/Element;
    .end local v2    # "elements":Lorg/jsoup/select/Elements;
    .end local v3    # "formatter":Lorg/jsoup/examples/HtmlToPlainText;
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v5    # "plainText":Ljava/lang/String;
    .end local v6    # "selector":Ljava/lang/String;
    .end local v7    # "url":Ljava/lang/String;
    :cond_4f
    move v8, v9

    .line 35
    goto :goto_a

    .line 37
    .restart local v7    # "url":Ljava/lang/String;
    :cond_51
    const/4 v6, 0x0

    goto :goto_16

    .line 51
    .restart local v0    # "doc":Lorg/jsoup/nodes/Document;
    .restart local v3    # "formatter":Lorg/jsoup/examples/HtmlToPlainText;
    .restart local v6    # "selector":Ljava/lang/String;
    :cond_53
    invoke-virtual {v3, v0}, Lorg/jsoup/examples/HtmlToPlainText;->getPlainText(Lorg/jsoup/nodes/Element;)Ljava/lang/String;

    move-result-object v5

    .line 52
    .restart local v5    # "plainText":Ljava/lang/String;
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v8, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 54
    .end local v5    # "plainText":Ljava/lang/String;
    :cond_5c
    return-void
.end method


# virtual methods
.method public getPlainText(Lorg/jsoup/nodes/Element;)Ljava/lang/String;
    .registers 5
    .param p1, "element"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 62
    new-instance v0, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;-><init>(Lorg/jsoup/examples/HtmlToPlainText;Lorg/jsoup/examples/HtmlToPlainText$1;)V

    .line 63
    .local v0, "formatter":Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;
    new-instance v1, Lorg/jsoup/select/NodeTraversor;

    invoke-direct {v1, v0}, Lorg/jsoup/select/NodeTraversor;-><init>(Lorg/jsoup/select/NodeVisitor;)V

    .line 64
    .local v1, "traversor":Lorg/jsoup/select/NodeTraversor;
    invoke-virtual {v1, p1}, Lorg/jsoup/select/NodeTraversor;->traverse(Lorg/jsoup/nodes/Node;)V

    .line 66
    invoke-virtual {v0}, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

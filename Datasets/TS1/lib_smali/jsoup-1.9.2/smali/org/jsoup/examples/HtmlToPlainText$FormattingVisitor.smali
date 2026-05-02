.class Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;
.super Ljava/lang/Object;
.source "HtmlToPlainText.java"

# interfaces
.implements Lorg/jsoup/select/NodeVisitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jsoup/examples/HtmlToPlainText;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FormattingVisitor"
.end annotation


# static fields
.field private static final maxWidth:I = 0x50


# instance fields
.field private accum:Ljava/lang/StringBuilder;

.field final synthetic this$0:Lorg/jsoup/examples/HtmlToPlainText;

.field private width:I


# direct methods
.method private constructor <init>(Lorg/jsoup/examples/HtmlToPlainText;)V
    .registers 3

    .prologue
    .line 70
    iput-object p1, p0, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;->this$0:Lorg/jsoup/examples/HtmlToPlainText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    const/4 v0, 0x0

    iput v0, p0, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;->width:I

    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;->accum:Ljava/lang/StringBuilder;

    return-void
.end method

.method synthetic constructor <init>(Lorg/jsoup/examples/HtmlToPlainText;Lorg/jsoup/examples/HtmlToPlainText$1;)V
    .registers 3
    .param p1, "x0"    # Lorg/jsoup/examples/HtmlToPlainText;
    .param p2, "x1"    # Lorg/jsoup/examples/HtmlToPlainText$1;

    .prologue
    .line 70
    invoke-direct {p0, p1}, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;-><init>(Lorg/jsoup/examples/HtmlToPlainText;)V

    return-void
.end method

.method private append(Ljava/lang/String;)V
    .registers 12
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    const/16 v9, 0x50

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 99
    const-string v6, "\n"

    invoke-virtual {p1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_e

    .line 100
    iput v5, p0, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;->width:I

    .line 101
    :cond_e
    const-string v6, " "

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3e

    iget-object v6, p0, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;->accum:Ljava/lang/StringBuilder;

    .line 102
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-eqz v6, :cond_3d

    iget-object v6, p0, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;->accum:Ljava/lang/StringBuilder;

    iget-object v7, p0, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;->accum:Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->substring(I)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/String;

    const-string v8, " "

    aput-object v8, v7, v5

    const-string v8, "\n"

    aput-object v8, v7, v4

    invoke-static {v6, v7}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3e

    .line 124
    :cond_3d
    :goto_3d
    return-void

    .line 105
    :cond_3e
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    iget v7, p0, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;->width:I

    add-int/2addr v6, v7

    if-le v6, v9, :cond_9c

    .line 106
    const-string v6, "\\s+"

    invoke-virtual {p1, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 107
    .local v3, "words":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4e
    array-length v6, v3

    if-ge v0, v6, :cond_3d

    .line 108
    aget-object v2, v3, v0

    .line 109
    .local v2, "word":Ljava/lang/String;
    array-length v6, v3

    add-int/lit8 v6, v6, -0x1

    if-ne v0, v6, :cond_8b

    move v1, v4

    .line 110
    .local v1, "last":Z
    :goto_59
    if-nez v1, :cond_6e

    .line 111
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 112
    :cond_6e
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    iget v7, p0, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;->width:I

    add-int/2addr v6, v7

    if-le v6, v9, :cond_8d

    .line 113
    iget-object v6, p0, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;->accum:Ljava/lang/StringBuilder;

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    iput v6, p0, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;->width:I

    .line 107
    :goto_88
    add-int/lit8 v0, v0, 0x1

    goto :goto_4e

    .end local v1    # "last":Z
    :cond_8b
    move v1, v5

    .line 109
    goto :goto_59

    .line 116
    .restart local v1    # "last":Z
    :cond_8d
    iget-object v6, p0, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;->accum:Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    iget v6, p0, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;->width:I

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v7

    add-int/2addr v6, v7

    iput v6, p0, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;->width:I

    goto :goto_88

    .line 121
    .end local v0    # "i":I
    .end local v1    # "last":Z
    .end local v2    # "word":Ljava/lang/String;
    .end local v3    # "words":[Ljava/lang/String;
    :cond_9c
    iget-object v4, p0, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;->accum:Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    iget v4, p0, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;->width:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v4, v5

    iput v4, p0, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;->width:I

    goto :goto_3d
.end method


# virtual methods
.method public head(Lorg/jsoup/nodes/Node;I)V
    .registers 7
    .param p1, "node"    # Lorg/jsoup/nodes/Node;
    .param p2, "depth"    # I

    .prologue
    .line 77
    invoke-virtual {p1}, Lorg/jsoup/nodes/Node;->nodeName()Ljava/lang/String;

    move-result-object v0

    .line 78
    .local v0, "name":Ljava/lang/String;
    instance-of v1, p1, Lorg/jsoup/nodes/TextNode;

    if-eqz v1, :cond_12

    .line 79
    check-cast p1, Lorg/jsoup/nodes/TextNode;

    .end local p1    # "node":Lorg/jsoup/nodes/Node;
    invoke-virtual {p1}, Lorg/jsoup/nodes/TextNode;->text()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;->append(Ljava/lang/String;)V

    .line 86
    :cond_11
    :goto_11
    return-void

    .line 80
    .restart local p1    # "node":Lorg/jsoup/nodes/Node;
    :cond_12
    const-string v1, "li"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_20

    .line 81
    const-string v1, "\n * "

    invoke-direct {p0, v1}, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;->append(Ljava/lang/String;)V

    goto :goto_11

    .line 82
    :cond_20
    const-string v1, "dt"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2e

    .line 83
    const-string v1, "  "

    invoke-direct {p0, v1}, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;->append(Ljava/lang/String;)V

    goto :goto_11

    .line 84
    :cond_2e
    const/4 v1, 0x7

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "p"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "h1"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "h2"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "h3"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "h4"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "h5"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "tr"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 85
    const-string v1, "\n"

    invoke-direct {p0, v1}, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;->append(Ljava/lang/String;)V

    goto :goto_11
.end method

.method public tail(Lorg/jsoup/nodes/Node;I)V
    .registers 9
    .param p1, "node"    # Lorg/jsoup/nodes/Node;
    .param p2, "depth"    # I

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 90
    invoke-virtual {p1}, Lorg/jsoup/nodes/Node;->nodeName()Ljava/lang/String;

    move-result-object v0

    .line 91
    .local v0, "name":Ljava/lang/String;
    const/16 v1, 0x9

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "br"

    aput-object v2, v1, v4

    const-string v2, "dd"

    aput-object v2, v1, v5

    const/4 v2, 0x2

    const-string v3, "dt"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "p"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "h1"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "h2"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "h3"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "h4"

    aput-object v3, v1, v2

    const/16 v2, 0x8

    const-string v3, "h5"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_42

    .line 92
    const-string v1, "\n"

    invoke-direct {p0, v1}, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;->append(Ljava/lang/String;)V

    .line 95
    :cond_41
    :goto_41
    return-void

    .line 93
    :cond_42
    const-string v1, "a"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_41

    .line 94
    const-string v1, " <%s>"

    new-array v2, v5, [Ljava/lang/Object;

    const-string v3, "href"

    invoke-virtual {p1, v3}, Lorg/jsoup/nodes/Node;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;->append(Ljava/lang/String;)V

    goto :goto_41
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 128
    iget-object v0, p0, Lorg/jsoup/examples/HtmlToPlainText$FormattingVisitor;->accum:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

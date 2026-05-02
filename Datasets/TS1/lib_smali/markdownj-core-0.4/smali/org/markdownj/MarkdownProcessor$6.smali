.class Lorg/markdownj/MarkdownProcessor$6;
.super Ljava/lang/Object;
.source "MarkdownProcessor.java"

# interfaces
.implements Lorg/markdownj/Replacement;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/markdownj/MarkdownProcessor;->doLists(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/markdownj/MarkdownProcessor;


# direct methods
.method constructor <init>(Lorg/markdownj/MarkdownProcessor;)V
    .registers 2

    .prologue
    .line 459
    iput-object p1, p0, Lorg/markdownj/MarkdownProcessor$6;->this$0:Lorg/markdownj/MarkdownProcessor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public replacement(Ljava/util/regex/Matcher;)Ljava/lang/String;
    .registers 10
    .param p1, "m"    # Ljava/util/regex/Matcher;

    .prologue
    .line 461
    const/4 v5, 0x1

    invoke-virtual {p1, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    .line 462
    .local v1, "list":Ljava/lang/String;
    const/4 v5, 0x3

    invoke-virtual {p1, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 465
    .local v2, "listStart":Ljava/lang/String;
    const-string v5, "[*+-]"

    invoke-virtual {v2, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4e

    .line 466
    const-string v3, "ul"

    .line 473
    .local v3, "listType":Ljava/lang/String;
    :goto_14
    iget-object v5, p0, Lorg/markdownj/MarkdownProcessor$6;->this$0:Lorg/markdownj/MarkdownProcessor;

    const-string v6, "\\n{2,}"

    const-string v7, "\n\n\n"

    # invokes: Lorg/markdownj/MarkdownProcessor;->replaceAll(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v5, v1, v6, v7}, Lorg/markdownj/MarkdownProcessor;->access$100(Lorg/markdownj/MarkdownProcessor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 475
    iget-object v5, p0, Lorg/markdownj/MarkdownProcessor$6;->this$0:Lorg/markdownj/MarkdownProcessor;

    # invokes: Lorg/markdownj/MarkdownProcessor;->processListItems(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v5, v1}, Lorg/markdownj/MarkdownProcessor;->access$800(Lorg/markdownj/MarkdownProcessor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 481
    .local v4, "result":Ljava/lang/String;
    const-string v5, "\\s+$"

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 484
    const-string v5, "ul"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_51

    .line 485
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "<ul>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "</ul>\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 489
    .local v0, "html":Ljava/lang/String;
    :goto_4d
    return-object v0

    .line 468
    .end local v0    # "html":Ljava/lang/String;
    .end local v3    # "listType":Ljava/lang/String;
    .end local v4    # "result":Ljava/lang/String;
    :cond_4e
    const-string v3, "ol"

    .restart local v3    # "listType":Ljava/lang/String;
    goto :goto_14

    .line 487
    .restart local v4    # "result":Ljava/lang/String;
    :cond_51
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "<ol>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "</ol>\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "html":Ljava/lang/String;
    goto :goto_4d
.end method

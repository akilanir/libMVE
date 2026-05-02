.class Lorg/markdownj/MarkdownProcessor$8;
.super Ljava/lang/Object;
.source "MarkdownProcessor.java"

# interfaces
.implements Lorg/markdownj/Replacement;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/markdownj/MarkdownProcessor;->processListItems(Ljava/lang/String;)Ljava/lang/String;
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
    .line 561
    iput-object p1, p0, Lorg/markdownj/MarkdownProcessor$8;->this$0:Lorg/markdownj/MarkdownProcessor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public replacement(Ljava/util/regex/Matcher;)Ljava/lang/String;
    .registers 7
    .param p1, "m"    # Ljava/util/regex/Matcher;

    .prologue
    .line 563
    const/4 v3, 0x4

    invoke-virtual {p1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 564
    .local v2, "text":Ljava/lang/String;
    new-instance v0, Lorg/markdownj/TextEditor;

    invoke-direct {v0, v2}, Lorg/markdownj/TextEditor;-><init>(Ljava/lang/CharSequence;)V

    .line 565
    .local v0, "item":Lorg/markdownj/TextEditor;
    const/4 v3, 0x1

    invoke-virtual {p1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    .line 566
    .local v1, "leadingLine":Ljava/lang/String;
    iget-object v3, p0, Lorg/markdownj/MarkdownProcessor$8;->this$0:Lorg/markdownj/MarkdownProcessor;

    # invokes: Lorg/markdownj/MarkdownProcessor;->isEmptyString(Ljava/lang/String;)Z
    invoke-static {v3, v1}, Lorg/markdownj/MarkdownProcessor;->access$900(Lorg/markdownj/MarkdownProcessor;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1f

    iget-object v3, p0, Lorg/markdownj/MarkdownProcessor$8;->this$0:Lorg/markdownj/MarkdownProcessor;

    # invokes: Lorg/markdownj/MarkdownProcessor;->hasParagraphBreak(Lorg/markdownj/TextEditor;)Z
    invoke-static {v3, v0}, Lorg/markdownj/MarkdownProcessor;->access$1000(Lorg/markdownj/MarkdownProcessor;Lorg/markdownj/TextEditor;)Z

    move-result v3

    if-eqz v3, :cond_4b

    .line 567
    :cond_1f
    iget-object v3, p0, Lorg/markdownj/MarkdownProcessor$8;->this$0:Lorg/markdownj/MarkdownProcessor;

    invoke-virtual {v0}, Lorg/markdownj/TextEditor;->outdent()Lorg/markdownj/TextEditor;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/markdownj/MarkdownProcessor;->runBlockGamut(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;

    move-result-object v0

    .line 573
    :goto_29
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "<li>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lorg/markdownj/TextEditor;->trim()Lorg/markdownj/TextEditor;

    move-result-object v4

    invoke-virtual {v4}, Lorg/markdownj/TextEditor;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</li>\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 570
    :cond_4b
    iget-object v3, p0, Lorg/markdownj/MarkdownProcessor$8;->this$0:Lorg/markdownj/MarkdownProcessor;

    invoke-virtual {v0}, Lorg/markdownj/TextEditor;->outdent()Lorg/markdownj/TextEditor;

    move-result-object v4

    # invokes: Lorg/markdownj/MarkdownProcessor;->doLists(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;
    invoke-static {v3, v4}, Lorg/markdownj/MarkdownProcessor;->access$1100(Lorg/markdownj/MarkdownProcessor;Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;

    move-result-object v0

    .line 571
    iget-object v3, p0, Lorg/markdownj/MarkdownProcessor$8;->this$0:Lorg/markdownj/MarkdownProcessor;

    invoke-virtual {v3, v0}, Lorg/markdownj/MarkdownProcessor;->runSpanGamut(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;

    move-result-object v0

    goto :goto_29
.end method

.class Lorg/markdownj/MarkdownProcessor$3;
.super Ljava/lang/Object;
.source "MarkdownProcessor.java"

# interfaces
.implements Lorg/markdownj/Replacement;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/markdownj/MarkdownProcessor;->doAutoLinks(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;
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
    .line 285
    iput-object p1, p0, Lorg/markdownj/MarkdownProcessor$3;->this$0:Lorg/markdownj/MarkdownProcessor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public replacement(Ljava/util/regex/Matcher;)Ljava/lang/String;
    .registers 9
    .param p1, "m"    # Ljava/util/regex/Matcher;

    .prologue
    .line 287
    const/4 v4, 0x1

    invoke-virtual {p1, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    .line 288
    .local v1, "address":Ljava/lang/String;
    new-instance v2, Lorg/markdownj/TextEditor;

    invoke-direct {v2, v1}, Lorg/markdownj/TextEditor;-><init>(Ljava/lang/CharSequence;)V

    .line 289
    .local v2, "ed":Lorg/markdownj/TextEditor;
    iget-object v4, p0, Lorg/markdownj/MarkdownProcessor$3;->this$0:Lorg/markdownj/MarkdownProcessor;

    # invokes: Lorg/markdownj/MarkdownProcessor;->unEscapeSpecialChars(Lorg/markdownj/TextEditor;)V
    invoke-static {v4, v2}, Lorg/markdownj/MarkdownProcessor;->access$400(Lorg/markdownj/MarkdownProcessor;Lorg/markdownj/TextEditor;)V

    .line 290
    iget-object v4, p0, Lorg/markdownj/MarkdownProcessor$3;->this$0:Lorg/markdownj/MarkdownProcessor;

    invoke-virtual {v2}, Lorg/markdownj/TextEditor;->toString()Ljava/lang/String;

    move-result-object v5

    # invokes: Lorg/markdownj/MarkdownProcessor;->encodeEmail(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v4, v5}, Lorg/markdownj/MarkdownProcessor;->access$500(Lorg/markdownj/MarkdownProcessor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 291
    .local v0, "addr":Ljava/lang/String;
    iget-object v4, p0, Lorg/markdownj/MarkdownProcessor$3;->this$0:Lorg/markdownj/MarkdownProcessor;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mailto:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Lorg/markdownj/TextEditor;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    # invokes: Lorg/markdownj/MarkdownProcessor;->encodeEmail(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v4, v5}, Lorg/markdownj/MarkdownProcessor;->access$500(Lorg/markdownj/MarkdownProcessor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 292
    .local v3, "url":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "<a href=\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\">"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "</a>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

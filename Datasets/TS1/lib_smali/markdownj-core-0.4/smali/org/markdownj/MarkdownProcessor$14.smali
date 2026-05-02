.class Lorg/markdownj/MarkdownProcessor$14;
.super Ljava/lang/Object;
.source "MarkdownProcessor.java"

# interfaces
.implements Lorg/markdownj/Replacement;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/markdownj/MarkdownProcessor;->doCodeSpans(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;
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
    .line 849
    iput-object p1, p0, Lorg/markdownj/MarkdownProcessor$14;->this$0:Lorg/markdownj/MarkdownProcessor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public replacement(Ljava/util/regex/Matcher;)Ljava/lang/String;
    .registers 6
    .param p1, "m"    # Ljava/util/regex/Matcher;

    .prologue
    .line 851
    const/4 v2, 0x2

    invoke-virtual {p1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    .line 852
    .local v0, "code":Ljava/lang/String;
    new-instance v1, Lorg/markdownj/TextEditor;

    invoke-direct {v1, v0}, Lorg/markdownj/TextEditor;-><init>(Ljava/lang/CharSequence;)V

    .line 853
    .local v1, "subEditor":Lorg/markdownj/TextEditor;
    const-string v2, "^[ \\t]+"

    invoke-virtual {v1, v2}, Lorg/markdownj/TextEditor;->deleteAll(Ljava/lang/String;)Lorg/markdownj/TextEditor;

    move-result-object v2

    const-string v3, "[ \\t]+$"

    invoke-virtual {v2, v3}, Lorg/markdownj/TextEditor;->deleteAll(Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 854
    iget-object v2, p0, Lorg/markdownj/MarkdownProcessor$14;->this$0:Lorg/markdownj/MarkdownProcessor;

    # invokes: Lorg/markdownj/MarkdownProcessor;->encodeCode(Lorg/markdownj/TextEditor;)V
    invoke-static {v2, v1}, Lorg/markdownj/MarkdownProcessor;->access$700(Lorg/markdownj/MarkdownProcessor;Lorg/markdownj/TextEditor;)V

    .line 855
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "<code>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Lorg/markdownj/TextEditor;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</code>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

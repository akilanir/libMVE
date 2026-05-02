.class Lorg/markdownj/MarkdownProcessor$4;
.super Ljava/lang/Object;
.source "MarkdownProcessor.java"

# interfaces
.implements Lorg/markdownj/Replacement;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/markdownj/MarkdownProcessor;->doBlockQuotes(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;
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
    .line 334
    iput-object p1, p0, Lorg/markdownj/MarkdownProcessor$4;->this$0:Lorg/markdownj/MarkdownProcessor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public replacement(Ljava/util/regex/Matcher;)Ljava/lang/String;
    .registers 6
    .param p1, "m"    # Ljava/util/regex/Matcher;

    .prologue
    .line 336
    new-instance v0, Lorg/markdownj/TextEditor;

    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lorg/markdownj/TextEditor;-><init>(Ljava/lang/CharSequence;)V

    .line 337
    .local v0, "blockQuote":Lorg/markdownj/TextEditor;
    const-string v2, "^[ \t]*>[ \t]?"

    invoke-virtual {v0, v2}, Lorg/markdownj/TextEditor;->deleteAll(Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 338
    const-string v2, "^[ \t]+$"

    invoke-virtual {v0, v2}, Lorg/markdownj/TextEditor;->deleteAll(Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 339
    iget-object v2, p0, Lorg/markdownj/MarkdownProcessor$4;->this$0:Lorg/markdownj/MarkdownProcessor;

    invoke-virtual {v2, v0}, Lorg/markdownj/MarkdownProcessor;->runBlockGamut(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;

    move-result-object v0

    .line 340
    const-string v2, "^"

    const-string v3, "  "

    invoke-virtual {v0, v2, v3}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;

    .line 343
    const-string v2, "(\\s*<pre>.*?</pre>)"

    const/16 v3, 0x20

    invoke-static {v2, v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v1

    .line 344
    .local v1, "p1":Ljava/util/regex/Pattern;
    new-instance v2, Lorg/markdownj/MarkdownProcessor$4$1;

    invoke-direct {v2, p0}, Lorg/markdownj/MarkdownProcessor$4$1;-><init>(Lorg/markdownj/MarkdownProcessor$4;)V

    invoke-virtual {v0, v1, v2}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/util/regex/Pattern;Lorg/markdownj/Replacement;)Lorg/markdownj/TextEditor;

    move-result-object v0

    .line 350
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "<blockquote>\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n</blockquote>\n\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

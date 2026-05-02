.class Lorg/markdownj/MarkdownProcessor$1;
.super Ljava/lang/Object;
.source "MarkdownProcessor.java"

# interfaces
.implements Lorg/markdownj/Replacement;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/markdownj/MarkdownProcessor;->stripLinkDefinitions(Lorg/markdownj/TextEditor;)V
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
    .line 131
    iput-object p1, p0, Lorg/markdownj/MarkdownProcessor$1;->this$0:Lorg/markdownj/MarkdownProcessor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public replacement(Ljava/util/regex/Matcher;)Ljava/lang/String;
    .registers 8
    .param p1, "m"    # Ljava/util/regex/Matcher;

    .prologue
    .line 133
    const/4 v3, 0x1

    invoke-virtual {p1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 134
    .local v0, "id":Ljava/lang/String;
    iget-object v3, p0, Lorg/markdownj/MarkdownProcessor$1;->this$0:Lorg/markdownj/MarkdownProcessor;

    new-instance v4, Lorg/markdownj/TextEditor;

    const/4 v5, 0x2

    invoke-virtual {p1, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/markdownj/TextEditor;-><init>(Ljava/lang/CharSequence;)V

    # invokes: Lorg/markdownj/MarkdownProcessor;->encodeAmpsAndAngles(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;
    invoke-static {v3, v4}, Lorg/markdownj/MarkdownProcessor;->access$000(Lorg/markdownj/MarkdownProcessor;Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;

    move-result-object v3

    invoke-virtual {v3}, Lorg/markdownj/TextEditor;->toString()Ljava/lang/String;

    move-result-object v2

    .line 135
    .local v2, "url":Ljava/lang/String;
    const/4 v3, 0x3

    invoke-virtual {p1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    .line 137
    .local v1, "title":Ljava/lang/String;
    if-nez v1, :cond_26

    .line 138
    const-string v1, ""

    .line 140
    :cond_26
    iget-object v3, p0, Lorg/markdownj/MarkdownProcessor$1;->this$0:Lorg/markdownj/MarkdownProcessor;

    const-string v4, "\""

    const-string v5, "&quot;"

    # invokes: Lorg/markdownj/MarkdownProcessor;->replaceAll(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v3, v1, v4, v5}, Lorg/markdownj/MarkdownProcessor;->access$100(Lorg/markdownj/MarkdownProcessor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 141
    iget-object v3, p0, Lorg/markdownj/MarkdownProcessor$1;->this$0:Lorg/markdownj/MarkdownProcessor;

    # getter for: Lorg/markdownj/MarkdownProcessor;->linkDefinitions:Ljava/util/Map;
    invoke-static {v3}, Lorg/markdownj/MarkdownProcessor;->access$200(Lorg/markdownj/MarkdownProcessor;)Ljava/util/Map;

    move-result-object v3

    new-instance v4, Lorg/markdownj/LinkDefinition;

    invoke-direct {v4, v2, v1}, Lorg/markdownj/LinkDefinition;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    const-string v3, ""

    return-object v3
.end method

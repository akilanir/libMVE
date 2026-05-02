.class Lorg/markdownj/MarkdownProcessor$12;
.super Ljava/lang/Object;
.source "MarkdownProcessor.java"

# interfaces
.implements Lorg/markdownj/Replacement;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/markdownj/MarkdownProcessor;->doAnchors(Lorg/markdownj/TextEditor;)Lorg/markdownj/TextEditor;
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
    .line 768
    iput-object p1, p0, Lorg/markdownj/MarkdownProcessor$12;->this$0:Lorg/markdownj/MarkdownProcessor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public replacement(Ljava/util/regex/Matcher;)Ljava/lang/String;
    .registers 9
    .param p1, "m"    # Ljava/util/regex/Matcher;

    .prologue
    .line 770
    const/4 v4, 0x2

    invoke-virtual {p1, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    .line 771
    .local v0, "linkText":Ljava/lang/String;
    const/4 v4, 0x3

    invoke-virtual {p1, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    .line 772
    .local v3, "url":Ljava/lang/String;
    const/4 v4, 0x6

    invoke-virtual {p1, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 774
    .local v2, "title":Ljava/lang/String;
    const-string v4, "\\*"

    # getter for: Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;
    invoke-static {}, Lorg/markdownj/MarkdownProcessor;->access$1200()Lorg/markdownj/CharacterProtector;

    move-result-object v5

    const-string v6, "*"

    invoke-virtual {v5, v6}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 775
    const-string v4, "_"

    # getter for: Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;
    invoke-static {}, Lorg/markdownj/MarkdownProcessor;->access$1200()Lorg/markdownj/CharacterProtector;

    move-result-object v5

    const-string v6, "_"

    invoke-virtual {v5, v6}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 776
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 777
    .local v1, "result":Ljava/lang/StringBuilder;
    const-string v4, "<a href=\""

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 778
    if-eqz v2, :cond_7c

    .line 780
    const-string v4, "\\*"

    # getter for: Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;
    invoke-static {}, Lorg/markdownj/MarkdownProcessor;->access$1200()Lorg/markdownj/CharacterProtector;

    move-result-object v5

    const-string v6, "*"

    invoke-virtual {v5, v6}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 781
    const-string v4, "_"

    # getter for: Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;
    invoke-static {}, Lorg/markdownj/MarkdownProcessor;->access$1200()Lorg/markdownj/CharacterProtector;

    move-result-object v5

    const-string v6, "_"

    invoke-virtual {v5, v6}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 782
    iget-object v4, p0, Lorg/markdownj/MarkdownProcessor$12;->this$0:Lorg/markdownj/MarkdownProcessor;

    const-string v5, "\""

    const-string v6, "&quot;"

    # invokes: Lorg/markdownj/MarkdownProcessor;->replaceAll(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v4, v2, v5, v6}, Lorg/markdownj/MarkdownProcessor;->access$100(Lorg/markdownj/MarkdownProcessor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 783
    const-string v4, " title=\""

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 784
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 785
    const-string v4, "\""

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 787
    :cond_7c
    const-string v4, ">"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 788
    const-string v4, "</a>"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 789
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

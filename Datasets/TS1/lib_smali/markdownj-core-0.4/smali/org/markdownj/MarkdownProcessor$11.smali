.class Lorg/markdownj/MarkdownProcessor$11;
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
    .line 722
    iput-object p1, p0, Lorg/markdownj/MarkdownProcessor$11;->this$0:Lorg/markdownj/MarkdownProcessor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public replacement(Ljava/util/regex/Matcher;)Ljava/lang/String;
    .registers 13
    .param p1, "m"    # Ljava/util/regex/Matcher;

    .prologue
    .line 725
    const/4 v8, 0x1

    invoke-virtual {p1, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    .line 726
    .local v7, "wholeMatch":Ljava/lang/String;
    const/4 v8, 0x2

    invoke-virtual {p1, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 727
    .local v2, "linkText":Ljava/lang/String;
    const/4 v8, 0x3

    invoke-virtual {p1, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 728
    .local v1, "id":Ljava/lang/String;
    if-eqz v1, :cond_1d

    const-string v8, ""

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_21

    .line 729
    :cond_1d
    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 732
    :cond_21
    iget-object v8, p0, Lorg/markdownj/MarkdownProcessor$11;->this$0:Lorg/markdownj/MarkdownProcessor;

    # getter for: Lorg/markdownj/MarkdownProcessor;->linkDefinitions:Ljava/util/Map;
    invoke-static {v8}, Lorg/markdownj/MarkdownProcessor;->access$200(Lorg/markdownj/MarkdownProcessor;)Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/markdownj/LinkDefinition;

    .line 733
    .local v0, "defn":Lorg/markdownj/LinkDefinition;
    if-eqz v0, :cond_ca

    .line 734
    invoke-virtual {v0}, Lorg/markdownj/LinkDefinition;->getUrl()Ljava/lang/String;

    move-result-object v6

    .line 736
    .local v6, "url":Ljava/lang/String;
    const-string v8, "\\*"

    # getter for: Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;
    invoke-static {}, Lorg/markdownj/MarkdownProcessor;->access$1200()Lorg/markdownj/CharacterProtector;

    move-result-object v9

    const-string v10, "*"

    invoke-virtual {v9, v10}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 737
    const-string v8, "_"

    # getter for: Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;
    invoke-static {}, Lorg/markdownj/MarkdownProcessor;->access$1200()Lorg/markdownj/CharacterProtector;

    move-result-object v9

    const-string v10, "_"

    invoke-virtual {v9, v10}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 738
    invoke-virtual {v0}, Lorg/markdownj/LinkDefinition;->getTitle()Ljava/lang/String;

    move-result-object v4

    .line 739
    .local v4, "title":Ljava/lang/String;
    const-string v5, ""

    .line 740
    .local v5, "titleTag":Ljava/lang/String;
    if-eqz v4, :cond_9c

    const-string v8, ""

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_9c

    .line 742
    const-string v8, "\\*"

    # getter for: Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;
    invoke-static {}, Lorg/markdownj/MarkdownProcessor;->access$1200()Lorg/markdownj/CharacterProtector;

    move-result-object v9

    const-string v10, "*"

    invoke-virtual {v9, v10}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 743
    const-string v8, "_"

    # getter for: Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;
    invoke-static {}, Lorg/markdownj/MarkdownProcessor;->access$1200()Lorg/markdownj/CharacterProtector;

    move-result-object v9

    const-string v10, "_"

    invoke-virtual {v9, v10}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 744
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, " title=\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 746
    :cond_9c
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "<a href=\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ">"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "</a>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 750
    .end local v4    # "title":Ljava/lang/String;
    .end local v5    # "titleTag":Ljava/lang/String;
    .end local v6    # "url":Ljava/lang/String;
    .local v3, "replacementText":Ljava/lang/String;
    :goto_c9
    return-object v3

    .line 748
    .end local v3    # "replacementText":Ljava/lang/String;
    :cond_ca
    move-object v3, v7

    .restart local v3    # "replacementText":Ljava/lang/String;
    goto :goto_c9
.end method

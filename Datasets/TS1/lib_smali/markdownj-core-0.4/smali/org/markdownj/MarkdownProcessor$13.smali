.class Lorg/markdownj/MarkdownProcessor$13;
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
    .line 801
    iput-object p1, p0, Lorg/markdownj/MarkdownProcessor$13;->this$0:Lorg/markdownj/MarkdownProcessor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public replacement(Ljava/util/regex/Matcher;)Ljava/lang/String;
    .registers 13
    .param p1, "m"    # Ljava/util/regex/Matcher;

    .prologue
    const/4 v9, 0x2

    .line 804
    const/4 v8, 0x1

    invoke-virtual {p1, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    .line 805
    .local v7, "wholeMatch":Ljava/lang/String;
    invoke-virtual {p1, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 806
    .local v2, "linkText":Ljava/lang/String;
    invoke-virtual {p1, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 807
    .local v1, "id":Ljava/lang/String;
    const-string v8, "[ ]?\\n"

    const-string v9, " "

    invoke-virtual {v1, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 809
    iget-object v8, p0, Lorg/markdownj/MarkdownProcessor$13;->this$0:Lorg/markdownj/MarkdownProcessor;

    # getter for: Lorg/markdownj/MarkdownProcessor;->linkDefinitions:Ljava/util/Map;
    invoke-static {v8}, Lorg/markdownj/MarkdownProcessor;->access$200(Lorg/markdownj/MarkdownProcessor;)Ljava/util/Map;

    move-result-object v8

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/markdownj/LinkDefinition;

    .line 810
    .local v0, "defn":Lorg/markdownj/LinkDefinition;
    if-eqz v0, :cond_c7

    .line 811
    invoke-virtual {v0}, Lorg/markdownj/LinkDefinition;->getUrl()Ljava/lang/String;

    move-result-object v6

    .line 813
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

    .line 814
    const-string v8, "_"

    # getter for: Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;
    invoke-static {}, Lorg/markdownj/MarkdownProcessor;->access$1200()Lorg/markdownj/CharacterProtector;

    move-result-object v9

    const-string v10, "_"

    invoke-virtual {v9, v10}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 815
    invoke-virtual {v0}, Lorg/markdownj/LinkDefinition;->getTitle()Ljava/lang/String;

    move-result-object v4

    .line 816
    .local v4, "title":Ljava/lang/String;
    const-string v5, ""

    .line 817
    .local v5, "titleTag":Ljava/lang/String;
    if-eqz v4, :cond_99

    const-string v8, ""

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_99

    .line 819
    const-string v8, "\\*"

    # getter for: Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;
    invoke-static {}, Lorg/markdownj/MarkdownProcessor;->access$1200()Lorg/markdownj/CharacterProtector;

    move-result-object v9

    const-string v10, "*"

    invoke-virtual {v9, v10}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 820
    const-string v8, "_"

    # getter for: Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;
    invoke-static {}, Lorg/markdownj/MarkdownProcessor;->access$1200()Lorg/markdownj/CharacterProtector;

    move-result-object v9

    const-string v10, "_"

    invoke-virtual {v9, v10}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 821
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

    .line 823
    :cond_99
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

    .line 827
    .end local v4    # "title":Ljava/lang/String;
    .end local v5    # "titleTag":Ljava/lang/String;
    .end local v6    # "url":Ljava/lang/String;
    .local v3, "replacementText":Ljava/lang/String;
    :goto_c6
    return-object v3

    .line 825
    .end local v3    # "replacementText":Ljava/lang/String;
    :cond_c7
    move-object v3, v7

    .restart local v3    # "replacementText":Ljava/lang/String;
    goto :goto_c6
.end method

.class Lorg/markdownj/MarkdownProcessor$10;
.super Ljava/lang/Object;
.source "MarkdownProcessor.java"

# interfaces
.implements Lorg/markdownj/Replacement;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/markdownj/MarkdownProcessor;->doImages(Lorg/markdownj/TextEditor;)V
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
    .line 683
    iput-object p1, p0, Lorg/markdownj/MarkdownProcessor$10;->this$0:Lorg/markdownj/MarkdownProcessor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public replacement(Ljava/util/regex/Matcher;)Ljava/lang/String;
    .registers 13
    .param p1, "m"    # Ljava/util/regex/Matcher;

    .prologue
    .line 686
    const/4 v8, 0x1

    invoke-virtual {p1, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    .line 687
    .local v7, "wholeMatch":Ljava/lang/String;
    const/4 v8, 0x2

    invoke-virtual {p1, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    .line 688
    .local v0, "altText":Ljava/lang/String;
    const/4 v8, 0x3

    invoke-virtual {p1, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 689
    .local v2, "id":Ljava/lang/String;
    if-eqz v2, :cond_1d

    const-string v8, ""

    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_21

    .line 690
    :cond_1d
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 694
    :cond_21
    iget-object v8, p0, Lorg/markdownj/MarkdownProcessor$10;->this$0:Lorg/markdownj/MarkdownProcessor;

    # getter for: Lorg/markdownj/MarkdownProcessor;->linkDefinitions:Ljava/util/Map;
    invoke-static {v8}, Lorg/markdownj/MarkdownProcessor;->access$200(Lorg/markdownj/MarkdownProcessor;)Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/markdownj/LinkDefinition;

    .line 695
    .local v1, "defn":Lorg/markdownj/LinkDefinition;
    if-eqz v1, :cond_ca

    .line 696
    invoke-virtual {v1}, Lorg/markdownj/LinkDefinition;->getUrl()Ljava/lang/String;

    move-result-object v6

    .line 697
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

    .line 698
    const-string v8, "_"

    # getter for: Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;
    invoke-static {}, Lorg/markdownj/MarkdownProcessor;->access$1200()Lorg/markdownj/CharacterProtector;

    move-result-object v9

    const-string v10, "_"

    invoke-virtual {v9, v10}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 699
    invoke-virtual {v1}, Lorg/markdownj/LinkDefinition;->getTitle()Ljava/lang/String;

    move-result-object v4

    .line 700
    .local v4, "title":Ljava/lang/String;
    const-string v5, ""

    .line 701
    .local v5, "titleTag":Ljava/lang/String;
    if-eqz v4, :cond_a6

    const-string v8, ""

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_a6

    .line 702
    const-string v8, "\\*"

    # getter for: Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;
    invoke-static {}, Lorg/markdownj/MarkdownProcessor;->access$1200()Lorg/markdownj/CharacterProtector;

    move-result-object v9

    const-string v10, "*"

    invoke-virtual {v9, v10}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 703
    const-string v8, "_"

    # getter for: Lorg/markdownj/MarkdownProcessor;->CHAR_PROTECTOR:Lorg/markdownj/CharacterProtector;
    invoke-static {}, Lorg/markdownj/MarkdownProcessor;->access$1200()Lorg/markdownj/CharacterProtector;

    move-result-object v9

    const-string v10, "_"

    invoke-virtual {v9, v10}, Lorg/markdownj/CharacterProtector;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 704
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, " alt=\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\" title=\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 706
    :cond_a6
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "<img src=\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 710
    .end local v4    # "title":Ljava/lang/String;
    .end local v5    # "titleTag":Ljava/lang/String;
    .end local v6    # "url":Ljava/lang/String;
    .local v3, "replacementText":Ljava/lang/String;
    :goto_c9
    return-object v3

    .line 708
    .end local v3    # "replacementText":Ljava/lang/String;
    :cond_ca
    move-object v3, v7

    .restart local v3    # "replacementText":Ljava/lang/String;
    goto :goto_c9
.end method

.class public Lorg/markdownj/HTMLDecoder;
.super Ljava/lang/Object;
.source "HTMLDecoder.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static decode(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "html"    # Ljava/lang/String;

    .prologue
    .line 43
    new-instance v0, Lorg/markdownj/TextEditor;

    invoke-direct {v0, p0}, Lorg/markdownj/TextEditor;-><init>(Ljava/lang/CharSequence;)V

    .line 44
    .local v0, "ed":Lorg/markdownj/TextEditor;
    const-string v3, "&#(\\d+);"

    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    .line 45
    .local v1, "p1":Ljava/util/regex/Pattern;
    new-instance v3, Lorg/markdownj/HTMLDecoder$1;

    invoke-direct {v3}, Lorg/markdownj/HTMLDecoder$1;-><init>()V

    invoke-virtual {v0, v1, v3}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/util/regex/Pattern;Lorg/markdownj/Replacement;)Lorg/markdownj/TextEditor;

    .line 53
    const-string v3, "&#x([0-9a-fA-F]+);"

    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    .line 54
    .local v2, "p2":Ljava/util/regex/Pattern;
    new-instance v3, Lorg/markdownj/HTMLDecoder$2;

    invoke-direct {v3}, Lorg/markdownj/HTMLDecoder$2;-><init>()V

    invoke-virtual {v0, v2, v3}, Lorg/markdownj/TextEditor;->replaceAll(Ljava/util/regex/Pattern;Lorg/markdownj/Replacement;)Lorg/markdownj/TextEditor;

    .line 62
    invoke-virtual {v0}, Lorg/markdownj/TextEditor;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

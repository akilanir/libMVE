.class public Lcom/petebevin/markdown/MarkdownProcessor;
.super Lorg/markdownj/MarkdownProcessor;
.source "MarkdownProcessor.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 51
    invoke-direct {p0}, Lorg/markdownj/MarkdownProcessor;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 1
    .param p0, "args"    # [Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 72
    invoke-static {p0}, Lorg/markdownj/MarkdownProcessor;->main([Ljava/lang/String;)V

    .line 73
    return-void
.end method


# virtual methods
.method public markdown(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "txt"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 62
    invoke-super {p0, p1}, Lorg/markdownj/MarkdownProcessor;->markdown(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

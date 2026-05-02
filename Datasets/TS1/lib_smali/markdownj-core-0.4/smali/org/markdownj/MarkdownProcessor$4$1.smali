.class Lorg/markdownj/MarkdownProcessor$4$1;
.super Ljava/lang/Object;
.source "MarkdownProcessor.java"

# interfaces
.implements Lorg/markdownj/Replacement;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/markdownj/MarkdownProcessor$4;->replacement(Ljava/util/regex/Matcher;)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/markdownj/MarkdownProcessor$4;


# direct methods
.method constructor <init>(Lorg/markdownj/MarkdownProcessor$4;)V
    .registers 2

    .prologue
    .line 344
    iput-object p1, p0, Lorg/markdownj/MarkdownProcessor$4$1;->this$1:Lorg/markdownj/MarkdownProcessor$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public replacement(Ljava/util/regex/Matcher;)Ljava/lang/String;
    .registers 5
    .param p1, "m1"    # Ljava/util/regex/Matcher;

    .prologue
    .line 346
    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    .line 347
    .local v0, "pre":Ljava/lang/String;
    iget-object v1, p0, Lorg/markdownj/MarkdownProcessor$4$1;->this$1:Lorg/markdownj/MarkdownProcessor$4;

    iget-object v1, v1, Lorg/markdownj/MarkdownProcessor$4;->this$0:Lorg/markdownj/MarkdownProcessor;

    const-string v2, "^  "

    # invokes: Lorg/markdownj/MarkdownProcessor;->deleteAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v1, v0, v2}, Lorg/markdownj/MarkdownProcessor;->access$600(Lorg/markdownj/MarkdownProcessor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.class public Lorg/ligi/axt/extensions/UriAXT;
.super Ljava/lang/Object;
.source "UriAXT.java"


# instance fields
.field private final uri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/net/Uri;)V
    .registers 2
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lorg/ligi/axt/extensions/UriAXT;->uri:Landroid/net/Uri;

    .line 14
    return-void
.end method


# virtual methods
.method public loadImage(Landroid/content/Context;)Ljava/io/File;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 17
    new-instance v0, Lorg/ligi/axt/converter/ImageFromIntentUriToFileConverter;

    invoke-direct {v0, p1}, Lorg/ligi/axt/converter/ImageFromIntentUriToFileConverter;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lorg/ligi/axt/extensions/UriAXT;->uri:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Lorg/ligi/axt/converter/ImageFromIntentUriToFileConverter;->extract(Landroid/net/Uri;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

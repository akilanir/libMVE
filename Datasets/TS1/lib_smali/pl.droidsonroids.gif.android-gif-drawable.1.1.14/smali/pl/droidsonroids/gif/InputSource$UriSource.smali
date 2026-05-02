.class public final Lpl/droidsonroids/gif/InputSource$UriSource;
.super Lpl/droidsonroids/gif/InputSource;
.source "InputSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lpl/droidsonroids/gif/InputSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "UriSource"
.end annotation


# instance fields
.field private final mContentResolver:Landroid/content/ContentResolver;

.field private final mUri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    .registers 3
    .param p1, "contentResolver"    # Landroid/content/ContentResolver;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "uri"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 144
    invoke-direct {p0}, Lpl/droidsonroids/gif/InputSource;-><init>()V

    .line 145
    iput-object p1, p0, Lpl/droidsonroids/gif/InputSource$UriSource;->mContentResolver:Landroid/content/ContentResolver;

    .line 146
    iput-object p2, p0, Lpl/droidsonroids/gif/InputSource$UriSource;->mUri:Landroid/net/Uri;

    .line 147
    return-void
.end method


# virtual methods
.method open()Lpl/droidsonroids/gif/GifInfoHandle;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 151
    iget-object v0, p0, Lpl/droidsonroids/gif/InputSource$UriSource;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lpl/droidsonroids/gif/InputSource$UriSource;->mUri:Landroid/net/Uri;

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lpl/droidsonroids/gif/GifInfoHandle;->openUri(Landroid/content/ContentResolver;Landroid/net/Uri;Z)Lpl/droidsonroids/gif/GifInfoHandle;

    move-result-object v0

    return-object v0
.end method

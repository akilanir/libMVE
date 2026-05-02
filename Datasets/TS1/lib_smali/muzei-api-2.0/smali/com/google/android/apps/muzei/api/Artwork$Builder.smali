.class public Lcom/google/android/apps/muzei/api/Artwork$Builder;
.super Ljava/lang/Object;
.source "Artwork.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/muzei/api/Artwork;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mArtwork:Lcom/google/android/apps/muzei/api/Artwork;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 126
    new-instance v0, Lcom/google/android/apps/muzei/api/Artwork;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/apps/muzei/api/Artwork;-><init>(Lcom/google/android/apps/muzei/api/Artwork$1;)V

    iput-object v0, p0, Lcom/google/android/apps/muzei/api/Artwork$Builder;->mArtwork:Lcom/google/android/apps/muzei/api/Artwork;

    .line 127
    return-void
.end method


# virtual methods
.method public build()Lcom/google/android/apps/muzei/api/Artwork;
    .registers 2

    .prologue
    .line 199
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/Artwork$Builder;->mArtwork:Lcom/google/android/apps/muzei/api/Artwork;

    return-object v0
.end method

.method public byline(Ljava/lang/String;)Lcom/google/android/apps/muzei/api/Artwork$Builder;
    .registers 3
    .param p1, "byline"    # Ljava/lang/String;

    .prologue
    .line 165
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/Artwork$Builder;->mArtwork:Lcom/google/android/apps/muzei/api/Artwork;

    # setter for: Lcom/google/android/apps/muzei/api/Artwork;->mByline:Ljava/lang/String;
    invoke-static {v0, p1}, Lcom/google/android/apps/muzei/api/Artwork;->access$302(Lcom/google/android/apps/muzei/api/Artwork;Ljava/lang/String;)Ljava/lang/String;

    .line 166
    return-object p0
.end method

.method public imageUri(Landroid/net/Uri;)Lcom/google/android/apps/muzei/api/Artwork$Builder;
    .registers 3
    .param p1, "imageUri"    # Landroid/net/Uri;

    .prologue
    .line 149
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/Artwork$Builder;->mArtwork:Lcom/google/android/apps/muzei/api/Artwork;

    # setter for: Lcom/google/android/apps/muzei/api/Artwork;->mImageUri:Landroid/net/Uri;
    invoke-static {v0, p1}, Lcom/google/android/apps/muzei/api/Artwork;->access$102(Lcom/google/android/apps/muzei/api/Artwork;Landroid/net/Uri;)Landroid/net/Uri;

    .line 150
    return-object p0
.end method

.method public title(Ljava/lang/String;)Lcom/google/android/apps/muzei/api/Artwork$Builder;
    .registers 3
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 157
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/Artwork$Builder;->mArtwork:Lcom/google/android/apps/muzei/api/Artwork;

    # setter for: Lcom/google/android/apps/muzei/api/Artwork;->mTitle:Ljava/lang/String;
    invoke-static {v0, p1}, Lcom/google/android/apps/muzei/api/Artwork;->access$202(Lcom/google/android/apps/muzei/api/Artwork;Ljava/lang/String;)Ljava/lang/String;

    .line 158
    return-object p0
.end method

.method public token(Ljava/lang/String;)Lcom/google/android/apps/muzei/api/Artwork$Builder;
    .registers 3
    .param p1, "token"    # Ljava/lang/String;

    .prologue
    .line 173
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/Artwork$Builder;->mArtwork:Lcom/google/android/apps/muzei/api/Artwork;

    # setter for: Lcom/google/android/apps/muzei/api/Artwork;->mToken:Ljava/lang/String;
    invoke-static {v0, p1}, Lcom/google/android/apps/muzei/api/Artwork;->access$402(Lcom/google/android/apps/muzei/api/Artwork;Ljava/lang/String;)Ljava/lang/String;

    .line 174
    return-object p0
.end method

.method public viewIntent(Landroid/content/Intent;)Lcom/google/android/apps/muzei/api/Artwork$Builder;
    .registers 3
    .param p1, "viewIntent"    # Landroid/content/Intent;

    .prologue
    .line 190
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/Artwork$Builder;->mArtwork:Lcom/google/android/apps/muzei/api/Artwork;

    # setter for: Lcom/google/android/apps/muzei/api/Artwork;->mViewIntent:Landroid/content/Intent;
    invoke-static {v0, p1}, Lcom/google/android/apps/muzei/api/Artwork;->access$502(Lcom/google/android/apps/muzei/api/Artwork;Landroid/content/Intent;)Landroid/content/Intent;

    .line 191
    return-object p0
.end method
